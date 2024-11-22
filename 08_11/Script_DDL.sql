create database prova;

use prova;

create table prova (
	idProva 	int not null primary key auto_increment,
    dataProva	date not null,
    descricao	varchar(100) not null
);

create table questao (
	idQuestao	int not null primary key auto_increment,
    peso		int not null,
    idProva		int not null, -- chave estrangeira
    foreign key (idProva) references prova (idProva)
);

create table aluno (
	idAluno		int not null primary key auto_increment,
    nome		varchar(50) not null,
    cpf			char(11) not null
);

create table nota(
	idAluno		int not null, -- chave primária e estrangeira
    idQuestao	int not null, -- chave primária e estrangeira
    nota		decimal(5,2),
    primary key	(idAluno,idQuestao),
    foreign key (idAluno) references aluno (idAluno),
    foreign key (idQuestao) references questao (idQuestao)
);