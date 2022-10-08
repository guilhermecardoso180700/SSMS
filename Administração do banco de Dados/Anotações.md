. Backup
    . Full:  Backup completo do banco de dados.
        - BACKUP DATABASE <Nome do banco> TO DISK = '<Diretório e Nome>'
    
    . Diferencial: Mapeia toda mudança efetuada, através da estrutura interna, sem ter que gerar centenas de logs de transação.
        - BACKUP DATABASE <Nome do banco> TO DISK = '<Diretório e Nome>' WITH DIFFERENTIAL

    . Transact: Backup apenas das modificações dos dados.
        - BACKUP LOG <Nome do banco> TO DISK '<Diretório e Nome>'

. Recuperando Backups

    . Entedero tipo de recuperação a ser efetuada
    . Uma transação é salva no backup, de acordo com seu status(Executada/Ativa/Inativa)
    . Saber o estado dos backups
        - RESTORE VERIFYONLY FROM DISK '<Nome do arquivo backup>' WITH CHECKSUM
        Verifica o status do arquivo: 1 - Arquivo válido, 0 - Arquivo inválido )
    
    . Explora os arquivos válidos, e retornar o resultados dos backups salvos, de com a ordem que foram salvos:
        - RESTORE HEADERONLY FROM DISK = '<Diretório e nome do arquivo>'

    RESTORE DATABASE <Nome do banco> FROM DISK = '<Diretório e nome do arquivo>' WITH FILE = <Número do backup>, RECOVERY/NORECOVERY