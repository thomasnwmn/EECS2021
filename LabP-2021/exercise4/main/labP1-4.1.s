    .section .data
    .align  2

# Example weights
weights:
    .word  2, -3, 5, -1, 4, 3, -2, 7, -6, 1

# Example inputs
input_1:
    .word  1, 0, 1, 1, 0, 1, 0, 1, 0, 1
input_2:
    .word  0, 1, 1, 0, 0, 1, 1, 0, 0, 1
input_3:
    .word  0, 0, 1, 1, 1, 0, 1, 1, 0, 0

bias:
    .word  1

    .globl result
result:
    .word  0

student_last2:
    .word  62

result_final:
    .word  0    

    .section .text
    .align  2
    .globl compute_neuron
    .type  compute_neuron, @function

compute_neuron:
    la   t0, weights
    la   t1, input_3
    lw   t2, bias
    li   t3, 0
    li   t4, 10

loop_sum:
    lw   t5, 0(t0)
    lw   t6, 0(t1)
    mul  a1, t5, t6
    add  t3, t3, a1

    addi t0, t0, 4
    addi t1, t1, 4
    addi t4, t4, -1
    bnez t4, loop_sum

    add  t3, t3, t2

    la   a1, result
    sw   t3, 0(a1)

    la   a2, student_last2
    lw   a2, 0(a2)
    
    andi a3, a2, 1
    beqz a3, do_or

do_and:
    and  a4, t3, a2
    j    done_logic

do_or:
    or   a4, t3, a2

done_logic:
    la   a1, result_final
    sw   a4, 0(a1)

    mv   a0, a4
    ret

    .size compute_neuron, .-compute_neuron
