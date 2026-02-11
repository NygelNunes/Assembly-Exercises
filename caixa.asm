#1 – Simule, em Assembly MIPS, o funcionamento de um caixa eletrônico.
#O sistema deverá funcionar da seguinte forma:

#a) Inicialmente, deverá ser apresentada ao usuário a seguinte lista de opções:
#- Digite 1 para consultar saldo;

#- Digite 2 para realizar saque;

#- Digite 3 para realizar depósito;

#- Digite 4 para encerrar a operação.

#b) O saldo deverá iniciar com o valor 0 (zero).

#c) Não será permitido realizar saques com saldo insuficiente.

#Após realizar uma operação diferente de 4 deverá apresentar novamente a lista de opções!
.data
		opcao:  .asciiz "\nCaixa: \n Digite 1 para consultar saldo; \n Digite 2 para realizar saque; \n Digite 3 para realizar depósito; \n Digite 4 para encerrar a operação; \n"
		digite: .asciiz "Digite: "
		digite1: .asciiz "Digite valor do Saque: "
		digite2: .asciiz "Digite valor do Deposito: "
		error: .asciiz "\nSaldo insuficiente!\n"
		msg_saldo: .asciiz "\nSeu saldo atual e: "
		saldo: .word 0 
		
	.text
	
	menu:
		# Mostra as opcoes
		li $v0, 4
		la $a0, opcao
		syscall
		
		li $v0, 4
		la $a0, digite
		syscall
		
		# Le a opcao do usuario
		li $v0, 5
		syscall
		
		move $t0, $v0
		
		# Define constantes para comparacao
		li $t1, 1
		li $t2, 2
		li $t3, 3
		li $t4, 4
		
		# Desvios condicionais
		beq $t0, $t1, um
		beq $t0, $t2, dois
		beq $t0, $t3, tres
		beq $t0, $t4, quatro
		
		# Se digitar algo invalido, volta pro menu
		j menu
		
		um: # Consultar Saldo
			li $v0, 4
			la $a0, msg_saldo
			syscall
		
			li  $v0, 1
			lw $a0, saldo    #lw carrega o valor em $a0
			syscall
			
			j menu         

		dois: # Realizar Saque
			li $v0, 4
			la $a0, digite1
			syscall
			
			li $v0, 5
			syscall
			
			move $t2, $v0    # $t2 tem o valor do saque
			lw $t5, saldo    #Carregar o saldo em registrador ($t5) para comparar
			
			bgt $t2, $t5, maior # Se Saque > Saldo, vai para erro
			
			# Se for menor ou igual 
    			sub $t6, $t5, $t2  # Subtrai do saldo carregado
			sw $t6, saldo      # Atualiza a memoria
			
			j menu             #Importante pular o erro e voltar ao menu

    			maior: 
    				li  $v0, 4
				la $a0, error
				syscall
			
				j menu             # Volta ao menu apos erro

		tres: # Realizar Deposito
			li $v0, 4
			la $a0, digite2
			syscall
			
			li $v0, 5
			syscall
			
			move $t3, $v0    # Valor do deposito
			lw $t5, saldo    # Carrega saldo atual
			
			add $t7, $t5, $t3 # Soma ao saldo existente 
			sw $t7, saldo #atualiza
			
			j menu            # Volta ao menu

		quatro: # Encerrar
			li $v0, 10
			syscall
	
			
	