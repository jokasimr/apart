#include <algorithm>
#include <array>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <random>
#include <stdexcept>
#include <vector>

namespace {

constexpr uint32_t LEAF_BIT = uint32_t(1) << 31;
constexpr uint32_t INDEX_MASK = LEAF_BIT - 1;
constexpr uint32_t DEPTH = 10;
constexpr uint64_t CHUNK_SIZE = 2048;

struct Node {
	float a0;
	float a1;
	float a2;
	float threshold;
	uint32_t children[2];
};

struct Point {
	float x0;
	float x1;
	float x2;
};

struct GenericNode {
	float threshold;
	uint32_t children[2];
};

struct GenericTree {
	std::vector<float> coefficients;
	std::vector<float> feature_major_coefficients;
	std::vector<GenericNode> nodes;
	uint32_t dimensions;
};

struct AosInput {
	const Point *points;

	inline float Score(const Node &node, uint64_t row) const {
		auto &point = points[row];
		return node.a0 * point.x0 + node.a1 * point.x1 + node.a2 * point.x2;
	}
};

struct SoaInput {
	const float *x0;
	const float *x1;
	const float *x2;

	inline float Score(const Node &node, uint64_t row) const {
		return node.a0 * x0[row] + node.a1 * x1[row] + node.a2 * x2[row];
	}
};

class SplitMix64 {
public:
	explicit SplitMix64(uint64_t seed) : state(seed) {
	}

	uint64_t Next() {
		uint64_t value = (state += UINT64_C(0x9e3779b97f4a7c15));
		value = (value ^ (value >> 30)) * UINT64_C(0xbf58476d1ce4e5b9);
		value = (value ^ (value >> 27)) * UINT64_C(0x94d049bb133111eb);
		return value ^ (value >> 31);
	}

	float Parameter() {
		return static_cast<float>(static_cast<int>(Next() % 17) - 8) / 8.0F;
	}

	float Threshold() {
		return static_cast<float>(static_cast<int>(Next() % 5) - 2) / 8.0F;
	}

private:
	uint64_t state;
};

std::vector<Node> MakeHeapTree(uint64_t seed) {
	const auto node_count = (uint32_t(1) << DEPTH) - 1;
	const auto first_bottom_node = (uint32_t(1) << (DEPTH - 1)) - 1;
	std::vector<Node> tree(node_count);
	SplitMix64 random(seed);
	for (uint32_t node_index = 0; node_index < node_count; node_index++) {
		auto &node = tree[node_index];
		node.a0 = random.Parameter();
		node.a1 = random.Parameter();
		node.a2 = random.Parameter();
		if (node.a0 == 0 && node.a1 == 0 && node.a2 == 0) {
			node.a0 = 1.0F / 8.0F;
		}
		node.threshold = random.Threshold();
		auto left = 2 * node_index + 1;
		if (left < node_count) {
			node.children[0] = left;
			node.children[1] = left + 1;
		} else {
			auto leaf = 2 * (node_index - first_bottom_node);
			node.children[0] = LEAF_BIT | leaf;
			node.children[1] = LEAF_BIT | (leaf + 1);
		}
	}
	return tree;
}

uint32_t CopyPreorder(const std::vector<Node> &source, std::vector<Node> &target, uint32_t reference) {
	if (reference & LEAF_BIT) {
		return reference;
	}
	auto target_index = static_cast<uint32_t>(target.size());
	target.push_back(source[reference]);
	target[target_index].children[0] = CopyPreorder(source, target, source[reference].children[0]);
	target[target_index].children[1] = CopyPreorder(source, target, source[reference].children[1]);
	return target_index;
}

std::vector<Node> MakePreorderTree(const std::vector<Node> &source) {
	std::vector<Node> result;
	result.reserve(source.size());
	CopyPreorder(source, result, 0);
	return result;
}

GenericTree MakeGenericTree(const std::vector<Node> &source, uint32_t dimensions) {
	if (dimensions != 3) {
		throw std::invalid_argument("this benchmark data has three features");
	}
	GenericTree result;
	result.dimensions = dimensions;
	result.coefficients.reserve(source.size() * dimensions);
	result.feature_major_coefficients.resize(source.size() * dimensions);
	result.nodes.reserve(source.size());
	for (uint32_t node_index = 0; node_index < source.size(); node_index++) {
		auto &node = source[node_index];
		result.coefficients.push_back(node.a0);
		result.coefficients.push_back(node.a1);
		result.coefficients.push_back(node.a2);
		result.feature_major_coefficients[node_index] = node.a0;
		result.feature_major_coefficients[source.size() + node_index] = node.a1;
		result.feature_major_coefficients[2 * source.size() + node_index] = node.a2;
		result.nodes.push_back({node.threshold, {node.children[0], node.children[1]}});
	}
	return result;
}

struct Inputs {
	std::vector<Point> aos;
	std::array<std::vector<float>, 3> soa;
};

Inputs MakeInputs(uint64_t count) {
	Inputs result;
	result.aos.resize(count);
	for (auto &feature : result.soa) {
		feature.resize(count);
	}
	for (uint64_t row = 0; row < count; row++) {
		Point point {
		    static_cast<float>((row * 17 + 13) % 2049) / 1024.0F - 1.0F,
		    static_cast<float>((row * 29 + 7) % 2049) / 1024.0F - 1.0F,
		    static_cast<float>((row * 43 + 3) % 2049) / 1024.0F - 1.0F,
		};
		result.aos[row] = point;
		result.soa[0][row] = point.x0;
		result.soa[1][row] = point.x1;
		result.soa[2][row] = point.x2;
	}
	return result;
}

template <class INPUT>
inline uint32_t Advance(const Node *tree, const INPUT &input, uint64_t row, uint32_t reference) {
	auto &node = tree[reference];
	return node.children[static_cast<uint32_t>(input.Score(node, row) >= node.threshold)];
}

template <class INPUT>
inline void AdvanceBlock(const Node *tree, const INPUT &input, uint64_t row, uint32_t (&references)[8]) {
	references[0] = Advance(tree, input, row, references[0]);
	references[1] = Advance(tree, input, row + 1, references[1]);
	references[2] = Advance(tree, input, row + 2, references[2]);
	references[3] = Advance(tree, input, row + 3, references[3]);
	references[4] = Advance(tree, input, row + 4, references[4]);
	references[5] = Advance(tree, input, row + 5, references[5]);
	references[6] = Advance(tree, input, row + 6, references[6]);
	references[7] = Advance(tree, input, row + 7, references[7]);
}

#if defined(__GNUC__) || defined(__clang__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

template <class INPUT>
NOINLINE uint64_t EvaluateChecksum(const Node *tree, const INPUT &input, uint64_t begin, uint64_t count) {
	uint64_t checksum = 0;
	uint64_t row = begin;
	const auto end = begin + count;
	for (; row + 8 <= end; row += 8) {
		uint32_t references[8] {};
		for (uint32_t level = 0; level < DEPTH; level++) {
			AdvanceBlock(tree, input, row, references);
		}
		for (auto reference : references) {
			checksum += reference & INDEX_MASK;
		}
	}
	for (; row < end; row++) {
		uint32_t reference = 0;
		for (uint32_t level = 0; level < DEPTH; level++) {
			reference = Advance(tree, input, row, reference);
		}
		checksum += reference & INDEX_MASK;
	}
	return checksum;
}

template <class INPUT>
NOINLINE void EvaluateOutput(const Node *tree, const INPUT &input, const uint32_t *leaves, uint64_t begin,
	                         uint64_t count, uint32_t *output) {
	uint64_t row = begin;
	const auto end = begin + count;
	for (; row + 8 <= end; row += 8) {
		uint32_t references[8] {};
		for (uint32_t level = 0; level < DEPTH; level++) {
			AdvanceBlock(tree, input, row, references);
		}
		for (uint64_t lane = 0; lane < 8; lane++) {
			output[row - begin + lane] = leaves[references[lane] & INDEX_MASK];
		}
	}
	for (; row < end; row++) {
		uint32_t reference = 0;
		for (uint32_t level = 0; level < DEPTH; level++) {
			reference = Advance(tree, input, row, reference);
		}
		output[row - begin] = leaves[reference & INDEX_MASK];
	}
}

template <class INPUT>
NOINLINE void EvaluateOutputRuntimeDepth(const Node *tree, const INPUT &input, const uint32_t *leaves, uint32_t depth,
	                                     uint64_t begin, uint64_t count, uint32_t *output) {
	uint64_t row = begin;
	const auto end = begin + count;
	for (; row + 8 <= end; row += 8) {
		uint32_t references[8] {};
		for (uint32_t level = 0; level < depth; level++) {
			AdvanceBlock(tree, input, row, references);
		}
		for (uint64_t lane = 0; lane < 8; lane++) {
			output[row - begin + lane] = leaves[references[lane] & INDEX_MASK];
		}
	}
	for (; row < end; row++) {
		uint32_t reference = 0;
		for (uint32_t level = 0; level < depth; level++) {
			reference = Advance(tree, input, row, reference);
		}
		output[row - begin] = leaves[reference & INDEX_MASK];
	}
}

NOINLINE uint64_t Sum(const uint32_t *values, uint64_t count) {
	uint64_t result = 0;
	for (uint64_t index = 0; index < count; index++) {
		result += values[index];
	}
	return result;
}

template <class INPUT>
uint64_t EvaluateMaterialized(const Node *tree, const INPUT &input, const uint32_t *leaves, uint64_t count,
	                          uint32_t *output) {
	EvaluateOutput(tree, input, leaves, 0, count, output);
	return Sum(output, count);
}

template <class INPUT>
uint64_t EvaluateChunked(const Node *tree, const INPUT &input, const uint32_t *leaves, uint64_t count,
	                     uint32_t *output) {
	uint64_t checksum = 0;
	for (uint64_t begin = 0; begin < count; begin += CHUNK_SIZE) {
		auto chunk_count = std::min(CHUNK_SIZE, count - begin);
		EvaluateOutput(tree, input, leaves, begin, chunk_count, output);
		checksum += Sum(output, chunk_count);
	}
	return checksum;
}

template <class INPUT>
uint64_t EvaluateChunkedRuntimeDepth(const Node *tree, const INPUT &input, const uint32_t *leaves, uint32_t depth,
	                                 uint64_t count, uint32_t *output) {
	uint64_t checksum = 0;
	for (uint64_t begin = 0; begin < count; begin += CHUNK_SIZE) {
		auto chunk_count = std::min(CHUNK_SIZE, count - begin);
		EvaluateOutputRuntimeDepth(tree, input, leaves, depth, begin, chunk_count, output);
		checksum += Sum(output, chunk_count);
	}
	return checksum;
}

inline uint32_t AdvanceGeneric(const GenericNode *nodes, const float *coefficients, uint32_t dimensions,
	                           const float *const *features, uint64_t row, uint32_t reference) {
	float score = 0;
	auto node_coefficients = coefficients + static_cast<uint64_t>(reference) * dimensions;
	for (uint32_t feature = 0; feature < dimensions; feature++) {
		score += node_coefficients[feature] * features[feature][row];
	}
	auto &node = nodes[reference];
	return node.children[static_cast<uint32_t>(score >= node.threshold)];
}

inline void AdvanceGenericLaneOuter(const GenericNode *nodes, const float *coefficients, uint32_t dimensions,
	                                const float *const *features, uint64_t row, uint32_t (&references)[8]) {
	references[0] = AdvanceGeneric(nodes, coefficients, dimensions, features, row, references[0]);
	references[1] = AdvanceGeneric(nodes, coefficients, dimensions, features, row + 1, references[1]);
	references[2] = AdvanceGeneric(nodes, coefficients, dimensions, features, row + 2, references[2]);
	references[3] = AdvanceGeneric(nodes, coefficients, dimensions, features, row + 3, references[3]);
	references[4] = AdvanceGeneric(nodes, coefficients, dimensions, features, row + 4, references[4]);
	references[5] = AdvanceGeneric(nodes, coefficients, dimensions, features, row + 5, references[5]);
	references[6] = AdvanceGeneric(nodes, coefficients, dimensions, features, row + 6, references[6]);
	references[7] = AdvanceGeneric(nodes, coefficients, dimensions, features, row + 7, references[7]);
}

inline void AdvanceGenericDimensionOuter(const GenericNode *nodes, const float *coefficients, uint32_t dimensions,
	                                     const float *const *features, uint64_t row,
	                                     uint32_t (&references)[8]) {
	float scores[8] {};
	for (uint32_t feature = 0; feature < dimensions; feature++) {
		auto values = features[feature] + row;
		scores[0] += coefficients[static_cast<uint64_t>(references[0]) * dimensions + feature] * values[0];
		scores[1] += coefficients[static_cast<uint64_t>(references[1]) * dimensions + feature] * values[1];
		scores[2] += coefficients[static_cast<uint64_t>(references[2]) * dimensions + feature] * values[2];
		scores[3] += coefficients[static_cast<uint64_t>(references[3]) * dimensions + feature] * values[3];
		scores[4] += coefficients[static_cast<uint64_t>(references[4]) * dimensions + feature] * values[4];
		scores[5] += coefficients[static_cast<uint64_t>(references[5]) * dimensions + feature] * values[5];
		scores[6] += coefficients[static_cast<uint64_t>(references[6]) * dimensions + feature] * values[6];
		scores[7] += coefficients[static_cast<uint64_t>(references[7]) * dimensions + feature] * values[7];
	}
	for (uint32_t lane = 0; lane < 8; lane++) {
		auto &node = nodes[references[lane]];
		references[lane] = node.children[static_cast<uint32_t>(scores[lane] >= node.threshold)];
	}
}

inline void AdvanceGenericFeatureMajor(const GenericNode *nodes, const float *coefficients, uint32_t node_count,
	                                   uint32_t dimensions, const float *const *features, uint64_t row,
	                                   uint32_t (&references)[8]) {
	float scores[8] {};
	for (uint32_t feature = 0; feature < dimensions; feature++) {
		auto node_coefficients = coefficients + static_cast<uint64_t>(feature) * node_count;
		auto values = features[feature] + row;
		scores[0] += node_coefficients[references[0]] * values[0];
		scores[1] += node_coefficients[references[1]] * values[1];
		scores[2] += node_coefficients[references[2]] * values[2];
		scores[3] += node_coefficients[references[3]] * values[3];
		scores[4] += node_coefficients[references[4]] * values[4];
		scores[5] += node_coefficients[references[5]] * values[5];
		scores[6] += node_coefficients[references[6]] * values[6];
		scores[7] += node_coefficients[references[7]] * values[7];
	}
	for (uint32_t lane = 0; lane < 8; lane++) {
		auto &node = nodes[references[lane]];
		references[lane] = node.children[static_cast<uint32_t>(scores[lane] >= node.threshold)];
	}
}

template <bool DIMENSION_OUTER>
NOINLINE void EvaluateGenericOutput(const GenericTree &tree, const float *const *features, const uint32_t *leaves,
	                                uint64_t begin, uint64_t count, uint32_t *output) {
	auto nodes = tree.nodes.data();
	auto coefficients = tree.coefficients.data();
	uint64_t row = begin;
	const auto end = begin + count;
	for (; row + 8 <= end; row += 8) {
		uint32_t references[8] {};
		for (uint32_t level = 0; level < DEPTH; level++) {
			if (DIMENSION_OUTER) {
				AdvanceGenericDimensionOuter(nodes, coefficients, tree.dimensions, features, row, references);
			} else {
				AdvanceGenericLaneOuter(nodes, coefficients, tree.dimensions, features, row, references);
			}
		}
		for (uint64_t lane = 0; lane < 8; lane++) {
			output[row - begin + lane] = leaves[references[lane] & INDEX_MASK];
		}
	}
	for (; row < end; row++) {
		uint32_t reference = 0;
		for (uint32_t level = 0; level < DEPTH; level++) {
			reference = AdvanceGeneric(nodes, coefficients, tree.dimensions, features, row, reference);
		}
		output[row - begin] = leaves[reference & INDEX_MASK];
	}
}

NOINLINE void EvaluateGenericFeatureMajorOutput(const GenericTree &tree, const float *const *features,
	                                            const uint32_t *leaves, uint64_t begin, uint64_t count,
	                                            uint32_t *output) {
	auto nodes = tree.nodes.data();
	auto coefficients = tree.feature_major_coefficients.data();
	uint64_t row = begin;
	const auto end = begin + count;
	for (; row + 8 <= end; row += 8) {
		uint32_t references[8] {};
		for (uint32_t level = 0; level < DEPTH; level++) {
			AdvanceGenericFeatureMajor(nodes, coefficients, static_cast<uint32_t>(tree.nodes.size()), tree.dimensions,
			                           features, row, references);
		}
		for (uint64_t lane = 0; lane < 8; lane++) {
			output[row - begin + lane] = leaves[references[lane] & INDEX_MASK];
		}
	}
	for (; row < end; row++) {
		uint32_t reference = 0;
		for (uint32_t level = 0; level < DEPTH; level++) {
			reference = AdvanceGeneric(nodes, tree.coefficients.data(), tree.dimensions, features, row, reference);
		}
		output[row - begin] = leaves[reference & INDEX_MASK];
	}
}

template <bool DIMENSION_OUTER>
uint64_t EvaluateGenericChunked(const GenericTree &tree, const float *const *features, const uint32_t *leaves,
	                            uint64_t count, uint32_t *output) {
	uint64_t checksum = 0;
	for (uint64_t begin = 0; begin < count; begin += CHUNK_SIZE) {
		auto chunk_count = std::min(CHUNK_SIZE, count - begin);
		EvaluateGenericOutput<DIMENSION_OUTER>(tree, features, leaves, begin, chunk_count, output);
		checksum += Sum(output, chunk_count);
	}
	return checksum;
}

uint64_t EvaluateGenericFeatureMajorChunked(const GenericTree &tree, const float *const *features,
	                                        const uint32_t *leaves, uint64_t count, uint32_t *output) {
	uint64_t checksum = 0;
	for (uint64_t begin = 0; begin < count; begin += CHUNK_SIZE) {
		auto chunk_count = std::min(CHUNK_SIZE, count - begin);
		EvaluateGenericFeatureMajorOutput(tree, features, leaves, begin, chunk_count, output);
		checksum += Sum(output, chunk_count);
	}
	return checksum;
}

double Median(std::vector<double> values) {
	std::sort(values.begin(), values.end());
	return values[values.size() / 2];
}

double MedianAbsoluteDeviation(const std::vector<double> &values) {
	const auto median = Median(values);
	std::vector<double> deviations;
	deviations.reserve(values.size());
	for (auto value : values) {
		deviations.push_back(std::abs(value - median));
	}
	return Median(std::move(deviations));
}

enum class Method : uint8_t {
	HEAP_AOS,
	HEAP_SOA,
	PREORDER_SOA,
	MATERIALIZED,
	CHUNKED,
	RUNTIME_DEPTH,
	GENERIC_LANE_OUTER,
	GENERIC_DIMENSION_OUTER,
	GENERIC_FEATURE_MAJOR,
};

constexpr std::array<Method, 9> METHODS {
	Method::HEAP_AOS,     Method::HEAP_SOA, Method::PREORDER_SOA,          Method::MATERIALIZED,
	Method::CHUNKED,      Method::RUNTIME_DEPTH, Method::GENERIC_LANE_OUTER, Method::GENERIC_DIMENSION_OUTER,
	Method::GENERIC_FEATURE_MAJOR,
};
constexpr std::array<const char *, 9> METHOD_NAMES {
	"heap + AoS + checksum", "heap + SoA + checksum", "preorder + SoA + checksum", "materialized output",
	"2048-row chunks",       "runtime depth",          "generic lane-outer",        "generic dimension-outer",
	"generic feature-major",
};

} // namespace

int main(int argc, char **argv) {
	if (argc != 5) {
		std::cerr << "usage: kernel_costs ROWS WARMUPS RUNS SEED\n";
		return 2;
	}
	const auto row_count = std::strtoull(argv[1], nullptr, 10);
	const auto warmups = std::atoi(argv[2]);
	const auto runs = std::atoi(argv[3]);
	const auto seed = std::strtoull(argv[4], nullptr, 10);
	if (row_count == 0 || warmups < 0 || runs < 3 || runs % 2 == 0) {
		throw std::invalid_argument("rows must be positive and runs must be odd and at least three");
	}

	auto heap_tree = MakeHeapTree(seed + DEPTH);
	auto preorder_tree = MakePreorderTree(heap_tree);
	uint32_t dimensions = argc == 5 ? 3 : 0;
	auto generic_tree = MakeGenericTree(preorder_tree, dimensions);
	auto inputs = MakeInputs(row_count);
	AosInput aos {inputs.aos.data()};
	SoaInput soa {inputs.soa[0].data(), inputs.soa[1].data(), inputs.soa[2].data()};
	const float *feature_pointers[3] {inputs.soa[0].data(), inputs.soa[1].data(), inputs.soa[2].data()};
	std::vector<uint32_t> leaves(uint32_t(1) << DEPTH);
	for (uint32_t leaf = 0; leaf < leaves.size(); leaf++) {
		leaves[leaf] = leaf;
	}
	std::vector<uint32_t> output(row_count);
	std::array<std::vector<double>, METHODS.size()> samples;
	volatile uint32_t runtime_depth_source = DEPTH;
	const auto runtime_depth = runtime_depth_source;
	uint64_t expected_checksum = 0;
	bool have_checksum = false;
	std::mt19937 ordering(static_cast<uint32_t>(seed));
	std::array<size_t, METHODS.size()> order {0, 1, 2, 3, 4, 5, 6, 7, 8};

	for (int round = -warmups; round < runs; round++) {
		std::shuffle(order.begin(), order.end(), ordering);
		for (auto method_index : order) {
			auto start = std::chrono::steady_clock::now();
			uint64_t checksum = 0;
			switch (METHODS[method_index]) {
			case Method::HEAP_AOS:
				checksum = EvaluateChecksum(heap_tree.data(), aos, 0, row_count);
				break;
			case Method::HEAP_SOA:
				checksum = EvaluateChecksum(heap_tree.data(), soa, 0, row_count);
				break;
			case Method::PREORDER_SOA:
				checksum = EvaluateChecksum(preorder_tree.data(), soa, 0, row_count);
				break;
			case Method::MATERIALIZED:
				checksum = EvaluateMaterialized(preorder_tree.data(), soa, leaves.data(), row_count, output.data());
				break;
			case Method::CHUNKED:
				checksum = EvaluateChunked(preorder_tree.data(), soa, leaves.data(), row_count, output.data());
				break;
			case Method::RUNTIME_DEPTH:
				checksum = EvaluateChunkedRuntimeDepth(preorder_tree.data(), soa, leaves.data(), runtime_depth, row_count,
				                                       output.data());
				break;
			case Method::GENERIC_LANE_OUTER:
				checksum = EvaluateGenericChunked<false>(generic_tree, feature_pointers, leaves.data(), row_count,
				                                         output.data());
				break;
			case Method::GENERIC_DIMENSION_OUTER:
				checksum = EvaluateGenericChunked<true>(generic_tree, feature_pointers, leaves.data(), row_count,
				                                        output.data());
				break;
			case Method::GENERIC_FEATURE_MAJOR:
				checksum = EvaluateGenericFeatureMajorChunked(generic_tree, feature_pointers, leaves.data(), row_count,
				                                              output.data());
				break;
			}
			auto stop = std::chrono::steady_clock::now();
			if (!have_checksum) {
				expected_checksum = checksum;
				have_checksum = true;
			} else if (checksum != expected_checksum) {
				throw std::runtime_error("checksum mismatch");
			}
			if (round >= 0) {
				samples[method_index].push_back(std::chrono::duration<double>(stop - start).count());
			}
		}
	}

	std::cout << "| Variant | Median (ms) | MAD (ms) | ns/row |\n";
	std::cout << "|:---|---:|---:|---:|\n";
	std::cout << std::fixed << std::setprecision(2);
	for (size_t method_index = 0; method_index < METHODS.size(); method_index++) {
		auto median = Median(samples[method_index]);
		auto dispersion = MedianAbsoluteDeviation(samples[method_index]);
		std::cout << "| " << METHOD_NAMES[method_index] << " | " << median * 1e3 << " | " << dispersion * 1e3
		          << " | " << median * 1e9 / static_cast<double>(row_count) << " |\n";
	}
}
