CREATE DATABASE escola;
USE escola;

CREATE TABLE salas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    numero_sala INT
);


CREATE TABLE professores (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    id_sala INT,
    
    FOREIGN KEY (id_sala) REFERENCES salas(id)
);

CREATE TABLE turmas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_sala INT,
    horario_aula DATETIME,
    FOREIGN KEY (id_sala) REFERENCES salas(id)
);
