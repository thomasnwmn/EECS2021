# Student Name: Thomas Newman
# Student EECS account: newman06
# Student ID number: 221224662
#
# extern void reverse (int32_t * arr, int totalBytes)
# ARGUMENTS:
# a0 Pointer to array
# a1 total size: array size * size int32_t = 5 * 4 = 20

.global reverse
.text
reverse:
addi sp, sp, -20 # Set sp for stack
add x31, x31, sp # Stack index
push_stack:
add x12, a0, x30
lw x4, 0(x12) # Array element loaded at x4

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# TODO: Task 3.1
# Add your code here
# Push x4 into stack
sw x4, 0(x31)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
addi x30, x30, 4 # Array index + 4
addi x31, x31, 4 # Stack index + 4
bne a1, x30, push_stack
addi x30, x0, 0 # Restore array index
pop_stack:
addi x31, x31 , -4 # Stack index - 4
add x12, a0, x30

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# TODO: Task 3.1
# Add your code here
# Pop stack element and load it at x4
lw x4, 0(x31)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sw x4, 0(x12) # Change the value to x4 in array
addi x30, x30, 4 # Array index + 4
bne x31, sp, pop_stack
exit:
addi sp, sp, 20 # Restore sp
ret