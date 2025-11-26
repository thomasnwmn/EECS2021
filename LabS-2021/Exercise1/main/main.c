#include <stdio.h>
#include <stdint.h>
#pragma GCC optimize("-O3")

extern void reverse (int32_t *arr, int totalSize);

void app_main (void) {
    int32_t arr [] = {10, 34, 21, 8, 50};

    int size = sizeof(arr)/sizeof(int32_t);
    int i=0;

    // Print the original array
    printf("Original array:\n");
    for (i=0; i < size ; i++) {
        printf("arr[%d]: %ld\n", i, arr[i]);
    }

    // Call reverse
    reverse (arr, size*sizeof(int32_t));
    // Print the reversed array
    printf ("Reversed array:\n");
    for (i=0; i<size; i++) {
        printf("arr[%d]: %ld\n", i , arr [i]);
    }
}