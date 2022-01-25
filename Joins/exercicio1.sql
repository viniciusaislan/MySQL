create database db_generation_game_online;
use db_generation_game_online;

create table tb_classe(
	id bigint auto_increment,
    nome varchar(10) not null,
    nivelClasse int check (nivelClasse > 0 and nivelClasse < 100),
    primary key(id)
);

insert into tb_classe (nome, nivelClasse) values ("Black mage", 30);
insert into tb_classe (nome, nivelClasse) values ("Warrior", 30);
insert into tb_classe (nome, nivelClasse) values ("White mage", 30);
insert into tb_classe (nome, nivelClasse) values ("Dragoon", 30);
insert into tb_classe (nome, nivelClasse) values ("Ninja", 30);


create table tb_personagem(
	id bigint auto_increment,
    nome varchar(10) not null,
    isGameMaster boolean,
    nivelBase int check (nivelBase > 0 and nivelBase < 100),
    ataque int check (ataque > 0),
    defesa int check (defesa > 0),
    classe bigint,
    primary key (id),
    foreign key(classe) references tb_classe(id)
);

insert into tb_personagem (nome, isGameMaster, nivelBase, ataque, defesa, classe)
										 values ("Avos", false, 30, 4000, 1500, 1),
												("Titan", false, 30, 2000, 4000, 2),
												("Shiva", false, 30, 1000, 1000, 3),
												("Ifrit", false, 30, 4000, 2000, 4),
												("Garuda", false, 30, 3800, 2000, 5),
												("Carlinho", false, 30, 3800, 2000, 5);

select * from tb_personagem where ataque > 2000;

select * from tb_personagem where defesa >= 1000 and defesa <= 2000;

select * from tb_personagem where nome like 'c%';

select * from tb_personagem inner join tb_classe on tb_personagem.classe = tb_classe.id;

select tb_personagem.nome, tb_personagem.nivelBase, tb_classe.nivelClasse, tb_personagem.ataque, tb_personagem.defesa, tb_classe.nome as job
	from tb_personagem inner join tb_classe on tb_personagem.classe = tb_classe.id and tb_classe.nome = "Ninja";