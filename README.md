# TadesSkate
Participantes do grupo: Paulo Henrique, Amanda Betti, Vitor Oliveira, Gabriel Teixeira


CREATE TABLE filial (
  filial_id integer primary key not null generated always as identity (start with 1, increment by 1),
  Email varchar(255)  not null,
  Telefone varchar(15)  not null,
  Endereco varchar(150)  not null,
  Cidade varchar(100)  not null,
  Estado varchar(80)  not null,
  bairro varchar (80) not null
); 
CREATE TABLE cliente (
  cliente_id integer primary key not null generated always as identity(start with 1, increment by 1 ), 
  nome varchar(50) not null,
  sobrenome varchar(100) not null,
  CPF varchar(15)not null unique, 
  email varchar(100) not null,
  telefone varchar(15) not null, 
  endereco varchar(100) not null,
  cidade varchar(100) not null,
  estado varchar(80)  not null,
  bairro varchar (80) not null,
  nascimento date,
  fk_filial_id integer references filial(filial_id)
);

CREATE TABLE funcionario (
  funcionario_id integer primary key not null generated always as identity(start with 1, increment by 1),
  nome varchar(50) not null,
  sobrenome varchar(100) not null,
  CPF varchar(15) not null,
  email varchar(100) not null,
  telefone varchar(15)  not null,
  endereco varchar(150) not null,
  cidade varchar (100) not null,
  estado varchar(80) not null,
  bairro varchar(80) not null,
  departamento varchar(50) not null,
  salario float not null,
  nascimento date ,
 fk_filial_id integer references filial(filial_id)
);


CREATE TABLE produto (
  produto_id integer NOT NULL primary key generated always as identity(start with 1, increment by 1),
  descricao varchar(100) not null,
  categoria varchar(50) not null,
  fabricante varchar(50) not null,
  valor float not null,
  quantidade integer not null,
  desconto float not null,
  fk_filial_id integer references filial(filial_id)
);


CREATE TABLE venda (
  venda_id integer NOT NULL primary key generated always as identity(start with 1, increment by 1),
  Valor_Total float not null,
  Data TIMESTAMP not null,
  fk_funcionario_id integer references funcionario (funcionario_id),
  fk_cliente_id integer references cliente (cliente_id),
  fk_filial_id integer references filial(filial_id)
);


CREATE TABLE pedido (
pedido_id integer NOT NULL primary key generated always as identity(start with 1, increment by 1) ,
  fk_produto_id  integer references produto(produto_id),
  fk_venda_id integer references venda(venda_id),
  fk_filial_id integer references filial(filial_id),
  quantidade integer not null,
  Valor_Unitario float not null
  