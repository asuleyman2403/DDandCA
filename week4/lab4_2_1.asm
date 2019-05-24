.data
	message:  .asciiz "Enter a number: "
	
.text
	li $t1,1
	li $t3,0
	
main:	li $v0,4
    	la $a0,message
    	syscall
    	
	li $v0,5
	syscall
	move $t2,$v0
	
 loop:	beq $t2,$t3, the_end
	mul $t1,$t1,$t2
	add $t2,$t2, -1
	j loop
	

the_end:    	li $v0, 1
    	move $a0, $t1
    	syscall 
    	
    	li $v0, 10
    	syscall
