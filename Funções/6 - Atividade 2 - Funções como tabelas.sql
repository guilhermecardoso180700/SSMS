-- Utilizando a função que criamos anteriormente, que conta o número total de notas por data
SELECT DISTINCT DATA, [dbo].[NUMERONOTAS](DATA) AS NUMERO FROM [NOTAS FISCAIS] WHERE DATA >= '20170101' AND DATA <= '20170110'

-- Criando uma função que utiliza o select anterior:
CREATE FUNCTION FUNC_TABELA_NOTAS (@DATA_INICIAL DATE, @DATA_FINAL DATE) RETURNS TABLE AS
RETURN SELECT DISTINCT DATA, [dbo].[NUMERONOTAS](DATA) AS NUMERO FROM [NOTAS FISCAIS] WHERE DATA >= @DATA_INICIAL AND DATA <= @DATA_FINAL

-- SELECT DA FUNÇÃO ANTERIOR:
SELECT * FROM [dbo].[FUNC_TABELA_NOTAS]('20170101','20170110')