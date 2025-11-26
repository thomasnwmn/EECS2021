#include <stdio.h>
#include <string.h>

extern int _start();

void app_main(void) {
    int result = _start();
    if (result % 2 == 0) {
        printf("The given input has EVEN parity.\n");
    } else {
        printf("The given input has ODD parity.\n");
    }
}