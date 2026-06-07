// darkmodern.nvim — colorscheme showcase
// AI-generated code for colorscheme highlighting demonstration only.
// No functional guarantees. Not intended for production use.

const GREETING = "Hello, World!" as const;
const MAX_COUNT = 5 as const;

// --- Types ---

type Weight = number;

interface Item {
	id: number;
	weight: Weight;
	label: string;
}

type Registry = {
	items: Item[];
	labels: Map<string, Weight>;
};

// --- Utilities ---

/**
 * Compute the sum of a numeric array.
 * @param values - array of integers
 * @returns total sum
 */
function checksum(values: readonly number[]): number {
	return values.reduce((sum, v) => sum + v, 0);
}

/**
 * Format an Item as a readable string.
 */
const describe = (item: Item): string =>
	`[${item.id}] ${item.label.padEnd(8)} (${item.weight.toFixed(2)})`;

function makeRegistry(items: Item[]): Registry {
	const labels = new Map<string, Weight>(
		items.map(({ label, weight }) => [label, weight]),
	);
	return { items, labels };
}

// --- Main ---

async function main(): Promise<void> {
	const items: Item[] = [
		{ id: 1, weight: 1.5, label: "alpha" },
		{ id: 2, weight: 2.0, label: "beta" },
		{ id: 3, weight: 0.75, label: "gamma" },
	];

	const values = [10, 20, 30, 40, 50] as const;
	const total = checksum(values);
	const registry = makeRegistry(items);

	if (total > 100) {
		console.log(GREETING);
	} else {
		console.log(`sum = ${total}`);
	}

	for (const [key, val] of registry.labels) {
		console.log(`  ${key.padEnd(8)} => ${val.toFixed(2)}`);
	}

	const heavy = registry.items
		.filter((item): item is Item => item.weight > 1.0)
		.map(describe);

	await Promise.allSettled(
		heavy.map(async (line) => {
			await new Promise<void>((resolve) => setTimeout(resolve, 0));
			console.log(line);
		}),
	);
}

main().catch((err: unknown) => {
	if (err instanceof Error) console.error(err.message);
});
