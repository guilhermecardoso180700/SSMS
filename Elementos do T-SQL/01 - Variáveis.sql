-- Declarando variáveis
DECLARE @IDADE INT
DECLARE @NOME VARCHAR(200)
DECLARE @DATA DATE

-- Declarando variáveis em sequência:
DECLARE @IDADE2 INT, @NOME2 VARCHAR(200), @DATA2 DATE

-- Atribuindo valores:
SET @IDADE = 20 
SET @NOME = 'Guilherme'
SET @DATA = '2022-06-13'

-- Exibindo variáveis:
-- PRINT @IDADE
-- PRINT @NOME
-- PRINT @DATA

-- Criando a variável CPF:
DECLARE @CPF VARCHAR(12) = '1471156710'

-- Buscando cliente através do CPF
-- SELECT NOME, * FROM [TABELA DE CLIENTES] WHERE CPF = @CPF

-- Atribuindo valores através de um SELECT:
SELECT @NOME2 = NOME, @DATA2 = [DATA DE NASCIMENTO], @IDADE2 = IDADE FROM [TABELA DE CLIENTES] WHERE CPF = @CPF

--Exibindo variáveis:
PRINT @NOME2
PRINT @DATA2
PRINT @IDADE2
PRINT @CPF