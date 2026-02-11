	.data
		pergunta:  .asciiz "Digite a sua idade:"
		menor:     .asciiz "Voce é menor de idade!"
		maior:     .asciiz "Voce é maior de idade!"

	.text
		# --- Exibe a pergunta ---
		li $v0, 4              # 4 = código para imprimir string
		la $a0, pergunta       # la (load address) carrega o endereço da string em $a0
		syscall                # executa a chamada do sistema
	
		# --- Lê a idade digitada ---
		li $v0, 5              # 5 = código para ler inteiro do teclado
		syscall                # após a leitura, o valor fica em $v0
	
		move $t1, $v0          # move a idade digitada para $t1 (registrador temporário)
	        # não é bom deixar no $v0 porque ele será reutilizado
	
		# --- Define idade de referência ---
		li $t0, 18             # carrega 18 em $t0 (idade mínima para ser maior de idade)
	
		# --- Estrutura condicional ---
		blt $t1, $t0, menoridade   # se idade < 18, desvia para menoridade
		bge $t1, $t0, maioridade   # se idade >= 18, desvia para maioridade "bge - igual, bgt - sem igual"
	
		# --- Caso seja menor de idade ---
		menoridade:
			li $v0, 4
			la $a0, menor          # carrega mensagem de menor de idade
			syscall
	
			li $v0, 10             # 10 = encerrar programa
			syscall
	
		# --- Caso seja maior de idade ---
		maioridade:
			li $v0, 4
			la $a0, maior          # carrega mensagem de maior de idade
			syscall
	
			li $v0, 10             # encerra programa
			syscall
