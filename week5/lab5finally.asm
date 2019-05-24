.data 
	the_end_prompt: .asciiz "You win!\n"
	guess_print: .asciiz "Print number: "
	cows: .asciiz  "Cows: "
	bulls: .asciiz "Bulls: "
.text
.globl main
main: 
	li $v0, 30
	syscall
	
	move $a1, $a0
	
	li $v0, 40
	syscall
	
	li $a1, 10
	li $v0, 42
	syscall
	
	add $s0, $a0, 0
		
	li $a1, 10
	li $v0, 42
	syscall

	add $s1, $a0, 0
	
			
	li $a1, 10
	li $v0, 42
	syscall

	add $s2, $a0, 0
	
			
	li $a1, 10
	li $v0, 42
	syscall

	add $s3, $a0, 0
	
	li $v0, 11
	la $a0, '\n'
	syscall
		
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
	
	li $v0, 11
	la $a0, '\n'
	syscall
		
loop_1:

	move $t0, $zero
	move $t1, $zero
	
	jal print_guess
	jal read_int
	move $s4, $zero
	move $s4, $v0
	
	jal print_guess
	jal read_int
	move $s5, $zero
	move $s5, $v0
	
	jal print_guess
	jal read_int
	move $s6, $zero
	move $s6, $v0	
	
	jal print_guess
	jal read_int
	move $s7, $zero
	move $s7, $v0
	j check_1
	
check_1:	beq $s0, $s4, add_bulls_1
check_2:	beq $s1, $s5, add_bulls_2
check_3:	beq $s2, $s6, add_bulls_3
check_4:	beq $s3, $s7, add_bulls_4
	
loop_2:	
	beq $t0, 4, the_end
	
mistake:
    move $t3, $zero
    move $t4, $zero
    check_cows_1:	beq $s4, $s0, add_to_right_1
    check_cows_2:	beq $s4, $s1, add_to_right_2
    check_cows_3:	beq $s4, $s2, add_to_right_3
    check_cows_4:	beq $s4, $s3, add_to_right_4
    add_1:		    beq $t4, $zero, add_to_mistake_1
        

    check_cows_5:	beq $s5, $s0, add_to_right_5
    check_cows_6:	beq $s5, $s1, add_to_right_6
    check_cows_7:	beq $s5, $s2, add_to_right_7
    check_cows_8:	beq $s5, $s3, add_to_right_8
    add_2:		    beq $t4, $zero, add_to_mistake_2
        

    check_cows_9:	beq $s6, $s0, add_to_right_9
    check_cows_10:	beq $s6, $s1, add_to_right_10
    check_cows_11:	beq $s6, $s2, add_to_right_11
    check_cows_12:	beq $s6, $s3, add_to_right_12
    add_3:		    beq $t4, $zero, add_to_mistake_3
        

    check_cows_13:	beq $s7, $s0, add_to_right_13
    check_cows_14:	beq $s7, $s1, add_to_right_14
    check_cows_15:	beq $s7, $s2, add_to_right_15
    check_cows_16:	beq $s7, $s3, add_to_right_16
    add_4:		    beq $t4, $zero, add_to_mistake_4
	
loop_3:	
    jal calculate_cows
	
	jal add_cows
	
	jal print_result
	
	j loop_1
	
	
print_guess:
	li $v0, 4
	la $a0, guess_print
	syscall
	jr $ra
	
print_result:
	li $v0, 4
	la $a0, bulls
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 11
	la $a0, '\n'
	syscall
	
	li $v0, 4
	la $a0, cows
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 11
	la $a0, '\n'
	syscall
	
	jr $ra
	
read_int:
	li $v0, 5
	syscall
	jr $ra


add_bulls_1:
	add $t0, $t0, 1
	j check_2

add_bulls_2:
	add $t0, $t0, 1
	j check_3

add_bulls_3:
	add $t0, $t0, 1
	j check_4

add_bulls_4:
	add $t0, $t0, 1
	j loop_2
	


add_to_right_1: 
	add $t4, $t4, 1	
	j check_cows_2

add_to_right_2: 
	add $t4, $t4, 1	
	j check_cows_3

add_to_right_3: 
	add $t4, $t4, 1	
	j check_cows_4

add_to_right_4: 
	add $t4, $t4, 1	
	j add_1

add_to_right_5: 
	add $t4, $t4, 1	
	j check_cows_6
add_to_right_6: 
	add $t4, $t4, 1	
	j check_cows_7
add_to_right_7: 
	add $t4, $t4, 1	
	j check_cows_8
add_to_right_8: 
	add $t4, $t4, 1	
	j add_2
add_to_right_9: 
	add $t4, $t4, 1	
	j check_cows_10
add_to_right_10: 
	add $t4, $t4, 1	
	j check_cows_11
add_to_right_11: 
	add $t4, $t4, 1	
	j check_cows_12
add_to_right_12: 
	add $t4, $t4, 1	
	j add_3
add_to_right_13: 
	add $t4, $t4, 1	
	j check_cows_14
add_to_right_14: 
	add $t4, $t4, 1	
	j check_cows_15
add_to_right_15: 
	add $t4, $t4, 1	
	j check_cows_16
add_to_right_16: 
	add $t4, $t4, 1	
	j add_4


add_to_mistake_1:

	add $t3, $t3, 1
    move $t4, $zero
 
	j check_cows_5	

add_to_mistake_2:
	add $t3, $t3, 1
    move $t4, $zero
	j check_cows_9		

add_to_mistake_3:
	add $t3, $t3, 1
    move $t4, $zero
	j check_cows_13		

add_to_mistake_4:
	add $t3, $t3, 1
	j loop_3

add_cows: 
	move $t1, $t2
	jr $ra

calculate_cows:
	move $t2, $zero
	add $t2, $t2, 4
	sub $t2, $t2, $t0

	sub $t2, $t2, $t3
	jr $ra	
    
the_end:
	li $v0, 4
	la $a0, the_end_prompt
	syscall
	
	li $v0, 10
	syscall