create database CanDoIt; #criando o banco CanDoIt
use CanDoIt; #selecionando o banco




CREATE TABLE Usuarios ( #criaçao do entidade usuario
id smallint primary key auto_increment,
NM_Nome varchar(20) NOT NULL

);



CREATE TABLE MetaDeVicio( # criaçao da meta de vicio
NM_Nome varchar(20) NOT NULL,
DS_TipoDeVicio varchar(12),
ST_FoiConcluida boolean,
HR_Tempo time,


IdUsuario smallint,
id int primary key auto_increment,

FOREIGN KEY (IdUsuario) REFERENCES Usuarios(id)
);

CREATE TABLE MetaFinanceira(# criaçao da meta financeira
NM_Nome varchar(20) NOT NULL,
ST_TipoDaMeta char(10) not null,
VL_QuantiaEstimada decimal (8,2),
VL_QuantiaAtual decimal (8,2),
ST_FoiConcluida boolean,
IdUsuario smallint,

id int primary key auto_increment ,
FOREIGN KEY (IdUsuario) REFERENCES Usuarios(id)

);

CREATE TABLE MetaDeDieta( # criaçao da meta dieta
NM_Nome varchar(20) NOT NULL,
ST_TipoDaMeta char (10),
VL_PesoAtual double,
VL_PesoDesejado double,
ST_FoiConcluida boolean,

IdUsuario smallint,
id int primary key auto_increment,


FOREIGN KEY (IdUsuario) REFERENCES Usuarios(id)
);

drop table MetaDeExercicios;
drop table TarefasDeExercicio;
drop table ConquistaExercicio;

CREATE TABLE MetaDeExercicios( # criaçao da meta de exercicio
NM_Nome varchar(20) NOT NULL,
ST_DiasDaSemana char(7),
HR_Horas varchar(5),
ST_FoiConcluida boolean,

IdUsuario smallint,
PK_id int primary key auto_increment,


FOREIGN KEY (IdUsuario) REFERENCES Usuarios(id)
);

CREATE TABLE TarefasVicio( # tarefas de cada meta
NM_Nome varchar(20) NOT NULL,
DS_Descricao varchar(100),
ST_FoiConcluido boolean,
FK_MetaVicio int,

PK_id int primary key auto_increment ,
foreign key(FK_MetaVicio) references MetaDeVicio(id)

);

CREATE TABLE TarefasDeDieta( # tarefas de cada meta
NM_Nome varchar(20) NOT NULL,
DS_Descricao varchar(100),
ST_FoiConcluido boolean,
FK_MetaDieta int,

PK_id int primary key auto_increment ,
foreign key(FK_MetaDieta) references MetaDeDieta(id)

);

CREATE TABLE TarefasFinanceiro( # tarefas de cada meta
NM_Nome varchar(20) NOT NULL,
DS_Descricao varchar(100),
ST_FoiConcluido boolean,
FK_MetaFinanceira int,

PK_id int primary key auto_increment ,
foreign key(FK_MetaFinanceira) references MetaFinanceira(id)

);

CREATE TABLE TarefasDeExercicio( # tarefas de cada meta
NM_Nome varchar(20) NOT NULL,
DS_Descricao varchar(100),
ST_FoiConcluido boolean,
FK_MetaExercicio int,

PK_id int primary key auto_increment ,
foreign key(FK_MetaExercicio) references MetaDeExercicios(PK_id)

);


CREATE TABLE ConquistaVicio( # lista de todas as conquistas do app
NM_Nome varchar(20) NOT NULL,
DS_Descricao varchar(100),
ST_FoiConcluido boolean,
FK_ConquistaVicio int ,

PK_id int primary key auto_increment,
foreign key(FK_ConquistaVicio) references MetaDeVicio(id)
 
);

CREATE TABLE ConquistaDieta( # lista de todas as conquistas do app
NM_Nome varchar(20) NOT NULL,
DS_Descricao varchar(100),
ST_FoiConcluido boolean,
FK_ConquistaDieta int ,

PK_id int primary key auto_increment,
foreign key(FK_ConquistaDieta) references MetaDeDieta(id)
 
);


CREATE TABLE ConquistaFinanceira( # lista de todas as conquistas do app
NM_Nome varchar(20) NOT NULL,
DS_Descricao varchar(100),
ST_FoiConcluido boolean,
FK_ConquistaDaMetaFinanceira int ,

PK_id int primary key auto_increment,
foreign key(FK_ConquistaDaMetaFinanceira) references MetaFinanceira(id)
 
);
CREATE TABLE ConquistaVicio( # lista de todas as conquistas do app
NM_Nome varchar(20) NOT NULL,
DS_Descricao varchar(100),
ST_FoiConcluido boolean,
FK_ConquistaVicio int ,

PK_id int primary key auto_increment,
foreign key(FK_ConquistaVicio) references MetaDeVicio(id)
 
);
CREATE TABLE ConquistaExercicio( # lista de todas as conquistas do app
NM_Nome varchar(20) NOT NULL,
DS_Descricao varchar(100),
ST_FoiConcluido boolean,
FK_ConquistaExercicio int ,

PK_id int primary key auto_increment,
foreign key(FK_ConquistaExercicio) references MetaDeExercicios(PK_id)
 
);




###############


#selecionando todo de cada tabela
select * from Usuarios;
select * from MetaDeVicio;
select * from MetaDeDieta;
select * from MetaDeExercicios;
select * from MetaFinanceira;
select * from TarefasVicio;
select * from TarefasDeDieta;
select * from TarefasFinanceiro;
select * from TarefasDeExercicio;
select * from ConquistaVicio;
select * from ConquistaDieta;
select * from ConquistaFinanceira;
select * from ConquistaExercicio;
######


# criando um novo usuario
insert into Usuarios (NM_nome) 
	values ("cleyson");

describe MetaFinanceira; # observar todas as colunas que existem na tabela

# criando uma nova meta financeira
insert into MetaFinanceira (NM_Nome , ST_TipoDaMeta,VL_QuantiaEstimada,
VL_QuantiaAtual, ST_FoiConcluida , IdUsuario) 
values ("ganhar money" , "acumular" , 1000.00 , 100.00 ,false , 1 );



select * from MetaFinanceira; # verificando se foi adicionado corretamente

describe TarefasFinanceiro; # observar todas as colunas que existem na tabela

#criando uma tarefa para ajudar na meta financeira
insert into TarefasFinanceiro( NM_Nome , DS_Descricao, ST_FoiConcluido,FK_MetaFinanceira )
values ("trabalhar mais", "trabaiar pq video games  tao caros " , true , 2 );

select * from TarefasFinanceiro; # observar se foi criado corretamente

# retorna o nome do usuario e nome , tipo e status das metas financeiras que ele criou 
select Usuarios.NM_Nome , MetaFinanceira.NM_Nome , MetaFinanceira.ST_TipoDaMeta ,MetaFinanceira.ST_FoiConcluida
from Usuarios join MetaFinanceira
on Usuarios.id = MetaFinanceira.IdUsuario; 


#retona todas as tarefas das metas financeiras ja criadas
select  *
from MetaFinanceira join TarefasFinanceiro
on MetaFinanceira.id = TarefasFinanceiro.FK_MetaFinanceira;


select * from TarefasFinanceiro
where TarefasFinanceiro.ST_FoiConcluido = false;

describe ConquistaFinanceira;

# inserindo uma conquista financeira
insert ConquistaFinanceira (NM_Nome , DS_descricao , ST_FoiConcluido , FK_ConquistaDaMetaFinanceira)
values ("50%", " voce atingiu 50% da sua meta" , false , 2);

select * from ConquistaFinanceira;

# retorna as conquistas cadastradas para cada meta
select  ConquistaFinanceira.PK_id, ConquistaFinanceira.NM_Nome , MetaFinanceira.id, MetaFinanceira.NM_Nome ,ConquistaFinanceira.DS_Descricao , ConquistaFinanceira.ST_FoiConcluido
from ConquistaFinanceira join MetaFinanceira
on ConquistaFinanceira.FK_ConquistaDaMetaFinanceira = MetaFinanceira.id;


# altera o status da conquista deixando ela como true(completa)
UPDATE ConquistaFinanceira SET ST_FoiConcluido='1' WHERE PK_id='4';

#  altera o status da tarefa deixando ela como true(completa)
UPDATE TarefasFinanceiro SET ST_FoiConcluido='1' WHERE PK_id='6';

#  altera o status da meta financeira deixando ela como true(completa)
UPDATE MetaFinanceira SET ST_FoiConcluida='1' WHERE id='2';


# comandos para deletar uma meta que tenha conquista e tarefas junto a ela , antes de excluir uma meta temos
#que excluir todas as ligaçoes que ela faz (chaves estrangeiras)
delete from TarefasFinanceiro where FK_MetaFinanceira = '2';
delete from ConquistaFinanceira where FK_ConquistaDaMetaFinanceira = '2';
delete from MetaFinanceira where id = '2';

 
#
select * from MetaFinanceira;

#retorna todas as metas financeira em ordem crescente
select * from MetaFinanceira
order  by ST_FoiConcluida ;


#retorna todas as metas financeira em ordem decrescente
select * from MetaFinanceira
order  by ST_FoiConcluida desc ;



describe MetaDeVicio;
#criando meta de vicio
insert into MetaDeVicio (NM_Nome , DS_TipoDeVicio , ST_FoiConcluida , HR_Tempo, IdUsuario)
values ("parae de fumar" , "cigarro" , false , '00:00:00' , 1)
;

select * from MetaDeVicio; 


describe MetaDeDieta;
#criando meta de dieta
insert into MetaDeDieta (NM_Nome , ST_TipoDaMeta , VL_PesoAtual , VL_PesoDesejado, ST_FoiConcluida , IdUsuario)
values ("perde peso" , "emagrecer" , 110 ,90 , false ,1)
;
select * from MetaDeDieta; 


describe MetaDeExercicios;

#criando meta de exercicio
insert into MetaDeExercicios (NM_Nome , ST_DiasDaSemana , HR_Horas , ST_FoiConcluida , IdUsuario)
values ("academia" , "2 4 6" , "20:00" , false ,1)
;
select * from MetaDeExercicios; 


#retorna em uma linnha o nome de todas as metas
select  Usuarios.id , MetaDeVicio.NM_Nome , MetaDeDieta.NM_Nome , MetaFinanceira.NM_Nome , MetaDeExercicios.NM_Nome
from Usuarios 
	inner join MetaDeVicio on Usuarios.id = MetaDeVicio.IdUsuario
	inner join MetaDeDieta  on Usuarios.id = MetaDeDieta.IdUsuario
	inner join MetaFinanceira on Usuarios.id = MetaFinanceira.IdUsuario
	inner join MetaDeExercicios on Usuarios.id = MetaDeExercicios.IdUsuario
;
 








# exlui todo a BD
drop database CanDoIt;

