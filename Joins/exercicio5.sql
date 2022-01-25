create database db_construindo_a_nossa_vida;

use db_construindo_a_nossa_vida;

create table tb_categoria(
	id bigint auto_increment,
    classe varchar(30) not null,
	entrada timestamp,
    primary key(id)
);

create table tb_produto(
	id bigint auto_increment,
    nome varchar(30) not null,
    marca varchar(30) not null,
	tamanho varchar(20) not null,
    preco decimal(10,2) not null,
    id_categoria bigint,
    primary key(id),
    foreign key(id_categoria) references tb_categoria(id)
);

insert into tb_categoria(classe,entrada) values
	("construção",current_timestamp()),
  	("sanitário",current_timestamp()),
	("elétrico",current_timestamp()),
    ("madeira",current_timestamp())
;

insert into tb_produto(nome,marca,preco,tamanho,id_categoria) values 
	("Cimento", "CimentoLegal", 28.0, "50KG", 1),
    ("Areia", "AreiaLegal", 10.0, "50KG", 1),
    ("Cano", "CanoLegal", 25.0, "100x5x5cm", 2),
    ("Fio Elétrico", "FioLegal", 10.0, "50m", 3),
    ("Tábua", "TabuaLegal", 100.0, "300x150x3cm", 4)
;

select * from tb_produto where preco > 50;

select * from tb_produto where preco between 3 and 60;

select * from tb_produto where nome like "%c%";

select * from tb_produto inner join tb_categoria on tb_produto.id_categoria = tb_categoria.id;

select * from tb_produto inner join tb_categoria on tb_produto.id_categoria = tb_categoria.id and tb_categoria.classe = "construção";