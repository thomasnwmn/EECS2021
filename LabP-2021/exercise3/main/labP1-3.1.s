    .section .data
    blink_count: .word 62

    .section .text
    .globl get_blink_count

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# TODO: Task 3.1
# Add your code here
get_blink_count:
    la t0, blink_count
    lw a0, 0(t0)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ret