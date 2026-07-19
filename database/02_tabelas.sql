-- =======================
-- TABELA CLIENTES 
-- =======================
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
	telefone VARCHAR(20),
	cpf CHAR(11) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

-- =======================
-- TABELA CATEGORIAS 
-- =======================
CREATE TABLE categorias (
	id_categoria SERIAL PRIMARY KEY,
	nome VARCHAR(100) UNIQUE NOT NULL,
	descricao TEXT
);
-- =======================
-- TABELA PRODUTOS 
-- =======================