-- Comandos para criação e concessão de privilégios
-- ==================================================
CREATE USER 'Alvaro'@'localhost' IDENTIFIED BY 'Estudar@2023';
SELECT USER FROM mysql.user;
GRANT SELECT, INSERT, UPDATE, DELETE ON mercearia.* TO 'Alvaro'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'Alvaro'@'localhost';

-- Criar um banco de dados com o nome mercearia
-- =============================================
CREATE DATABASE mercearia;

-- Criação das tabelas nom banco de dados com PRIMARY KEY e FOREIGN KEY
-- =====================================================================
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255),
    descricao TEXT,
    preco_unitario DECIMAL(10, 2)
);

CREATE TABLE entradas_estoque (
    id_entrada INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    data_entrada DATE,

    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE saidas_estoque (
    id_saida INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    data_saida DATE,

    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Inserindo valores nas três tabelas para posterior consulta
-- ===========================================================
INSERT INTO produtos (nome_produto, descricao, preco_unitario, estoque_minimo) 
        VALUES ('Papel Higiênico', 'Folha dupla 12 rolos 30 metros', 17.90, 200),
               ('Escova de dente', 'Clareamento whitening', 15, 100),
               ('Amaciante', 'Amaciante concentrado bilho intenso', 26.90, 150),
               ('Biscoito', 'Biscoito recheado chocolate', 4.49, 50),
               ('Iogurte', 'Iogurte natural 170g', 2.65, 120),
               ('Manteiga', 'Manteiga c/Sal 200g', 8.99, 90),
               ('Detergente', 'Lava louças líquido 500ml', 3.40, 130),
               ('Farinha de mandioca', 'Farinha de mandioca 1kg', 6.98, 100),
               ('Açúcar', 'Açúcar mascavo 1kg', 7.98, 80),
               ('Sabão em pó', 'Sabão em pó brilhante 1.6kg', 14.99, 75);

INSERT INTO entradas_estoque (id_produto, quantidade, data_entrada) 
        VALUES (1, 1000, '2023-11-10'),
               (1, 500, '2023-11-11'),
               (1, 250, '2023-11-24'),

               (2, 1500, '2023-11-11'),
               (2, 700, '2023-11-13'),
               (2, 150, '2023-11-23'),

               (3, 500, '2023-11-12'),
               (3, 350, '2023-11-16'),  

               (4, 600, '2023-11-15'),
               (4, 650, '2023-11-16'),

               (5, 450, '2023-11-15'),
               (5, 450, '2023-11-18'),

               (6, 700, '2023-11-16'),
               (6, 300, '2023-11-20'),
               (6, 250, '2023-11-21'),

               (7, 650, '2023-11-17'),
               (7, 250, '2023-11-21'),

               (8, 400, '2023-11-19'),
               (8, 400, '2023-11-20'),

               (9, 525,'2023-11-10'),
               (9, 250,'2023-11-20'),

               (10, 150, '2023-11-11'),
               (10, 400, '2023-11-18'),
               (10, 250, '2023-11-22');

INSERT INTO saidas_estoque (id_produto, quantidade, data_saida) 
        VALUES (1, 250, '2023-11-13'),
               (1, 150, '2023-11-15'),

               (2, 350, '2023-11-13'),
               (2, 400, '2023-11-20'),
               (2, 50, '2023-11-24'),

               (3, 150, '2023-11-19'),
               (3, 200, '2023-11-17'),  

               (4, 100, '2023-11-18'),
               (4, 150, '2023-11-17'),

               (5, 275, '2023-11-19'),
               (5, 80, '2023-11-20'),

               (6, 200, '2023-11-18'),
               (6, 40, '2023-11-21'),
               (6, 90, '2023-11-25'),

               (7, 180, '2023-11-19'),
               (7, 225, '2023-11-22'),

               (8, 230, '2023-11-20'),
               (8, 170, '2023-11-24'),
               (8, 45, '2023-11-25'),

               (9, 35,'2023-11-15'),
               (9, 68,'2023-11-23'),

               (10, 30, '2023-11-17'),
               (10, 100, '2023-11-19');

-- Atualizando registros da tabela de produtos
-- ============================================
UPDATE produtos SET estoque_minimo = 160 WHERE id_produto = 1;
UPDATE produtos SET estoque_minimo = 45 WHERE id_produto = 4;

-- Excluindo um registro da tabela de entrada_estoque
-- ===================================================
DELETE FROM entradas_estoque WHERE id_entrada = 3;

-- Selecionando todas as saidas aonde a quantidade é maior que 150
-- ================================================================
SELECT * FROM saidas_estoque WHERE quantidade >  150;

-- Realizando um filtro por datas e ordenando pela quantidade
-- ===========================================================
SELECT * FROM entradas_estoque WHERE data_entrada BETWEEN '2023-11-15' AND '2023-11-20' ORDER BY quantidade;

-- Fazendo uma pesquisa por produtos que terminam com te
-- ======================================================
SELECT * FROM produtos WHERE nome_produto LIKE '%te';

-- Listando todos os produtos cadastrados
-- =======================================
SELECT * FROM produtos;

-- Fazendo um filtro entra a tabela produtos e entrada aonde a data é igual a 2023-11-16
-- ======================================================================================
SELECT nome_produto, data_entrada, quantidade 
        FROM entradas_estoque as entrada 
        INNER JOIN produtos as produto 
        ON entrada.id_produto = produto.id_produto WHERE data_entrada = '2023-11-16';

-- Listando o nome, quantidade e saida de um produto específico
-- =============================================================
SELECT nome_produto, quantidade, data_saida FROM saidas_estoque 
        LEFT JOIN  produtos
        ON produtos.id_produto = saidas_estoque.id_produto 
        WHERE saidas_estoque.id_produto = 8;

-- Somando todas a entradas de um produto e agrupando pelo id_produto
-- ===================================================================
SELECT SUM(quantidade) as total FROM entradas_estoque GROUP BY id_produto;
