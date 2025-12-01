DROP DATABASE IF EXISTS aula;
CREATE DATABASE aula;
USE aula;

CREATE TABLE `produto` (
`id` INT NOT NULL AUTO_INCREMENT,
`nome_prod` VARCHAR(50) NULL DEFAULT NULL,
`estoque` INT NOT NULL DEFAULT 0,
PRIMARY KEY (`id`));

CREATE TABLE `cliente` (
`id` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(100) NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `venda` (
`id` INT NOT NULL AUTO_INCREMENT,
`id_produto` INT NOT NULL,
`id_cliente` INT NOT NULL,
`qtde` INT NULL DEFAULT NULL,
`valor_unitario` DECIMAL(9,2) NULL DEFAULT '0.00',
PRIMARY KEY (`id`),
FOREIGN KEY (`id_produto`) REFERENCES produto(id),
FOREIGN KEY (`id_cliente`) REFERENCES cliente(id));


INSERT INTO `produto` VALUES (1, 'Abacaxi', 45), (2, 'Maçã', 35), (3, 'Laranja', 23), (4, 'Manga', 36);
INSERT INTO `cliente` VALUES (1, 'Fulano'), (2, 'Ciclano'), (3, 'Beltrano');

SET AUTOCOMMIT = OFF;

# Q1. Realizar a venda de 10 maçãs para o Beltrano 
# (inserção + update de estoque)
BEGIN;
INSERT INTO `venda` VALUES (1, 2, 3, 10, 2.50);
UPDATE produto 
SET produto.estoque = produto.estoque-10 
WHERE  produto.id = 2;
COMMIT;

# Q2. Realizar a tentativa 
# de venda de 100 maçãs para 
# o Beltrano (com ROLLBACK no final)
BEGIN;
INSERT INTO `venda` VALUES (2, 2, 3, 100, 2.50);
UPDATE produto 
SET produto.estoque = produto.estoque - 100 
WHERE  produto.id = 2;
ROLLBACK;

# Q3. Transformar a variável estoque em uma relação 
# entre fornecedor e produto. Com esse novo cenário, 
# realizar uma adição de 100 unidades de laranjas caso o estoque 
# tenha menos de 20 unidades. 

DROP DATABASE IF EXISTS aula;
CREATE DATABASE aula;
USE aula;

CREATE TABLE `produto` (
`id` INT NOT NULL AUTO_INCREMENT,
`nome_prod` VARCHAR(50) NULL DEFAULT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `cliente` (
`id` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(100) NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `venda` (
`id` INT NOT NULL AUTO_INCREMENT,
`id_produto` INT NOT NULL,
`id_cliente` INT NOT NULL,
`qtde` INT NULL DEFAULT NULL,
`valor_unitario` DECIMAL(9,2) NULL DEFAULT '0.00',
PRIMARY KEY (`id`),
FOREIGN KEY (`id_produto`) REFERENCES produto(id),
FOREIGN KEY (`id_cliente`) REFERENCES cliente(id));

CREATE TABLE `fornecedor` (
`id` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(50) NULL DEFAULT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `entrada_produto` (
`id` INT NOT NULL AUTO_INCREMENT,
`id_fornecedor` INT NOT NULL,
`id_produto` INT NOT NULL,
`qntd` INT NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (`id_produto`) REFERENCES produto(id),
FOREIGN KEY (`id_fornecedor`) REFERENCES fornecedor(id));

INSERT INTO `produto` VALUES (1, 'Abacaxi'), (2, 'Maçã'), (3, 'Laranja'), (4, 'Manga');
INSERT INTO `cliente` VALUES (1, 'Fulano'), (2, 'Ciclano'), (3, 'Beltrano');
INSERT INTO `fornecedor` VALUES (1, 'Fazenda Feliz');

INSERT INTO `entrada_produto` (id_fornecedor, id_produto, qntd) VALUES (1, 3, 25);
    
    
# Estrutura de transação utilizando IF e PROCEDURE    
DELIMITER //

CREATE PROCEDURE repor_estoque(entrada INT, min_value INT, id_prod INT)
BEGIN
	DECLARE total_estoque INT;
    START TRANSACTION;
    SELECT SUM(qntd) INTO @total_estoque FROM entrada_produto WHERE id_produto=id_prod;
	INSERT INTO `entrada_produto` (id_fornecedor, id_produto, qntd) VALUES (1, id_prod, entrada);
    IF (@total_estoque < min_value) THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END //

DELIMITER ;

# Temos 25 unidades no estoque para o produto 3, portanto o seguinte comando vai realizar um rollback:
CALL repor_estoque(100, 20, 3);
SELECT * FROM entrada_produto;

# Já alterando o valor mínimo para 30, a transação será commitada (visto que temos 25 unidades no estoque)
CALL repor_estoque(100, 30, 3);
SELECT * FROM entrada_produto;