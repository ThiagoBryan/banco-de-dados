create database seguradora_de_automoveis

create table cliente (nome_cliente varchar(50), numero_cliente integer, numero_apolice integer, endereco varchar(100));


create table apolice (numero_apolice varchar(50), valor char(15), registro varchar(20));

create table carro (registro char(20), numero_apolice char(20), marca char(15), data_acidente date);

create table acidente (data_acidente date, hora time, local char(50));