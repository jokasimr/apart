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
	LogicalType coefficient_type;
	LogicalType threshold_type;
	LogicalType leaf_type;
	int64_t root;
};

struct CompiledTree {
	CompiledTree(const ParsedTree &tree, idx_t dimensions_p)
	    : leaf_values(tree.leaf_type, tree.leaf_values.size() + 1), leaf_count(tree.leaf_values.size()), root(0),
	      dimensions(dimensions_p), depth(0) {
		for (idx_t leaf_idx = 0; leaf_idx < leaf_count; leaf_idx++) {
			leaf_values.SetValue(leaf_idx, tree.leaf_values[leaf_idx]);
		}
		leaf_values.SetValue(leaf_count, Value(tree.leaf_type));
	}

	virtual ~CompiledTree() {
	}

	Vector leaf_values;
	idx_t leaf_count;
	uint32_t root;
	idx_t dimensions;
	uint32_t depth;
};

template <class T, idx_t N>
struct FixedNode {
	T coefficients[N];
	T threshold;
	uint32_t children[2];
};

template <class T, idx_t N>
struct FixedTree final : CompiledTree {
	explicit FixedTree(const ParsedTree &tree) : CompiledTree(tree, N) {
	}

	vector<FixedNode<T, N>> nodes;
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

static const LogicalType &SequenceChildType(const LogicalType &type, const string &field_name) {
	if (type.id() == LogicalTypeId::LIST) {
		return ListType::GetChildType(type);
	}
	if (type.id() == LogicalTypeId::ARRAY) {
		return ArrayType::GetChildType(type);
	}
	throw BinderException("decision_tree tree field '%s' must be a LIST or ARRAY, not %s", field_name, type.ToString());
}

static const vector<Value> &SequenceValues(const Value &value, const string &field_name) {
	if (value.IsNull()) {
		throw BinderException("decision_tree tree field '%s' cannot be NULL", field_name);
	}
	if (value.type().id() == LogicalTypeId::LIST) {
		return ListValue::GetChildren(value);
	}
	if (value.type().id() == LogicalTypeId::ARRAY) {
		return ArrayValue::GetChildren(value);
	}
	throw BinderException("decision_tree tree field '%s' must be a LIST or ARRAY, not %s", field_name,
	                      value.type().ToString());
}

static optional_idx FindStructField(const child_list_t<LogicalType> &fields, const string &name) {
	for (idx_t field_idx = 0; field_idx < fields.size(); field_idx++) {
		if (StringUtil::CIEquals(fields[field_idx].first, name)) {
			return field_idx;
		}
	}
	return optional_idx();
}

static idx_t RequireStructField(const child_list_t<LogicalType> &fields, const string &name) {
	auto result = FindStructField(fields, name);
	if (!result.IsValid()) {
		throw BinderException("decision_tree tree STRUCT is missing required field '%s'", name);
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

static int64_t ReadChildReference(const Value &value, const string &field_name, idx_t index) {
	if (value.IsNull()) {
		throw BinderException("decision_tree tree field '%s' contains NULL at index %llu", field_name, index);
	}
	try {
		return value.DefaultCastAs(LogicalType::BIGINT).GetValue<int64_t>();
	} catch (Exception &ex) {
		throw BinderException("decision_tree tree field '%s' contains an invalid child reference at index %llu: %s",
		                      field_name, index, ex.what());
	}
}

static ParsedTree ParseTreeValue(const Value &tree_value) {
	if (tree_value.IsNull()) {
		throw BinderException("decision_tree tree argument cannot be NULL");
	}
	if (tree_value.type().id() != LogicalTypeId::STRUCT) {
		throw BinderException("decision_tree first argument must be a constant STRUCT, not %s",
		                      tree_value.type().ToString());
	}

	auto &fields = StructType::GetChildTypes(tree_value.type());
	auto &values = StructValue::GetChildren(tree_value);
	auto coefficients_idx = RequireStructField(fields, "coefficients");
	auto thresholds_idx = RequireStructField(fields, "thresholds");
	auto left_idx = RequireStructField(fields, "left_children");
	auto right_idx = RequireStructField(fields, "right_children");
	auto leaves_idx = RequireStructField(fields, "leaf_values");
	auto root_idx = FindStructField(fields, "root");

	auto &coefficient_rows = SequenceValues(values[coefficients_idx], "coefficients");
	auto &threshold_values = SequenceValues(values[thresholds_idx], "thresholds");
	auto &left_values = SequenceValues(values[left_idx], fields[left_idx].first);
	auto &right_values = SequenceValues(values[right_idx], fields[right_idx].first);
	auto &leaf_values = SequenceValues(values[leaves_idx], fields[leaves_idx].first);

	auto coefficient_row_type = SequenceChildType(fields[coefficients_idx].second, "coefficients");
	auto coefficient_type = SequenceChildType(coefficient_row_type, "coefficients row");
	auto threshold_type = SequenceChildType(fields[thresholds_idx].second, "thresholds");
	auto left_type = SequenceChildType(fields[left_idx].second, fields[left_idx].first);
	auto right_type = SequenceChildType(fields[right_idx].second, fields[right_idx].first);
	auto leaf_type = SequenceChildType(fields[leaves_idx].second, fields[leaves_idx].first);

	RequireFloatingType(coefficient_type, "coefficients");
	RequireFloatingType(threshold_type, "thresholds");
	if (!left_type.IsIntegral() || !right_type.IsIntegral()) {
		throw BinderException("decision_tree child references must use integer types (found %s and %s)",
		                      left_type.ToString(), right_type.ToString());
	}
	if (root_idx.IsValid() && !fields[root_idx.GetIndex()].second.IsIntegral()) {
		throw BinderException("decision_tree root reference must use an integer type, not %s",
		                      fields[root_idx.GetIndex()].second.ToString());
	}
	if (leaf_type.id() == LogicalTypeId::SQLNULL || leaf_type.id() == LogicalTypeId::UNKNOWN) {
		throw BinderException("decision_tree leaf_values must have a concrete type; cast an all-NULL or empty list to "
		                      "the desired result type");
	}

	auto node_count = coefficient_rows.size();
	if (threshold_values.size() != node_count || left_values.size() != node_count ||
	    right_values.size() != node_count) {
		throw BinderException("decision_tree coefficients, thresholds, left_children, and right_children must have "
		                      "the same number of entries");
	}
	if (leaf_values.empty()) {
		throw BinderException("decision_tree leaf_values must contain at least one value");
	}
	if (node_count >= LEAF_MASK || leaf_values.size() >= LEAF_MASK) {
		throw BinderException("decision_tree supports fewer than %u internal nodes and leaf values", LEAF_MASK);
	}

	ParsedTree result;
	result.thresholds = threshold_values;
	result.leaf_values = leaf_values;
	result.coefficient_type = std::move(coefficient_type);
	result.threshold_type = std::move(threshold_type);
	result.leaf_type = std::move(leaf_type);
	result.coefficients.reserve(node_count);
	result.left_children.reserve(node_count);
	result.right_children.reserve(node_count);

	for (idx_t node_idx = 0; node_idx < node_count; node_idx++) {
		result.coefficients.emplace_back(SequenceValues(coefficient_rows[node_idx], "coefficients row"));
		result.left_children.push_back(ReadChildReference(left_values[node_idx], fields[left_idx].first, node_idx));
		result.right_children.push_back(ReadChildReference(right_values[node_idx], fields[right_idx].first, node_idx));
	}

	if (root_idx.IsValid()) {
		result.root = ReadChildReference(values[root_idx.GetIndex()], "root", 0);
	} else if (node_count == 0) {
		if (leaf_values.size() != 1) {
			throw BinderException("decision_tree with no internal nodes requires a root field identifying the leaf");
		}
		result.root = -1;
	} else {
		result.root = 0;
	}
	return result;
}

static void ValidateDimensions(const ParsedTree &tree, idx_t dimensions) {
	if (dimensions == 0) {
		throw BinderException("decision_tree requires at least one feature");
	}
	for (idx_t node_idx = 0; node_idx < tree.coefficients.size(); node_idx++) {
		if (tree.coefficients[node_idx].size() != dimensions) {
			throw BinderException("decision_tree coefficients row %llu has %llu values, but the invocation has %llu "
			                      "features",
			                      node_idx, tree.coefficients[node_idx].size(), dimensions);
		}
	}
}

template <class T>
static T ReadNumber(const Value &value, const string &field_name, idx_t index) {
	if (value.IsNull()) {
		throw BinderException("decision_tree tree field '%s' contains NULL at index %llu", field_name, index);
	}
	auto target_type = std::is_same<T, float>::value ? LogicalType::FLOAT : LogicalType::DOUBLE;
	auto cast_value = value.DefaultCastAs(target_type);
	return cast_value.template GetValue<T>();
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
			                      reference, node_count);
		}
		if (node_state[source] == 1) {
			throw BinderException("decision_tree topology contains a cycle at internal node %lld", reference);
		}
		if (node_state[source] == 2) {
			throw BinderException("decision_tree topology reuses internal node %lld; topology must be a tree",
			                      reference);
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

	result.root = visit(tree.root, 0);
	for (idx_t node_idx = 0; node_idx < node_count; node_idx++) {
		if (node_state[node_idx] == 0) {
			throw BinderException("decision_tree contains unreachable internal node %llu", node_idx);
		}
	}
	for (idx_t leaf_idx = 0; leaf_idx < leaf_count; leaf_idx++) {
		if (!leaf_used[leaf_idx]) {
			throw BinderException("decision_tree contains unreachable leaf value %llu", leaf_idx);
		}
	}
}

template <class T, idx_t N>
static shared_ptr<CompiledTree> CompileFixedTree(const ParsedTree &tree) {
	auto result = make_shared_ptr<FixedTree<T, N>>(tree);
	CompileTopology(tree, *result, [&](FixedTree<T, N> &target_tree, uint32_t target, idx_t source) {
		auto &node = target_tree.nodes[target];
		node.threshold = ReadNumber<T>(tree.thresholds[source], "thresholds", source);
		for (idx_t feature_idx = 0; feature_idx < N; feature_idx++) {
			node.coefficients[feature_idx] =
			    ReadNumber<T>(tree.coefficients[source][feature_idx], "coefficients", source);
		}
	});
	return result;
}

template <class T>
static shared_ptr<CompiledTree> CompileGenericTree(const ParsedTree &tree, idx_t dimensions) {
	auto result = make_shared_ptr<GenericTree<T>>(tree, dimensions);
	auto node_count = tree.coefficients.size();
	result->coefficients.resize(node_count * dimensions);
	CompileTopology(tree, *result, [&](GenericTree<T> &target_tree, uint32_t target, idx_t source) {
		auto &node = target_tree.nodes[target];
		node.threshold = ReadNumber<T>(tree.thresholds[source], "thresholds", source);
		for (idx_t feature_idx = 0; feature_idx < dimensions; feature_idx++) {
			target_tree.coefficients[feature_idx * node_count + target] =
			    ReadNumber<T>(tree.coefficients[source][feature_idx], "coefficients", source);
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

template <idx_t FEATURE, class T, idx_t N, class INPUT>
struct FixedScore {
	static inline void Accumulate(T &score, const FixedNode<T, N> &node, const INPUT &input, idx_t row) {
		score += node.coefficients[FEATURE] * input.Get(FEATURE, row);
		FixedScore<FEATURE + 1, T, N, INPUT>::Accumulate(score, node, input, row);
	}
};

template <class T, idx_t N, class INPUT>
struct FixedScore<N, T, N, INPUT> {
	static inline void Accumulate(T &, const FixedNode<T, N> &, const INPUT &, idx_t) {
	}
};

template <class T, idx_t N, class INPUT>
static inline uint32_t AdvanceFixed(const FixedNode<T, N> *nodes, const INPUT &input, idx_t row, uint32_t reference) {
	auto &node = nodes[reference];
	T score = 0;
	FixedScore<0, T, N, INPUT>::Accumulate(score, node, input, row);
	return node.children[static_cast<idx_t>(score >= node.threshold)];
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
static inline void AdvanceFixedLane(const FixedNode<T, N> *nodes, const INPUT &input, idx_t row,
                                    uint32_t (&references)[BLOCK_SIZE]) {
	references[LANE] = AdvanceFixed(nodes, input, row + LANE, references[LANE]);
}

template <class T, idx_t N, class INPUT>
static inline void AdvanceFixedBlock(const FixedNode<T, N> *nodes, const INPUT &input, idx_t row,
                                     uint32_t (&references)[BLOCK_SIZE]) {
	AdvanceFixedLane<0>(nodes, input, row, references);
	AdvanceFixedLane<1>(nodes, input, row, references);
	AdvanceFixedLane<2>(nodes, input, row, references);
	AdvanceFixedLane<3>(nodes, input, row, references);
	AdvanceFixedLane<4>(nodes, input, row, references);
	AdvanceFixedLane<5>(nodes, input, row, references);
	AdvanceFixedLane<6>(nodes, input, row, references);
	AdvanceFixedLane<7>(nodes, input, row, references);
}

template <class T, idx_t N, class INPUT>
static void EvaluateFixedTree(const FixedTree<T, N> &tree, const INPUT &input, idx_t count, sel_t *leaf_indices) {
	auto nodes = tree.nodes.data();
	idx_t row = 0;
	for (; row + BLOCK_SIZE <= count; row += BLOCK_SIZE) {
		uint32_t references[BLOCK_SIZE] {tree.root, tree.root, tree.root, tree.root,
		                                 tree.root, tree.root, tree.root, tree.root};
		if (tree.depth == VARIABLE_DEPTH) {
			uint8_t active = IsLeaf(tree.root) ? 0 : UINT8_C(0xff);
			while (active) {
				uint8_t next_active = 0;
				AdvanceFixedActive(nodes, input, row, active, references, next_active);
				active = next_active;
			}
		} else {
			for (uint32_t level = 0; level < tree.depth; level++) {
				AdvanceFixedBlock(nodes, input, row, references);
			}
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

template <bool CHECK_ACTIVE, idx_t LANE, class T, class INPUT>
static inline void AccumulateGenericLane(const T *coefficients, const INPUT &input, idx_t feature, idx_t row,
                                         uint8_t active, const uint32_t (&references)[BLOCK_SIZE],
                                         T (&scores)[BLOCK_SIZE]) {
	constexpr auto lane_bit = static_cast<uint8_t>(uint8_t(1) << LANE);
	if (!CHECK_ACTIVE || (active & lane_bit)) {
		scores[LANE] += coefficients[references[LANE]] * input.Get(feature, row + LANE);
	}
}

template <bool CHECK_ACTIVE, class T, class INPUT>
static inline void AccumulateGeneric(const T *coefficients, const INPUT &input, idx_t feature, idx_t row,
                                     uint8_t active, const uint32_t (&references)[BLOCK_SIZE],
                                     T (&scores)[BLOCK_SIZE]) {
	AccumulateGenericLane<CHECK_ACTIVE, 0>(coefficients, input, feature, row, active, references, scores);
	AccumulateGenericLane<CHECK_ACTIVE, 1>(coefficients, input, feature, row, active, references, scores);
	AccumulateGenericLane<CHECK_ACTIVE, 2>(coefficients, input, feature, row, active, references, scores);
	AccumulateGenericLane<CHECK_ACTIVE, 3>(coefficients, input, feature, row, active, references, scores);
	AccumulateGenericLane<CHECK_ACTIVE, 4>(coefficients, input, feature, row, active, references, scores);
	AccumulateGenericLane<CHECK_ACTIVE, 5>(coefficients, input, feature, row, active, references, scores);
	AccumulateGenericLane<CHECK_ACTIVE, 6>(coefficients, input, feature, row, active, references, scores);
	AccumulateGenericLane<CHECK_ACTIVE, 7>(coefficients, input, feature, row, active, references, scores);
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
	T scores[BLOCK_SIZE] {};
	auto node_count = tree.nodes.size();
	for (idx_t feature = 0; feature < tree.dimensions; feature++) {
		auto coefficients = tree.coefficients.data() + feature * node_count;
		AccumulateGeneric<CHECK_ACTIVE>(coefficients, input, feature, row, active, references, scores);
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
		T score = 0;
		for (idx_t feature = 0; feature < tree.dimensions; feature++) {
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

template <class T>
static DecisionTreeLocalState<T> &GetLocalState(ExpressionState &state) {
	return ExecuteFunctionState::GetFunctionState(state)->Cast<DecisionTreeLocalState<T>>();
}

static const CompiledTree &GetTree(ExpressionState &state) {
	auto &expression = state.expr.Cast<BoundFunctionExpression>();
	return *expression.bind_info->Cast<DecisionTreeBindData>().tree;
}

static void EmitLeaves(const CompiledTree &tree, const SelectionVector &leaf_indices, idx_t count, bool all_constant,
                       Vector &result) {
	if (!all_constant && tree.leaf_count < STANDARD_VECTOR_SIZE / 2) {
		result.Reference(tree.leaf_values);
		result.Dictionary(tree.leaf_count + 1, leaf_indices, count);
		return;
	}
	result.SetVectorType(VectorType::FLAT_VECTOR);
	VectorOperations::Copy(tree.leaf_values, result, leaf_indices, tree.leaf_count + 1, 0, 0, count);
	if (all_constant) {
		result.SetVectorType(VectorType::CONSTANT_VECTOR);
	}
}

static void ApplyColumnNulls(DataChunk &args, idx_t count, idx_t null_leaf, SelectionVector &leaf_indices) {
	for (auto &input : args.data) {
		auto &validity = FlatVector::Validity(input);
		if (!validity.AllValid()) {
			for (idx_t row = 0; row < count; row++) {
				if (!validity.RowIsValid(row)) {
					leaf_indices.set_index(row, null_leaf);
				}
			}
		}
	}
}

static void ApplyArrayNulls(Vector &arrays, Vector &elements, idx_t dimensions, idx_t count, idx_t null_leaf,
                            SelectionVector &leaf_indices) {
	auto &array_validity = FlatVector::Validity(arrays);
	auto &element_validity = FlatVector::Validity(elements);
	auto elements_all_valid = element_validity.AllValid();
	if (array_validity.AllValid() && elements_all_valid) {
		return;
	}
	for (idx_t row = 0; row < count; row++) {
		if (!array_validity.RowIsValid(row)) {
			leaf_indices.set_index(row, null_leaf);
			continue;
		}
		if (!elements_all_valid) {
			auto offset = row * dimensions;
			for (idx_t feature = 0; feature < dimensions; feature++) {
				if (!element_validity.RowIsValid(offset + feature)) {
					leaf_indices.set_index(row, null_leaf);
					break;
				}
			}
		}
	}
}

template <class T, idx_t N>
static void ExecuteFixedColumns(DataChunk &args, ExpressionState &state, Vector &result) {
	auto &tree = static_cast<const FixedTree<T, N> &>(GetTree(state));
	auto &local_state = GetLocalState<T>(state);
	D_ASSERT(args.ColumnCount() == N);
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
	EvaluateFixedTree(tree, input, count, local_state.leaf_indices.data());
	ApplyColumnNulls(args, count, tree.leaf_count, local_state.leaf_indices);
	EmitLeaves(tree, local_state.leaf_indices, count, all_constant, result);
}

template <class T, idx_t N>
static void ExecuteFixedArray(DataChunk &args, ExpressionState &state, Vector &result) {
	auto &tree = static_cast<const FixedTree<T, N> &>(GetTree(state));
	auto &local_state = GetLocalState<T>(state);
	D_ASSERT(args.ColumnCount() == 1);
	auto all_constant = args.AllConstant();
	auto count = all_constant ? idx_t(1) : args.size();
	auto &arrays = args.data[0];
	if (arrays.GetVectorType() != VectorType::FLAT_VECTOR) {
		arrays.Flatten(count);
	}
	auto &elements = ArrayVector::GetEntry(arrays);
	if (elements.GetVectorType() != VectorType::FLAT_VECTOR) {
		elements.Flatten(count * N);
	}

	FixedArrayInput<T, N> input {FlatVector::GetData<T>(elements)};
	EvaluateFixedTree(tree, input, count, local_state.leaf_indices.data());
	ApplyArrayNulls(arrays, elements, N, count, tree.leaf_count, local_state.leaf_indices);
	EmitLeaves(tree, local_state.leaf_indices, count, all_constant, result);
}

template <class T>
static void ExecuteGenericColumns(DataChunk &args, ExpressionState &state, Vector &result) {
	auto &tree = static_cast<const GenericTree<T> &>(GetTree(state));
	auto &local_state = GetLocalState<T>(state);
	D_ASSERT(args.ColumnCount() == tree.dimensions);
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
	EvaluateGenericTree(tree, input, count, local_state.leaf_indices.data());
	ApplyColumnNulls(args, count, tree.leaf_count, local_state.leaf_indices);
	EmitLeaves(tree, local_state.leaf_indices, count, all_constant, result);
}

template <class T>
static void ExecuteGenericArray(DataChunk &args, ExpressionState &state, Vector &result) {
	auto &tree = static_cast<const GenericTree<T> &>(GetTree(state));
	auto &local_state = GetLocalState<T>(state);
	D_ASSERT(args.ColumnCount() == 1);
	auto all_constant = args.AllConstant();
	auto count = all_constant ? idx_t(1) : args.size();
	auto &arrays = args.data[0];
	if (arrays.GetVectorType() != VectorType::FLAT_VECTOR) {
		arrays.Flatten(count);
	}
	auto &elements = ArrayVector::GetEntry(arrays);
	if (elements.GetVectorType() != VectorType::FLAT_VECTOR) {
		elements.Flatten(count * tree.dimensions);
	}

	GenericArrayInput<T> input {FlatVector::GetData<T>(elements), tree.dimensions};
	EvaluateGenericTree(tree, input, count, local_state.leaf_indices.data());
	ApplyArrayNulls(arrays, elements, tree.dimensions, count, tree.leaf_count, local_state.leaf_indices);
	EmitLeaves(tree, local_state.leaf_indices, count, all_constant, result);
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
	default:
		function.SetFunctionCallback(ExecuteGenericColumns<T>);
		return;
	}
}

static void IncludeComputationType(const LogicalType &type, const string &description, bool &use_double) {
	RequireFloatingType(type, description);
	use_double |= type == LogicalType::DOUBLE;
}

static LogicalType ConfigureTypes(ScalarFunction &function, const ParsedTree &tree, idx_t dimensions, bool array_input,
                                  const vector<LogicalType> &feature_types) {
	bool use_double = false;
	IncludeComputationType(tree.coefficient_type, "coefficients", use_double);
	IncludeComputationType(tree.threshold_type, "thresholds", use_double);
	for (auto &feature_type : feature_types) {
		IncludeComputationType(feature_type, "features", use_double);
	}
	auto computation_type = use_double ? LogicalType::DOUBLE : LogicalType::FLOAT;

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
	if (use_double) {
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
