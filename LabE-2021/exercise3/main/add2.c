/*
 * SPDX-FileCopyrightText: 2010-2022 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: CC0-1.0
 */

#include <stdio.h>

extern int add_numbers();

void app_main(void) {
    int result = add_numbers();
    printf("Result of addition = %d\n", result);
}