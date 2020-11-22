create database CanDoIt; #criando o banco CanDoIt
use CanDoIt; #selecionando o banco

CREATE TABLE Usuario( #criaçao do entidade usuario
NM_Nome varchar(20) NOT NULL, 

id int primary key auto_increment not null,
NR_vicio int,
NR_dieta int,
NR_financeira int,
NR_exercicio int,

foreign key (NR_vicio) references MetaDeVicio(id),
foreign key (NR_dieta) references MetaFinanceira(id),
foreign key (NR_financeira) references MetaDeDieta(id),
foreign key (NR_exercicio) references MetaDeExercicios(id)


);


CREATE TABLE MetaDeVicio( # criaçao da meta de vicio
NM_Nome varchar(20) NOT NULL,
DS_TipoDeVicio varchar(12),
ST_FoiConcluida boolean,
HR_Tempo datetime(3),


id int primary key auto_increment not null,
NR_Tarefa int,
NR_Conquista int,
foreign key (NR_Tarefa) references Tarefas(PK_id),
foreign key (NR_Conquista) references Conquistas(PK_id)
);

CREATE TABLE MetaFinanceira(# criaçao da meta financeira
NM_Nome varchar(20) NOT NULL,
ST_TipoDaMeta char (10),
VL_QuantiaEstimada double,
VL_QuantiaAtual double,
ST_FoiConcluida boolean,
HR_Tempo datetime(3),


id int primary key auto_increment not null,
NR_Tarefa int,
NR_Conquista int,
foreign key (NR_Tarefa) references Tarefas(PK_id),
foreign key (NR_Conquista) references Conquistas(PK_id)
);

CREATE TABLE MetaDeDieta( # criaçao da meta dieta
NM_Nome varchar(20) NOT NULL,
ST_TipoDaMeta char (10),
VL_PesoAtual double,
VL_PesoDesejado double,
ST_FoiConcluida boolean,
HR_Tempo datetime(3),

id int primary key auto_increment not null,
NR_Tarefa int,
NR_Conquista int,
foreign key (NR_Tarefa) references Tarefas(PK_id),
foreign key (NR_Conquista) references Conquistas(PK_id)
);

CREATE TABLE MetaDeExercicios( # criaçao da meta de exercicio
NM_Nome varchar(20) NOT NULL,
ST_TipoDaMeta char (10),
ST_DiasDaSemana char(7),
HR_Horas time(2),
ST_FoiConcluida boolean,
HR_Tempo datetime(3),

id int primary key auto_increment not null,
NR_Tarefa int,
NR_Conquista int,
foreign key (NR_Tarefa) references Tarefas(PK_id),
foreign key (NR_Conquista) references Conquistas(PK_id)
);

CREATE TABLE Tarefas( # tarefas de cada meta
NM_Nome varchar(20) NOT NULL,
DS_Descricao varchar(100),
ST_FoiConcluido boolean,

PK_id int primary key auto_increment not null
);

CREATE TABLE Conquistas( # lista de todas as conquistas do app
NM_Nome varchar(20) NOT NULL,
DS_Descricao varchar(100),
ST_FoiConcluido boolean,

PK_id int primary key auto_increment not null
);


drop database CanDoIt;




