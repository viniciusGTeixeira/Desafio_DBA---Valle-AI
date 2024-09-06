# Projeto de Banco de Dados com Criptografia

## Estrutura do Projeto

- `docker/` - Configurações do Docker.
- `sql/` - Scripts SQL para migração, seeds e funções.
- `docs/` - Documentação do esquema do banco de dados.
- `tests/` - Scripts e dados para testes de banco de dados.
- `scripts/` - Scripts para backup e restauração.
- `.env` - Variáveis de ambiente.
- `README.md` - Documentação do projeto.

## Inicialização

1. **Iniciar os Contêineres Docker**
    ```bash
    docker compose up -d
    ```

2. **Executar Migrações**
    Execute os scripts de migração e seeds conforme necessário.

3. **Verificar**
    Verifique se o banco de dados está funcionando conforme o esperado.

## Backup e Restauração

- **Backup**
    ```bash
    ./scripts/backup.sh
    ```

- **Restauração**
    ```bash
    ./scripts/restore.sh
    ```


## Estrutura do projeto

Desafio_Valle_ai/
│
├── docker/
│   ├── docker-compose.yml
│   ├── init.sql
│
├── sql/
│   ├── migrations/
│   │   ├── 001-create-users-table.sql
│   │   ├── 002-create-sensitive-data-table.sql
│   │   └── (outros scripts de migração)
│   ├── seeds/
│   │   ├── 001-insert-sample-data.sql
│   │   └── 002-generate-ouid.sql
│   └── functions/
│       ├── 001-encrypt-decrypt-functions.sql
│       └── 002-generate-ouid-function.sql
│
├── docs/
│   └── database-schema.md
│
├── tests/
│   └── (scripts e dados para testes de banco de dados)
│
├── scripts/
│   ├── backup.sh
│   ├── restore.sh
│   └── (outros scripts úteis)
│
├── .env
└── README.md
