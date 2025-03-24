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

drop table funcionario_projeto;
create table funcionario_projeto(
    Essn char(9) not null,
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

-- Inserindo funcionários
INSERT INTO empresa.funcionario (Ssn, primeiro_nome, sobrenome, aniversaio, logradouro, sexo, salario) VALUES
('123456789', 'Carlos', 'Silva', '1985-06-15', 'Rua A, 100', 'M', 5000.00),
('987654321', 'Ana', 'Souza', '1990-04-22', 'Rua B, 200', 'F', 5500.00),
('456789123', 'Mariana', 'Ferreira', '1988-12-10', 'Rua C, 300', 'F', 6000.00);

-- Inserindo departamentos
INSERT INTO departamento (numero, nome, gerente_ssn, gerente_start_date) VALUES
(1, 'TI', '123456789', '2020-01-01'),
(2, 'RH', '987654321', '2021-02-01'),
(3, 'Financeiro', '456789123', '2019-05-01');

-- Inserindo localizações dos departamentos
INSERT INTO departamento_localizacao (numero_departamento, localizacao) VALUES
(1, 'São Paulo'),
(2, 'Rio de Janeiro'),
(3, 'Belo Horizonte');

-- Inserindo projetos
INSERT INTO projeto (nome, numero_projeto, projeto_localizacao, num_departamento) VALUES
('Sistema ERP', 101, 'São Paulo', 1),
('Recrutamento', 102, 'Rio de Janeiro', 2),
('Auditoria Financeira', 103, 'Belo Horizonte', 3);

-- Inserindo funcionários em projetos
INSERT INTO funcionario_projeto (Essn, projeto_numero, horas) VALUES
('987654321', '102', '2024-03-01'),
('456789123', '103', '2024-03-01');


select * from funcionario_projeto;

-- Inserindo dependentes
INSERT INTO dependente (Essn, dependente_nome, sexo, data_nascimento, relacionamento_empregado) VALUES
('123456789', 'Pedro', 'M', '2015-07-20', 'Filho'),
('987654321', 'Laura', 'F', '2018-09-15', 'Filha'),
('456789123', 'Fernanda', 'F', '1992-03-05', 'Esposa');

select * from dependente;


/*utilizando valor INSS*/
select primeiro_nome, salario, round( salario * 0.011,2) as 
INSS from empresa.funcionario;

/*definir aumento de salário para os gerentes que trabalham no projeto
associado as Sistema ERP*/
UPDATE empresa.funcionario AS f
SET f.salario = f.salario * 1.10  -- Aumento de 10%
WHERE f.Ssn IN (
    SELECT d.gerente_ssn
    FROM departamento AS d
    JOIN projeto AS p ON d.numero = p.num_departamento
    WHERE p.nome = 'Sistema ERP'
);

select * from empresa.funcionario;




show tables;