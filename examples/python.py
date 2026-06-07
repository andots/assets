# darkmodern.nvim — colorscheme showcase
# AI-generated code for colorscheme highlighting demonstration only.
# No functional guarantees. Not intended for production use.

from __future__ import annotations

import math
from dataclasses import dataclass, field
from typing import NamedTuple

GREETING  = "Hello, World!"
MAX_COUNT = 5


class Item(NamedTuple):
    """A weighted item."""
    id:     int
    weight: float
    label:  str

    def describe(self) -> str:
        return f"[{self.id}] {self.label:<8} ({self.weight:.2f})"


@dataclass
class Registry:
    """Holds a collection of Items."""
    items:  list[Item] = field(default_factory=list)
    labels: dict[str, float] = field(default_factory=dict)

    def add(self, item: Item) -> None:
        self.items.append(item)
        self.labels[item.label] = item.weight

    def heavy(self, threshold: float = 1.0) -> list[Item]:
        return [item for item in self.items if item.weight > threshold]


def checksum(values: list[int]) -> int:
    """Compute the sum of an integer list."""
    return sum(values)


def main() -> None:
    registry = Registry()
    for item in [
        Item(1, 1.5,  "alpha"),
        Item(2, 2.0,  "beta"),
        Item(3, 0.75, "gamma"),
    ]:
        registry.add(item)

    values = [10, 20, 30, 40, 50]
    total  = checksum(values)

    if total > 100:
        print(GREETING)
    else:
        print(f"sum = {total}")

    for key, val in registry.labels.items():
        print(f"  {key:<8} => {val:.2f}")

    for item in registry.heavy():
        print(item.describe())

    _ = math.sqrt(total)


if __name__ == "__main__":
    main()
