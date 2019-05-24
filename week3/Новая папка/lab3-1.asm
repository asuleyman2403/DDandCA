.data 	     
    prompt1:     .asciiz "Enter an integer: "
    prompt2:     .asciiz "The sum = "


.text 	
.globl     main     

  main:   jal getandsumValues       #$a1 contains the sum after the call to the procedure
          li $v0,4
          la $a0,prompt2
          syscall
             
          li $v0,1
          move $a0,$a1
          syscall
            
          li $v0,10          #end of the main program, execution stops here
          syscall

# procedure getandsumValues
	getandsumValues:       addi $sp,$sp,-8
                               sw $ra,4($sp)
                               la $a0,prompt1
                               li $v0,4
                               syscall
                             
                               li $v0,5
                               syscall
                              
                               move $a1,$v0
                               beq $a1,$0,done
                               sw $a1,0($sp)
                               jal getandsumValues
                               
                               lw $t0,0($sp)
                               add $a1,$a1,$t0

                    done:      lw $ra,4($sp)
                               addi $sp,$sp,8
                               jr $ra
