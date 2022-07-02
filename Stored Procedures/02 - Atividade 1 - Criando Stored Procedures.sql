-- Criando Procedure:
CREATE PROCEDURE BUSCA_POR_ENTIDADES_COMPLETA @ENTIDADE AS VARCHAR(10)
AS
BEGIN
IF @ENTIDADE = 'CLIENTES'
	SELECT CPF AS IDENTIFADOR, NOME AS DESCRITOR, BAIRRO AS BAIRRO FROM [TABELA DE CLIENTES]
ELSE IF @ENTIDADE = 'VENDEDORES'
	SELECT MATRICULA AS IDENTIFICADOR, NOME AS DESCRITOR, BAIRRO AS BAIRRO FROM [TABELA DE VENDEDORES]
ELSE IF @ENTIDADE = 'PRODUTOS'
	SELECT [CODIGO DO PRODUTO] AS IDENTIFICADOR, [NOME DO PRODUTO] AS DESCRITOR FROM [TABELA DE PRODUTOS]
END

-- Executando a procedure:

-- Select na tabela de clientes:
EXEC BUSCA_POR_ENTIDADES @ENTIDADE = 'CLIENTES'

-- Select na tabela de vendedores:
EXEC BUSCA_POR_ENTIDADES @ENTIDADE = 'VENDEDORES'

-- Select na tabela de produtos:
EXEC BUSCA_POR_ENTIDADES_COMPLETA @ENTIDADE = 'PRODUTOS'

