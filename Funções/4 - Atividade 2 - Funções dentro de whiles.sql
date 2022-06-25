-- Se a tabela ja´existir, exclua:
IF OBJECT_ID('TABELANOTAS','U') IS NOT NULL
DROP TABLE TABELANOTAS

-- Criando tabela:
CREATE TABLE TABELANOTAS (DATA DATE, NUMNOTAS INT)

-- Declarando variáveis:
DECLARE @DATAINICIAL DATE = '20170101'
DECLARE @DATAFINAL DATE = '20170110'
DECLARE @NUMNOTAS INT

-- Realizando o loop:
WHILE @DATAINICIAL <= @DATAFINAL
BEGIN
   SELECT @NUMNOTAS = COUNT(*) FROM [NOTAS FISCAIS] 
    WHERE DATA = @DATAINICIAL
   INSERT INTO TABELANOTAS (DATA, NUMNOTAS) 
	-- Utilizanso a função de contar notas dentro do insert:
    VALUES (@DATAINICIAL, [dbo].[NUMERO_NOTAS](@DATAINICIAL))
   SELECT @DATAINICIAL = DATEADD(DAY, 1, @DATAINICIAL)
END
SELECT * FROM TABELANOTAS
