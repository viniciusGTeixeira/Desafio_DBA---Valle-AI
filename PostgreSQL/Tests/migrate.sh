#!/bin/bash

# Configurações do banco de dados
DB_USER="admin"
DB_HOST="localhost"  # Ajuste para o nome do contêiner ou IP se necessário
DB_PORT="5432"
DB_NAME="shopnow"

# Pasta onde os arquivos de migração estão localizados
MIGRATION_DIR="sql/migrations"

# Verifica se o diretório de migração existe
if [ ! -d "$MIGRATION_DIR" ]; then
    echo "O diretório de migração '$MIGRATION_DIR' não existe."
    exit 1
fi

# Executa cada arquivo SQL na pasta de migrações
for sql_file in $(ls ${MIGRATION_DIR}/*.sql 2>/dev/null | sort); do
    echo "Executando $sql_file..."
    psql -U $DB_USER -h $DB_HOST -p $DB_PORT -d $DB_NAME -f $sql_file
    if [ $? -ne 0 ]; then
        echo "Erro ao executar $sql_file"
        exit 1
    fi
done

echo "Todas as migrações foram executadas com sucesso."
