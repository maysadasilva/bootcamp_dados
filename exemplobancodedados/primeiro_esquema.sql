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

insert into pessoa values ('6', 'Silva', 'Silva', 'F','2004-03-05' ,'Rua Subida', ' Guariba', 'São Paulo', 'Brasil','9090900'),
('7', 'Luis', 'Silva', 'M','2004-03-05' ,'Rua Subida', ' Guariba', 'São Paulo', 'Brasil','9090900');
select * from pessoa;

delete from pessoa where id_pessoa=1;

insert into comida_favorita values ('5', 'Lasanha');

select * from comida_favorita;
