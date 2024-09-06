-- Função para gerar OUID e mapear para UserID real
CREATE OR REPLACE FUNCTION generate_ouid(real_id INT) RETURNS UUID AS $$
DECLARE
    new_ouid UUID;
BEGIN
    new_ouid := gen_random_uuid();
    INSERT INTO ouid_mapping (real_user_id, obfuscated_user_id) VALUES (real_id, new_ouid);
    RETURN new_ouid;
END;
$$ LANGUAGE plpgsql;
