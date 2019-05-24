	.data


	.text
	
li $v0, 5
syscall 

move $t0, $v0


li $v0, 11
la $a0, '\n'
syscall

li $v0, 34
move $a0, $t0
syscall

li $v0, 11
la $a0, '\n'
syscall

li $v0, 35
move $a0, $t0
syscall

li $v0, 11
la $a0, '\n'
syscall

li $v0, 36
move $a0, $t0
syscall

