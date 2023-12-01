CREATE DATABASE biblioteca;
USE biblioteca;
-- -----------------------------------------------------------------------------------------
-- Fazer a descrição  
-- 
-- -----------------------------------------------------------------------------------------

CREATE TABLE autores (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    nacionalidade VARCHAR(255)
);

CREATE TABLE categorias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT
);

CREATE TABLE livros (
	id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    ano DATE,
    editora VARCHAR(255),
    id_autor INT,
    id_categoria INT,
    
    FOREIGN KEY (id_autor) REFERENCES autores(id),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

