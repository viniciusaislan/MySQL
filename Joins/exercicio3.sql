create database db_farmacia_do_bem;

use db_farmacia_do_bem;

create table tb_produto(
	id bigint auto_increment,
    preco decimal(10,2) not null check( preco > 0),
    marca varchar(20) not null,
    nome varchar(30) not null,
    id_categoria bigint,
    foreign key(id_categoria) references tb_categoria(id),
    primary key(id)    
);


create table tb_categoria(
	id bigint auto_increment,
	tarja enum("sem tarja","amarela","vermelha","preta"),
    departamento varchar(20) not null,
    primary key (id)
);

insert into tb_categoria(tarja,departamento)
 values ("sem tarja", "remédios"), /*1*/
	("vermelha", "remédios"),	/*2*/
    ("sem tarja", "conveniência"),	/*3*/
    ("preta", "remédios"),	/*4*/
    ("amarela", "remédios");	/*5*/
    
insert into tb_produto(preco, marca, nome, id_categoria) values
	(19.99, "Dorflex", "Dorflex 50 cps", 1),
    (75.00, "Suplemento vit", "CogMax", 1),
    (12.99, "Novalgina", "Sanofi Aventis", 5),
    (4.00, "Água", "São bento", 3),
    (130.00, "Aché", "Forxiga 10 mg 30 cps", 2),
    (50.00, "Aché", "Monomaxicetina 50 cps", 4);
    
select * from tb_produto where preco > 50;

select * from tb_produto where preco between 3 and 60;

select * from tb_produto where nome like "%b%";

select * from tb_produto inner join tb_categoria on tb_produto.id_categoria = tb_categoria.id;

select * from tb_produto inner join tb_categoria on tb_produto.id_categoria = tb_categoria.id where departamento = "conveniência";
 