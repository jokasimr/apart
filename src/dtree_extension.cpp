#define DUCKDB_EXTENSION_MAIN

#include "dtree_extension.hpp"

#include "duckdb/common/exception.hpp"
#include "duckdb/common/string_util.hpp"
#include "duckdb/common/types/vector.hpp"
#include "duckdb/execution/expression_executor.hpp"
#include "duckdb/function/scalar_function.hpp"
#include "duckdb/planner/expression/bound_function_expression.hpp"

#include <functional>
#include <limits>

namespace duckdb {

namespace {

constexpr uint32_t LEAF_MASK = uint32_t(1) << 31;
constexpr uint32_t INDEX_MASK = LEAF_MASK - 1;

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

struct CompiledTopologyNode {
	idx_t source_index;
	uint32_t left;
	uint32_t right;
};

template <class T>
struct CompiledNode {
	T threshold;
	uint32_t left;
	uint32_t right;
};

struct CompiledTopology {
	vector<CompiledTopologyNode> nodes;
	uint32_t root;
};

template <class T>
struct CompiledTree {
	vector<T> coefficients;
	vector<CompiledNode<T>> nodes;
	uint32_t root;
	idx_t dimensions;
};

template <class T>
struct DecisionTreeBindData final : FunctionData {
	DecisionTreeBindData(shared_ptr<CompiledTree<T>> tree_p, shared_ptr<Vector> leaves_p, idx_t null_leaf_index_p)
	    : tree(std::move(tree_p)), leaves(std::move(leaves_p)), null_leaf_index(null_leaf_index_p) {
	}

	shared_ptr<CompiledTree<T>> tree;
	shared_ptr<Vector> leaves;
	idx_t null_leaf_index;

	unique_ptr<FunctionData> Copy() const override {
		return make_uniq<DecisionTreeBindData<T>>(tree, leaves, null_leaf_index);
	}

	bool Equals(const FunctionData &) const override {
		return true;
	}
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
	result.coefficient_type = coefficient_type;
	result.threshold_type = threshold_type;
	result.leaf_type = leaf_type;
	result.thresholds = threshold_values;
	result.leaf_values = leaf_values;
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

static CompiledTopology ValidateAndCompileTopology(const ParsedTree &tree) {
	auto node_count = tree.coefficients.size();
	auto leaf_count = tree.leaf_values.size();
	vector<uint8_t> node_state(node_count, 0);
	vector<bool> leaf_used(leaf_count, false);
	CompiledTopology result;

	std::function<uint32_t(int64_t)> visit = [&](int64_t reference) -> uint32_t {
		if (reference < 0) {
			if (reference == std::numeric_limits<int64_t>::min()) {
				throw BinderException("decision_tree contains an invalid leaf reference");
			}
			auto leaf_idx = UnsafeNumericCast<uint64_t>(-reference - 1);
			if (leaf_idx >= leaf_count) {
				throw BinderException("decision_tree leaf reference %lld is out of range for %llu leaf values",
				                      reference, leaf_count);
			}
			leaf_used[leaf_idx] = true;
			return LEAF_MASK | UnsafeNumericCast<uint32_t>(leaf_idx);
		}

		auto source_idx = UnsafeNumericCast<uint64_t>(reference);
		if (source_idx >= node_count) {
			throw BinderException("decision_tree internal-node reference %lld is out of range for %llu nodes",
			                      reference, node_count);
		}
		if (node_state[source_idx] == 1) {
			throw BinderException("decision_tree topology contains a cycle at internal node %lld", reference);
		}
		if (node_state[source_idx] == 2) {
			throw BinderException("decision_tree topology reuses internal node %lld; topology must be a tree",
			                      reference);
		}

		node_state[source_idx] = 1;
		auto target_idx = UnsafeNumericCast<uint32_t>(result.nodes.size());
		result.nodes.push_back({source_idx, 0, 0});
		auto left_child = visit(tree.left_children[source_idx]);
		auto right_child = visit(tree.right_children[source_idx]);
		result.nodes[target_idx].left = left_child;
		result.nodes[target_idx].right = right_child;
		node_state[source_idx] = 2;
		return target_idx;
	};

	result.root = visit(tree.root);
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
	return result;
}

static bool RequiresDouble(const LogicalType &type) {
	if (type.id() == LogicalTypeId::UNKNOWN) {
		throw ParameterNotResolvedException();
	}
	if (type.id() == LogicalTypeId::DOUBLE) {
		return true;
	}
	if (type.id() != LogicalTypeId::FLOAT) {
		throw BinderException("decision_tree parameters and features must be FLOAT or DOUBLE, not %s", type.ToString());
	}
	return false;
}

template <class T>
static T GetParameter(const Value &value, const string &field_name, idx_t index) {
	if (value.IsNull()) {
		throw BinderException("decision_tree tree field '%s' contains NULL at index %llu", field_name, index);
	}
	return value.GetValue<T>();
}

template <class T>
static shared_ptr<CompiledTree<T>> BuildCompiledTree(const ParsedTree &tree, const CompiledTopology &topology,
                                                     idx_t dimensions) {
	auto storage = make_shared_ptr<CompiledTree<T>>();
	storage->root = topology.root;
	storage->dimensions = dimensions;
	storage->nodes.reserve(topology.nodes.size());
	storage->coefficients.reserve(topology.nodes.size() * dimensions);
	for (auto &node : topology.nodes) {
		for (idx_t feature_idx = 0; feature_idx < dimensions; feature_idx++) {
			storage->coefficients.push_back(
			    GetParameter<T>(tree.coefficients[node.source_index][feature_idx], "coefficients", node.source_index));
		}
		storage->nodes.push_back({GetParameter<T>(tree.thresholds[node.source_index], "thresholds", node.source_index),
		                          node.left, node.right});
	}
	return storage;
}

template <class T>
struct NumericVectorAccessor {
	UnifiedVectorFormat format;
	const T *data = nullptr;

	void Initialize(Vector &input, idx_t count) {
		input.ToUnifiedFormat(count, format);
		data = format.GetData<T>();
	}

	inline bool Get(idx_t row, T &value) const {
		auto source_idx = format.sel->get_index(row);
		if (!format.validity.RowIsValid(source_idx)) {
			return false;
		}
		value = data[source_idx];
		return true;
	}
};

template <class T>
struct NumericArrayAccessor {
	UnifiedVectorFormat arrays;
	UnifiedVectorFormat elements;
	const T *data = nullptr;

	void Initialize(Vector &input, idx_t count) {
		input.ToUnifiedFormat(count, arrays);
		auto &child = ArrayVector::GetEntry(input);
		child.ToUnifiedFormat(ArrayVector::GetTotalSize(input), elements);
		data = elements.GetData<T>();
	}

	inline bool Get(idx_t row, T *values, idx_t dimensions) const {
		auto array_idx = arrays.sel->get_index(row);
		if (!arrays.validity.RowIsValid(array_idx)) {
			return false;
		}
		auto offset = array_idx * dimensions;
		for (idx_t feature_idx = 0; feature_idx < dimensions; feature_idx++) {
			auto element_idx = elements.sel->get_index(offset + feature_idx);
			if (!elements.validity.RowIsValid(element_idx)) {
				return false;
			}
			values[feature_idx] = data[element_idx];
		}
		return true;
	}
};

static inline bool IsLeaf(uint32_t reference) {
	return (reference & LEAF_MASK) != 0;
}

static inline idx_t LeafIndex(uint32_t reference) {
	return reference & INDEX_MASK;
}

template <class T>
static inline uint32_t Traverse(const CompiledTree<T> &tree, const T *features) {
	auto reference = tree.root;
	while (!IsLeaf(reference)) {
		auto &node = tree.nodes[reference];
		T score = T(0);
		auto coefficient_offset = UnsafeNumericCast<idx_t>(reference) * tree.dimensions;
		for (idx_t feature_idx = 0; feature_idx < tree.dimensions; feature_idx++) {
			score += tree.coefficients[coefficient_offset + feature_idx] * features[feature_idx];
		}
		reference = score >= node.threshold ? node.right : node.left;
	}
	return reference;
}

static void EmitLeafSelection(DataChunk &args, Vector &leaves, SelectionVector &selection, Vector &result) {
	if (args.AllConstant()) {
		ConstantVector::Reference(result, leaves, selection.get_index(0), args.size());
	} else {
		result.Slice(leaves, selection, args.size());
	}
}

template <class T>
static void ExecuteColumns(DataChunk &args, ExpressionState &state, Vector &result) {
	auto &expression = state.expr.Cast<BoundFunctionExpression>();
	auto &bind_data = expression.bind_info->Cast<DecisionTreeBindData<T>>();
	auto &tree = *bind_data.tree;
	vector<NumericVectorAccessor<T>> inputs(tree.dimensions);
	for (idx_t feature_idx = 0; feature_idx < tree.dimensions; feature_idx++) {
		inputs[feature_idx].Initialize(args.data[feature_idx + 1], args.size());
	}
	vector<T> features(tree.dimensions);
	SelectionVector leaves(args.size());
	for (idx_t row = 0; row < args.size(); row++) {
		bool valid = true;
		for (idx_t feature_idx = 0; feature_idx < tree.dimensions; feature_idx++) {
			if (!inputs[feature_idx].Get(row, features[feature_idx])) {
				valid = false;
				break;
			}
		}
		leaves.set_index(row, valid ? LeafIndex(Traverse(tree, features.data())) : bind_data.null_leaf_index);
	}
	EmitLeafSelection(args, *bind_data.leaves, leaves, result);
}

template <class T>
static void ExecuteArray(DataChunk &args, ExpressionState &state, Vector &result) {
	auto &expression = state.expr.Cast<BoundFunctionExpression>();
	auto &bind_data = expression.bind_info->Cast<DecisionTreeBindData<T>>();
	auto &tree = *bind_data.tree;
	NumericArrayAccessor<T> input;
	input.Initialize(args.data[1], args.size());
	vector<T> features(tree.dimensions);
	SelectionVector leaves(args.size());
	for (idx_t row = 0; row < args.size(); row++) {
		auto valid = input.Get(row, features.data(), tree.dimensions);
		leaves.set_index(row, valid ? LeafIndex(Traverse(tree, features.data())) : bind_data.null_leaf_index);
	}
	EmitLeafSelection(args, *bind_data.leaves, leaves, result);
}

template <class T>
static unique_ptr<FunctionData> BindEvaluator(ScalarFunction &function, const ParsedTree &tree,
                                              const CompiledTopology &topology, idx_t dimensions, bool array_input,
                                              shared_ptr<Vector> leaves, idx_t null_leaf_index) {
	function.SetFunctionCallback(array_input ? ExecuteArray<T> : ExecuteColumns<T>);
	return make_uniq<DecisionTreeBindData<T>>(BuildCompiledTree<T>(tree, topology, dimensions), std::move(leaves),
	                                          null_leaf_index);
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

	auto parsed_tree = ParseTreeValue(ExpressionExecutor::EvaluateScalar(context, *arguments[0]));
	bool array_input = arguments.size() == 2 && arguments[1]->return_type.id() == LogicalTypeId::ARRAY;
	idx_t dimensions;
	bool use_double = false;
	if (!parsed_tree.coefficients.empty()) {
		use_double |= RequiresDouble(parsed_tree.coefficient_type);
		use_double |= RequiresDouble(parsed_tree.threshold_type);
	}

	if (array_input) {
		dimensions = ArrayType::GetSize(arguments[1]->return_type);
		use_double |= RequiresDouble(ArrayType::GetChildType(arguments[1]->return_type));
	} else {
		dimensions = arguments.size() - 1;
		for (idx_t argument_idx = 1; argument_idx < arguments.size(); argument_idx++) {
			use_double |= RequiresDouble(arguments[argument_idx]->return_type);
		}
	}
	if (dimensions == 0) {
		throw BinderException("decision_tree requires at least one feature");
	}
	for (idx_t node_idx = 0; node_idx < parsed_tree.coefficients.size(); node_idx++) {
		if (parsed_tree.coefficients[node_idx].size() != dimensions) {
			throw BinderException("decision_tree coefficients row %llu has %llu values, but the invocation has %llu "
			                      "features",
			                      node_idx, parsed_tree.coefficients[node_idx].size(), dimensions);
		}
	}

	LogicalType computation_type = use_double ? LogicalType::DOUBLE : LogicalType::FLOAT;
	auto topology = ValidateAndCompileTopology(parsed_tree);
	auto leaf_storage = make_shared_ptr<Vector>(parsed_tree.leaf_type, parsed_tree.leaf_values.size() + 1);
	for (idx_t leaf_idx = 0; leaf_idx < parsed_tree.leaf_values.size(); leaf_idx++) {
		leaf_storage->SetValue(leaf_idx, parsed_tree.leaf_values[leaf_idx]);
	}
	auto null_leaf_index = parsed_tree.leaf_values.size();
	leaf_storage->SetValue(null_leaf_index, Value(parsed_tree.leaf_type));

	function.arguments.resize(arguments.size());
	function.arguments[0] = arguments[0]->return_type;
	if (array_input) {
		function.arguments[1] = LogicalType::ARRAY(computation_type, dimensions);
	} else {
		for (idx_t argument_idx = 1; argument_idx < arguments.size(); argument_idx++) {
			function.arguments[argument_idx] = computation_type;
		}
	}
	function.varargs = LogicalType(LogicalTypeId::INVALID);
	function.SetReturnType(parsed_tree.leaf_type);

	switch (computation_type.id()) {
	case LogicalTypeId::FLOAT:
		return BindEvaluator<float>(function, parsed_tree, topology, dimensions, array_input, std::move(leaf_storage),
		                            null_leaf_index);
	case LogicalTypeId::DOUBLE:
		return BindEvaluator<double>(function, parsed_tree, topology, dimensions, array_input, std::move(leaf_storage),
		                             null_leaf_index);
	default:
		throw InternalException("Unsupported decision_tree computation type %s", computation_type.ToString());
	}
}

static void UnboundDecisionTree(DataChunk &, ExpressionState &, Vector &) {
	throw InternalException("decision_tree evaluator was not selected during binding");
}

static void LoadInternal(ExtensionLoader &loader) {
	ScalarFunction decision_tree("decision_tree", {LogicalType::ANY, LogicalType::ANY}, LogicalType::ANY,
	                             UnboundDecisionTree, BindDecisionTree);
	decision_tree.varargs = LogicalType::ANY;
	decision_tree.SetNullHandling(FunctionNullHandling::SPECIAL_HANDLING);
	loader.RegisterFunction(decision_tree);
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
