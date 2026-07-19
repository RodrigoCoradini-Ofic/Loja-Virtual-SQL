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
CREATE TABLE produtos (
	id_produto SERIAL PRIMARY KEY,
	nome  VARCHAR(150) NOT NULL,
	descricao TEXT,
	preco NUMERIC(10,2) NOT NULL,
	quantidade_estoque INTEGER NOT NULL DEFAULT 0,
	id_categoria INTEGER NOT NULL,
	sku VARCHAR(30) UNIQUE NOT NULL, -- Stock Keeping Unit

	CONSTRAINT fk_produto_categoria
		FOREIGN KEY (id_categoria)
		REFERENCES categorias(id_categoria)
);