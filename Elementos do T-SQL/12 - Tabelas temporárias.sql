-- Criando tabela temporária:
CREATE TABLE #TABELA01 (ID VARCHAR(10) NULL, NOME VARCHAR(200) NULL)

-- Inserindo valores na tabela temporária:
INSERT INTO #TABELA01 (ID,NOME) VALUES ('01','Guilherme')

-- Visualizando tabela temporária/ Script não funciona em outras abas por ter apenas um #:
SELECT * FROM #TABELA01

-----------------------------------------

CREATE TABLE ##TABELA02 (ID VARCHAR(10) NULL, NOME VARCHAR(200) NULL)
INSERT INTO ##TABELA02 (ID,NOME) VALUES ('01','Guilherme')

-- Visualizando tabela temporária 2/ Funciona normalmente em outras abas por ter dois#:
SELECT * FROM ##TABELA02

-----------------------------------------

-- SELECT final funciona apenas se executarmos o script inteiro, pois funciona como uma variável:
DECLARE @LIMITE_MINIMO INT, @LIMITE_MAXIMO INT, @CONTADOR_NOTAS INT
DECLARE @TABELA_NUMEROS TABLE ([NUMERO] INT, [STATUS] VARCHAR(200))

SET @LIMITE_MINIMO = 1
SET @LIMITE_MAXIMO = 100	

SET NOCOUNT ON
WHILE @LIMITE_MINIMO <= @LIMITE_MAXIMO
BEGIN
   SELECT @CONTADOR_NOTAS = COUNT(*) FROM [NOTAS FISCAIS] WHERE [NUMERO] = @LIMITE_MINIMO
   IF @CONTADOR_NOTAS > 0 
       INSERT INTO @TABELA_NUMEROS ([NUMERO], [STATUS]) VALUES (@LIMITE_MINIMO, 'É nota fiscal')
   ELSE
       INSERT INTO @TABELA_NUMEROS ([NUMERO], [STATUS]) VALUES (@LIMITE_MINIMO, 'Não é nota fiscal')
   SET @LIMITE_MINIMO = @LIMITE_MINIMO + 1   
END

SELECT * FROM @TABELA_NUMEROS