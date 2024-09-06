#!/bin/bash

# Definir variáveis
DB_CONTAINER="postgres_db"
DB_USER="admin"
DB_NAME="shopnow"
BACKUP_FILE="backup.sql"

# Backup do banco de dados PostgreSQL
docker exec $DB_CONTAINER pg_dump -U $DB_USER -d $DB_NAME > $BACKUP_FILE
