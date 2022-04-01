create database thiago;
create database bryan;
create database thurler;
create database criei_outro;
create database mais_um;
create database nao_tenho_mais_ideia;

drop database bryan;
drop database thurler;
drop database criei_outro;
drop database mais_um;
drop database nao_tenho_mais_ideia;

create table usuario (id_usuario integer, login varchar (20), data_cadastro date, senha varchar(10));
create table cliente (id_cliente integer, nome_fantasia varchar(100), razao_social varchar(200), cnpj integer,
pessoa_responsavel varchar(50));
create table telefone (id_telefone integer, ddd integer, numero integer);

insert into cliente (id_cliente, nome_fantasia, razao_social, cnpj, pessoa_responsavel) values(1,'Ps5','Playstation',null,
'Sony');
alter table cliente alter column cnpj type int8;

insert into telefone (id_telefone, ddd, numero) values(1,22,992124343);
insert into usuario (id_usuario, login, data_cadastro, senha) values(1,'GOW', '2022-08-21', 'esseanosai');

update cliente set cnpj = 10121987654321 where id_cliente= 1;

-- delete from cliente where id_cliente is null; -- para excluir uma linha

alter table usuario alter column id_usuario type serial not null; -- vai enviar erro



