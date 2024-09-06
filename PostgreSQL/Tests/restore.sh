#!/bin/bash

# Restauração do banco de dados PostgreSQL
docker exec -i postgres_db psql -U admin -d shopnow < backup.sql
