# Student Name: Thomas Newman
# Student EECS account: newman06
# Student ID number: 221224662
#
# extern int bigcall (
# int32_t one,
# int64_t two,
# int32_t three,
# int64_t four,
# int32_t five,
# int64_t six,
# int32_t seven,
# int64_t eight,
# int32_t nine
# );
#
# ARGUMENTS:
# a0 stores the argument 1 value
# a1 stores the low order value of argument 2 (int64)
# a2 stores the high order value of argument 2 (int64)
# a3 stores the argument 3 value
# a4 stores the low order value of argument 4 (int64)
# a5 stores the high order value of argument 4 (int64)
# a6 stores the argument 5 value
# a7 stores the low order value of argument 6 (int64)
# RETURNS:
# a0 the sum of all arguments

.global bigcall

.struct 0
svfp:       .space 4 # Save register fp / s0
svra:       .space 4 # Save register ra
            .balign 8 # Make sz mod 8
sz      =   . - svfp

.text
bigcall:
    addi sp, sp, -sz # Set sp for stack frame
    sw fp, svfp(sp) # Save fp / s0
    sw ra, svra(sp) # Save ra
    addi fp, sp , +sz # Set fp = original sp

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# TODO: Task 4.1
# Add your code here
add a0, a0, a1
add a0, a0, a2
add a0, a0, a3
add a0, a0, a4
add a0, a0, a5
add a0, a0, a6
add a0, a0, a7
lw t1, 0(fp)
add a0, a0, t1
lw t1, 4(fp)
add a0, a0, t1
lw t1, 8(fp)
add a0, a0, t1
lw t1, 12(fp)
add a0, a0, t1
lw t1, 16(fp)
add a0, a0, t1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

lw ra, svra(sp) # Restore ra
lw fp, svfp(sp) # Restore fp / s0
addi sp, sp, +sz # Restore sp
ret