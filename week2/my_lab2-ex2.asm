.data
phrase: .asciiz "Digital Design!" 
addon: .asciiz "Computer Architecture!"
new_string: .asciiz "aaa"

.text
.globl main

main:
	li $v0, 4
	la $a0, phrase
	syscall
	
	li $v0, 11
	la $a0, '\n'
	syscall
	
	la $s0, phrase
	li $t0, ' '
	sb $t0, 15($s0)
	li $t0, '&'
	sb $t0, 14($s0)
	
	li $v0, 4
	la $a0, phrase
	syscall 
	
	li $v0, 11 
	la $a0, '\n'
	syscall
	
	li $t0, 0
	sb $t0, 7($s0)
	
	li $v0, 4
	la $a0, phrase
	syscall
	
	
