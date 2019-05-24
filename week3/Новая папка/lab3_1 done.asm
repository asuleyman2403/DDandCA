.data
instr_count:	.word	9

first_pass:	.asciiz "add $2,$1,$1"
		.space  9
		.asciiz "add $3,$0,$2"
		.space  9
		.asciiz "add $3,$3,$3"
		.space  9
		.asciiz "add $4,$3,$0"
		.space  9	
		.asciiz "beq $3,$0,done"
		.space  7
		.asciiz "sub $3,$3,$1"
		.space  9
		.asciiz "j loop"
		.space  15
		.asciiz "sw $2,0($0)"
		.space  10
		.asciiz "lw $1,-2($4)"
		.space  9
.text
	la $t1,first_pass
	lw $t2,instr_count
	li $t3,0
	
A: 	beq $t3,$t2,B
	li $v0,4
	move $a0,$t1
	syscall
	
	li $v0,11
	la $a0,'\n'
	syscall
	
 	addi $t1,$t1,22
 	subi $t2,$t2,1
 	j A
 	
 B: 	li $v0,10
 	syscall
