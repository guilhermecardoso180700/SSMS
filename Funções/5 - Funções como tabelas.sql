-- Visualizando clientes:
SELECT * FROM [TABELA DE CLIENTES] WHERE CPF = '3623344710'

-- Criando a função de buscar as vendas de um determinado cliente:
CREATE FUNCTION LISTA_NOTAS_CLIENTE (@CPF AS VARCHAR(20)) RETURNS TABLE AS
RETURN SELECT * FROM [NOTAS FISCAIS] WHERE CPF = @CPF

-- Utilizando a função criada anteriormente:
SELECT * FROM [dbo].[LISTA_NOTAS_CLIENTES](3623344710)

----------------------------------

-- Trazendo o número total de notas de um determinado cliente:
SELECT COUNT (*) FROM [dbo].[LISTA_NOTAS_CLIENTES](3623344710)

-- Trazendo o total de vendas por cliente:
SELECT CPF, (SELECT COUNT (*) FROM [dbo].[LISTA_NOTAS_CLIENTES](CPF)) AS 'TOTAL_VENDAS' 
FROM [TABELA DE CLIENTES]

-- Trazendo o total do faturamento por cliente:
SELECT CPF, (SELECT SUM ([dbo].[FATURAMENTO_NOTA](NUMERO))) AS 'FATURAMENTO' FROM [NOTAS FISCAIS] GROUP BY CPF

----------------------------------

-- Juntando os dois selects anteriores:
SELECT A.CPF, A.TOTAL_VENDAS, B.FATURAMENTO FROM 
(SELECT CPF, (SELECT COUNT (*) FROM [dbo].[LISTA_NOTAS_CLIENTES](CPF)) AS 'TOTAL_VENDAS' 
FROM [TABELA DE CLIENTES]) A 
INNER JOIN 
(SELECT CPF, (SELECT SUM ([dbo].[FATURAMENTO_NOTA](NUMERO))) AS 'FATURAMENTO' FROM [NOTAS FISCAIS] GROUP BY CPF) B	
ON A.CPF = B.CPF