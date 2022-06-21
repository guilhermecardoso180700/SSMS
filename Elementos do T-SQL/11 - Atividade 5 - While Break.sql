/*
SELECT DATEADD(DAY, 1, @DATA)
Faça um script que, a partir do dia 01/01/2017, conte o número de notas fiscais até o dia 10/01/2017. Imprima a data e o número de notas fiscais.

Dicas:

Declare variáveis do tipo DATE: DATAINICIAL e DATAFINAL;
Faça um loop testando se a data inicial é menor que a data final;
Imprima a data e o número de notas na saída do Management Studio. Não esqueça de converter as variáveis para VARCHAR;
Acrescente um dia à data.
*/

-- Declarando variáveis:
DECLARE @DATAINICIAL DATE = '2017-01-01', @DATAFINAL DATE = '2017-01-10', @NUMNOTAS INT = 0, @TOTALNOTAS INT = 0

WHILE (@DATAINICIAL <= @DATAFINAL)
BEGIN
	SET @NUMNOTAS = (SELECT COUNT (*) FROM [NOTAS FISCAIS] WHERE DATA = @DATAINICIAL)
	SET @TOTALNOTAS = @TOTALNOTAS + (SELECT COUNT (*) FROM [NOTAS FISCAIS] WHERE DATA = @DATAINICIAL)
	SET @DATAINICIAL = DATEADD(DAY, 1, @DATAINICIAL)
	PRINT CONVERT(VARCHAR(10), @DATAINICIAL) + ': ' + CONVERT(VARCHAR(10), @NUMNOTAS) 
END
	-- Mostrando o número total de notas:
	PRINT 'Número total de notas: ' + CONVERT(VARCHAR(10), @TOTALNOTAS) 