.globl main
main:
la $t0, array
lw $t1, iterator
lw $t2, size

# system.out.println(array[i])
Loop:
bgt $t1, $t2, Exit
sll $t3, $t1, 2 # t3 = 4 * t1 = 4i
addu $t3, $t3, $t0 # 4i + memory location of the array --> 1000 + 4 = 1004

li $v0, 4
lw $a0, 0($t3)
syscall

addi $t1, $t1, 1
j Loop

Exit:
li $v0, 10
syscall

.data
iterator: .word 0
size:	.word	8
array: .word a1, a2, a3, a4, a5, a6, a7, a8, a9
a1: .asciiz "add $2,$1,$1\n"
a2: .asciiz "add $3,$0,$2\n"
a3: .asciiz "add $3,$3,$3\n"
a4: .asciiz "add $4,$3,$0\n"
a5: .asciiz "beq $3,$0,done\n"
a6: .asciiz "sub $3,$3,$1\n"
a7: .asciiz "j loop\n"
a8: .asciiz "sw $2,0($0)\n"
a9: .asciiz "lw $1,-2($4)\n"
