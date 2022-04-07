Select * From Editora
Select * From Livros

-- Para rodar o comando abaixo, exclua primeiro a chave estrangeira
-- da coluna CodigoEditora, na tabela de Livros
Insert Into Livros (CodigoLivro, NomeLivro, CodigoISBN, CodigoEditora) 
Values (5894, 'Livro 4', 548, 800)
----------------------------
-- alias

-- Junção simples e direta entre duas tabelas
-- Inner Join -> Tem que ter correspondência entre uma tabela e outra
Select
  L.*,
  ED.Nome as NomeEditora
From
  Livros L Inner Join Editora ED on (L.CodigoEditora = ED.CodigoEditora)

-- Left Outer Join -> Traz TODOS os registros da tabela da esquerda, 
--                    tendo ou não tendo correspondência com a tabela da direita
Select
  L.*,
  ED.Nome as NomeEditora
From
  Livros L Left Outer Join Editora ED on (L.CodigoEditora = ED.CodigoEditora)

------------------------------------------------------------------------------
-- JUNÇOES MENOS USADAS

-- Right Outer Join -> Traz TODOS os registros da tabela da direita, 
--                     tendo ou não tendo correspondência com a tabela da esquerda
Select
  L.*,
  ED.Nome as NomeEditora
From
  Livros L Right Outer Join Editora ED on (L.CodigoEditora = ED.CodigoEditora)

-- Full Outer Join -> Traz TODOS os registros da tabela da esquerda e todos os registros
--                    da tabela da direita,  tendo ou não tendo correspondência 
--                    entre as tabelas
Select
  L.*,
  ED.Nome as NomeEditora
From
  Livros L Full Outer Join Editora ED on (L.CodigoEditora = ED.CodigoEditora)

