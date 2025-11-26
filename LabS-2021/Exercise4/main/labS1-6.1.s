# Student Name: Thomas Newman
# Student EECS account: newman06
# Student ID number: 221224662
#
# extern unsigned struint (char const * text, bool * ok)
#
# ARGUMENTS:
# a0 char const * text (text to convert)
# a1 pointer to bool
#
# RETURNS:
# a0 unsigned value (when ok is true)
# ok:
# true, conversion successful
# false, conversion failed

        .global struint
        .text
struint:
        add t6, x0, a0 # t6 = ptr to test
        addi a0, x0, 0 # Accumulator for uint
        addi t2, x0, 0 # Digit count
        addi t4, x0, '0'
        addi t3, x0, '9'
        addi t1, x0, ' '
        addi t0, x0, 10

loop:
        lb t5, 0(t6)
        beq t5, t1, skip
        beqz t5, nulbyt

        blt t5, t4, fail
        bgt t5, t3, fail

        sub t5, t5, t4
        mul a0, a0, t0

        add a0, a0, t5
        addi t2, t2, 1 # Bump digit count

skip:   addi t6, t6, 1 # ++ text ptr
        j loop

nulbyt: beqz t2, fail # Fail if no digits
        li t0, 1
        sb t0, 0(a1) # ok = true
        ret

fail:   li t0, 0
exit:   sb t0, 0(a1) # ok = false
        ret