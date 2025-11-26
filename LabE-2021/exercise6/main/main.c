#include <stdio.h>

extern int _start();

void app_main(void) {
    int result = _start();
    printf("The computed value of f(x, y) is %d\n", result);
}