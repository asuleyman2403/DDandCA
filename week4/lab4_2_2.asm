.data 
	message: 	.asciiz "Enter a number: "
	theNumber: 	.word	0
	theResult: 	.word 	0
	
.text	
.globl main
	main: 	
		li $v0,4
		la $a0,message
		syscall 
		
		li $v0,5
		syscall 
		
		sw $v0, theNumber
		
		lw $a0,theNumber
		jal calcFactorial
		sw $v0,theResult	
		
		li $v0,1
		lw $a0,theResult
		syscall 
		
		li $v0,10
		syscall
	
.globl calcFactorial
calcFactorial: 
		subu $sp,$sp,8
		sw $ra,($sp)
		sw $s0,4($sp)
		
		li $v0,1
		beq $a0,0,the_end
		
		#factorial(n-1)
		move $s0,$a0
		sub $a0,$a0,1
		jal calcFactorial
		
		mul $v0,$s0,$v0
			
		the_end:
			lw $ra, ($sp) #load all values from the stack that we saved previously
			lw $s0, 4($sp)#restore the stack
			addu $sp,$sp,8
			jr $ra #jump back to previous address
		
