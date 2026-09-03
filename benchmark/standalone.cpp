#include <algorithm>
#include <array>
#include <chrono>
#include <cstdint>
#include <cstdlib>
#include <functional>
#include <iostream>
#include <random>
#include <stdexcept>
#include <vector>

namespace {

constexpr uint32_t LEAF_MASK = uint32_t(1) << 31;
constexpr uint32_t INDEX_MASK = LEAF_MASK - 1;
constexpr std::array<int, 4> DEPTHS {3, 5, 7, 10};

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

	int Uniform(int lower, int upper) {
		return lower + static_cast<int>(Next() % static_cast<uint64_t>(upper - lower + 1));
	}

private:
	uint64_t state;
};

struct SourceNode {
	std::array<float, 3> coefficients;
	float threshold;
	int64_t children[2];
};

struct Node {
	float threshold;
	uint32_t children[2];
};

struct Tree {
	std::vector<float> coefficients;
	std::vector<Node> nodes;
	uint32_t root;
	uint32_t dimensions;
};

Tree MakeTree(int depth, uint64_t seed) {
	SplitMix64 rng(seed + static_cast<uint64_t>(depth));
	const auto node_count = (uint32_t(1) << depth) - 1;
	const auto first_bottom_node = (uint32_t(1) << (depth - 1)) - 1;
	std::vector<SourceNode> source;
	source.reserve(node_count);

	for (uint32_t node = 0; node < node_count; node++) {
		SourceNode value;
		bool all_zero = true;
		for (auto &coefficient : value.coefficients) {
			coefficient = static_cast<float>(rng.Uniform(-8, 8)) / 8.0F;
			all_zero &= coefficient == 0;
		}
		if (all_zero) {
			value.coefficients[0] = 0.125F;
		}
		value.threshold = static_cast<float>(rng.Uniform(-2, 2)) / 8.0F;
		auto left = 2 * node + 1;
		if (left < node_count) {
			value.children[0] = left;
			value.children[1] = left + 1;
		} else {
			auto leaf = 2 * (node - first_bottom_node);
			value.children[0] = -static_cast<int64_t>(leaf) - 1;
			value.children[1] = -static_cast<int64_t>(leaf) - 2;
		}
		source.push_back(value);
	}

	Tree result;
	result.dimensions = 3;
	result.nodes.reserve(node_count);
	result.coefficients.reserve(node_count * result.dimensions);
	std::function<uint32_t(int64_t)> compile = [&](int64_t reference) -> uint32_t {
		if (reference < 0) {
			return LEAF_MASK | static_cast<uint32_t>(-reference - 1);
		}
		auto &source_node = source[static_cast<size_t>(reference)];
		auto target = static_cast<uint32_t>(result.nodes.size());
		result.nodes.push_back({source_node.threshold, {0, 0}});
		result.coefficients.insert(result.coefficients.end(), source_node.coefficients.begin(),
		                           source_node.coefficients.end());
		auto left = compile(source_node.children[0]);
		auto right = compile(source_node.children[1]);
		result.nodes[target].children[0] = left;
		result.nodes[target].children[1] = right;
		return target;
	};
	result.root = compile(0);
	return result;
}

using Features = std::array<std::vector<float>, 3>;

Features MakeFeatures(uint64_t rows) {
	Features result;
	for (auto &feature : result) {
		feature.resize(rows);
	}
	for (uint64_t row = 0; row < rows; row++) {
		result[0][row] = static_cast<float>((row * 17 + 13) % 2049) / 1024.0F - 1.0F;
		result[1][row] = static_cast<float>((row * 29 + 7) % 2049) / 1024.0F - 1.0F;
		result[2][row] = static_cast<float>((row * 43 + 3) % 2049) / 1024.0F - 1.0F;
	}
	return result;
}

#if defined(__GNUC__) || defined(__clang__)
__attribute__((noinline))
#endif
uint64_t Evaluate(const Tree &tree, const std::array<const float *, 3> &features, uint64_t rows) {
	uint64_t checksum = 0;
	for (uint64_t row = 0; row < rows; row++) {
		auto reference = tree.root;
		while ((reference & LEAF_MASK) == 0) {
			auto &node = tree.nodes[reference];
			float score = 0;
			auto offset = static_cast<size_t>(reference) * tree.dimensions;
			for (uint32_t feature = 0; feature < tree.dimensions; feature++) {
				score += tree.coefficients[offset + feature] * features[feature][row];
			}
			reference = node.children[score >= node.threshold];
		}
		checksum += reference & INDEX_MASK;
	}
	return checksum;
}

} // namespace

int main(int argc, char **argv) {
	if (argc != 5) {
		std::cerr << "usage: standalone ROWS WARMUPS RUNS SEED\n";
		return 2;
	}
	const auto rows = std::strtoull(argv[1], nullptr, 10);
	const auto warmups = std::atoi(argv[2]);
	const auto runs = std::atoi(argv[3]);
	const auto seed = std::strtoull(argv[4], nullptr, 10);
	if (rows == 0 || warmups < 0 || runs < 1) {
		throw std::invalid_argument("invalid benchmark arguments");
	}
	auto feature_storage = MakeFeatures(rows);
	std::array<const float *, 3> features;
	for (size_t feature = 0; feature < features.size(); feature++) {
		features[feature] = feature_storage[feature].data();
	}
	std::array<Tree, DEPTHS.size()> trees;
	for (size_t index = 0; index < DEPTHS.size(); index++) {
		trees[index] = MakeTree(DEPTHS[index], seed);
	}

	std::mt19937 ordering(static_cast<uint32_t>(seed));
	std::array<size_t, DEPTHS.size()> order {0, 1, 2, 3};
	for (int round = -warmups; round < runs; round++) {
		std::shuffle(order.begin(), order.end(), ordering);
		for (auto index : order) {
			auto start = std::chrono::steady_clock::now();
			auto checksum = Evaluate(trees[index], features, rows);
			auto end = std::chrono::steady_clock::now();
			std::chrono::duration<double> elapsed = end - start;
			std::cout << (round < 0 ? "warmup" : "measured") << ',' << DEPTHS[index] << ',' << elapsed.count()
			          << ',' << checksum << '\n';
		}
	}
}
