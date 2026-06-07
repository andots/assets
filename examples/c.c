// darkmodern.nvim — colorscheme showcase
// AI-generated code for colorscheme highlighting demonstration only.
// No functional guarantees. Not intended for production use.

#include <stdio.h>
#include <stdlib.h>

#define MAX_COUNT 5
#define GREETING  "Hello, World!"

typedef struct {
    int   id;
    float weight;
    char *label;
} Item;

/* Compute a simple checksum */
static int checksum(const int *arr, int len) {
    int sum = 0;
    for (int i = 0; i < len; i++) {
        sum += arr[i];
    }
    return sum;
}

int main(void) {
    Item items[MAX_COUNT] = {
        {1, 1.5f, "alpha"},
        {2, 2.0f, "beta"},
        {3, 0.75f, "gamma"},
    };

    int values[] = {10, 20, 30, 40, 50};
    int total    = checksum(values, MAX_COUNT);

    if (total > 100) {
        printf("%s\n", GREETING);
    } else {
        printf("sum = %d\n", total);
    }

    return EXIT_SUCCESS;
}
