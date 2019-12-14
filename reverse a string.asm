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
	
	
	
	add	$t1, $zero, $v0		
	add	$t2, $zero, $a0		
	add	$a0, $zero, $v0		
	
reverse:
	li	$t0, 0			
	li	$t3, 0			
	
	reverse_loop:
		add	$t3, $t2, $t0		
		lb	$t4, 0($t3)		
		beqz	$t4, exit		
		sb	$t4, output($t1)		
		subi	$t1, $t1, 1		
		addi	$t0, $t0, 1		
		j	reverse_loop		
	
exit:
	li	$v0, 4		
	la	$a0, output		
	syscall
		
	li	$v0, 10			
	syscall
	

