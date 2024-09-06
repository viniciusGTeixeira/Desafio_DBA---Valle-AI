-- Criação da tabela payments
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    data_id INT REFERENCES sensitive_data(data_id),
    encrypted_card_number BYTEA NOT NULL,
    encrypted_card_expiry BYTEA NOT NULL,
    encrypted_cvc BYTEA NOT NULL
);
