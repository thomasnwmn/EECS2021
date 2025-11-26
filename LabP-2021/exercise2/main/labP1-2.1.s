    .section .data
    .globl led_state
    led_state: .word 0

    .section .text
    .globl toggle_led
toggle_led:
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # TODO: Task 2.1
    # Add your code here
    la t0, led_state
    lw t1, 0(t0)
    xori t1, t1, 1
    sw t1, 0(t0)
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ret