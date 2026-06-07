// darkmodern.nvim — colorscheme showcase
// AI-generated code for colorscheme highlighting demonstration only.
// No functional guarantees. Not intended for production use.

package com.example.showcase;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.LinkedHashMap;

public class Main {

    private static final String GREETING  = "Hello, World!";
    private static final int    MAX_COUNT = 5;

    record Item(int id, double weight, String label) {}

    // Compute the sum of an integer array.
    private static int checksum(int[] values) {
        int sum = 0;
        for (int v : values) {
            sum += v;
        }
        return sum;
    }

    // Format an Item as a readable string.
    private static String describe(Item item) {
        return String.format("[%d] %-8s (%.2f)", item.id(), item.weight(), item.label());
    }

    public static void main(String[] args) {
        List<Item> items = List.of(
            new Item(1, 1.5,  "alpha"),
            new Item(2, 2.0,  "beta"),
            new Item(3, 0.75, "gamma")
        );

        int[] values = {10, 20, 30, 40, 50};
        int   total  = checksum(values);

        if (total > 100) {
            System.out.println(GREETING);
        } else {
            System.out.printf("sum = %d%n", total);
        }

        Map<String, Double> labels = new LinkedHashMap<>();
        labels.put("alpha", 1.5);
        labels.put("beta",  2.0);
        labels.put("gamma", 0.75);

        for (Map.Entry<String, Double> entry : labels.entrySet()) {
            System.out.printf("  %-8s => %.2f%n", entry.getKey(), entry.getValue());
        }

        items.stream()
             .filter(item -> item.weight() > 1.0)
             .map(Main::describe)
             .forEach(System.out::println);
    }
}
