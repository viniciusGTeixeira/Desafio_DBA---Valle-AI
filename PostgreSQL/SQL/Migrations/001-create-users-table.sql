-- Criação da tabela users
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    address TEXT,
    dob DATE,
    password_hash TEXT NOT NULL
);
