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

-- =======================
-- TABELA PEDIDOS 
-- =======================
CREATE TABLE pedidos (
	id_pedido SERIAL PRIMARY KEY,
	id_cliente INTEGER NOT NULL,
	data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	status VARCHAR(20) NOT NULL,
	valor_total NUMERIC(10,2) NOT NULL DEFAULT 0.00,

	CONSTRAINT fk_pedido_cliente
		FOREIGN KEY (id_cliente)
		REFERENCES clientes(id_cliente)
);

-- =======================
-- TABELA ITENS_PEDIDO
-- =======================
CREATE TABLE itens_pedido (
	id_item SERIAL PRIMARY KEY,
	id_pedido INTEGER NOT NULL,
	id_produto INTEGER NOT NULL,
	quantidade INTEGER NOT NULL,
	preco_unitario NUMERIC(10,2) NOT NULL,
	
	CONSTRAINT fk_item_pedido
		FOREIGN KEY (id_pedido)
		REFERENCES pedidos(id_pedido),

	CONSTRAINT fk_item_produto
		FOREIGN KEY (id_produto)
		REFERENCES produtos(id_produto)
);