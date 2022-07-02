Stored Procedures:

1 - Introdução:

. Rotinas executadas pelo Servidor
    - Funções retornam valor escalar ou tabela (Precisa de uma variável)
    - Stored Procedures não necessariamente retornam um valor - Altera valores da variável passada a ela.

. Corpo definido por BEGIN e END
. Várias variáveis como referência
. Uma ou mais variáveis de retorno

CREATE PROCURE nomeprocedure (Declaração de variáveis)
AS
BEGIN
CORPO DE PROCEDURE
END

2 - 