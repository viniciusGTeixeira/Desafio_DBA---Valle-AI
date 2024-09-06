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
