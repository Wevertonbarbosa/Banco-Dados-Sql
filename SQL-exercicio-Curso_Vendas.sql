CREATE TABLE cursos(
	id_cursos INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255) NOT NULL,
	mensalidade INT NOT NULL,
	PRIMARY KEY (id_cursos),

);

CREATE TABLE enderecos(
	id_endereco INT NOT NULL IDENTITY(1,1),
	cidade VARCHAR(255) NOT NULL,
	rua VARCHAR(255) NOT NULL,
	numero INT
	PRIMARY KEY (id_endereco)
);

CREATE TABLE alunos(
	id_alunos INT NOT NULL IDENTITY(1,1),
	id_endereco INT NOT NULL,
	nome VARCHAR(255) NOT NULL,
	cpf CHAR (11) NOT NULL,
	email VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL,
	PRIMARY KEY (id_alunos),
	FOREIGN KEY (id_endereco) REFERENCES enderecos(id_endereco)
);

DROP TABLE enderecos;

CREATE TABLE matricula(
	id_aluno INT NOT NULL,
	id_curso INT NOT NULL,
	FOREIGN KEY  (id_aluno) REFERENCES alunos(id_alunos),
	FOREIGN KEY (id_curso) REFERENCES cursos(id_cursos)
);

INSERT INTO cursos(nome, mensalidade)
VALUES ('Programação', 100);


INSERT INTO cursos(nome, mensalidade)
VALUES ('Administração', 220);


INSERT INTO cursos(nome, mensalidade)
VALUES ('informática', 80);


INSERT INTO cursos(nome, mensalidade)
VALUES ('Matemática', 95);


INSERT INTO cursos(nome, mensalidade)
VALUES ('Artes', 150);

SELECT * FROM cursos;

--================================== Alunos

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento) 
VALUES(1, 'Alexandre Raul Cardoso', '37967024818', 'alexandre_cardoso@policiamilitar.sp.gov.br', '19/01/1994');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(2, 'Heitor Sérgio Bryan Novaes', '55137936103', 'heitorsergionovaes@ipek.net.br', '25/01/1951');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento) 
VALUES(3, 'Leonardo Nathan Davi Monteiro', '40436955199', 'leonardo.nathan.monteiro@acramisper.com', '22/01/1961');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento) 
VALUES(4, 'Felipe Noah Calebe Sales', '84553649632', 'felipe-sales80@lidertel.com.br', '03/01/1957');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(5, 'Gael Danilo Mário da Rosa', '56459619352', 'gaeldanilodarosa@integrasjc.com.br', '19/01/1961');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento) 
VALUES(6, 'Luís Anderson Anderson Drumond', '46142468261', 'luis_drumond@sunrise.com.br', '02/01/1977');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(7, 'Francisca Cláudia Lorena da Silva', '52756612901', 'francisca_claudia_dasilva@duoarq.com', '14/01/1998');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(8, 'Leonardo Danilo Campos', '40699367930', 'leonardo_campos@bsd.com.br', '02/01/1954');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento) 
VALUES(9, 'Stella Cláudia Laura Drumond', '47333058344', 'stella_drumond@lojapetline.com.br', '03/01/1960');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(10, 'Liz Analu Fabiana Monteiro', '71467087807', 'liz_monteiro@hardquality.com.br', '16/01/1957');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(11, 'Calebe José Caleb Rodrigues', '96904984791', 'calebe_jose_rodrigues@ficopola.net', '22/01/1982');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(12, 'Kaique Gabriel da Silva', '33645282092', 'kaique.gabriel.dasilva@clinicasilhouette.com.br', '14/01/1947');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(13, 'Camila Marli Novaes', '26375017319', 'camila.marli.novaes@supercleanlav.com.br', '24/01/1995');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(14, 'Rosa Elza Sueli Rodrigues', '71141196077', 'rosa_elza_rodrigues@lukin4.com.br', '12/01/1943');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(15, 'Joana Antonella Manuela Cavalcanti', '35929091340', 'joanaantonellacavalcanti@portalpublicidade.com.br', '04/01/1993');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(16, 'Jennifer Josefa Alana Farias', '76857381984', 'jennifer_farias@inductothermgroup.com.br', '01/01/1959');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(17, 'Andrea Daniela Nina Cardoso', '96492721608', 'andrea.daniela.cardoso@raya3.com.br', '12/01/1962');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(18, 'Jéssica Camila Oliveira', '29299168180', 'jessica_oliveira@consultorialk.com.br', '15/01/1982');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(19, 'Gabriel Kaique da Mota', '17011333770', 'gabrielkaiquedamota@edu.uniso.br', '03/01/1980');

INSERT INTO alunos(id_endereco, nome, cpf, email, data_nascimento)
VALUES(20, 'Eduarda Ester Pereira', '05738904044', 'eduarda_ester_pereira@azulcargo.com.br', '20/01/1974');

--=====================Endereços

INSERT INTO enderecos(cidade, rua, numero) 
VALUES('Aparecida de Goiânia', 'Rua Bauru', 12);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Belém', 'Quadra N', 55);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Rondonópolis', 'Rua Gv-30', 26);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Altamira', 'Avenida João Rodrigues', 37);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Londrina', 'Rua Maria Osti', 56);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Teresina', 'Avenida Zequinha Freire', 98);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Colombo', 'Rua Frederico Fromhols', 3);

INSERT INTO enderecos(cidade, rua, numero) 
VALUES('Brasília', 'Quadra QNR 4', 9);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Vitória', 'Rua Gonçalves Dias', 81);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Natal', 'Rua Tamboril', 97);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Campo Grande', 'Rua Rui Barbosa', 41);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Montes Claros', 'Rua H', 91);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Campo Largo', 'Rua Quatro', 85);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Ribeirão das Neves', 'Rua Bálsamo', 49);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Corumbá', 'Alameda Idalécio Proença', 34);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Ji-Paraná', 'Rua Boa Vista', 61);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Olinda', 'Rua do Reflexo', 78);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Brasília', 'Praça dos Três Poderes Anexo II', 31);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('Fortaleza', 'Rua 610', 40);

INSERT INTO enderecos(cidade, rua, numero)
VALUES('João Pessoa', 'Vila Marcos Barbosa', 33);

SELECT * FROM enderecos;

CREATE TABLE modulos(
	id_modulo INT NOT NULL IDENTITY(1,1),
	tipo_modulos VARCHAR (255),
	PRIMARY KEY (id_modulo)
);

CREATE TABLE modulo_curso(
	id_curso INT NOT NULL,
	id_modulos INT NOT NULL,
	FOREIGN KEY (id_curso) REFERENCES cursos(id_cursos),
	FOREIGN KEY (id_modulos) REFERENCES modulos(id_modulo)
);

--=================== Inserir dados Modulos

INSERT INTO modulos (tipo_modulos)
VALUES ('SQL Serve');

INSERT INTO modulos(tipo_modulos)
VALUES ('Arquivamento');

INSERT INTO modulos(tipo_modulos)
VALUES ('Contas aplicadas');

INSERT INTO modulos(tipo_modulos)
VALUES ('Desenhos anime');

INSERT INTO modulos(tipo_modulos)
VALUES ('Python');

DROP TABLE modulo_curso;
DROP TABLE modulos;

SELECT * FROM alunos;

--==== Listagem em ordem alfabética
SELECT alunos.nome, alunos.email
FROM alunos
ORDER BY alunos.nome ASC
















