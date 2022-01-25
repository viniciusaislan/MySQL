create database db_pizzaria_legal;

use db_pizzaria_legal;


create table tb_categoria(
	id bigint auto_increment,
	tamanho enum("P", "M", "G"),
    tipo enum("doce","salgado"),
    primary key(id)
);

create table tb_pizza(
	id bigint auto_increment,
    sabor varchar(20) not null,
    preco real(10,2) check (preco > 0),
    comBorda enum("Cheedar", "Catupiry", "Nenhum"),
    existe boolean,
    id_categoria bigint,
    primary key(id),
    foreign key(id_categoria) references tb_categoria(id)
);

insert into tb_categoria(tamanho, tipo) values ("P", "doce"),
	("P", "salgado"),
    ("M", "salgado"),
    ("G", "salgado"),
    ("G", "salgado");
    
insert into tb_pizza(sabor, preco, comBorda, existe, id_categoria) values ("Quatro queijos", 50, "Cheedar", true, 3),
	("Dois queijos", 35, "Catupiry", true, 3),
    ("Calabresa", 25, "Nenhum", true, 2),
    ("Frango", 40, "Cheedar", true, 3),
    ("Lombo com cheedar", 50, "Cheedar", true, 4),
    ("Chocolate", 30, "Nenhum", false, 1);
    
select * from tb_pizza where preco > 45;

select * from tb_pizza where preco between 29 and 60;

select * from tb_pizza where sabor like "c%";

select * from tb_pizza inner join tb_categoria on tb_pizza.id_categoria = tb_categoria.id
	order by tb_pizza.sabor;
    
select * from tb_pizza inner join tb_categoria on tb_pizza.id_categoria = tb_categoria.id and tb_categoria.tipo = "doce";
	