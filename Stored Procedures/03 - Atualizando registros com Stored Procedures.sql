CREATE PROCEDURE RECALCULA_IDADE
AS
BEGIN
-- Atualiza a idade de todos os clientes:
UPDATE [TABELA DE CLIENTES] SET IDADE = DATEDIFF(YEAR, [DATA DE NASCIMENTO], GETDATE())
END

-- Inserindo manualmente um cliente:
INSERT INTO [TABELA DE CLIENTES] (CPF, NOME, [ENDERECO 1], [ENDERECO 2], BAIRRO, CIDADE, ESTADO, CEP, [DATA DE NASCIMENTO], SEXO, [LIMITE DE CREDITO], [VOLUME DE COMPRA], [PRIMEIRA COMPRA])
VALUES
('344890590', 'Ethan Jhonson', 'Rua Projetada', '', 'Madureira','Rio de Janeiro', 'RJ', '20000', '20000306', 'M', 12000, 12000, 0)

-- Executando procedure
EXEC RECALCULA_IDADE

SELECT * FROM [TABELA DE CLIENTES]