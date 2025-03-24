create database empresa;
use empresa;
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
    numero int not null primary key,
    nome varchar(15) not null unique,
    gerente_ssn char(9) not null,
    gerente_start_date date not null,
    foreign key ( gerente_ssn) references empresa.funcionario (Ssn)
    
);

create table departamento_localizacao(
   numero_departamento int not null,
   localizacao varchar(15) not null,
   primary key (numero_departamento, localizacao),
   foreign key  (numero_departamento) references departamento(numero)
);

create table projeto(
    nome varchar(30) not null unique,
    numero_projeto int not null,
    projeto_localizacao varchar (15),
    num_departamento int not null,
    primary key (numero_projeto),
    foreign key (num_departamento) references departamento(numero)
);

create table funcionario_projeto(
    Essn char(5) not null,
    projeto_numero int not null,
    horas datetime not null,
    primary key (Essn, projeto_numero),
    foreign key (Essn) references empresa.funcionario (Ssn),
    foreign key (projeto_numero) references projeto(numero_projeto) 
);

create table dependente(
   Essn char(15) not null,
   dependente_nome varchar(15) not null,
   sexo enum ('M','F'),
   data_nascimento date,
   relacionamento_empregado varchar(8),
   primary key (Essn, dependente_nome),
   foreign key (Essn) references empresa.funcionario(Ssn)
);