.data
message: .asciiz "Enter string: "
input: .space 20
.text
.globl main

main:
# getting user input as text
li $v0, 8
la $a0, input
li $a1, 20
syscall

li $v0,4
li $t0,0

loop:
lb $t1,input($t0)
beq $t1, 0,exit
blt $t1,'A',case
bgt $t1,'Z',case
add $t1, $t1, 32
sb $t1,input($t0)

case:
addi $t0,$t0,1
j loop

exit: 
li $v0, 4
la $a0, input
syscall
li $v0,10
syscall
