CREATE DATABASE hospital_db;

USE hospital_db;

CREATE TABLE hospital(
	id_hospital INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255) NOT NULL,
	cnpj INT NOT NULL,
	PRIMARY KEY (id_hospital)
);

CREATE TABLE alas(
	id_ala INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255) NOT NULL,
	identificador VARCHAR(5),
	PRIMARY KEY (id_ala)
);

CREATE TABLE enfermeira_chefe(
	id_chefe INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255) NOT NULL,
	cre VARCHAR(255) NOT NULL,
	PRIMARY KEY (id_chefe)
);

CREATE TABLE enfermeira (
	id_enfermeira INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255) NOT NULL,
	cre VARCHAR(255) NOT NULL,
	PRIMARY KEY (id_enfermeira)
);

CREATE TABLE plano_saude(
	id_plano INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255) NOT NULL,
	telefone VARCHAR(255) NOT NULL,
	operadora VARCHAR(255) NOT NULL,
	PRIMARY KEY (id_plano)
);

 CREATE TABLE credenciado (
	id_credenciado INT NOT NULL IDENTITY(1,1),
	id_plano INT NOT NULL,
	id_paciente INT NOT NULL,
	PRIMARY KEY (id_credenciado)
 );

 CREATE TABLE paciente (
	id_paciente INT NOT NULL IDENTITY(1,1),
	nome VARCHAR(255),
	nascimento DATE NOT NULL,
	telefone VARCHAR(255),
	PRIMARY KEY(id_paciente)
 );

 CREATE TABLE atendimento(
	id_atendimento INT NOT NULL IDENTITY(1,1),
	data_atendimento DATE NOT NULL,
	id_medico INT NOT NULL,
	id_paciente INT NOT NULL,
	PRIMARY KEY (id_atendimento)
 );

 CREATE TABLE medico(
	id_medico INT NOT NULL IDENTITY(1,1),
	crm VARCHAR(255),
	nome VARCHAR(255),
	especialidade VARCHAR(255),
	PRIMARY KEY (id_medico)
 );



