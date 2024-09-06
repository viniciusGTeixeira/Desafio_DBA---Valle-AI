-- Criação da tabela orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    obfuscated_user_id UUID REFERENCES ouid_mapping(obfuscated_user_id),
    product_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);