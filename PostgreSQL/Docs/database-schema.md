# Esquema do Banco de Dados

## Tabelas

### `users`
- `user_id`: Chave primária, tipo SERIAL.
- `name`: Nome do usuário.
- `email`: Email do usuário.
- `address`: Endereço do usuário.
- `dob`: Data de nascimento do usuário.
- `password_hash`: Hash da senha do usuário.

### `sensitive_data`
- `data_id`: Chave primária, tipo SERIAL.
- `user_id`: Chave estrangeira referenciando `users(user_id)`.
- `cpf_hash`: CPF criptografado.
- `encrypted_address`: Endereço criptografado.

### `orders`
- `order_id`: Chave primária, tipo SERIAL.
- `user_id`: Chave estrangeira referenciando `users(user_id)`.
- `product_id`: ID do produto.
- `order_date`: Data do pedido.

### `payments`
- `payment_id`: Chave primária, tipo SERIAL.
- `data_id`: Chave estrangeira referenciando `sensitive_data(data_id)`.
- `encrypted_card_number`: Número do cartão criptografado.
- `encrypted_card_expiry`: Data de validade do cartão criptografada.
- `encrypted_cvc`: CVC criptografado.

### `products`
- `product_id`: Chave primária, tipo SERIAL.
- `name`: Nome do produto.
- `description`: Descrição do produto.
- `price`: Preço do produto.
- `category`: Categoria do produto.
- `stock_quantity`: Quantidade em estoque.
