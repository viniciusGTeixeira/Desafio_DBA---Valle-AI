-- Criação da tabela ouid_mapping
CREATE TABLE ouid_mapping (
    ouid SERIAL PRIMARY KEY,
    real_user_id INT UNIQUE NOT NULL,
    obfuscated_user_id UUID NOT NULL
);
