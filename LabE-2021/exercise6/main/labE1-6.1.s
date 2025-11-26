    .section .data
x:      .word 2
y:      .word 3
result: .word 0

    .section .text
    .global _start

_start:
    la      x30, x
    lw      x5,  0(x30)
    la      x31, y
    lw      x6,  0(x31)
    mul     a0,  x5, x5
    mul     x5,  x6, x6
    add     a0,  a0, x5
    ret
