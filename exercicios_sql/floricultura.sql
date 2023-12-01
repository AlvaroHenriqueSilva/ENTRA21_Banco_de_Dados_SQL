CREATE DATABASE floricultura;
USE floricultura;
-- -----------------------------------------------------------------------------------------
-- A tabela de clientes é a tabela pai desse banco, a partir dele é feitos os outros 
-- relacionamentos com a tabela produtos e compras_produto
-- -----------------------------------------------------------------------------------------
CREATE TABLE clientes (	
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255),
    telefone VARCHAR(50),
    RG VARCHAR(50),
    endereco VARCHAR(255)
);
-- -----------------------------------------------------------------------------------------
-- A tabela produtos é a segunda tabela a ser criada, ela faz um relacionamento com a 
-- tabela de compras_produto
-- -----------------------------------------------------------------------------------------
CREATE TABLE produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255),
    tipo VARCHAR(255),
    preco DECIMAL(10, 2),
    quantidade INT
);
-- -----------------------------------------------------------------------------------------
-- A tabela de compras faz um relacionamento com as duas tabelas mostrando que
-- um cliente pode comprar vários produtos diferentes no mesmo dia.
-- -----------------------------------------------------------------------------------------
CREATE TABLE compras_produto (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    data_compra DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);