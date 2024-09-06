-- Criação da tabela sensitive_data
CREATE TABLE sensitive_data (
    data_id SERIAL PRIMARY KEY,
    obfuscated_user_id UUID REFERENCES ouid_mapping(obfuscated_user_id),
    cpf_hash BYTEA NOT NULL,
    encrypted_address BYTEA
);
