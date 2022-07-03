-- Mostra todas as colunas de Uma tabela:
EXEC sp_columns @TABLE_NAME = 'TABELA DE CLIENTES', @TABLE_OWNER = 'dbo'

-- Listando tabelas que iniciam com tab, no banco Sucos vendas:
EXEC sp_tables @TABLE_NAME = 'tab%', @TABLE_OWNER = 'dbo', @TABLE_QUALIFIER = 'SUCOS_VENDAS'