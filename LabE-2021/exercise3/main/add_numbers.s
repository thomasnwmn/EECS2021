.global add_numbers

add_numbers:
    addi a0, x0, 2030
    addi a1, x0, 2021
    add a2, a0, a1
    mv a0, a2

ret