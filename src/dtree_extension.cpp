#define DUCKDB_EXTENSION_MAIN

#include "dtree_extension.hpp"

#include "duckdb/common/exception.hpp"
#include "duckdb/common/serializer/deserializer.hpp"
#include "duckdb/common/serializer/serializer.hpp"
#include "duckdb/common/string_util.hpp"
#include "duckdb/common/types/vector.hpp"
#include "duckdb/execution/expression_executor.hpp"
#include "duckdb/function/scalar_function.hpp"
#include "duckdb/planner/expression/bound_function_expression.hpp"

#include <functional>
#include <limits>
#include <type_traits>
#include <utility>

namespace duckdb {

namespace {

constexpr uint32_t LEAF_MASK = uint32_t(1) << 31;
constexpr uint32_t INDEX_MASK = LEAF_MASK - 1;
constexpr uint32_t VARIABLE_DEPTH = std::numeric_limits<uint32_t>::max();
constexpr idx_t BLOCK_SIZE = 8;

static inline bool IsLeaf(uint32_t reference) {
	return (reference & LEAF_MASK) != 0;
}

static inline sel_t LeafIndex(uint32_t reference) {
	return reference & INDEX_MASK;
}

struct ParsedTree {
	vector<vector<Value>> coefficients;
	vector<Value> thresholds;
	vector<int64_t> left_children;
	vector<int64_t> right_children;
	vector<Value> leaf_values;
	LogicalType parameter_type;
	LogicalType leaf_type;
};

struct CompiledTree {
	CompiledTree(const ParsedTree &tree, idx_t dimensions_p)
	    : leaf_values(tree.leaf_type, tree.leaf_values.size() + 1), leaf_count(tree.leaf_values.size()), root(0),
	      dimensions(dimensions_p), depth(0), leaf_values_all_valid(false) {
		for (idx_t leaf_idx = 0; leaf_idx < leaf_count; leaf_idx++) {
			leaf_values.SetValue(leaf_idx, tree.leaf_values[leaf_idx]);
		}
		leaf_values.SetValue(leaf_count, Value(tree.leaf_type));
		leaf_values_all_valid = FlatVector::Validity(leaf_values).CheckAllValid(leaf_count);
		if (tree.leaf_type.id() == LogicalTypeId::STRUCT) {
			for (auto &child : StructVector::GetEntries(leaf_values)) {
				struct_children_all_valid.push_back(FlatVector::Validity(*child).CheckAllValid(leaf_count));
			}
		}
	}

	virtual ~CompiledTree() {
	}

	Vector leaf_values;
	idx_t leaf_count;
	uint32_t root;
	idx_t dimensions;
	uint32_t depth;
	bool leaf_values_all_valid;
	vector<bool> struct_children_all_valid;
};

template <class T, idx_t N>
struct FixedNode {
	T coefficients[N];
	T threshold;
	uint32_t children[2];
};

template <class T, idx_t N>
struct ImplicitFixedNode {
	T coefficients[N];
	T threshold;
};

template <>
struct alignas(16) ImplicitFixedNode<float, 2> {
	float coefficients[2];
	float threshold;
};

static_assert(sizeof(ImplicitFixedNode<float, 2>) == 16, "FLOAT N=2 implicit nodes must have a 16-byte stride");

template <class T, idx_t N>
struct FixedTree final : CompiledTree {
	explicit FixedTree(const ParsedTree &tree) : CompiledTree(tree, N) {
	}

	vector<FixedNode<T, N>> nodes;
	vector<ImplicitFixedNode<T, N>> implicit_nodes;
	vector<sel_t> implicit_leaves;
};

template <class T>
struct GenericNode {
	T threshold;
	uint32_t children[2];
};

template <class T>
struct GenericTree final : CompiledTree {
	GenericTree(const ParsedTree &tree, idx_t dimensions_p) : CompiledTree(tree, dimensions_p) {
	}

	vector<GenericNode<T>> nodes;
	vector<T> coefficients;
};

struct DecisionTreeBindData final : FunctionData {
	DecisionTreeBindData(shared_ptr<CompiledTree> tree_p, Value tree_value_p, LogicalType computation_type_p)
	    : tree(std::move(tree_p)), tree_value(std::move(tree_value_p)),
	      computation_type(std::move(computation_type_p)) {
	}

	shared_ptr<CompiledTree> tree;
	Value tree_value;
	LogicalType computation_type;

	unique_ptr<FunctionData> Copy() const override {
		return make_uniq<DecisionTreeBindData>(tree, tree_value, computation_type);
	}

	bool Equals(const FunctionData &other_p) const override {
		auto &other = other_p.Cast<DecisionTreeBindData>();
		return computation_type == other.computation_type && tree_value == other.tree_value;
	}
};

template <class T>
struct DecisionTreeLocalState final : FunctionLocalState {
	explicit DecisionTreeLocalState(idx_t dimensions) : leaf_indices(STANDARD_VECTOR_SIZE), features(dimensions) {
	}

	SelectionVector leaf_indices;
	vector<const T *> features;
};

static const vector<Value> &SequenceValues(const Value &value, const string &path) {
	if (value.IsNull()) {
		throw BinderException("decision_tree %s cannot be NULL", path);
	}
	if (value.type().id() == LogicalTypeId::LIST) {
		return ListValue::GetChildren(value);
	}
	if (value.type().id() == LogicalTypeId::ARRAY) {
		return ArrayValue::GetChildren(value);
	}
	throw BinderException("decision_tree %s must be a LIST or ARRAY, not %s", path, value.type().ToString());
}

static optional_idx FindStructField(const child_list_t<LogicalType> &fields, const string &name) {
	for (idx_t field_idx = 0; field_idx < fields.size(); field_idx++) {
		if (StringUtil::CIEquals(fields[field_idx].first, name)) {
			return field_idx;
		}
	}
	return optional_idx();
}

static idx_t RequireStructField(const child_list_t<LogicalType> &fields, const string &name, const string &path) {
	auto result = FindStructField(fields, name);
	if (!result.IsValid()) {
		throw BinderException("decision_tree %s is missing required field '%s'", path, name);
	}
	return result.GetIndex();
}

static void RequireFloatingType(const LogicalType &type, const string &description) {
	if (type.id() == LogicalTypeId::UNKNOWN) {
		throw ParameterNotResolvedException();
	}
	if (type != LogicalType::FLOAT && type != LogicalType::DOUBLE) {
		throw BinderException("decision_tree %s must be FLOAT or DOUBLE, not %s", description, type.ToString());
	}
}

static void IncludeCommonType(LogicalType &current, const LogicalType &type, const string &path) {
	LogicalType combined;
	if (!LogicalType::TryGetMaxLogicalTypeUnchecked(current, type, combined)) {
		throw BinderException("decision_tree %s has type %s, which cannot be combined with %s", path, type.ToString(),
		                      current.ToString());
	}
	current = std::move(combined);
}

static void IncludeParameterType(LogicalType &current, const LogicalType &type, const string &path) {
	if (!type.IsNumeric()) {
		throw BinderException("decision_tree %s must be numeric, not %s", path, type.ToString());
	}
	IncludeCommonType(current, type, path);
}

static int64_t ReadChildReference(const Value &value, const string &path) {
	if (value.IsNull()) {
		throw BinderException("decision_tree %s cannot be NULL", path);
	}
	switch (value.type().id()) {
	case LogicalTypeId::TINYINT:
	case LogicalTypeId::SMALLINT:
	case LogicalTypeId::INTEGER:
	case LogicalTypeId::BIGINT:
	case LogicalTypeId::HUGEINT:
		break;
	default:
		throw BinderException("decision_tree %s must be a signed integer, not %s", path, value.type().ToString());
	}
	int64_t reference;
	try {
		reference = value.DefaultCastAs(LogicalType::BIGINT).GetValue<int64_t>();
	} catch (Exception &ex) {
		throw BinderException("decision_tree %s is outside the supported BIGINT range: %s", path, ex.what());
	}
	if (reference == 0) {
		throw BinderException("decision_tree %s cannot be 0", path);
	}
	return reference > 0 ? reference - 1 : reference;
}

static ParsedTree ParseTreeValue(const Value &tree_value) {
	if (tree_value.IsNull()) {
		throw BinderException("decision_tree tree cannot be NULL");
	}
	if (tree_value.type().id() != LogicalTypeId::STRUCT) {
		throw BinderException("decision_tree tree must be a STRUCT, not %s", tree_value.type().ToString());
	}

	auto &fields = StructType::GetChildTypes(tree_value.type());
	auto weights_idx = RequireStructField(fields, "weights", "tree");
	auto thresholds_idx = RequireStructField(fields, "thresholds", "tree");
	auto children_idx = RequireStructField(fields, "children", "tree");
	auto values_idx = RequireStructField(fields, "values", "tree");
	if (fields.size() != 4) {
		throw BinderException(
		    "decision_tree tree must contain exactly 'weights', 'thresholds', 'children', and 'values'");
	}

	auto &fields_values = StructValue::GetChildren(tree_value);
	auto &weight_rows = SequenceValues(fields_values[weights_idx], "tree.weights");
	auto &threshold_values = SequenceValues(fields_values[thresholds_idx], "tree.thresholds");
	auto &child_rows = SequenceValues(fields_values[children_idx], "tree.children");
	auto &leaf_values = SequenceValues(fields_values[values_idx], "tree.values");
	if (weight_rows.empty()) {
		throw BinderException("decision_tree tree.weights must contain root node 1");
	}
	if (weight_rows.size() >= LEAF_MASK) {
		throw BinderException("decision_tree supports fewer than %u internal nodes", LEAF_MASK);
	}
	if (threshold_values.size() != weight_rows.size()) {
		throw BinderException("decision_tree tree.thresholds has %llu values, but tree.weights has %llu nodes",
		                      threshold_values.size(), weight_rows.size());
	}
	if (child_rows.size() != weight_rows.size()) {
		throw BinderException("decision_tree tree.children has %llu entries, but tree.weights has %llu nodes",
		                      child_rows.size(), weight_rows.size());
	}
	if (leaf_values.empty()) {
		throw BinderException("decision_tree tree.values must contain at least one leaf value");
	}
	if (leaf_values.size() >= LEAF_MASK) {
		throw BinderException("decision_tree supports fewer than %u leaves", LEAF_MASK);
	}

	ParsedTree result;
	result.parameter_type = LogicalType::SQLNULL;
	result.leaf_type = leaf_values[0].type();
	if (result.leaf_type.id() == LogicalTypeId::SQLNULL || result.leaf_type.id() == LogicalTypeId::UNKNOWN) {
		throw BinderException(
		    "decision_tree leaf values must have a concrete type; cast NULL values to the desired result type");
	}
	result.coefficients.reserve(weight_rows.size());
	result.thresholds.reserve(weight_rows.size());
	result.left_children.reserve(weight_rows.size());
	result.right_children.reserve(weight_rows.size());
	result.leaf_values.assign(leaf_values.begin(), leaf_values.end());

	for (idx_t node = 0; node < weight_rows.size(); node++) {
		auto node_path = "tree.weights[" + to_string(node + 1) + "]";
		auto &weight_values = SequenceValues(weight_rows[node], node_path);
		vector<Value> weights;
		weights.reserve(weight_values.size());
		for (idx_t weight = 0; weight < weight_values.size(); weight++) {
			auto weight_path = node_path + "[" + to_string(weight + 1) + "]";
			if (weight_values[weight].IsNull()) {
				throw BinderException("decision_tree %s cannot be NULL", weight_path);
			}
			IncludeParameterType(result.parameter_type, weight_values[weight].type(), weight_path);
			weights.push_back(weight_values[weight]);
		}
		result.coefficients.push_back(std::move(weights));

		auto threshold_path = "tree.thresholds[" + to_string(node + 1) + "]";
		auto &threshold = threshold_values[node];
		if (threshold.IsNull()) {
			throw BinderException("decision_tree %s cannot be NULL", threshold_path);
		}
		IncludeParameterType(result.parameter_type, threshold.type(), threshold_path);
		result.thresholds.push_back(threshold);

		auto child_path = "tree.children[" + to_string(node + 1) + "]";
		auto &children = SequenceValues(child_rows[node], child_path);
		if (children.size() != 2) {
			throw BinderException("decision_tree %s must contain exactly [above, below]", child_path);
		}
		result.right_children.push_back(ReadChildReference(children[0], child_path + "[1]"));
		result.left_children.push_back(ReadChildReference(children[1], child_path + "[2]"));
	}
	return result;
}

static void ValidateDimensions(const ParsedTree &tree, idx_t dimensions) {
	if (dimensions == 0) {
		throw BinderException("decision_tree requires at least one feature");
	}
	for (idx_t node_idx = 0; node_idx < tree.coefficients.size(); node_idx++) {
		if (tree.coefficients[node_idx].size() != dimensions) {
			throw BinderException(
			    "decision_tree tree.weights[%llu] has %llu values, but the invocation has %llu features", node_idx + 1,
			    tree.coefficients[node_idx].size(), dimensions);
		}
	}
}

template <class T>
static T ReadNumber(const Value &value, const string &path) {
	LogicalType target_type = std::is_same<T, float>::value ? LogicalType::FLOAT : LogicalType::DOUBLE;
	try {
		auto cast_value = value.DefaultCastAs(target_type);
		return cast_value.template GetValue<T>();
	} catch (Exception &ex) {
		throw BinderException("decision_tree %s cannot be converted to %s: %s", path, target_type.ToString(),
		                      ex.what());
	}
}

template <class TREE, class INITIALIZE_NODE>
static void CompileTopology(const ParsedTree &tree, TREE &result, INITIALIZE_NODE &&initialize_node) {
	auto node_count = tree.coefficients.size();
	auto leaf_count = tree.leaf_values.size();
	result.nodes.reserve(node_count);

	vector<uint8_t> node_state(node_count, 0);
	vector<bool> leaf_used(leaf_count, false);
	bool found_leaf = false;
	std::function<uint32_t(int64_t, uint32_t)> visit = [&](int64_t reference, uint32_t depth) -> uint32_t {
		if (reference < 0) {
			if (reference == std::numeric_limits<int64_t>::min()) {
				throw BinderException("decision_tree contains an invalid leaf reference");
			}
			auto leaf = UnsafeNumericCast<uint64_t>(-reference - 1);
			if (leaf >= leaf_count) {
				throw BinderException("decision_tree leaf reference %lld is out of range for %llu leaf values",
				                      reference, leaf_count);
			}
			leaf_used[leaf] = true;
			if (!found_leaf) {
				result.depth = depth;
				found_leaf = true;
			} else if (result.depth != depth) {
				result.depth = VARIABLE_DEPTH;
			}
			return LEAF_MASK | UnsafeNumericCast<uint32_t>(leaf);
		}

		auto source = UnsafeNumericCast<uint64_t>(reference);
		if (source >= node_count) {
			throw BinderException("decision_tree internal-node reference %lld is out of range for %llu nodes",
			                      reference + 1, node_count);
		}
		if (node_state[source] == 1) {
			throw BinderException("decision_tree topology contains a cycle at internal node %lld", reference + 1);
		}
		if (node_state[source] == 2) {
			throw BinderException("decision_tree topology reuses internal node %lld; topology must be a tree",
			                      reference + 1);
		}

		node_state[source] = 1;
		auto target = UnsafeNumericCast<uint32_t>(result.nodes.size());
		result.nodes.emplace_back();
		initialize_node(result, target, source);
		auto left = visit(tree.left_children[source], depth + 1);
		auto right = visit(tree.right_children[source], depth + 1);
		result.nodes[target].children[0] = left;
		result.nodes[target].children[1] = right;
		node_state[source] = 2;
		return target;
	};

	result.root = visit(0, 0);
	for (idx_t node_idx = 0; node_idx < node_count; node_idx++) {
		if (node_state[node_idx] == 0) {
			throw BinderException("decision_tree contains unreachable internal node %llu", node_idx + 1);
		}
	}
	for (idx_t leaf_idx = 0; leaf_idx < leaf_count; leaf_idx++) {
		if (!leaf_used[leaf_idx]) {
			throw BinderException("decision_tree contains unreachable leaf value %llu", leaf_idx + 1);
		}
	}
}

template <class T, idx_t N>
static void MakeImplicitTopology(FixedTree<T, N> &tree) {
	auto nodes = std::move(tree.nodes);
	vector<uint32_t> references;
	references.reserve(nodes.size() * 2 + 1);
	references.push_back(tree.root);
	tree.implicit_nodes.reserve(nodes.size());

	for (idx_t node_idx = 0; node_idx < nodes.size(); node_idx++) {
		auto reference = references[node_idx];
		D_ASSERT(!IsLeaf(reference));
		auto &source = nodes[reference];
		tree.implicit_nodes.emplace_back();
		auto &target = tree.implicit_nodes.back();
		for (idx_t feature = 0; feature < N; feature++) {
			target.coefficients[feature] = source.coefficients[feature];
		}
		target.threshold = source.threshold;
		references.push_back(source.children[0]);
		references.push_back(source.children[1]);
	}

	tree.implicit_leaves.reserve(nodes.size() + 1);
	for (idx_t leaf = nodes.size(); leaf < references.size(); leaf++) {
		D_ASSERT(IsLeaf(references[leaf]));
		tree.implicit_leaves.push_back(LeafIndex(references[leaf]));
	}
	tree.root = 0;
}

template <class T, idx_t N>
static shared_ptr<CompiledTree> CompileFixedTree(const ParsedTree &tree) {
	auto result = make_shared_ptr<FixedTree<T, N>>(tree);
	CompileTopology(tree, *result, [&](FixedTree<T, N> &target_tree, uint32_t target, idx_t source) {
		auto &node = target_tree.nodes[target];
		node.threshold = ReadNumber<T>(tree.thresholds[source], "tree.thresholds[" + to_string(source + 1) + "]");
		for (idx_t feature_idx = 0; feature_idx < N; feature_idx++) {
			node.coefficients[feature_idx] =
			    ReadNumber<T>(tree.coefficients[source][feature_idx],
			                  "tree.weights[" + to_string(source + 1) + "][" + to_string(feature_idx + 1) + "]");
		}
	});
	if (result->depth != VARIABLE_DEPTH) {
		MakeImplicitTopology(*result);
	}
	return result;
}

template <class T>
static shared_ptr<CompiledTree> CompileGenericTree(const ParsedTree &tree, idx_t dimensions) {
	auto result = make_shared_ptr<GenericTree<T>>(tree, dimensions);
	auto node_count = tree.coefficients.size();
	result->coefficients.resize(node_count * dimensions);
	CompileTopology(tree, *result, [&](GenericTree<T> &target_tree, uint32_t target, idx_t source) {
		auto &node = target_tree.nodes[target];
		node.threshold = ReadNumber<T>(tree.thresholds[source], "tree.thresholds[" + to_string(source + 1) + "]");
		for (idx_t feature_idx = 0; feature_idx < dimensions; feature_idx++) {
			target_tree.coefficients[feature_idx * node_count + target] =
			    ReadNumber<T>(tree.coefficients[source][feature_idx],
			                  "tree.weights[" + to_string(source + 1) + "][" + to_string(feature_idx + 1) + "]");
		}
	});
	return result;
}

template <class T>
static shared_ptr<CompiledTree> CompileTree(const ParsedTree &tree, idx_t dimensions) {
	switch (dimensions) {
	case 1:
		return CompileFixedTree<T, 1>(tree);
	case 2:
		return CompileFixedTree<T, 2>(tree);
	case 3:
		return CompileFixedTree<T, 3>(tree);
	case 4:
		return CompileFixedTree<T, 4>(tree);
	case 5:
		return CompileFixedTree<T, 5>(tree);
	case 6:
		return CompileFixedTree<T, 6>(tree);
	case 7:
		return CompileFixedTree<T, 7>(tree);
	default:
		return CompileGenericTree<T>(tree, dimensions);
	}
}

template <class T>
struct ColumnInput {
	const T *const *features;

	inline T Get(idx_t feature, idx_t row) const {
		return features[feature][row];
	}
};

template <class T, idx_t N>
struct FixedArrayInput {
	const T *data;

	inline T Get(idx_t feature, idx_t row) const {
		return data[row * N + feature];
	}
};

template <class T>
struct GenericArrayInput {
	const T *data;
	idx_t dimensions;

	inline T Get(idx_t feature, idx_t row) const {
		return data[row * dimensions + feature];
	}
};

template <class T, class INPUT>
struct OffsetInput {
	const INPUT &input;
	idx_t offset;

	inline T Get(idx_t feature, idx_t row) const {
		return input.Get(feature, row + offset);
	}
};

template <idx_t FEATURE, class T, idx_t N, class INPUT>
struct FixedScore {
	template <class NODE>
	static inline void Accumulate(T &score, const NODE &node, const INPUT &input, idx_t row) {
		score += node.coefficients[FEATURE] * input.Get(FEATURE, row);
		FixedScore<FEATURE + 1, T, N, INPUT>::Accumulate(score, node, input, row);
	}
};

template <class T, idx_t N, class INPUT>
struct FixedScore<N, T, N, INPUT> {
	template <class NODE>
	static inline void Accumulate(T &, const NODE &, const INPUT &, idx_t) {
	}
};

template <class T, idx_t N, class INPUT>
static inline uint32_t AdvanceFixed(const FixedNode<T, N> *nodes, const INPUT &input, idx_t row, uint32_t reference) {
	auto &node = nodes[reference];
	T score = node.coefficients[0] * input.Get(0, row);
	FixedScore<1, T, N, INPUT>::Accumulate(score, node, input, row);
	return node.children[static_cast<idx_t>(score >= node.threshold)];
}

template <class T, idx_t N, class INPUT>
static inline uint32_t AdvanceImplicitFixed(const ImplicitFixedNode<T, N> *nodes, const INPUT &input, idx_t row,
                                            uint32_t reference) {
	auto &node = nodes[reference];
	T score = node.coefficients[0] * input.Get(0, row);
	FixedScore<1, T, N, INPUT>::Accumulate(score, node, input, row);
	return 2 * reference + 1 + static_cast<uint32_t>(score >= node.threshold);
}

template <idx_t LANE, class T, idx_t N, class INPUT>
static inline void AdvanceFixedActiveLane(const FixedNode<T, N> *nodes, const INPUT &input, idx_t row, uint8_t active,
                                          uint32_t (&references)[BLOCK_SIZE], uint8_t &next_active) {
	constexpr auto lane_bit = static_cast<uint8_t>(uint8_t(1) << LANE);
	if (active & lane_bit) {
		auto reference = AdvanceFixed(nodes, input, row + LANE, references[LANE]);
		references[LANE] = reference;
		if (!IsLeaf(reference)) {
			next_active |= lane_bit;
		}
	}
}

template <class T, idx_t N, class INPUT>
static inline void AdvanceFixedActive(const FixedNode<T, N> *nodes, const INPUT &input, idx_t row, uint8_t active,
                                      uint32_t (&references)[BLOCK_SIZE], uint8_t &next_active) {
	AdvanceFixedActiveLane<0>(nodes, input, row, active, references, next_active);
	AdvanceFixedActiveLane<1>(nodes, input, row, active, references, next_active);
	AdvanceFixedActiveLane<2>(nodes, input, row, active, references, next_active);
	AdvanceFixedActiveLane<3>(nodes, input, row, active, references, next_active);
	AdvanceFixedActiveLane<4>(nodes, input, row, active, references, next_active);
	AdvanceFixedActiveLane<5>(nodes, input, row, active, references, next_active);
	AdvanceFixedActiveLane<6>(nodes, input, row, active, references, next_active);
	AdvanceFixedActiveLane<7>(nodes, input, row, active, references, next_active);
}

template <idx_t LANE, class T, idx_t N, class INPUT>
static inline void AdvanceImplicitFixedLane(const ImplicitFixedNode<T, N> *nodes, const INPUT &input, idx_t row,
                                            uint32_t (&references)[BLOCK_SIZE]) {
	references[LANE] = AdvanceImplicitFixed(nodes, input, row + LANE, references[LANE]);
}

template <class T, idx_t N, class INPUT>
static inline void AdvanceImplicitFixedBlock(const ImplicitFixedNode<T, N> *nodes, const INPUT &input, idx_t row,
                                             uint32_t (&references)[BLOCK_SIZE]) {
	AdvanceImplicitFixedLane<0>(nodes, input, row, references);
	AdvanceImplicitFixedLane<1>(nodes, input, row, references);
	AdvanceImplicitFixedLane<2>(nodes, input, row, references);
	AdvanceImplicitFixedLane<3>(nodes, input, row, references);
	AdvanceImplicitFixedLane<4>(nodes, input, row, references);
	AdvanceImplicitFixedLane<5>(nodes, input, row, references);
	AdvanceImplicitFixedLane<6>(nodes, input, row, references);
	AdvanceImplicitFixedLane<7>(nodes, input, row, references);
}

template <class T, idx_t N, class INPUT>
static void EvaluateImplicitFixedTree(const FixedTree<T, N> &tree, const INPUT &input, idx_t count,
                                      sel_t *leaf_indices) {
	auto nodes = tree.implicit_nodes.data();
	auto node_count = tree.implicit_nodes.size();
	idx_t row = 0;
	for (; row + BLOCK_SIZE <= count; row += BLOCK_SIZE) {
		uint32_t references[BLOCK_SIZE] {};
		for (uint32_t level = 0; level < tree.depth; level++) {
			AdvanceImplicitFixedBlock(nodes, input, row, references);
		}
		for (idx_t lane = 0; lane < BLOCK_SIZE; lane++) {
			leaf_indices[row + lane] = tree.implicit_leaves[references[lane] - node_count];
		}
	}

	for (; row < count; row++) {
		uint32_t reference = 0;
		for (uint32_t level = 0; level < tree.depth; level++) {
			reference = AdvanceImplicitFixed(nodes, input, row, reference);
		}
		leaf_indices[row] = tree.implicit_leaves[reference - node_count];
	}
}

template <class T, idx_t N, class INPUT>
static void EvaluateFixedTree(const FixedTree<T, N> &tree, const INPUT &input, idx_t count, sel_t *leaf_indices) {
	if (tree.depth != VARIABLE_DEPTH) {
		EvaluateImplicitFixedTree(tree, input, count, leaf_indices);
		return;
	}

	auto nodes = tree.nodes.data();
	idx_t row = 0;
	for (; row + BLOCK_SIZE <= count; row += BLOCK_SIZE) {
		uint32_t references[BLOCK_SIZE] {tree.root, tree.root, tree.root, tree.root,
		                                 tree.root, tree.root, tree.root, tree.root};
		uint8_t active = IsLeaf(tree.root) ? 0 : UINT8_C(0xff);
		while (active) {
			uint8_t next_active = 0;
			AdvanceFixedActive(nodes, input, row, active, references, next_active);
			active = next_active;
		}
		for (idx_t lane = 0; lane < BLOCK_SIZE; lane++) {
			leaf_indices[row + lane] = LeafIndex(references[lane]);
		}
	}

	for (; row < count; row++) {
		auto reference = tree.root;
		while (!IsLeaf(reference)) {
			reference = AdvanceFixed(nodes, input, row, reference);
		}
		leaf_indices[row] = LeafIndex(reference);
	}
}

template <bool CHECK_ACTIVE, bool INITIALIZE, idx_t LANE, class T, class INPUT>
static inline void UpdateGenericLane(const T *coefficients, const INPUT &input, idx_t feature, idx_t row,
                                     uint8_t active, const uint32_t (&references)[BLOCK_SIZE],
                                     T (&scores)[BLOCK_SIZE]) {
	constexpr auto lane_bit = static_cast<uint8_t>(uint8_t(1) << LANE);
	if (!CHECK_ACTIVE || (active & lane_bit)) {
		auto product = coefficients[references[LANE]] * input.Get(feature, row + LANE);
		if (INITIALIZE) {
			scores[LANE] = product;
		} else {
			scores[LANE] += product;
		}
	}
}

template <bool CHECK_ACTIVE, bool INITIALIZE, class T, class INPUT>
static inline void UpdateGeneric(const T *coefficients, const INPUT &input, idx_t feature, idx_t row, uint8_t active,
                                 const uint32_t (&references)[BLOCK_SIZE], T (&scores)[BLOCK_SIZE]) {
	UpdateGenericLane<CHECK_ACTIVE, INITIALIZE, 0>(coefficients, input, feature, row, active, references, scores);
	UpdateGenericLane<CHECK_ACTIVE, INITIALIZE, 1>(coefficients, input, feature, row, active, references, scores);
	UpdateGenericLane<CHECK_ACTIVE, INITIALIZE, 2>(coefficients, input, feature, row, active, references, scores);
	UpdateGenericLane<CHECK_ACTIVE, INITIALIZE, 3>(coefficients, input, feature, row, active, references, scores);
	UpdateGenericLane<CHECK_ACTIVE, INITIALIZE, 4>(coefficients, input, feature, row, active, references, scores);
	UpdateGenericLane<CHECK_ACTIVE, INITIALIZE, 5>(coefficients, input, feature, row, active, references, scores);
	UpdateGenericLane<CHECK_ACTIVE, INITIALIZE, 6>(coefficients, input, feature, row, active, references, scores);
	UpdateGenericLane<CHECK_ACTIVE, INITIALIZE, 7>(coefficients, input, feature, row, active, references, scores);
}

template <bool CHECK_ACTIVE, idx_t LANE, class T>
static inline void SelectGenericLane(const GenericNode<T> *nodes, uint8_t active, uint32_t (&references)[BLOCK_SIZE],
                                     const T (&scores)[BLOCK_SIZE], uint8_t &next_active) {
	constexpr auto lane_bit = static_cast<uint8_t>(uint8_t(1) << LANE);
	if (!CHECK_ACTIVE || (active & lane_bit)) {
		auto &node = nodes[references[LANE]];
		auto reference = node.children[static_cast<idx_t>(scores[LANE] >= node.threshold)];
		references[LANE] = reference;
		if (CHECK_ACTIVE && !IsLeaf(reference)) {
			next_active |= lane_bit;
		}
	}
}

template <bool CHECK_ACTIVE, class T, class INPUT>
static inline void AdvanceGenericBlock(const GenericTree<T> &tree, const INPUT &input, idx_t row, uint8_t active,
                                       uint32_t (&references)[BLOCK_SIZE], uint8_t &next_active) {
	T scores[BLOCK_SIZE];
	auto node_count = tree.nodes.size();
	UpdateGeneric<CHECK_ACTIVE, true>(tree.coefficients.data(), input, 0, row, active, references, scores);
	for (idx_t feature = 1; feature < tree.dimensions; feature++) {
		auto coefficients = tree.coefficients.data() + feature * node_count;
		UpdateGeneric<CHECK_ACTIVE, false>(coefficients, input, feature, row, active, references, scores);
	}
	auto nodes = tree.nodes.data();
	SelectGenericLane<CHECK_ACTIVE, 0>(nodes, active, references, scores, next_active);
	SelectGenericLane<CHECK_ACTIVE, 1>(nodes, active, references, scores, next_active);
	SelectGenericLane<CHECK_ACTIVE, 2>(nodes, active, references, scores, next_active);
	SelectGenericLane<CHECK_ACTIVE, 3>(nodes, active, references, scores, next_active);
	SelectGenericLane<CHECK_ACTIVE, 4>(nodes, active, references, scores, next_active);
	SelectGenericLane<CHECK_ACTIVE, 5>(nodes, active, references, scores, next_active);
	SelectGenericLane<CHECK_ACTIVE, 6>(nodes, active, references, scores, next_active);
	SelectGenericLane<CHECK_ACTIVE, 7>(nodes, active, references, scores, next_active);
}

template <class T, class INPUT>
static inline uint32_t TraverseGeneric(const GenericTree<T> &tree, const INPUT &input, idx_t row) {
	auto reference = tree.root;
	while (!IsLeaf(reference)) {
		T score = tree.coefficients[reference] * input.Get(0, row);
		for (idx_t feature = 1; feature < tree.dimensions; feature++) {
			score += tree.coefficients[feature * tree.nodes.size() + reference] * input.Get(feature, row);
		}
		auto &node = tree.nodes[reference];
		reference = node.children[static_cast<idx_t>(score >= node.threshold)];
	}
	return reference;
}

template <class T, class INPUT>
static void EvaluateGenericTree(const GenericTree<T> &tree, const INPUT &input, idx_t count, sel_t *leaf_indices) {
	idx_t row = 0;
	for (; row + BLOCK_SIZE <= count; row += BLOCK_SIZE) {
		uint32_t references[BLOCK_SIZE] {tree.root, tree.root, tree.root, tree.root,
		                                 tree.root, tree.root, tree.root, tree.root};
		if (tree.depth == VARIABLE_DEPTH) {
			uint8_t active = IsLeaf(tree.root) ? 0 : UINT8_C(0xff);
			while (active) {
				uint8_t next_active = 0;
				AdvanceGenericBlock<true>(tree, input, row, active, references, next_active);
				active = next_active;
			}
		} else {
			for (uint32_t level = 0; level < tree.depth; level++) {
				uint8_t unused = 0;
				AdvanceGenericBlock<false>(tree, input, row, 0, references, unused);
			}
		}
		for (idx_t lane = 0; lane < BLOCK_SIZE; lane++) {
			leaf_indices[row + lane] = LeafIndex(references[lane]);
		}
	}

	for (; row < count; row++) {
		leaf_indices[row] = LeafIndex(TraverseGeneric(tree, input, row));
	}
}

template <class T, idx_t N>
struct FixedTreeEvaluator {
	const FixedTree<T, N> &tree;

	template <class INPUT>
	void operator()(const INPUT &input, idx_t count, sel_t *leaf_indices) const {
		EvaluateFixedTree(tree, input, count, leaf_indices);
	}
};

template <class T>
struct GenericTreeEvaluator {
	const GenericTree<T> &tree;

	template <class INPUT>
	void operator()(const INPUT &input, idx_t count, sel_t *leaf_indices) const {
		EvaluateGenericTree(tree, input, count, leaf_indices);
	}
};

template <class T, class INPUT, class ROW_VALID, class EVALUATE>
static void EvaluateValidRuns(const INPUT &input, idx_t count, idx_t null_leaf, sel_t *leaf_indices,
                              ROW_VALID &&row_valid, EVALUATE &&evaluate) {
	idx_t row = 0;
	while (row < count) {
		if (!row_valid(row)) {
			leaf_indices[row++] = null_leaf;
			continue;
		}

		auto begin = row++;
		while (row < count && row_valid(row)) {
			row++;
		}
		OffsetInput<T, INPUT> offset_input {input, begin};
		evaluate(offset_input, row - begin, leaf_indices + begin);
	}
}

template <class T, class INPUT, class VALIDITY_ENTRY, class EVALUATE>
static void EvaluateValidityEntries(const INPUT &input, idx_t count, idx_t null_leaf, sel_t *leaf_indices,
                                    VALIDITY_ENTRY &&validity_entry, EVALUATE &&evaluate) {
	idx_t row = 0;
	idx_t entry_idx = 0;
	while (row < count) {
		auto entry_count = MinValue<idx_t>(ValidityMask::BITS_PER_VALUE, count - row);
		auto valid_bits = ValidityMask::EntryWithValidBits(entry_count);
		auto entry = validity_entry(entry_idx) & valid_bits;
		if (entry == valid_bits) {
			auto begin = row;
			do {
				row += entry_count;
				entry_idx++;
				if (row == count) {
					break;
				}
				entry_count = MinValue<idx_t>(ValidityMask::BITS_PER_VALUE, count - row);
				valid_bits = ValidityMask::EntryWithValidBits(entry_count);
				entry = validity_entry(entry_idx) & valid_bits;
			} while (entry == valid_bits);
			OffsetInput<T, INPUT> offset_input {input, begin};
			evaluate(offset_input, row - begin, leaf_indices + begin);
			continue;
		} else if (entry == 0) {
			for (idx_t lane = 0; lane < entry_count; lane++) {
				leaf_indices[row + lane] = null_leaf;
			}
		} else {
			idx_t lane = 0;
			while (lane < entry_count) {
				if (!ValidityMask::RowIsValid(entry, lane)) {
					leaf_indices[row + lane++] = null_leaf;
					continue;
				}
				auto begin = lane++;
				while (lane < entry_count && ValidityMask::RowIsValid(entry, lane)) {
					lane++;
				}
				OffsetInput<T, INPUT> offset_input {input, row + begin};
				evaluate(offset_input, lane - begin, leaf_indices + row + begin);
			}
		}
		row += entry_count;
		entry_idx++;
	}
}

template <class T>
static DecisionTreeLocalState<T> &GetLocalState(ExpressionState &state) {
	return ExecuteFunctionState::GetFunctionState(state)->Cast<DecisionTreeLocalState<T>>();
}

static const CompiledTree &GetTree(ExpressionState &state) {
	auto &expression = state.expr.Cast<BoundFunctionExpression>();
	return *expression.bind_info->Cast<DecisionTreeBindData>().tree;
}

static bool IsSimpleLeafType(const LogicalType &type) {
	return TypeIsConstantSize(type.InternalType());
}

static bool UseDictionary(const CompiledTree &tree, const LogicalType &type) {
	return tree.leaf_count < STANDARD_VECTOR_SIZE / 2 && !IsSimpleLeafType(type);
}

static void CopyValidity(const Vector &source, Vector &target, const SelectionVector &selection, idx_t count,
                         bool values_all_valid, bool selected_null) {
	if (values_all_valid && !selected_null) {
		return;
	}
	FlatVector::Validity(target).CopySel(FlatVector::Validity(source), selection, 0, 0, count);
}

template <class T>
static void CopySimpleValues(const Vector &source, Vector &target, const SelectionVector &selection, idx_t count,
                             bool values_all_valid, bool selected_null) {
	auto source_data = FlatVector::GetData<T>(source);
	auto target_data = FlatVector::GetData<T>(target);
	for (idx_t row = 0; row < count; row++) {
		target_data[row] = source_data[selection.get_index(row)];
	}
	CopyValidity(source, target, selection, count, values_all_valid, selected_null);
}

static void CopySimpleValues(const Vector &source, Vector &target, const SelectionVector &selection, idx_t count,
                             bool values_all_valid, bool selected_null) {
	switch (source.GetType().InternalType()) {
	case PhysicalType::BOOL:
	case PhysicalType::INT8:
		return CopySimpleValues<int8_t>(source, target, selection, count, values_all_valid, selected_null);
	case PhysicalType::INT16:
		return CopySimpleValues<int16_t>(source, target, selection, count, values_all_valid, selected_null);
	case PhysicalType::INT32:
		return CopySimpleValues<int32_t>(source, target, selection, count, values_all_valid, selected_null);
	case PhysicalType::INT64:
		return CopySimpleValues<int64_t>(source, target, selection, count, values_all_valid, selected_null);
	case PhysicalType::INT128:
		return CopySimpleValues<hugeint_t>(source, target, selection, count, values_all_valid, selected_null);
	case PhysicalType::UINT8:
		return CopySimpleValues<uint8_t>(source, target, selection, count, values_all_valid, selected_null);
	case PhysicalType::UINT16:
		return CopySimpleValues<uint16_t>(source, target, selection, count, values_all_valid, selected_null);
	case PhysicalType::UINT32:
		return CopySimpleValues<uint32_t>(source, target, selection, count, values_all_valid, selected_null);
	case PhysicalType::UINT64:
		return CopySimpleValues<uint64_t>(source, target, selection, count, values_all_valid, selected_null);
	case PhysicalType::UINT128:
		return CopySimpleValues<uhugeint_t>(source, target, selection, count, values_all_valid, selected_null);
	case PhysicalType::FLOAT:
		return CopySimpleValues<float>(source, target, selection, count, values_all_valid, selected_null);
	case PhysicalType::DOUBLE:
		return CopySimpleValues<double>(source, target, selection, count, values_all_valid, selected_null);
	case PhysicalType::INTERVAL:
		return CopySimpleValues<interval_t>(source, target, selection, count, values_all_valid, selected_null);
	default:
		throw InternalException("Unsupported simple decision_tree leaf type");
	}
}

static void EmitStruct(const CompiledTree &tree, const SelectionVector &leaf_indices, idx_t count, bool selected_null,
                       Vector &result) {
	result.SetVectorType(VectorType::FLAT_VECTOR);
	CopyValidity(tree.leaf_values, result, leaf_indices, count, tree.leaf_values_all_valid, selected_null);
	auto &source = StructVector::GetEntries(tree.leaf_values);
	auto &target = StructVector::GetEntries(result);
	for (idx_t field = 0; field < source.size(); field++) {
		if (UseDictionary(tree, source[field]->GetType())) {
			target[field]->Reference(*source[field]);
			target[field]->Dictionary(tree.leaf_count + 1, leaf_indices, count);
		} else if (IsSimpleLeafType(source[field]->GetType())) {
			CopySimpleValues(*source[field], *target[field], leaf_indices, count, tree.struct_children_all_valid[field],
			                 selected_null);
		} else {
			target[field]->SetVectorType(VectorType::FLAT_VECTOR);
			VectorOperations::Copy(*source[field], *target[field], leaf_indices, tree.leaf_count + 1, 0, 0, count);
		}
	}
}

static void EmitLeaves(const CompiledTree &tree, const SelectionVector &leaf_indices, idx_t count, bool all_constant,
                       bool selected_null, Vector &result) {
	if (all_constant) {
		result.SetVectorType(VectorType::FLAT_VECTOR);
		VectorOperations::Copy(tree.leaf_values, result, leaf_indices, tree.leaf_count + 1, 0, 0, count);
		result.SetVectorType(VectorType::CONSTANT_VECTOR);
		return;
	}
	if (tree.leaf_values.GetType().id() == LogicalTypeId::STRUCT) {
		EmitStruct(tree, leaf_indices, count, selected_null, result);
		return;
	}
	if (UseDictionary(tree, tree.leaf_values.GetType())) {
		result.Reference(tree.leaf_values);
		result.Dictionary(tree.leaf_count + 1, leaf_indices, count);
		return;
	}
	result.SetVectorType(VectorType::FLAT_VECTOR);
	if (IsSimpleLeafType(tree.leaf_values.GetType())) {
		CopySimpleValues(tree.leaf_values, result, leaf_indices, count, tree.leaf_values_all_valid, selected_null);
	} else {
		VectorOperations::Copy(tree.leaf_values, result, leaf_indices, tree.leaf_count + 1, 0, 0, count);
	}
}

static bool ColumnsAllValid(const DataChunk &args, idx_t count) {
	for (auto &input : args.data) {
		if (!FlatVector::Validity(input).CheckAllValid(count)) {
			return false;
		}
	}
	return true;
}

static validity_t ColumnValidityEntry(const DataChunk &args, idx_t entry_idx) {
	auto result = ValidityMask::ValidityBuffer::MAX_ENTRY;
	for (auto &input : args.data) {
		result &= FlatVector::Validity(input).GetValidityEntry(entry_idx);
	}
	return result;
}

static bool ArrayRowIsValid(const ValidityMask &array_validity, const ValidityMask &element_validity,
                            bool elements_all_valid, idx_t dimensions, idx_t row) {
	if (!array_validity.RowIsValid(row)) {
		return false;
	}
	if (elements_all_valid) {
		return true;
	}
	auto offset = row * dimensions;
	for (idx_t feature = 0; feature < dimensions; feature++) {
		if (!element_validity.RowIsValid(offset + feature)) {
			return false;
		}
	}
	return true;
}

static void SetConstantNull(Vector &result) {
	result.SetVectorType(VectorType::CONSTANT_VECTOR);
	ConstantVector::SetNull(result, true);
}

static bool HasConstantNull(const DataChunk &args) {
	for (auto &input : args.data) {
		if (input.GetVectorType() == VectorType::CONSTANT_VECTOR && ConstantVector::IsNull(input)) {
			return true;
		}
	}
	return false;
}

template <class T, idx_t N>
static void ExecuteFixedColumns(DataChunk &args, ExpressionState &state, Vector &result) {
	auto &tree = static_cast<const FixedTree<T, N> &>(GetTree(state));
	auto &local_state = GetLocalState<T>(state);
	D_ASSERT(args.ColumnCount() == N);
	if (HasConstantNull(args)) {
		SetConstantNull(result);
		return;
	}
	auto all_constant = args.AllConstant();
	auto count = all_constant ? idx_t(1) : args.size();
	for (idx_t feature = 0; feature < N; feature++) {
		auto &input = args.data[feature];
		if (input.GetVectorType() != VectorType::FLAT_VECTOR) {
			input.Flatten(count);
		}
		local_state.features[feature] = FlatVector::GetData<T>(input);
	}

	ColumnInput<T> input {local_state.features.data()};
	bool selected_null = false;
	if (ColumnsAllValid(args, count)) {
		EvaluateFixedTree(tree, input, count, local_state.leaf_indices.data());
	} else {
		selected_null = true;
		EvaluateValidityEntries<T>(
		    input, count, tree.leaf_count, local_state.leaf_indices.data(),
		    [&](idx_t entry_idx) { return ColumnValidityEntry(args, entry_idx); }, FixedTreeEvaluator<T, N> {tree});
	}
	EmitLeaves(tree, local_state.leaf_indices, count, all_constant, selected_null, result);
}

template <class T, idx_t N>
static void ExecuteFixedArray(DataChunk &args, ExpressionState &state, Vector &result) {
	auto &tree = static_cast<const FixedTree<T, N> &>(GetTree(state));
	auto &local_state = GetLocalState<T>(state);
	D_ASSERT(args.ColumnCount() == 1);
	auto &arrays = args.data[0];
	auto all_constant = arrays.GetVectorType() == VectorType::CONSTANT_VECTOR;
	if (all_constant && ConstantVector::IsNull(arrays)) {
		SetConstantNull(result);
		return;
	}
	auto count = all_constant ? idx_t(1) : args.size();
	if (arrays.GetVectorType() != VectorType::FLAT_VECTOR) {
		arrays.Flatten(count);
	}
	auto &elements = ArrayVector::GetEntry(arrays);
	if (elements.GetVectorType() != VectorType::FLAT_VECTOR) {
		elements.Flatten(count * N);
	}

	FixedArrayInput<T, N> input {FlatVector::GetData<T>(elements)};
	auto &array_validity = FlatVector::Validity(arrays);
	auto &element_validity = FlatVector::Validity(elements);
	auto elements_all_valid = element_validity.CheckAllValid(count * N);
	auto all_valid = array_validity.CheckAllValid(count) && elements_all_valid;
	if (all_constant && !all_valid) {
		SetConstantNull(result);
		return;
	}
	bool selected_null = false;
	if (all_valid) {
		EvaluateFixedTree(tree, input, count, local_state.leaf_indices.data());
	} else {
		selected_null = true;
		EvaluateValidRuns<T>(
		    input, count, tree.leaf_count, local_state.leaf_indices.data(),
		    [&](idx_t row) { return ArrayRowIsValid(array_validity, element_validity, elements_all_valid, N, row); },
		    FixedTreeEvaluator<T, N> {tree});
	}
	EmitLeaves(tree, local_state.leaf_indices, count, all_constant, selected_null, result);
}

template <class T>
static void ExecuteGenericColumns(DataChunk &args, ExpressionState &state, Vector &result) {
	auto &tree = static_cast<const GenericTree<T> &>(GetTree(state));
	auto &local_state = GetLocalState<T>(state);
	D_ASSERT(args.ColumnCount() == tree.dimensions);
	if (HasConstantNull(args)) {
		SetConstantNull(result);
		return;
	}
	auto all_constant = args.AllConstant();
	auto count = all_constant ? idx_t(1) : args.size();
	for (idx_t feature = 0; feature < tree.dimensions; feature++) {
		auto &input = args.data[feature];
		if (input.GetVectorType() != VectorType::FLAT_VECTOR) {
			input.Flatten(count);
		}
		local_state.features[feature] = FlatVector::GetData<T>(input);
	}

	ColumnInput<T> input {local_state.features.data()};
	bool selected_null = false;
	if (ColumnsAllValid(args, count)) {
		EvaluateGenericTree(tree, input, count, local_state.leaf_indices.data());
	} else {
		selected_null = true;
		EvaluateValidityEntries<T>(
		    input, count, tree.leaf_count, local_state.leaf_indices.data(),
		    [&](idx_t entry_idx) { return ColumnValidityEntry(args, entry_idx); }, GenericTreeEvaluator<T> {tree});
	}
	EmitLeaves(tree, local_state.leaf_indices, count, all_constant, selected_null, result);
}

template <class T>
static void ExecuteGenericArray(DataChunk &args, ExpressionState &state, Vector &result) {
	auto &tree = static_cast<const GenericTree<T> &>(GetTree(state));
	auto &local_state = GetLocalState<T>(state);
	D_ASSERT(args.ColumnCount() == 1);
	auto &arrays = args.data[0];
	auto all_constant = arrays.GetVectorType() == VectorType::CONSTANT_VECTOR;
	if (all_constant && ConstantVector::IsNull(arrays)) {
		SetConstantNull(result);
		return;
	}
	auto count = all_constant ? idx_t(1) : args.size();
	if (arrays.GetVectorType() != VectorType::FLAT_VECTOR) {
		arrays.Flatten(count);
	}
	auto &elements = ArrayVector::GetEntry(arrays);
	if (elements.GetVectorType() != VectorType::FLAT_VECTOR) {
		elements.Flatten(count * tree.dimensions);
	}

	GenericArrayInput<T> input {FlatVector::GetData<T>(elements), tree.dimensions};
	auto &array_validity = FlatVector::Validity(arrays);
	auto &element_validity = FlatVector::Validity(elements);
	auto elements_all_valid = element_validity.CheckAllValid(count * tree.dimensions);
	auto all_valid = array_validity.CheckAllValid(count) && elements_all_valid;
	if (all_constant && !all_valid) {
		SetConstantNull(result);
		return;
	}
	bool selected_null = false;
	if (all_valid) {
		EvaluateGenericTree(tree, input, count, local_state.leaf_indices.data());
	} else {
		selected_null = true;
		EvaluateValidRuns<T>(
		    input, count, tree.leaf_count, local_state.leaf_indices.data(),
		    [&](idx_t row) {
			    return ArrayRowIsValid(array_validity, element_validity, elements_all_valid, tree.dimensions, row);
		    },
		    GenericTreeEvaluator<T> {tree});
	}
	EmitLeaves(tree, local_state.leaf_indices, count, all_constant, selected_null, result);
}

template <class T>
static unique_ptr<FunctionLocalState> InitializeLocalState(ExpressionState &, const BoundFunctionExpression &,
                                                           FunctionData *bind_data) {
	D_ASSERT(bind_data);
	auto &tree = *bind_data->Cast<DecisionTreeBindData>().tree;
	return make_uniq<DecisionTreeLocalState<T>>(tree.dimensions);
}

template <class T>
static void ConfigureFunction(ScalarFunction &function, idx_t dimensions, bool array_input) {
	function.SetInitStateCallback(InitializeLocalState<T>);
	if (array_input) {
		switch (dimensions) {
		case 1:
			function.SetFunctionCallback(ExecuteFixedArray<T, 1>);
			return;
		case 2:
			function.SetFunctionCallback(ExecuteFixedArray<T, 2>);
			return;
		case 3:
			function.SetFunctionCallback(ExecuteFixedArray<T, 3>);
			return;
		case 4:
			function.SetFunctionCallback(ExecuteFixedArray<T, 4>);
			return;
		case 5:
			function.SetFunctionCallback(ExecuteFixedArray<T, 5>);
			return;
		case 6:
			function.SetFunctionCallback(ExecuteFixedArray<T, 6>);
			return;
		case 7:
			function.SetFunctionCallback(ExecuteFixedArray<T, 7>);
			return;
		default:
			function.SetFunctionCallback(ExecuteGenericArray<T>);
			return;
		}
	}

	switch (dimensions) {
	case 1:
		function.SetFunctionCallback(ExecuteFixedColumns<T, 1>);
		return;
	case 2:
		function.SetFunctionCallback(ExecuteFixedColumns<T, 2>);
		return;
	case 3:
		function.SetFunctionCallback(ExecuteFixedColumns<T, 3>);
		return;
	case 4:
		function.SetFunctionCallback(ExecuteFixedColumns<T, 4>);
		return;
	case 5:
		function.SetFunctionCallback(ExecuteFixedColumns<T, 5>);
		return;
	case 6:
		function.SetFunctionCallback(ExecuteFixedColumns<T, 6>);
		return;
	case 7:
		function.SetFunctionCallback(ExecuteFixedColumns<T, 7>);
		return;
	default:
		function.SetFunctionCallback(ExecuteGenericColumns<T>);
		return;
	}
}

static LogicalType ConfigureTypes(ScalarFunction &function, const ParsedTree &tree, idx_t dimensions, bool array_input,
                                  const vector<LogicalType> &feature_types) {
	auto computation_type = tree.parameter_type;
	for (auto &feature_type : feature_types) {
		RequireFloatingType(feature_type, "features");
		LogicalType combined;
		if (!LogicalType::TryGetMaxLogicalTypeUnchecked(computation_type, feature_type, combined)) {
			throw BinderException("decision_tree parameters of type %s cannot be combined with features of type %s",
			                      computation_type.ToString(), feature_type.ToString());
		}
		computation_type = std::move(combined);
	}
	D_ASSERT(computation_type == LogicalType::FLOAT || computation_type == LogicalType::DOUBLE);

	function.return_type = tree.leaf_type;
	function.varargs = LogicalType(LogicalTypeId::INVALID);
	function.SetNullHandling(FunctionNullHandling::DEFAULT_NULL_HANDLING);
	if (array_input) {
		function.arguments[0] = LogicalType::ARRAY(computation_type, dimensions);
	} else {
		for (auto &argument : function.arguments) {
			argument = computation_type;
		}
	}
	if (computation_type == LogicalType::DOUBLE) {
		ConfigureFunction<double>(function, dimensions, array_input);
	} else {
		ConfigureFunction<float>(function, dimensions, array_input);
	}
	return computation_type;
}

static unique_ptr<FunctionData> BindDecisionTree(ClientContext &context, ScalarFunction &function,
                                                 vector<unique_ptr<Expression>> &arguments) {
	if (arguments.size() < 2) {
		throw BinderException("decision_tree requires a tree and at least one feature");
	}
	if (arguments[0]->HasParameter()) {
		throw ParameterNotResolvedException();
	}
	if (!arguments[0]->IsFoldable()) {
		throw BinderException("decision_tree tree argument must be constant for a bound invocation");
	}
	if (arguments[0]->return_type.id() != LogicalTypeId::STRUCT) {
		throw BinderException("decision_tree first argument must be a constant STRUCT, not %s",
		                      arguments[0]->return_type.ToString());
	}

	auto tree_value = ExpressionExecutor::EvaluateScalar(context, *arguments[0]);
	auto parsed_tree = ParseTreeValue(tree_value);
	bool array_input = arguments.size() == 2 && arguments[1]->return_type.id() == LogicalTypeId::ARRAY;
	idx_t dimensions;
	vector<LogicalType> feature_types;
	if (array_input) {
		dimensions = ArrayType::GetSize(arguments[1]->return_type);
		feature_types.push_back(ArrayType::GetChildType(arguments[1]->return_type));
	} else {
		dimensions = arguments.size() - 1;
		feature_types.reserve(dimensions);
		for (idx_t argument_idx = 1; argument_idx < arguments.size(); argument_idx++) {
			feature_types.push_back(arguments[argument_idx]->return_type);
		}
	}
	ValidateDimensions(parsed_tree, dimensions);

	function.arguments.resize(arguments.size());
	function.arguments[0] = arguments[0]->return_type;
	Function::EraseArgument(function, arguments, 0);
	auto computation_type = ConfigureTypes(function, parsed_tree, dimensions, array_input, feature_types);
	auto compiled_tree = computation_type == LogicalType::DOUBLE ? CompileTree<double>(parsed_tree, dimensions)
	                                                             : CompileTree<float>(parsed_tree, dimensions);
	return make_uniq<DecisionTreeBindData>(std::move(compiled_tree), std::move(tree_value), computation_type);
}

static void SerializeDecisionTree(Serializer &serializer, const optional_ptr<FunctionData> bind_data,
                                  const ScalarFunction &) {
	D_ASSERT(bind_data);
	auto &data = bind_data->Cast<DecisionTreeBindData>();
	serializer.WriteProperty(100, "tree", data.tree_value);
}

static unique_ptr<FunctionData> DeserializeDecisionTree(Deserializer &deserializer, ScalarFunction &function) {
	auto tree_value = deserializer.ReadProperty<Value>(100, "tree");
	auto parsed_tree = ParseTreeValue(tree_value);
	bool array_input = function.arguments.size() == 1 && function.arguments[0].id() == LogicalTypeId::ARRAY;
	auto dimensions = array_input ? ArrayType::GetSize(function.arguments[0]) : function.arguments.size();
	vector<LogicalType> feature_types;
	if (array_input) {
		feature_types.push_back(ArrayType::GetChildType(function.arguments[0]));
	} else {
		feature_types = function.arguments;
	}
	ValidateDimensions(parsed_tree, dimensions);
	auto computation_type = ConfigureTypes(function, parsed_tree, dimensions, array_input, feature_types);
	auto compiled_tree = computation_type == LogicalType::DOUBLE ? CompileTree<double>(parsed_tree, dimensions)
	                                                             : CompileTree<float>(parsed_tree, dimensions);
	return make_uniq<DecisionTreeBindData>(std::move(compiled_tree), std::move(tree_value), computation_type);
}

static void UnboundDecisionTree(DataChunk &, ExpressionState &, Vector &) {
	throw InternalException("decision_tree evaluator was not selected during binding");
}

static void LoadInternal(ExtensionLoader &loader) {
	ScalarFunction function("decision_tree", {LogicalType::ANY, LogicalType::ANY}, LogicalType::ANY,
	                        UnboundDecisionTree, BindDecisionTree);
	function.varargs = LogicalType::ANY;
	// The return type comes from the tree, so binding must happen before DuckDB folds a constant NULL feature.
	// Bound invocations use default null handling.
	function.SetNullHandling(FunctionNullHandling::SPECIAL_HANDLING);
	function.SetSerializeCallback(SerializeDecisionTree);
	function.SetDeserializeCallback(DeserializeDecisionTree);
	loader.RegisterFunction(function);
}

} // namespace

void DtreeExtension::Load(ExtensionLoader &loader) {
	LoadInternal(loader);
}

std::string DtreeExtension::Name() {
	return "dtree";
}

std::string DtreeExtension::Version() const {
#ifdef EXT_VERSION_DTREE
	return EXT_VERSION_DTREE;
#else
	return "";
#endif
}

} // namespace duckdb

extern "C" {

DUCKDB_CPP_EXTENSION_ENTRY(dtree, loader) { // NOLINT
	duckdb::LoadInternal(loader);
}
}
