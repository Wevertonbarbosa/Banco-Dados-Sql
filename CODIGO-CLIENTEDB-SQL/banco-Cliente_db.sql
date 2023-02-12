CREATE DATABASE clientes_db; 

USE clientes_db; /* Usando a tabela é default usar este comando*/

/* Construção da tabela*/

CREATE TABLE clientes(
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(255),
	idade INT,
	sexo CHAR(1),
	cpf CHAR(11)

);

/*Inserir valor as tabelas*/

INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ('Robson', 40,'M', '12312312312');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Denise', 35,'F', '18989888812');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Madalena', 55,'F', '34534534545');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Jorge', 60, 'M', '89089089090');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Ana', 18, 'F','90909009090');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Bruna', 26, 'F','78568945239');

SELECT * FROM clientes /* Ver a tabela*/

SELECT * FROM clientes WHERE sexo = 'M' ; -- Extrair um valor especifico de uma tabela  

SELECT * FROM clientes WHERE sexo = 'F' AND idade > '30' ORDER BY idade DESC;

-- Order by == ele organiza a tabea diante.
-- O Desc é descrecente mas se eu colocar o ORDER BY por default ele vai de forma crescente


CREATE TABLE departamentos(
	id INT NOT NULL IDENTITY(1,1),
	departamento VARCHAR(255),
	PRIMARY KEY(id)
);

INSERT INTO departamentos (departamento) VALUES
('Vendas'),
('Marketing'),
('RH'),
('TI'),
('Administrativo'),
('Desenvolvimento');

SELECT * FROM departamentos;

CREATE TABLE funcionarios(
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(255),
	email VARCHAR(255),
	sexo CHAR(1),
	data_nascimento DATE,
	salario INT,
	departamento_id INT,
	FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

INSERT INTO funcionarios (nome, email, sexo, data_nascimento, salario, departamento_id) VALUES
('Luana', 'luana@gmail.com', 'F', '01-05-1996', 3000, 1),
('Marilia', 'marilia@hotmail.com', 'F', '03-05-1995', 3100, 2),
('Raquel', 'raquel@gmail.com', 'F', '15-07-1994', 3050, 3),
('Joana', 'joana@gmail.com', 'F', '03-07-1995', 3000, 4),
('Fabricio', 'fabricio@gmail.com', 'M', '01-05-1993', 4700, 5),
('Everaldo', 'everaldo@hotmail.com', 'M', '07-05-1993', 4600, 6),
('Ricardo', 'ricardo@gmail.com', 'M', '15-05-1998', 3500, 1),
('Cleber', 'cleber@hotmail.com', 'M', '01-05-1997', 3300, 3),
('Fernando', 'fernando@hotmail.com', 'M', '03-05-1989', 3000, 2),
('Felipe', 'felipe@hotmail.com', 'M', '03-05-1996', 3070, 4),
('Matheus', 'matheus@hotmail.com', 'M', '15-05-1989', 4060, 5),
('Rodrigo', 'rodrigo@hotmail.com', 'M', '01-05-1996', 3060, 6),
('Luma', 'luma@gmail.com', 'F', '01-05-1996', 3700, 1),
('Rafael', 'rafael@gmail.com', 'M', '15-03-1991', 3500, 4),
('Mariana', 'mariana@gmail.com', 'F', '01-07-1998', 3900, 4),
('Monique', 'monique@gmail.com', 'F', '15-07-1993', 4100, 2),
('Joaquim', 'joaquim@hotmail.com', 'M', '01-05-1994', 3300, 3),
('Sandro', 'sandro@gmail.com', 'M', '01-05-1996', 4700, 5),
('Henrique', 'henrique@gmail.com', 'M', '07-07-1995', 3500, 6),
('Maria', 'maria@gmail.com', 'F', '07-07-1995', 4100, 3),
('Penha', 'penha@gmail.com', 'F', '07-07-1988', 5000, 5),
('Laura', 'laura@gmail.com', 'F', '07-07-1990', 5500, 5);

--COUNT estou contando quantos funcionarios do sexo masculino tem na tabela 
--AS o count vai me retorna o uma linha com um numero exato pedido e usando o AS e logo apos eu coloco o Titulo da tabela
SELECT COUNT(*) AS contagem_funcionario
FROM funcionarios
WHERE sexo = 'M';

SELECT *
FROM funcionarios 
ORDER BY data_nascimento DESC;

--AVG ele calcula a media salarial da tabela.
SELECT AVG(salario) 
AS mediaSalarial
FROM funcionarios;


SELECT departamento_id, MIN(salario) AS menor_salario, MAX(salario) AS maior_salario
FROM funcionarios
GROUP BY departamento_id;

SELECT sexo,
AVG(salario) AS media_salarial,
COUNT(id) AS pessoas 
FROM funcionarios
GROUP BY sexo;


--===== VIEW 
CREATE VIEW view_homem_mulher_mediaSlarial AS(
	SELECT
	d.departamento,
	f.sexo
	FROM funcionarios f
	INNER JOIN departamentos d
	ON f.departamento_id = d.id
	WHERE(f.sexo = 'M' AND MONTH(f.data_nascimento) = '05') OR (f.sexo = 'F' AND MONTH(f.data_nascimento) = '07')
	GROUP BY d.departamento, f.sexo
);

SELECT * FROM view_homem_mulher_mediaSlarial;

--==== TRAZER O MENOR SALÁRIO DE CADA DEPARTAMENTO E O NOME DO FUNCIONARIO QUE RECEBE SEU VALOR. TRAZER O NOME DO DEPARTAMENTO
SELECT
d.id, 
d.departamento,
MIN(f.Salario)AS Menor_salario
FROM departamentos d
INNER JOIN funcionarios f
ON f.departamento_id = d.id
GROUP BY d.id, d.departamento;


--============ DESEJO SABER O ANO DE NASCIMENTO DE TODOS OS FUNCIONÁRIOS E SABER QUEM É O MAIS VELHO
WITH base_table(
SELECT
departamento_id
YEAR(data_nascimento),
FIRST_VALUE(YEAR(data_nascimento)) OVER(PARTITION BY departamento_id ORDER BY YEAR(data_nascimento))
FROM funcionarios
)
