SELECT GETDATE()

-- Consultando o dia da semana:
SELECT DATENAME(WEEKDAY, GETDATE())

-- Consultando o dia da semana daqui a 4 dias / Incrementando dias a data: 
SELECT DATENAME(WEEKDAY, DATEADD(DAY,4,GETDATE()))

-- Declarando variáveis:
DECLARE @DIA_SEMANA VARCHAR(20), @NUMERO_DIAS INT

-- Dia que serão somados:
SET @NUMERO_DIAS = 6

-- Atribuindo o valor da função DATENAME à variável DIA_SEMANA:
SET @DIA_SEMANA = DATENAME(WEEKDAY, DATEADD(DAY,@NUMERO_DIAS,GETDATE()))

-- Consultando o valor da variável DIA_SEMANA:
PRINT @DIA_SEMANA

-- Usando o IF para identificar se o dia é ou não fim de semana:
IF @DIA_SEMANA = 'Domingo' or @DIA_SEMANA = 'Sábado'
	PRINT 'Esse dia é fim de semana.'
ELSE 
	PRINT 'Esse dia é dia de semana.'