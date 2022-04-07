create database dentibao;

create table "atendente" (id_funcionario integer not null, 
nome_atendente varchar(50) not null,
numero_senha integer,                             --CONSTRAINT "FK_exemplo.exemplo_exemplo" -> FK_nomeTablelaQueVocTa.idDaOutraTabelaQueQuerReferenciar
cpf_paciente char(11) not null);				  --FOREIGN KEY ("exemplo_exemplo")-> idDaOutraTabelaQueQuerReferenciar
												  --REFERENCES "exemplo"("exemplo_exemplo") -> OutraTabela (<---idDaOutraTabela)
alter table atendente add primary key ("id_funcionario");
alter table atendente add constraint "FK_atendente.numero_senha" foreign key ("numero_senha") references "senha"("numero_senha");
--ALTER TABLE atendente modify COLUMN id_funcionario serial not null;


create table "senha" (numero_senha integer not null);
alter table senha add primary  key ("numero_senha");

create table "paciente" 
(cpf_paciente char(11) not null primary key ,
nome_paciente varchar(50) not null,
data_nasc date not null,
id_endereço integer not null,
id_telefone integer not null,
numero_senha integer,
numero_atendimento integer);   

alter table paciente add constraint "FK_paciente.id_telefone" foreign key ("id_telefone") references "telefone"("id_telefone");
alter table paciente add constraint "FK_paciente.id_endereço" foreign key ("id_endereço") references "endereço"("id_endereço"); 
alter table paciente add constraint "FK_paciente.numero_senha" foreign key ("numero_senha") references "senha"("numero_senha"); 

create table "telefone" 
(id_telefone serial not null primary key,
celular char(11) not null,
fixo char(11));

create table "endereço"
(id_endereço serial not null primary key,
cep char (8) not null,
rua varchar(200) not null,
bairro char(25)not null,
cidade char(50));

create table "ficha_atendimento" 
(id_numero_atendimento serial not null primary key,
motivo_consulta varchar(200) not null ,
historico varchar (1000) not null,
diagnostico varchar(200) not null,
receitas varchar(200), 
solicitao_retorno varchar(200));

ALTER table ficha_atendimento ADD id_funcionario integer;
ALTER table ficha_atendimento ADD cpf_paciente integer;
ALTER TABLE ficha_atendimento DROP COLUMN cpf_paciente;
ALTER table ficha_atendimento ADD cpf_paciente char(11);
alter table ficha_atendimento add constraint "FK_ficha_atendimento.id_funcionario" foreign key ("id_funcionario") references "atendente"("id_funcionario");
alter table ficha_atendimento add constraint "FK_ficha_atendimento.cpf_paciente" foreign key ("cpf_paciente") references "paciente"("cpf_paciente"); 


select * from atendente;
select * from paciente;

select atendente.nome_atendente, atendente.numero_senha, paciente.nome_paciente from atendente
	inner join paciente on atendente.nome_atendente = paciente.nome_paciente;





