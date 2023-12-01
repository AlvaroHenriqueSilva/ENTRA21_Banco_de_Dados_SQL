CREATE DATABASE bercario;
USE bercario;
-- -----------------------------------------------------------------------------------------
-- A tabela médicos é a tabela pai desse banco a partir dele vem os outros relacionamentos.
-- -----------------------------------------------------------------------------------------
CREATE TABLE medicos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    telefone VARCHAR(50),
    CRM INT,
    especialidade VARCHAR(255)
);
-- --------------------------------------------------------------------------------------------------------
-- A tabela mães tem um relacionamento com a tabela de médicos pois um médicos pode atender a várias mães.
-- --------------------------------------------------------------------------------------------------------
CREATE TABLE maes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT,
    nome VARCHAR(255),
    
    FOREIGN KEY (id_medico) REFERENCES medicos(id)
);
-- --------------------------------------------------------------------------------------------------------
-- A tabela bebes tem um relacionamento com a tabela mãe pois um bebe só pode ter uma mãe.
-- --------------------------------------------------------------------------------------------------------
CREATE TABLE bebes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    data_nascimento DATE,
    peso_nascimento DECIMAL(3, 2),
    altura DECIMAL(3, 2),
    id_mae INT,
    
    FOREIGN KEY (id_mae) REFERENCES maes(id)
);
