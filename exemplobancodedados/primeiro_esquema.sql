create database primeiro_esquema;
use  primeiro_esquema;

create table pessoa(
	id_pessoa smallint unsigned auto_increment,
    primeiro_nome varchar(20),
    sobrenome varchar(20),
    sexo enum ('M', 'F'),
    data_nasc date,
    logradouro varchar (30),
    cidade varchar (20),
    estado varchar (20),
    pais varchar (20),
    cep varchar (20),
    constraint pk_pessoa primary key (id_pessoa)
);
desc pessoa;

create table comida_favorita(
	id_pessoa smallint unsigned auto_increment,
    comida varchar(20),
    constraint pk_comida_favortia primary key comida_favorita(id_pessoa, comida),
    constraint fk_comida_favorita foreign key (id_pessoa) references pessoa(id_pessoa)
);

desc comida_favorita;

