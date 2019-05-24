.data
	guess_print: .asciiz "Guess a number: "
	the_end: .asciiz "Well guessed!"
.text
	li $v0, 30
	syscall
	
	move $a1, $a0
	
	li $v0, 40
	syscall
	
	li $a1, 10
	li $v0, 42
	syscall
	
	add $v1, $a0, 1
	
loop: 	jal print_guess
	jal read_int
	
	bne $v0, $v1, loop
	
exit:
	li $v0, 4
	la $a0, the_end
	syscall
	
	li $v0, 10
	syscall
	
print_guess:
	li $v0, 4
	la $a0, guess_print
	syscall
	jr $ra
	
read_int:
	li $v0, 5
	syscall
	jr $ra
										
	