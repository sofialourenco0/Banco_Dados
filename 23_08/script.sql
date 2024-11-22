-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CLIENTE (
	nome  		varchar(100),			NOT NULL
	numeroID 	int,					NOT NULL
	email 		varchar(100),			NOT NULL
	endereco 	varchar(100),			NOT NULL
	dataCadastro date,					NOT NULL
	telefone 	varchar(15),			NOT NULL
	status 		varchar(15)				NOT NULL
)

CREATE TABLE PESSOA FISICA (
	estadoCivil 	varchar(10),		NOT NULL
	CPF 			varchar(15),		NOT NULL
	sexo 			char,				NOT NULL
	habilitacao 	varchar(15),		NOT NULL
	RG 				varchar(15)			NOT NULL
	dataNasc 		date,				NOT NULL
	faixaRenda 		decimal(9,2),		NOT NULL
	numeroID 		int,				NOT NULL
	profissao 		varchar()			NOT NULL
)

CREATE TABLE PESSOAJURIDICA (
	razaoSocial 		vacrchar(100),		NOT NULL
	inscrcaoEstadual 	vacrhar(100),		NOT NULL
	ramoAtividade 		varhar(100),		NOT NULL
	CNPJ 				varchar(18),		NOT NULL
	contatoResponsavel 	varchar(15),		NOT NULL
	numeroID 			int					NOT NULL
)

CREATE TABLE VEICULO (
	numeroRegistro 		int PRIMARY KEY,	NOT NULL
	Placa 				vachar(10),			NOT NULL
	Marca 				varhar(20),			NOT NULL
	AnoFabricacao	 	date,				NOT NULL
	Modelo 				varchar(20),		NOT NULL
	Tipo 				Varchar(100),		NOT NULL
)

CREATE TABLE ACIDENTE (
	NumeroID 		int PRIMARY KEY,		NOT NULL
	descricao 		varchar(200),			NOT NULL
	data 			date,					NOT NULL
	local 			varchar(20),			NOT NULL
	Hora 			time,					NOT NULL
	numeroRegistro 	int,					NOT NULL -- CHAVE ESTRANGEIRA
	FOREIGN KEY(numeroRegistro) REFERENCES VEICULO (numeroRegistro)
)

CREATE TABLE APOLICE (
	numero 			varchar(100) PRIMARY KEY,	NOT NULL
	valor 			decimal(9,2),				NOT NULL
	descrecao 		varchar(200),				NOT NULL
	numeroVeiculo 	varchar(10),				NOT NULL
	numeroRegistro 	int,						NOT NULL
	FOREIGN KEY(numeroRegistro) REFERENCES VEICULO (numeroRegistro)
)

