-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE ENQUETE (
	codigoEnquete int PRIMARY KEY,
	nome 		varchar(30),
	descricao	varchar(50),
	dataIncial 	date,
	dataFinal 	date,
	codigoUsuario int --chave estrangeria
);

CREATE TABLE PERGUNTAS (
	codigoPergunta Varchar(15) PRIMARY KEY,
	descricao	varchar(150),
	codigoEnquete int, -- chave estrangeira
	FOREIGN KEY(codigoEnquete) REFERENCES ENQUETE (codigoEnquete)
);

CREATE TABLE RESPOSTAS (
	codigoResposta int PRIMARY KEY,
	descricao	varchar(150),
	codigoPergunta int, -- chave estrangeira
	FOREIGN KEY(codigoPergunta) REFERENCES PERGUNTAS (codigoPergunta)
);

CREATE TABLE USUÁRIO (
	codigoUsuario Texto(1) PRIMARY KEY,
	nome 			Varchar(50),
	email 			Varchar(100),
	login 			varchar(20),
	senha 			varchar(20),
	dataCadastro 	date,
	dataNasc 		date,
	areaAtuacao 	varchar(300,
	profissao 		varchar(30),
	areaFormacao 	varchar(30),
	estadoCivil 	varchar(15),
	escolaridade 	varchar(30),
	estado 			char(02)
);

CREATE TABLE responder (
	codigoUsuario int, -- chave estrangeira
	codigoEnquete int, -- chave estrangeria
	data date,
	PRIMARY KEY(codigoUsuario,codigoEnquete), -- chave primaria composta 
	FOREIGN KEY(codigoUsuario) REFERENCES USUÁRIO (codigoUsuario),
	FOREIGN KEY(codigoEnquete) REFERENCES ENQUETE (codigoEnquete)
);

ALTER TABLE ENQUETE ADD FOREIGN KEY(codigoUsuario) REFERENCES USUÁRIO (codigoUsuario)
