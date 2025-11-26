   .section .data
number: .word 0xA5A5A5A7
result: .word 0

   .section .text
   .global _start

_start:
   la   t0, number
   lw   t1, 0(t0)
   li   t2, 0

1:
   beqz t1, 2f
   andi t0, t1, 1
   xor  t2, t2, t0
   srli t1, t1, 1
   j   1b

2:
   la   t0, result
   sw   t2, 0(t0)
   mv   a0, t2
   ret
