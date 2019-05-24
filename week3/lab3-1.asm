.data 	    
    prompt1:     .asciiz "Enter an integer: "
    prompt2:     .asciiz "The sum = "

.text 	
.globl     main     

  main:   jal getandsumValues       # invoke function
              li $v0,4 
              la $a0,prompt2
              syscall
              li $v0,1 
              move $a0,$a1 
              syscall
              li $v0,10
              syscall

		getandsumValues:  addi $sp,$sp,-8  # allocate 8 bytes on the stack moving pointer up
                               sw $ra,4($sp) # save $ra in the upper one
                               la $a0,prompt1
                               li $v0,4 # print string 
                               syscall
                               li $v0,5 # read integer
                               syscall
                               move $a1,$v0 # save read integer to the variable
                               beq $a1,$0,done # check if input is equal to 0, invoke done function
                               sw $a1,0($sp) # save returned value
                               jal getandsumValues # recursively invoke function
                               
                               lw $t0,0($sp)
                               add $a1,$a1,$t0 # add read integer to the sum

                done:  		lw $ra,4($sp) # reload $ra so we can return to caller
                                addi $sp,$sp,8 # allocate 8 bytes on the stack moving pointer up
                                jr $ra # return
