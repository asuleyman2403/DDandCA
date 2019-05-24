.data 	 
	endline: .asciiz "\n"
.text 	#program instructions
.globl     main     # main program
  main:   
  	li $v0, 12
  	syscall
  	
  	move $t1, $v0
  	
  	jal isalpha      
        
	li $v0, 4
	la $a0, endline
	syscall
	
        li $v0, 1
        move $a0, $s3
        syscall
        
       	li $v0,10
        syscall
        

			isalpha: 	addi $sp, $sp, -4
				sw $ra,0($sp)
				li $s3,0
				li $t7,'A'
				blt $t1,$t7,done_isalpha
				li $t7,'Z'
				ble $t1,$t7, correct
				li $t7,'a'
				blt $t1,$t7,done_isalpha 
				li $t7,'z'
				ble $t1,$t7,correct
				j done_isalpha
   			correct: li $s3,1
   			done_isalpha: lw $ra,0($sp)
                                    addi $sp,$sp,4
                                    jr $ra

