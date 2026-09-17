-- Sandbox de banco de dados para praticar SQL em um restaurante.
-- O script pode ser executado novamente sem acumular dados duplicados.

DROP TABLE IF EXISTS pedido_itens;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS clientes;

CREATE TABLE categorias (
	id INTEGER PRIMARY KEY,
	nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE produtos (
	id INTEGER PRIMARY KEY,
	categoria_id INTEGER NOT NULL,
	nome VARCHAR(100) NOT NULL,
	preco DECIMAL(10, 2) NOT NULL CHECK (preco >= 0),
	disponivel BOOLEAN NOT NULL DEFAULT TRUE,
	FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE clientes (
	id INTEGER PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(20),
	cidade VARCHAR(60) NOT NULL
);

CREATE TABLE pedidos (
	id INTEGER PRIMARY KEY,
	cliente_id INTEGER NOT NULL,
	data_pedido DATE NOT NULL,
	status VARCHAR(20) NOT NULL CHECK (status IN ('aberto', 'pago', 'entregue', 'cancelado')),
	FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE pedido_itens (
	pedido_id INTEGER NOT NULL,
	produto_id INTEGER NOT NULL,
	quantidade INTEGER NOT NULL CHECK (quantidade > 0),
	preco_unitario DECIMAL(10, 2) NOT NULL CHECK (preco_unitario >= 0),
	PRIMARY KEY (pedido_id, produto_id),
	FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
	FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO categorias (id, nome) VALUES
	(1, 'Entradas'),
	(2, 'Pratos principais'),
	(3, 'Bebidas'),
	(4, 'Sobremesas');

INSERT INTO produtos (id, categoria_id, nome, preco, disponivel) VALUES
	(1, 1, 'Bruschetta', 18.50, TRUE),
	(2, 1, 'Batata rústica', 22.00, TRUE),
	(3, 2, 'Lasanha de queijo', 39.90, TRUE),
	(4, 2, 'Risoto de cogumelos', 42.50, TRUE),
	(5, 3, 'Suco de laranja', 9.00, TRUE),
	(6, 3, 'Água mineral', 5.00, TRUE),
	(7, 4, 'Pudim de leite', 14.00, TRUE);

INSERT INTO clientes (id, nome, telefone, cidade) VALUES
	(1, 'Ana Souza', '11999990001', 'São Paulo'),
	(2, 'Bruno Lima', '21999990002', 'Rio de Janeiro'),
	(3, 'Carla Mendes', '31999990003', 'Belo Horizonte');

INSERT INTO pedidos (id, cliente_id, data_pedido, status) VALUES
	(1, 1, '2025-01-10', 'entregue'),
	(2, 2, '2025-01-11', 'pago'),
	(3, 1, '2025-01-12', 'aberto');

INSERT INTO pedido_itens (pedido_id, produto_id, quantidade, preco_unitario) VALUES
	(1, 1, 1, 18.50),
	(1, 3, 1, 39.90),
	(1, 5, 2, 9.00),
	(2, 2, 1, 22.00),
	(2, 4, 1, 42.50),
	(3, 3, 2, 39.90),
	(3, 7, 1, 14.00);

-- Exemplos para praticar:
-- SELECT * FROM produtos WHERE preco < 30;
-- SELECT * FROM pedidos WHERE status = 'aberto';
-- SELECT p.nome, c.nome AS categoria FROM produtos p JOIN categorias c ON c.id = p.categoria_id;
-- SELECT pe.id, cl.nome, SUM(pi.quantidade * pi.preco_unitario) AS total
-- FROM pedidos pe JOIN clientes cl ON cl.id = pe.cliente_id
-- JOIN pedido_itens pi ON pi.pedido_id = pe.id
-- GROUP BY pe.id, cl.nome;
