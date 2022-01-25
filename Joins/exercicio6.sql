create database db_cursoDaMinhaVida;

use db_cursoDaMinhaVida;

create table tb_categoria(
	id bigint auto_increment,
    linguagem enum("JS", "Java", "Portugol", "Python"),
    hab enum("Front-end","Back-end"),
    primary key(id)
);

create table tb_curso(
	id bigint auto_increment,
	framework enum("SpringBoot", "Angular", "React", "Node.js", "null"),
    tempo varchar(10) not null,
    numeroAlunes int not null,
    id_categoria bigint,
    primary key(id),
    foreign key(id_categoria) references tb_categoria(id)
);

insert into tb_categoria(linguagem, hab) values
	("JS","Front-end"),
    ("Java","Front-end"),
    ("JS","Back-end"),
    ("Java","Back-end"),
    ("Python","Back-end")
;

insert into tb_curso(framework, tempo, numeroAlunes, id_categoria) values 
	("SpringBoot", "3 meses", 40, 4),
    ("Angular", "2 meses", 30, 2),
    ("React", "3 meses", 20, 1),
    ("Node.js", "1 mes", 30, 3),
    ("null", "3 meses", 40, 5),
    ("Angular", "2 meses", 25, 2)
;

select * from tb_curso where numeroAlunes >= 30;

select * from tb_curso where numeroAlunes between 25 and 30;

select * from tb_curso where framework like "%a%";

select * from tb_curso inner join tb_categoria on tb_curso.id_categoria = tb_categoria.id;

select * from tb_curso inner join tb_categoria on tb_curso.id_categoria = tb_categoria.id where tb_categoria.linguagem = "Java";
