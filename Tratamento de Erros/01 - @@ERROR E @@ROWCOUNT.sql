-- SELECT que nos traz o faturamento e a comissão de um cliente num determinado ano:
SELECT SUM(A.QUANTIDADE * A.PREÇO) AS FATURAMENTO,
SUM(A.QUANTIDADE * A.PREÇO)/10 AS COMISSAO
FROM [ITENS NOTAS FISCAIS] A INNER JOIN [NOTAS FISCAIS] B
ON A.NUMERO = B.NUMERO WHERE B.CPF = '1471156710' AND YEAR(B.DATA) = 2016

-- Criando a procedure que utiliza o select acima:
CREATE PROCEDURE TRATA_ERROZERO @CPF VARCHAR(12), @ANO INT, @DENOMINADOR INT, @NUMERRO INT OUTPUT, @NUMLINHA INT OUTPUT
AS
BEGIN
	SELECT SUM(A.QUANTIDADE * A.PREÇO) AS FATURAMENTO,
	SUM(A.QUANTIDADE * A.PREÇO)/@DENOMINADOR AS COMISSAO
	FROM [ITENS NOTAS FISCAIS] A INNER JOIN [NOTAS FISCAIS] B
	ON A.NUMERO = B.NUMERO WHERE B.CPF = @CPF AND YEAR(B.DATA) = @ANO
	-- Variáveis que receberão o valor das variáveis de ambiente:
	SELECT @NUMERRO	= @@ERROR, @NUMLINHA = @@ROWCOUNT
END

-- Declarando variáveis:
DECLARE  @DENOMINADOR INT = 10, @CPF varchar(12) = '1471156710', @ANO INT = 2016, @NUMERRO INT, @NUMLINHA INT

-- IF que nos mostrará os erros que ocorreram:
EXEC TRATA_ERRO_ZERO @CPF = @CPF, @ANO = @ANO, @DENOMINADOR = @DENOMINADOR, @NUMERRO = @NUMERRO OUTPUT, @NUMLINHA = @NUMLINHA OUTPUT
IF @NUMERRO <> 0 
	-- Mensagem de erro:
	PRINT 'Erro na linha: ' + CONVERT(VARCHAR(30),@NUMERRO) + ' - ' + CONVERT(VARCHAR(30), @NUMLINHA) 
