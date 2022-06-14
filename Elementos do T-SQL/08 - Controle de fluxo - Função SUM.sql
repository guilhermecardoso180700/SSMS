-- Consulta da tabela de clientes:
SELECT * FROM [TABELA DE CLIENTES]

-- Utilizando a função SUM para realizar a soma de todos os valores do campo LIMITE DE CREDITO da tabela de clientes: 
SELECT SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = 'Jardins'

-- Declarando variáveis:
DECLARE @LIMITE_MAXIMO float = 500000, @LIMITE_ATUAL FLOAT, @BAIRRO VARCHAR(30) = 'Jardins'

-- Atribuindo valor para a variável LIMITE_ATUAL:
SELECT @LIMITE_ATUAL =(SELECT SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = 'Jardins')

-- Realizando uma validação do limite de crédito:
IF @LIMITE_MAXIMO <= (SELECT SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = 'Jardins')
BEGIN
	PRINT 'Valor estourou'
END 
ELSE
BEGIN
	PRINT 'Valor não estourou, pode prosseguir'
END