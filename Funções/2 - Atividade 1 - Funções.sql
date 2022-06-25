-- Criando uma função que nos traz o número de notas emitidas num determinado dia:
CREATE FUNCTION NUMERO_NOTAS (@DATA DATE) RETURNS INT AS
BEGIN
	DECLARE @NUMERO INT
	SELECT @NUMERO = COUNT(*) FROM [NOTAS FISCAIS] WHERE DATA = @DATA
	RETURN @NUMERO
END

-- Realizando a consulta com a função:
SELECT [dbo].[NUMERO_NOTAS]('2015-01-14')