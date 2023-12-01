CREATE DATABASE firma;
USE firma;

CREATE TABLE categorias (
	id INT AUTO_INCREMENT,
    title VARCHAR(255)
);

CREATE TABLE clientes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(50)

);

CREATE TABLE produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255),
	id_categoria INT,
    preco DECIMAL(10, 2),
    
    FOREIGN KEY (id_produto) REFERENCES categorias(id)
);