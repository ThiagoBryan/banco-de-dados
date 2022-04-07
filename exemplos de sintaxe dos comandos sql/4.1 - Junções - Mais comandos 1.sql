Select * From Editora
Select * From Livros

-- Para rodar o comando abaixo, exclua primeiro a chave estrangeira
-- da coluna CodigoEditora, na tabela de Livros
Insert Into Livros (CodigoLivro, NomeLivro, CodigoISBN, CodigoEditora) 
Values (5894, 'Livro 4', 548, 800)
-----------------------------------------------------------------------------------------
-- Usando "Alias" em tabelas

-- Jun��o simples e direta entre duas tabelas
-- Inner Join -> Tem que ter correspond�ncia entre uma tabela e outra
Select
  L.*,
  ED.Nome as NomeEditora
From
  Livros L Inner Join Editora ED on (L.CodigoEditora = ED.CodigoEditora)


-- Left Outer Join -> Traz TODOS os registros da tabela da esquerda, 
--                    tendo ou n�o tendo correspond�ncia com a tabela da direita
Select
  L.*,
  ED.Nome as NomeEditora
From
  Livros L Left Outer Join Editora ED on (L.CodigoEditora = ED.CodigoEditora)

------------------------------------------------------------------------------
-- JUN�OES MENOS USADAS


-- Right Outer Join -> Traz TODOS os registros da tabela da direita, 
--                     tendo ou n�o tendo correspond�ncia com a tabela da esquerda
Select
  L.*,
  ED.Nome as NomeEditora
From
  Livros L Right Outer Join Editora ED on (L.CodigoEditora = ED.CodigoEditora)


-- Full Outer Join -> Traz TODOS os registros da tabela da esquerda e todos os registros
--                    da tabela da direita,  tendo ou n�o tendo correspond�ncia 
--                    entre as tabelas
Select
  L.*,
  ED.Nome as NomeEditora
From
  Livros L Full Outer Join Editora ED on (L.CodigoEditora = ED.CodigoEditora)

-----------------------------------------------------------------------------------------

-- Jun��o pelo Inner Join x Liga��o pelo Where
-- O resulto � sempre o mesmo

Select
  L.*,
  ED.Nome as NomeEditora
From
  Livros L Inner Join Editora ED on (L.CodigoEditora = ED.CodigoEditora)


Select
  L.*,
  ED.Nome as NomeEditora
From
  Livros L,
  Editora ED
Where
  (L.CodigoEditora = ED.CodigoEditora)

-----------------------------------------------------------------------------------------

-- Estamos alterando a propriedade "Nullable" (de "not null", para "null")
Alter Table Livros Alter Column CodigoEditora int null

-- Cadastrando mais um livro SEM INFORMAR o c�digo da editora
Insert Into Livros (CodigoLivro, NomeLivro, CodigoISBN) 
Values (98658, 'Livro 5', 548)

Select * From Livros

Select
  L.*,
  ED.Nome as NomeEditora
From
  Livros L Left Outer Join Editora ED on (L.CodigoEditora = ED.CodigoEditora)