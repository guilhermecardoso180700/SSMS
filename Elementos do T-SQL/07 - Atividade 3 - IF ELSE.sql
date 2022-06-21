/*
Crie um script que, baseado em uma data, conte o número de notas fiscais. Se houver mais de 70 notas, exiba a mensagem "Muita nota". 
Se não, exiba a mensagem "Pouca nota". Exiba também o número de notas.
*/

DECLARE @NUMERO_NOTAS INT

SELECT @NUMERO_NOTAS = COUNT (*) FROM [NOTAS FISCAIS]

IF @NUMERO_NOTAS > 70
	PRINT 'Muitas notas.'
Else
	PRINT 'Poucas Notas'
