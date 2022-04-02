create database dentibao;

create table "atendente" (id_funcionario integer, nome_atendente varchar(50), numero_senha integer, cpf_paciente integer);

create table "paciente" (cpf_paciente integer, nome_paciente varchar(50), data_nasc date, id_endereço integer, id_telefone integer, numero_senha integer, numero_atendimento integer);

create table "senha" (numero_senha integer);

create table "ficha_atendimento" (numero_atendimento integer, motivo_consulta varchar(200), "historico" varchar (1000), "diagnostico" varchar(200), "receitas" varchar(200), "solicitao_retorno" varchar(200), "id_funcionario" integer)



