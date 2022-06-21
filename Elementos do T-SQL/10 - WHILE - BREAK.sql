@ -- Declarando variáveis:
DECLARE @LIMITE_MAXIMO INT = 10, @LIMITE_MINIMO INT = 1

-- Criando o loop:
WHILE @LIMITE_MINIMO <= @LIMITE_MAXIMO
BEGIN
	PRINT @LIMITE_MINIMO
	-- Criando um BREAK para encerrar o WHILE
	SET @LIMITE_MINIMO = @LIMITE_MINIMO + 1
	IF @LIMITE_MINIMO = 6
		BEGIN PRINT 'Encerrando WHILE através do break...'
			  BREAK
	END
END