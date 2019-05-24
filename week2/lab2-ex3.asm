.text

	.globl main

main: 	add $t2,$t0,$t1	# add contents of $t0 and $t1, and store result in $t2



	li $v0,10		# terminate execution

	syscall