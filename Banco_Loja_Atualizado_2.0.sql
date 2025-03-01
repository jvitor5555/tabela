CREATE DATABASE loja;

USE loja;

-- LEMBRE-SE DE QUE ESTÁ USANDO O AUTO_INCREMENT E DE QUE QUASE TODAS AS COLUNAS SÃO NOT NULL --

-- TABELA SUBCATEGORIA CRIADA --
CREATE TABLE IF NOT EXISTS Subcategoria(

Cod_Subcategoria SMALLINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nome_Subcategoria VARCHAR(60) NOT NULL,
Data_Subcategoria DATE NOT NULL


-- ALTER TABLE Subcategoria RENAME COLUMN Data_Subcategoria TO 'Nome_Novo' --
-- ALTER TABLE Subcategoria CHANGE COLUMN Data_Subcategoria 'Nome_Novo' VARCHAR(60)--
);

-- DATA NÃO É UMA PALAVRA RESERVADA, PORÉM DEVE SER EVITADA PARA NÃO CAUSAR CONFUSÃO  --
-- LEMBRE DE CORRIGIR O NOME 'DATA_SUBCATEGORIA' DEPOIS E EXPLICAR ISSO PARA A NAYARA -- 

-- TABELA CATEGORIA CRIADA --
CREATE TABLE IF NOT EXISTS Categoria(

Cod_Categoria SMALLINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nome_Categoria VARCHAR(60) NOT NULL,
Cod_Subcategoria SMALLINT NOT NULL,
FOREIGN KEY (Cod_Subcategoria) REFERENCES Subcategoria(Cod_Subcategoria)
ON DELETE CASCADE 

-- ON DELETE CASCADE É UMA PROPRIEDADE USADA PARA APAGAR AS LINHAS DAS TABELAS EM SEQUÊNCIA --
);

-- TABELA PRODUTO CRIADA --
CREATE TABLE IF NOT EXISTS Produto(

Cod_Produto SMALLINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Cod_Categoria SMALLINT NOT NULL,
Nome_Produto VARCHAR(80) NOT NULL,
Descricao_Produto TEXT,
Preco_Produto FLOAT NOT NULL,
Peso_Produto FLOAT NOT NULL,
FOREIGN KEY(Cod_Categoria) REFERENCES Categoria(Cod_Categoria)
ON DELETE CASCADE
);

SELECT * FROM Subcategoria;
SELECT * FROM Categoria;
SELECT * FROM Produto;

DROP TABLE Categoria;
DROP TABLE Subcategoria;
DROP TABLE Produto;

DELETE FROM Subcategoria WHERE Cod_Subcategoria = 1;


ALTER TABLE Categoria
ADD Observacao_Categoria VARCHAR(255);

ALTER TABLE Produto
MODIFY COLUMN Peso_Produto DECIMAL(6,3);

ALTER TABLE Produto
MODIFY COLUMN Preco_Produto DECIMAL(6,2);

ALTER TABLE Categoria DROP COLUMN Observacao_Categoria;

INSERT INTO Subcategoria (Nome_Subcategoria, Data_Subcategoria) VALUES
("Esportivo", "2013-12-08"),
("Tecnologia", "2013-12-08"),
("Audio e Video", "2013-12-08"),
("Eletrodomesticos", "2012-12-08"),
("Papelaria", "2012-12-08");

INSERT INTO Categoria (Nome_Categoria, Cod_Subcategoria) VALUES
("Esportivo", 1),
("Tecnologia", 2),
("Audio e Video", 3),
("Eletrodomesticos", 4),
("Papelaria", 5);

INSERT INTO Produto (Cod_Categoria, Nome_Produto, Descricao_Produto, Preco_Produto, Peso_Produto) VALUES
(1, "", "", 00.00, 0.0),
(2, "", "", 00.00, 0.0),
(3, "", "", 00.00, 0.0),
(4, "", "", 00.00, 0.0),
(5, "", "", 00.00, 0.0);


