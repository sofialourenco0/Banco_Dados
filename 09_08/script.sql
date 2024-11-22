-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



	CREATE TABLE CLIENTE (
	idCliente 	int PRIMARY KEY,
	endereco 	varchar(30), not null
	telefone 	varchar(15), not null
	email	    varchar(100), not null
	nome 		varchar(50) not null
);

	CREATE TABLE PRODUTO (
	idProduto	 int PRIMARY KEY,
	descricao	 varchar(100),	not null
	preco		 decimal(9,2),not null
	nome		 varchar(50),not null
	numeric /*erro: ??*/not null
);

	CREATE TABLE PEDIDO (
	idPedido int PRIMARY KEY,not null
	dataPedido date,not null
	status varchar(20),not null
	idCliente int,not null
	FOREIGN KEY(idCliente) REFERENCES CLIENTE (idCliente)
	);

	CREATE TABLE ITEM_PEDIDO (
	isItemPedido int PRIMARY KEY,not null
	preco decimal(9,2),not null
	quantidade int,not null
	idProduto int,not null
	idPedido int,not null
	FOREIGN KEY(idProduto) REFERENCES PRODUTO (idProduto),not null
	FOREIGN KEY(idPedido) REFERENCES PEDIDO (idPedido)not null
	);

	CREATE TABLE FATURA (
	idfatura int PRIMARY KEY,not null
	valor total decimal9,2,not null
	datafatura date,not null
	idPedido int,not null
	FOREIGN KEY(idPedido) REFERENCES PEDIDO (idPedido)not null
);

