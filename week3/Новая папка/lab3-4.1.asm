



isnum: 		addi $sp,$sp,-4 	#store the $ra on the stack 
		sw $ra, 0($sp)
		li $s3,0 	        #clear $s3
		li  $t7,'0' 	        #test 0 - 9
		blt $t1,$t7,done_isnum 
		li $t7,'9'
		ble $t1,$t7,correct



		li $t7,'A' 	#test A - F
		blt $t1,$t7,done_isnum
		li $t7,'F'
		ble $t1,$t7,correct



		li $t7,'a' 	#test a – f 
		blt $t1,$t7,done_isnum
		li $t7,'f'
		ble $t1,$t7, correct
 		j done_isnum
 correct:       li $s3,1                      #it is a number, set the flag

 done_isnum:    lw $ra,0($sp)             #restore the $ra
                addi $sp,$sp,4
                jr $ra

