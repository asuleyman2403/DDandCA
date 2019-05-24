.text
.globl main

main:
li $t0, 3

loop:
beq $t0, 0, end
li $v0, 4
la $a0, entnum
syscall
li $v0, 5
syscall
move $t0, $v0
add $t1, $t1, $t0
li $v0, 11
la $a0, '\n'
syscall
j loop

end:
li $v0, 4
la $a0, result
syscall

li $v0, 1
move $a0, $t1
syscall

li $v0, 10
syscall



.data
entnum: .asciiz "Enter an integer:"
result: .asciiz "The sum = "
