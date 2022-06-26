-- Criando uma função que forma o endereçõ completo:
CREATE FUNCTION ENDERECO_COMPLETO (@ENDERECO VARCHAR(100), @CIDADE VARCHAR(50), @ESTADO VARCHAR(50), @CEP VARCHAR(20)) RETURNS VARCHAR (250) AS
BEGIN 
	DECLARE @ENDERECO_COMPLETO VARCHAR (250) = @ENDERECO + ' - ' + @CIDADE + ' - ' + @ESTADO + ' - ' + @CEP
	RETURN @ENDERECO_COMPLETO
END

-- Utilizando a função anterior:
SELECT [dbo].[ENDERECO_COMPLETO]('Avenida tirandentes','Guarullhos','São Paulo','077223') AS 'Endereço completo'

-- Select da tabela de clientes:
SELECT [ENDERECO 1], CIDADE, ESTADO, CEP FROM [TABELA DE CLIENTES]

-- Utilizando a tabela de clientes para trazer o endereço completo:
SELECT CPF, [dbo].[ENDERECO_COMPLETO]([ENDERECO 1], CIDADE, ESTADO, CEP)
FROM [TABELA DE CLIENTES]

----------------------------

-- Alterando funções:
ALTER FUNCTION  ENDERECO_COMPLETO (@ENDERECO VARCHAR(100), @CIDADE VARCHAR(50), @ESTADO VARCHAR(50), @CEP VARCHAR(20)) RETURNS VARCHAR (250) AS
BEGIN 
	DECLARE @ENDERECO_COMPLETO VARCHAR (250) = @ENDERECO + ', ' + @CIDADE + ', ' + @ESTADO + ', ' + @CEP
	RETURN @ENDERECO_COMPLETO
END