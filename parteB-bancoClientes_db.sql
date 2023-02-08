USE clientes_db;
--Quantas Pessoas tem em cada Departamento
SELECT departamento_id, COUNT(id) as num_funcionarios
FROM funcionarios
GROUP BY departamento_id;

--Qual a Soma de Salario por Departamento?
SELECT departamento_id, SUM(salario) AS soma_salario
FROM funcionarios
GROUP BY departamento_id;

--Quantos Homens tem no departamento e ganham mais de 3800.
SELECT departamento_id, COUNT(id) AS num_funcionarios
FROM funcionarios
WHERE sexo='M' AND Salario>3800
GROUP BY departamento_id;

SELECT departamento_id, MAX(salario) AS max_salario
FROM funcionarios
GROUP BY departamento_id
HAVING MAX(salario) > 4200;

--Quantos homens tem por departamento, ganham mais de 3800, desconsiderando os departamentos que tenham apenas um homem.

SELECT departamento_id, COUNT(id) AS qta_homens
FROM funcionarios
WHERE sexo = 'M' AND Salario > 3800
GROUP BY departamento_id
HAVING COUNT(id) > 1;

--QUANTAS MULHERES QUE TEM EMAIL @GMAIL.COM TEM MÉDIA DE SALARIO MAIOR QUE 4MIL POR DEPARTAMENTO.

SELECT departamento_id, COUNT(id) AS qta_mulheres, AVG(salario) AS media_salario
FROM funcionarios
WHERE sexo='F' AND email LIKE '%@gmail.com'
GROUP BY departamento_id
HAVING AVG(salario) > 4000;

--==============================================

CREATE TABLE categorias(
	id INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(30),
	ativa CHAR(3)
	PRIMARY KEY (id)
);


insert into categorias (nome, ativa) Values
('Informatica','[v]'),
('Telefonia','[v]'),
('Games','[v]'),
('TV, Audio e Video','[v]'),
('Impressão e imagem','[v]');

SELECT * FROM categorias;

CREATE TABLE produtos(
	id INT NOT NULL IDENTITY(1,1),
	id_categoria INT,
	descricao VARCHAR(50),
	preco INT,
	url_imagem VARCHAR(100),
	PRIMARY KEY (id)

);


insert into produtos (id_categoria, descricao, preco) values
(1,'SSD 128GB', 300),
(1,'SSD 256GB', 500),
(1,'KIT TECLADO E MOUSE', 600),
(3,'PLAYSTATION 3', 1500),
(2,'SAMSUNG A51', 2500),
(4,'TELEVISÃO LG 55"', 3000),
(3,'PLAYSTATION 3 1TB', 1500),
(2,'SAMSUNG S9', 2500),
(2,'IPHONE 8', 2500),
(2,'IPHONE 9', 3000),
(2,'IPHONE X', 4000),
(4,'TELEVISÃO SAMSUNG 32"', 1000),
(4,'TELEVISÃO SAMSUNG 48"', 3000),
(3,'PLAYSTATION 4 1TB', 2800),
(3,'PLAYSTATION 5 1TB', 5000),
(1,'Teclado Razer Gamer', 250),
(1,'Fone de ouvido Hyperx',170),
(1,'Mouse Gamer Razer', 90),
(1,'Mouse Gamer Razer 2400', 200)
insert into produtos (descricao, preco) values
('Mouse Gamer', 280),
('Teclado Gamer', 390);

SELECT * FROM produtos;

--TRAZER APENAS PRODUTOS QUE TENHAM CATEGORIA: INNER JOIN
SELECT * FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id;

--TRAZER TBM OS PRODUTOS QUE NÃO TEM CATEGORIA, UNIÃO PELA ESQUERDA: LEFT JOIN
SELECT * FROM produtos p
LEFT JOIN categorias c
ON p.id_categoria = c.id;

--TRAZER TUDO DA TABELA DIREITA INCLUSIVE AS CATEGORIAS QUE NÃO TEM PRODUTO: RIGHT JOIN
SELECT * FROM produtos p
RIGHT JOIN categorias c
ON p.id_categoria = c.id;

--TRAZER TUDO DE TODOS: FULL JOIN
SELECT * FROM produtos p
FULL JOIN categorias c
ON p.id_categoria = c.id;


--MAIOR PREÇO POR CATEGORIA TRAZENDO QUAL CATEGORIA É, APENAS PRODUTOS CATEGORIZADOS.
SELECT c.nome, MAX(p.preco) AS max_preco
FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id
GROUP BY c.nome;

--MENOR E MAIOR PREÇO DO PRODUTO DA CATEGORIA GAME E TELEFONIA
SELECT c.nome, MAX(p.preco) AS maximo_preco, MIN(p.preco) AS minino_preco
FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id
WHERE c.nome = 'Games' OR c.nome = 'Telefonia'
GROUP BY c.nome;

--QUANTO CUSTA O MAIOR PRODUTO NÃO CATALOGADO
SELECT  MAX(p.preco) AS maior_precoNcatalogado
FROM produtos p
LEFT JOIN categorias c
ON c.id = p.id_categoria
WHERE c.nome IS NULL

--MEDIA DE PREÇO DE TODOS OS PRODUTOS POR CATEGORIA
SELECT c.nome, AVG(p.preco) AS media
FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id 
GROUP BY c.nome;


--=================================================================

WITH aux_table AS (SELECT YEAR(data_nascimento) AS nascimento,
	CASE 
		WHEN YEAR(data_nascimento)>= 1993 THEN 'true'
		ELSE 'false'
		END AS 'milenium',
		id
FROM funcionarios)

SELECT milenium, COUNT(id) AS contagem
FROM aux_table
GROUP BY milenium;

--===================================================================
--Criação de views

--VIEWM PARA MEDIA SALARIAL

CREATE VIEW view_mediaSalario_sexo AS (
SELECT sexo, AVG(salario) AS media_salarial
FROM funcionarios
WHERE YEAR(data_nascimento) >= '1990'
GROUP BY sexo
);

SELECT * FROM view_mediaSalario_sexo;





