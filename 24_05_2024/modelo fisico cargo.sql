-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE funcionario (
	matriculaFunc int PRIMARY KEY,
	sexo varchar(10),
	dataNasc date,
	telefone vachar(15),
	endereço varchar(50),
	estadocivil varchar(15),
	nome varchar(30),
	RG varchar(15),
	CPF varchar(15),
	dataadimissao date,
	nacionalidade varchar(50),
	idDependente int
)

CREATE TABLE dependente (
	idCargo int PRIMARY KEY,
	nomeCargo varchar(50),
	dataInicio date,
	dataFim date
)

CREATE TABLE cargo (
	idDependente int PRIMARY KEY,
	dataNasc date,
	nome varchar(50)
)

CREATE TABLE conter (
	matriculaFunc int,		--chave estrangeira
	idCargo int,			--chave estrangeira
	FOREIGN KEY(matriculaFunc) REFERENCES funcionario (matriculaFunc),
	FOREIGN KEY(idCargo) REFERENCES dependente (idCargo)
)

ALTER TABLE funcionario ADD FOREIGN KEY(idDependente) REFERENCES cargo (idDependente)
