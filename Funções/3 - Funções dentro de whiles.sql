-- Declarando variáveis:
DECLARE @LIMITE_MINIMO INT, @LIMITE_MAXIMO INT, @CONTADOR_NOTAS INT

-- Declarando tabela temporária:
DECLARE @TABELA_NUMEROS TABLE ([NUMERO] INT, [STATUS] VARCHAR(200), FATURAMENTO FLOAT)

-- Definindo o número mínimo e máximo dos números das notas na consulta:
SET @LIMITE_MINIMO = 98
SET @LIMITE_MAXIMO = 102

SET NOCOUNT ON
-- Loop para alterar o número da nota nas consultas:
WHILE @LIMITE_MINIMO <= @LIMITE_MAXIMO
BEGIN
   SELECT @CONTADOR_NOTAS = COUNT(*) FROM [NOTAS FISCAIS] WHERE [NUMERO] = @LIMITE_MINIMO
   IF @CONTADOR_NOTAS > 0 
       BEGIN
		  -- Inserindo o Número da nota, dizendo se é ou não nota fiscal, e seu valor de faturamento:
          INSERT INTO @TABELA_NUMEROS ([NUMERO], [STATUS],FATURAMENTO) VALUES (@LIMITE_MINIMO, 'É nota fiscal',[dbo].[FATURAMENTO_NOTA](@LIMITE_MINIMO))

	   END
   ELSE
       BEGIN
          INSERT INTO @TABELA_NUMEROS ([NUMERO], [STATUS],FATURAMENTO) VALUES (@LIMITE_MINIMO, 'Não é nota fiscal',0)

	   END
   SET @LIMITE_MINIMO = @LIMITE_MINIMO + 1   
END

SELECT * FROM @TABELA_NUMEROS
