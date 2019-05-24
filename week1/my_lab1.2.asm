.text
.globl main

main:
li $v0, 4
la $a0, str1
syscall

li $v0, 8
la $a0, name
la $a1, 51
syscall

li $v0, 4
la $a0, str2
syscall

li $v0, 5
syscall

move $t0, $v0
addi $t1, $t0, 4

li $v0, 4
la $a0, str3
syscall

li $v0, 4
la $a0, name
syscall

li $v0, 4
la $a0, str4
syscall


li $v0, 1
move $a0, $t1
syscall

li $v0, 4
la $a0, str5
syscall

.data 
str1: .asciiz "What is your name? "
str2: .asciiz "How old are you? "
str3: .asciiz "Your name is " 
str4: .asciiz "Your age will be "
str5: .asciiz " after 4 years "
name: .space 51
