CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

INSERT INTO clientes (nome, email, data_cadastro) VALUES
  ('João Silva', 'joao.silva@email.com', '2024-01-29'),
  ('Maria Santos', 'maria.santos@email.com', '2024-01-29'),
  ('Carlos Oliveira', 'carlos.oliveira@email.com', '2024-01-30'),
  ('Ana Pereira', 'ana.pereira@email.com', '2024-01-30');

CREATE OR REPLACE FUNCTION contarClientesCadastrados(data_consulta DATE)
RETURNS INTEGER AS $$
DECLARE
    total_clientes INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_clientes
    FROM clientes
    WHERE data_cadastro = data_consulta;

    RETURN total_clientes;
END;
$$ LANGUAGE plpgsql;

SELECT COUNT(*) AS total_clientes FROM clientes;
