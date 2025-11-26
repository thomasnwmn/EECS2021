.global add_numbers

add_numbers:
    lui x5, 0x12345
    addi x5, x5, 2047
    addi x5, x5, 121
    lui x6, 0x11223
    addi x6, x6, 836
    add x7, x5, x6
    addi a0, x7, 0

ret
