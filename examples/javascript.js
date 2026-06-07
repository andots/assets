// darkmodern.nvim — colorscheme showcase
// AI-generated code for colorscheme highlighting demonstration only.
// No functional guarantees. Not intended for production use.

const GREETING = "Hello, World!";
const MAX_COUNT = 5;

// Item factory
const makeItem = (id, weight, label) => ({ id, weight, label });

/**
 * Compute the sum of a numeric array.
 * @param {number[]} values
 * @returns {number}
 */
function checksum(values) {
	return values.reduce((sum, v) => sum + v, 0);
}

/**
 * Format an item as a readable string.
 * @param {{ id: number, weight: number, label: string }} item
 * @returns {string}
 */
function describe(item) {
	return `[${item.id}] ${item.label.padEnd(8)} (${item.weight.toFixed(2)})`;
}

async function main() {
	const items = [
		makeItem(1, 1.5, "alpha"),
		makeItem(2, 2.0, "beta"),
		makeItem(3, 0.75, "gamma"),
	];

	const values = [10, 20, 30, 40, 50];
	const total = checksum(values);

	if (total > 100) {
		console.log(GREETING);
	} else {
		console.log(`sum = ${total}`);
	}

	const labels = {
		alpha: 1.5,
		beta: 2.0,
		gamma: 0.75,
	};

	for (const [key, val] of Object.entries(labels)) {
		console.log(`  ${key.padEnd(8)} => ${val}`);
	}

	const heavy = items.filter((item) => item.weight > 1.0).map(describe);

	await Promise.all(
		heavy.map(async (line) => {
			await new Promise((resolve) => setTimeout(resolve, 0));
			console.log(line);
		}),
	);
}

main().catch(console.error);
