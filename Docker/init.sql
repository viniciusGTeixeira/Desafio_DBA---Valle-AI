-- PostgreSQL

-- Habilitar a extensão pgcrypto
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Criação das tabelas
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    address TEXT,
    dob DATE,
    password_hash TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS ouid_mapping (
    ouid SERIAL PRIMARY KEY,
    real_user_id INT UNIQUE,
    obfuscated_user_id UUID NOT NULL
);

CREATE TABLE IF NOT EXISTS sensitive_data (
    data_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    cpf_hash BYTEA NOT NULL,
    encrypted_address BYTEA
);

CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS payments (
    payment_id SERIAL PRIMARY KEY,
    data_id INT REFERENCES sensitive_data(data_id),
    encrypted_card_number BYTEA NOT NULL,
    encrypted_card_expiry BYTEA NOT NULL,
    encrypted_cvc BYTEA NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(255),
    stock_quantity INT NOT NULL
);

-- Funções para criptografar e descriptografar dados
CREATE OR REPLACE FUNCTION encrypt_data(data TEXT, key TEXT) RETURNS BYTEA AS $$
BEGIN
    RETURN pgp_sym_encrypt(data, key);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION decrypt_data(data BYTEA, key TEXT) RETURNS TEXT AS $$
BEGIN
    RETURN pgp_sym_decrypt(data, key);
END;
$$ LANGUAGE plpgsql;
