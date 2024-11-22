-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

/*por: SOFIA CONCEIÇÃO CRIVILINN LOURENÇO */

CREATE TABLE FORNECEDOR (
	codFornecedor int PRIMARY KEY not null, 
	Estado char(2)not null,
	CodigoOC int not null,
	nomeFoenecedor varchar(50) not null,
	telefone varchar(15) not null,
	Cidade varchar(30) not null,
	endereçoFornecedor varchar(50) not null
);

CREATE TABLE MATERIAL (
	CodigoMatertial int PRIMARY KEY not null,
	valortotalItem decimal(9,2) not null,
	descricao varchar(100) not null,
	valorUnitario decimal(9,2) not null,
	Quantidade int
);

CREATE TABLE ORDEM_COMPRA (
	CodigoOC int PRIMARY KEYnot null,
	ValortotalOC decimal(9,2) not null,
	DataEmissao date not null,
	NomeResponsavel varchar(50) not null,
	codFornecedor int not null,
	FOREIGN KEY(codFornecedor) REFERENCES FORNECEDOR (codFornecedor) not null
);

CREATE TABLE Relação_3 (
	CodigoIC int PRIMARY KEY not null,
	CodigoOC int not null,
	CodigoMatertial int not null,
	FOREIGN KEY(CodigoOC) REFERENCES ORDEM_COMPRA (CodigoOC) not null,
	FOREIGN KEY(CodigoMatertial) REFERENCES MATERIAL (CodigoMatertial) not null
);

