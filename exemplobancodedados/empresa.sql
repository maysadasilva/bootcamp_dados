create database empresa;
use empresa;
drop database  empresa;
drop table empresa.funcionario;
create table empresa.funcionario(
	Ssn char(9) not null,
    primeiro_nome varchar(20) not null,
    sobrenome varchar(20) not null,
    aniversaio date not null,
    logradouro varchar(30),
    sexo enum ('M', 'F'),
    salario decimal(10,2),
    constraint pk_empresa_funcionario primary key (Ssn)
);

desc empresa.funcionario;

create table departamento(
    numero int not null,
    nome varchar(15) not null,
    gerente_ssn char(9) not null,
    gerente_start_date date not null,
    constraint pk_departamento primary key (numero),
    constraint unique_nome_deparment unique (nome),
   constraint fk_departamento
   foreign key ( gerente_ssn) references empresa.funcionario (Ssn)
);

create table departamento_localizacao(
   numero_departamento int not null,
   localizacao varchar(15) not null,
  constraint pk_num_departamento_local primary key (numero_departamento, localizacao),
  constraint fk_num_depar foreign key  (numero_departamento) references departamento(numero)
);

create table projeto(
    nome varchar(30) not null,
    numero_projeto int not null,
    projeto_localizacao varchar (15),
    num_departamento int not null,
    constraint unique_nomeProjeto unique (nome),
   constraint pk_num_proj primary key (numero_projeto),
   constraint fk_num_depa foreign key (num_departamento) references departamento(numero)
);

create table funcionario_projeto(
    Essn char(5) not null,
    projeto_numero int not null,
    horas datetime not null,
   constraint pk_essn primary key (Essn, projeto_numero),
   constraint fk_ess foreign key (Essn) references empresa.funcionario (Ssn),
   constraint fk_pro_numero foreign key (projeto_numero) references projeto(numero_projeto) 
);

create table dependente(
   Essn char(15) not null,
   dependente_nome varchar(15) not null,
   sexo enum ('M','F'),
   data_nascimento date,
   relacionamento_empregado varchar(8),
   constraint pk_essn_dependente primary key (Essn, dependente_nome),
  constraint fk_essn foreign key (Essn) references empresa.funcionario(Ssn)
);