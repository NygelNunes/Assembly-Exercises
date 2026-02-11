	
	# Solicite ao usuario a inserçõ de 4 notas de 0 á 10 de um valor inteiro, apresente como resposta a soma e media!
	
	.data 
	n1:  .asciiz "Nota 1 do tipo inteiro:"
	n2:  .asciiz "Nota 2 do tipo inteiro:"
	n3:  .asciiz "Nota 3 do tipo inteiro:"
	n4:  .asciiz "Nota 4 do tipo inteiro:"
	soma:  .asciiz "A soma dos numeros é: "
	resultado:  .asciiz "\n A media das notas é:  "

	.text 
# nota 1
	li $v0,  4
	la $a0,  n1
	syscall
	
	li $v0, 5
	syscall
	
	move $t1,  $v0 #movendo para variavel temporaria, pq se não sobrescreve o valor no $v0
	
# nota 2
	li $v0, 4
	la $a0, n2
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0 #movendo ...
	
#nota 3
	li $v0, 4
	la $a0, n3
	syscall
	
	li $v0, 5
	syscall
	
	move $t3, $v0 #movendo ...
	
#nota 4
	li $v0, 4
	la $a0, n4
	syscall
	
	li $v0, 5
	syscall
	
	move $t4, $v0 #movendo ...
	
	add $t0,  $t1,  $t2
	add $t5, $t3, $t4
	add $t6, $t0, $t5
	

	
	div $t7, $t6, 3
	
#Result som

	li $v0, 4
	la $a0, soma
	syscall
	
	li $v0, 1
	la $a0,  ($t6)
	syscall 
	
#Result div

	li $v0, 4
	la $a0, resultado
	syscall
	
	li $v0, 1
	la $a0,  ($t7)
	syscall 
	
	li $v0, 10
	syscall
