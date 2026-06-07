// darkmodern.nvim — colorscheme showcase
// AI-generated code for colorscheme highlighting demonstration only.
// No functional guarantees. Not intended for production use.

package main

import (
	"fmt"
	"math"
	"strings"
)

const (
	greeting = "Hello, World!"
	maxCount = 5
)

type Item struct {
	ID     int
	Weight float64
	Label  string
}

// checksum returns the sum of an integer slice.
func checksum(values []int) int {
	sum := 0
	for _, v := range values {
		sum += v
	}
	return sum
}

// describe formats an Item as a readable string.
func describe(item Item) string {
	return fmt.Sprintf("[%d] %-8s (%.2f)", item.ID, item.Label, item.Weight)
}

func main() {
	items := []Item{
		{1, 1.5, "alpha"},
		{2, 2.0, "beta"},
		{3, 0.75, "gamma"},
	}

	values := []int{10, 20, 30, 40, 50}
	total := checksum(values)

	if total > 100 {
		fmt.Println(greeting)
	} else {
		fmt.Printf("sum = %d\n", total)
	}

	for _, item := range items {
		line := describe(item)
		fmt.Println(strings.Repeat("-", 28))
		fmt.Println(line)
	}

	_ = math.Sqrt(float64(total))
}
