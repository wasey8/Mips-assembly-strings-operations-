
.data
input:	.space	256
output:	.space	256

	.text
	.globl main
main:
	li	$v0, 8		
	la	$a0, input		
	li	$a1, 256		
	syscall
	
	li	$v0, 4			
	la	$a0, input
	syscall
	
	jal	strlen			
	
	add	$t1, $zero, $v0		
	add	$t2, $zero, $a0		
	add	$a0, $zero, $v0		
	li	$v0, 1			
	syscall

	
exit:
	li	$v0, 4			# Print
	la	$a0, output		# the string!
	syscall
		
	li	$v0, 10			
	syscall
	


strlen:
	li	$t0, 0
	li	$t2, 0
	
	strlen_loop:
		add	$t2, $a0, $t0
		lb	$t1, 0($t2)
		beqz	$t1, strlen_exit
		addiu	$t0, $t0, 1
		j	strlen_loop
		
	strlen_exit:
		subi	$t0, $t0, 1
		add	$v0, $zero, $t0
		add	$t0, $zero, $zero
		jr	$ra
	
