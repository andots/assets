<?php

// darkmodern.nvim — colorscheme showcase
// AI-generated code for colorscheme highlighting demonstration only.
// No functional guarantees. Not intended for production use.

declare(strict_types=1);

namespace Showcase;

const GREETING  = "Hello, World!";
const MAX_COUNT = 5;

/**
 * Represents a weighted item.
 */
readonly class Item
{
    public function __construct(
        public int    $id,
        public float  $weight,
        public string $label,
    ) {}

    public function describe(): string
    {
        return sprintf("[%d] %-8s (%.2f)", $this->id, $this->label, $this->weight);
    }
}

/**
 * Compute the sum of an integer array.
 *
 * @param  int[] $values
 * @return int
 */
function checksum(array $values): int
{
    return array_reduce($values, fn(int $carry, int $v) => $carry + $v, 0);
}

function main(): void
{
    $items = [
        new Item(1, 1.5,  "alpha"),
        new Item(2, 2.0,  "beta"),
        new Item(3, 0.75, "gamma"),
    ];

    $values = [10, 20, 30, 40, 50];
    $total  = checksum($values);

    if ($total > 100) {
        echo GREETING . PHP_EOL;
    } else {
        printf("sum = %d\n", $total);
    }

    $labels = [
        "alpha" => 1.5,
        "beta"  => 2.0,
        "gamma" => 0.75,
    ];

    foreach ($labels as $key => $val) {
        printf("  %-8s => %.2f\n", $key, $val);
    }

    $heavy = array_filter($items, fn(Item $item) => $item->weight > 1.0);
    $lines = array_map(fn(Item $item) => $item->describe(), $heavy);

    array_walk($lines, fn(string $line) => print($line . PHP_EOL));
}

main();
