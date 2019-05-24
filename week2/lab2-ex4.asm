	.data 
filename: .space 32
fnlength: .word 9
prompt1: .asciiz "Enter a filename: "
buffer: .asciiz ""
	.text

li $v0, 4
la $a0, prompt1
syscall

li $v0, 8
la $a0, filename
lw $a1, fnlength
syscall

li $v0,13
la $a0, filename
la $a1, 0
la $a2, 0
syscall

move $s6, $v0

li $v0, 14
move $a0, $s6
la $a1, buffer
la $a2, 11
syscall


li $v0, 11
la $a0, '\n'
syscall

li $v0, 4
la $a0, buffer
syscall


li $v0, 16
move $a0,$s6
syscall

			

li $v0,10
syscall


