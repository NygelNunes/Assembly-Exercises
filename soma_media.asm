	# Solicite ao usuario a inserção de 4 notas de 0 á 10 de um valor inteiro, apresente como resposta a soma e media!
	
	.data 
	n1:  .asciiz "Nota 1 do tipo inteiro:"   # String armazenada na memória (segmento de dados)
	n2:  .asciiz "Nota 2 do tipo inteiro:"
	n3:  .asciiz "Nota 3 do tipo inteiro:"
	n4:  .asciiz "Nota 4 do tipo inteiro:"
	soma:  .asciiz "A soma dos numeros é: "
	resultado:  .asciiz "\n A media das notas é:  "

	.text 
# nota 1
	li $v0,  4              # li = load immediate (carrega valor imediato). 4 é código para imprimir string
	la $a0,  n1             # la = load address (carrega o endereço da string n1 para $a0)
	syscall                 # chamada do sistema para executar o serviço (imprimir string)
	
	li $v0, 5               # código 5 = ler inteiro do teclado
	syscall                 # executa leitura
	
	move $t1,  $v0          # move o valor lido (em $v0) para $t1 (registrador temporário)
	                        # usamos registradores $t para guardar valores temporários
	
# nota 2
	li $v0, 4               # imprimir string
	la $a0, n2              # carrega endereço da mensagem n2
	syscall
	
	li $v0, 5               # ler inteiro
	syscall
	
	move $t2, $v0           # salva segunda nota em $t2
	
#nota 3
	li $v0, 4
	la $a0, n3
	syscall
	
	li $v0, 5
	syscall
	
	move $t3, $v0           # salva terceira nota em $t3
	
#nota 4
	li $v0, 4
	la $a0, n4
	syscall
	
	li $v0, 5
	syscall
	
	move $t4, $v0           # salva quarta nota em $t4
	
	add $t0,  $t1,  $t2     # soma nota1 + nota2
	add $t5, $t3, $t4       # soma nota3 + nota4
	add $t6, $t0, $t5       # soma total das 4 notas (resultado final em $t6)
	
	div $t7, $t6, 3         # divide soma por 3 (resultado armazenado em $t7)
	                        # div = divisão inteira
	
#Result som

	li $v0, 4               # imprimir string
	la $a0, soma            # carrega endereço da mensagem "soma"
	syscall
	
	li $v0, 1               # código 1 = imprimir inteiro
	la $a0,  ($t6)          # envia valor da soma para impressão
	syscall 
	
#Result div

	li $v0, 4               # imprimir string
	la $a0, resultado       # carrega endereço da mensagem "resultado"
	syscall
	
	li $v0, 1               # imprimir inteiro
	la $a0,  ($t7)          # envia valor da média para impressão
	syscall 
	
	li $v0, 10              # código 10 = encerrar programa
	syscall
