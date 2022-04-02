create database "banco de dados";

CREATE TABLE "armazem" (
  "codigo_armazem" serial Not Null,
  "endereco" varchar(200) Not Null,
  "num_armazem" integer Not Null,
  PRIMARY KEY ("codigo_armazem")
);

CREATE TABLE "vendedor" (
  "codigo_vendedor" serial Not Null,
  "nome" varchar(50) Not Null,
  "endereco" varchar(200),
  "comissao" decimal,
  PRIMARY KEY ("codigo_vendedor")
);

CREATE TABLE "cliente" (
  "codigo_cliente" serial Not Null,
  "nome" varchar(50) Not Null,
  "endereco" varchar(200),
  "fat_acumulado" decimal,
  "limite_credito" decimal Not Null,
  "codigo_vendedor" integer Not Null,
  PRIMARY KEY ("codigo_cliente"),
  CONSTRAINT "FK_cliente.codigo_vendedor"
    FOREIGN KEY ("codigo_vendedor")
      REFERENCES "vendedor"("codigo_vendedor")
);

CREATE TABLE "pedido" (
  "codigo_pedido" serial Not Null,
  "num_pedido" integer,
  "data_pedido" date,
  "codigo_cliente" integer Not Null,
  "codigo_peca" integer Not Null,
  PRIMARY KEY ("codigo_pedido"),
  CONSTRAINT "FK_pedido.codigo_cliente"
    FOREIGN KEY ("codigo_cliente")
      REFERENCES "cliente"("codigo_cliente")
);

alter table pedido add 
constraint "FK_pedido.codigo_peca" 
foreign key ("codigo_peca") 
references "peca" ("codigo_peca");

CREATE TABLE "peca" (
  "codigo_peca" serial Not Null,
  "descricao" varchar(100) Not Null,
  "preco" decimal Not Null,
  "qtd_estoque" integer Not Null,
  "codigo_armazem" Integer Not Null,
  PRIMARY KEY ("codigo_peca"),
  CONSTRAINT "FK_peca.codigo_armazem"
    FOREIGN KEY ("codigo_armazem")
      REFERENCES "armazem"("codigo_armazem")
);

