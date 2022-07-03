-- Número de notas de um determinado cliente num determinado ano
SELECT COUNT(*) FROM [NOTAS FISCAIS] WHERE CPF = '50534475787' AND YEAR(DATA) = 2016

-- Faturamento de um cliente específico num ano específico:
SELECT SUM (QUANTIDADE * PREÇO) FROM [ITENS NOTAS FISCAIS] B INNER JOIN [NOTAS FISCAIS] A ON
A.NUMERO = B.NUMERO WHERE CPF = '50534475787' AND YEAR(DATA) = 2016

SELECT * FROM [TABELA DE CLIENTES]
SELECT CPF, * FROM [NOTAS FISCAIS]

-- Criando a procedure que nos retorna o número de notas fiscais e o valor do faturamento de um cliente num ano específico:
CREATE PROCEDURE RETORNA_VALORES 
@CPF AS VARCHAR(12), 
@ANO AS INT, 
@NUM_NOTAS AS INT OUTPUT,
@FATURAMENTO AS FLOAT OUTPUT
AS
BEGIN
SELECT @NUM_NOTAS =  COUNT(*) FROM [NOTAS FISCAIS] WHERE CPF = @CPF AND YEAR(DATA) = @ANO

SELECT @FATURAMENTO = SUM (QUANTIDADE * PREÇO) FROM [ITENS NOTAS FISCAIS] B INNER JOIN [NOTAS FISCAIS] A ON
A.NUMERO = B.NUMERO WHERE CPF = @CPF AND YEAR(DATA) = @ANO
END

-- Declarando variáveis:
DECLARE @NUMERO_NOTAS INT, @FATURAMENTO FLOAT
DECLARE @CPF VARCHAR(12) = '50534475787', @ANO INT = 2016

-- Executando Procedure:
EXEC RETORNA_VALORES @CPF = @CPF, @ANO = @ANO, @NUM_NOTAS = @NUMERO_NOTAS OUTPUT, @FATURAMENTO = @FATURAMENTO OUTPUT
SELECT @NUMERO_NOTAS, @FATURAMENTO