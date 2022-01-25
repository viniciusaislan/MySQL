create database db_cidade_das_carnes;

use db_cidade_das_carnes;

create table tb_categoria(
	id bigint auto_increment,
    animal enum ("frango","boi","porco"),
    fab timestamp,
    primary key(id)
);

create table tb_produto(
	id bigint auto_increment,
    nome varchar(25) not null,
    marca varchar(25) not null,
    peso decimal (3,1) check (peso > 0),
    preco decimal (10,2) check (preco > 0),
    id_categoria bigint,
    primary key(id),
    foreign key(id_categoria) references tb_categoria(id)
);

insert into tb_categoria(animal, fab) values 
	("frango",current_timestamp()),
	("boi",current_timestamp()),
	("porco",current_timestamp())
;

insert into tb_produto(nome, marca, peso, preco, id_categoria) values
	("Peito de frango","FrangoBom", 1.0, 20.0, 1),
    ("Costela","BoiBom", 5.0, 100.0, 2),
    ("Costela","PorcoBom", 5.0, 80.0, 3),
    ("Bisteca","PorcoBom", 2.0, 40.0, 3),
    ("Acém","BoiBom", 2.0, 40.0, 2),
    ("Cupim","BoiBom", 1.0, 50.0, 2)
;

select * from tb_produto where preco > 50;

select * from tb_produto where preco between 3 and 60;

select * from tb_produto where nome like "%c%";

select * from tb_produto inner join tb_categoria where tb_produto.id_categoria = tb_categoria.id;

select * from tb_produto inner join tb_categoria where tb_produto.id_categoria = tb_categoria.id and animal = "boi";