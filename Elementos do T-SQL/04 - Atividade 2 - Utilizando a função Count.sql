/*
Crie uma variável chamada NUMNOTAS e atribua a ela o número de notas fiscais do dia 01/01/2017. Mostre na saída do script o valor da variável.
*/

-- Declarando variáveis:
DECLARE @NUMNOTAS INT

-- Utilizando a função COUNT:
SELECT @NUMNOTAS = COUNT (*) FROM [NOTAS FISCAIS] WHERE DATA = '2015-01-01'

-- Imprimindo o número de notas do dia primeiro:
PRINT @NUMNOTAS