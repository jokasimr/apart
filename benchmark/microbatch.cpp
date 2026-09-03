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
#include <utility>
#include <vector>

namespace {

constexpr uint32_t LEAF_BIT = uint32_t(1) << 31;
constexpr std::array<unsigned, 4> TREE_SIZES {3, 5, 7, 10};
constexpr std::array<unsigned, 5> BLOCK_SIZES {1, 8, 16, 32, 64};

struct Point {
	float x0;
	float x1;
	float x2;
};

struct Node {
	float a0;
	float a1;
	float a2;
	float bias;
	uint32_t child[2];
};

struct Tree {
	std::vector<Node> nodes;
	uint32_t leaf_count = 0;
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

private:
	uint64_t state;
};

uint32_t BuildSubtree(Tree &tree, SplitMix64 &random, uint32_t internal_nodes) {
	if (internal_nodes == 0) {
		return LEAF_BIT | tree.leaf_count++;
	}

	const auto node_index = static_cast<uint32_t>(tree.nodes.size());
	tree.nodes.push_back({random.Parameter(), random.Parameter(), random.Parameter(), random.Parameter() / 4.0F, {0, 0}});
	auto remaining = internal_nodes - 1;
	auto heavy = static_cast<uint32_t>(std::llround(static_cast<double>(remaining) * 0.7));
	auto light = remaining - heavy;
	if (random.Next() & 1) {
		std::swap(heavy, light);
	}
	const auto left = BuildSubtree(tree, random, heavy);
	const auto right = BuildSubtree(tree, random, light);
	tree.nodes[node_index].child[0] = left;
	tree.nodes[node_index].child[1] = right;
	return node_index;
}

Tree MakeTree(unsigned balanced_depth, uint64_t seed) {
	Tree tree;
	const auto internal_nodes = (uint32_t(1) << balanced_depth) - 1;
	tree.nodes.reserve(internal_nodes);
	SplitMix64 random(seed + balanced_depth);
	BuildSubtree(tree, random, internal_nodes);
	return tree;
}

std::vector<Point> MakePoints(uint64_t count) {
	std::vector<Point> points(count);
	for (uint64_t row = 0; row < count; row++) {
		points[row] = {
		    static_cast<float>((row * 17 + 13) % 2049) / 1024.0F - 1.0F,
		    static_cast<float>((row * 29 + 7) % 2049) / 1024.0F - 1.0F,
		    static_cast<float>((row * 43 + 3) % 2049) / 1024.0F - 1.0F,
		};
	}
	return points;
}

inline bool IsLeaf(uint32_t reference) {
	return (reference & LEAF_BIT) != 0;
}

inline uint32_t Advance(const Node *tree, const Point &point, uint32_t reference) {
	const auto &node = tree[reference];
	const float score = node.a0 * point.x0 + node.a1 * point.x1 + node.a2 * point.x2 + node.bias;
	return node.child[static_cast<uint32_t>(score >= 0)];
}

#if defined(__GNUC__) || defined(__clang__)
__attribute__((noinline))
#endif
uint64_t EvaluateRows(const Node *tree, const Point *points, uint64_t count) {
	uint64_t checksum = 0;
	for (uint64_t row = 0; row < count; row++) {
		uint32_t reference = 0;
		while (!IsLeaf(reference)) {
			reference = Advance(tree, points[row], reference);
		}
		checksum += reference & ~LEAF_BIT;
	}
	return checksum;
}

template <size_t LANE, size_t BLOCK_SIZE>
inline void AdvanceLane(const Node *tree, const Point *points, uint64_t row, uint64_t active,
                        uint32_t (&references)[BLOCK_SIZE], uint64_t &next_active) {
	constexpr auto lane_bit = uint64_t(1) << LANE;
	if (active & lane_bit) {
		auto child = Advance(tree, points[row + LANE], references[LANE]);
		references[LANE] = child;
		if (!IsLeaf(child)) {
			next_active |= lane_bit;
		}
	}
}

template <size_t BLOCK_SIZE, size_t... LANES>
inline void AdvanceBlock(const Node *tree, const Point *points, uint64_t row, uint64_t active,
                         uint32_t (&references)[BLOCK_SIZE], uint64_t &next_active,
                         std::index_sequence<LANES...>) {
	(AdvanceLane<LANES>(tree, points, row, active, references, next_active), ...);
}

template <size_t BLOCK_SIZE>
#if defined(__GNUC__) || defined(__clang__)
__attribute__((noinline))
#endif
uint64_t EvaluateBlocks(const Node *tree, const Point *points, uint64_t count) {
	uint64_t checksum = 0;
	uint64_t row = 0;
	for (; row + BLOCK_SIZE <= count; row += BLOCK_SIZE) {
		uint32_t references[BLOCK_SIZE] = {};
		uint64_t active;
		if constexpr (BLOCK_SIZE == 64) {
			active = ~uint64_t(0);
		} else {
			active = (uint64_t(1) << BLOCK_SIZE) - 1;
		}
		while (active) {
			uint64_t next_active = 0;
			AdvanceBlock(tree, points, row, active, references, next_active,
			             std::make_index_sequence<BLOCK_SIZE> {});
			active = next_active;
		}
		for (auto reference : references) {
			checksum += reference & ~LEAF_BIT;
		}
	}
	return checksum + EvaluateRows(tree, points + row, count - row);
}

uint64_t Evaluate(unsigned block_size, const Node *tree, const Point *points, uint64_t count) {
	switch (block_size) {
	case 1:
		return EvaluateRows(tree, points, count);
	case 8:
		return EvaluateBlocks<8>(tree, points, count);
	case 16:
		return EvaluateBlocks<16>(tree, points, count);
	case 32:
		return EvaluateBlocks<32>(tree, points, count);
	case 64:
		return EvaluateBlocks<64>(tree, points, count);
	default:
		throw std::logic_error("unknown block size");
	}
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

} // namespace

int main(int argc, char **argv) {
	if (argc != 5) {
		std::cerr << "usage: microbatch ROWS WARMUPS RUNS SEED\n";
		return 2;
	}
	const auto row_count = std::strtoull(argv[1], nullptr, 10);
	const auto warmups = std::atoi(argv[2]);
	const auto runs = std::atoi(argv[3]);
	const auto seed = std::strtoull(argv[4], nullptr, 10);
	if (row_count == 0 || warmups < 0 || runs < 3 || runs % 2 == 0) {
		throw std::invalid_argument("rows must be positive and runs must be odd and at least three");
	}

	const auto points = MakePoints(row_count);
	std::array<Tree, TREE_SIZES.size()> trees;
	for (size_t index = 0; index < TREE_SIZES.size(); index++) {
		trees[index] = MakeTree(TREE_SIZES[index], seed);
	}

	using Samples = std::array<std::array<std::vector<double>, TREE_SIZES.size()>, BLOCK_SIZES.size()>;
	Samples samples;
	std::array<uint64_t, TREE_SIZES.size()> expected_checksums {};
	std::array<bool, TREE_SIZES.size()> checksum_set {};
	std::array<size_t, TREE_SIZES.size() * BLOCK_SIZES.size()> order;
	for (size_t index = 0; index < order.size(); index++) {
		order[index] = index;
	}
	std::mt19937 ordering(static_cast<uint32_t>(seed));

	for (int round = -warmups; round < runs; round++) {
		std::shuffle(order.begin(), order.end(), ordering);
		for (auto item : order) {
			const auto tree_index = item % TREE_SIZES.size();
			const auto block_index = item / TREE_SIZES.size();
			const auto start = std::chrono::steady_clock::now();
			const auto checksum =
			    Evaluate(BLOCK_SIZES[block_index], trees[tree_index].nodes.data(), points.data(), row_count);
			const auto stop = std::chrono::steady_clock::now();
			if (!checksum_set[tree_index]) {
				expected_checksums[tree_index] = checksum;
				checksum_set[tree_index] = true;
			} else if (checksum != expected_checksums[tree_index]) {
				throw std::runtime_error("checksum mismatch");
			}
			if (round >= 0) {
				samples[block_index][tree_index].push_back(std::chrono::duration<double>(stop - start).count());
			}
		}
	}

	std::cout << "| Block | Balanced-equivalent depth | Median (ms) | MAD (ms) | ns/row | Speedup |\n";
	std::cout << "|---:|---:|---:|---:|---:|---:|\n";
	std::cout << std::fixed << std::setprecision(2);
	for (size_t tree_index = 0; tree_index < TREE_SIZES.size(); tree_index++) {
		const auto baseline = Median(samples[0][tree_index]);
		for (size_t block_index = 0; block_index < BLOCK_SIZES.size(); block_index++) {
			const auto median = Median(samples[block_index][tree_index]);
			const auto dispersion = MedianAbsoluteDeviation(samples[block_index][tree_index]);
			std::cout << "| " << BLOCK_SIZES[block_index] << " | " << TREE_SIZES[tree_index] << " | "
			          << median * 1e3 << " | " << dispersion * 1e3 << " | "
			          << median * 1e9 / static_cast<double>(row_count) << " | " << baseline / median << "x |\n";
		}
	}
}
