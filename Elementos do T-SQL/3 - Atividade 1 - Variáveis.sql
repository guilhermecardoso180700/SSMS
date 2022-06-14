/* Crie 4 variáveis com as características abaixo:

Nome: Cliente. Tipo: Caracteres com 10 posições. Valor: João
Nome: Idade. Tipo: Inteiro. Valor: 10
Nome: DataNascimento. Tipo: Data. Valor: 10/01/2007
Nome: Custo. Tipo: Número com casas decimais. Valor: 10,23
Construa um script que declare estas variáveis, atribua valores a elas e exiba-as na saída do SQL Server Management Studio.
*/

DECLARE @Cliente VARCHAR(10) = 'João', @Idade int = 10, @DataNascimento date = '2007-01-10', @Custo float = 10.23

PRINT @Cliente
PRINT @Idade
PRINT @DataNascimento
PRINT @Custo