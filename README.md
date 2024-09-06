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
