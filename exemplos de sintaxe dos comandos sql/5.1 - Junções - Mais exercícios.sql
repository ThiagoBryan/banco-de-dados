Select * From Editora
Select * From Livros


-- Para rodar o comando abaixo, exclua primeiro a chave estrangeira
-- da coluna CodigoEditora, na tabela de Livros
Insert Into Livros (CodigoLivro, NomeLivro, CodigoISBN, CodigoEditora) 
Values (5894, 'Livro 4', 548, 800)
-----------------------------------------------------------------------------------------
-- Usando "Alias" em tabelas

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

-----------------------------------------------------------------------------------------

-- Junção pelo Inner Join x Ligação pelo Where
-- O resulto é sempre o mesmo

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

-- Cadastrando mais um livro SEM INFORMAR o código da editora
Insert Into Livros (CodigoLivro, NomeLivro, CodigoISBN) 
Values (98658, 'Livro 5', 548)

Select * From Livros


-- EXERCÍCIOS

/* 1) "Lista pra mim todos os livros que não tem editora informada" */
Select * From Livros Where (CodigoEditora is null)


/* ​2) "Lista pra mim todos os livros que estão vinculados a 
       editoras que não existem." */
Select
  L.*,
  ED.Nome as NomeEditora
From
  Livros L Left Outer Join Editora ED on (L.CodigoEditora = ED.CodigoEditora)
Where
  (ED.Nome is null) and
  (L.CodigoEditora is not null)


/* 3) "Lista pra mim todos os livros que estão sem editora, seja porque não for informado 
       uma editora ao cadastrar o livro, seja porque ele está vinculado a uma editora 
	   que não existe." */
Select
  L.*,
  ED.*
From
  Livros L Left Outer Join Editora ED on (L.CodigoEditora = ED.CodigoEditora)
Where
  ED.CodigoEditora is null


/* 4) "Lista pra mim todos os empréstimos feitos para alunos que não possuem CPF 
       informado em seu cadastro" */

--Select * From Alunos
--Insert Into Emprestimo Values (4, 1589, '2020-05-06', '2020-05-07')

Select
  AL.Nome,
  E.*
From
  Emprestimo E Inner Join Alunos AL on (E.NumeroMatriculaAluno = AL.NumeroMatriculaAluno)
Where
  AL.CPF is null


/* 5) "Lista pra mim todos os empréstimos de livros, com o nome do livro e o nome do 
       aluno que pegou o livro emprestado." */

Select
  E.DataEmprestimo,
  E.DataEntrega,
  L.NomeLivro,
  A.Nome as NomeAluno
From
  Emprestimo E Inner Join Livros L on (L.CodigoLivro = E.CodigoLivro)
               Inner Join Alunos A on (A.NumeroMatriculaAluno = E.NumeroMatriculaAluno)


/* 6) "Lista pra mim a quantidade de alunos cadastrados por bairro, 
       ordernando de modo decrescente por bairro. " */
Select Bairro, Count(*) as Total From Alunos
Group by Bairro Order by Bairro desc


/* 7) "Lista pra mim a quantidade de livros emprestados por bairro,
       considerando apenas os empréstimos feitos para alunos que tem cpf." */

Select
  A.Bairro,
  Count(*) as Total
From
  Emprestimo E Inner Join Alunos A on (A.NumeroMatriculaAluno = E.NumeroMatriculaAluno)
Where
  A.CPF is not null
Group by
  A.Bairro


/* 8) "Lista pra mim a quantidade de livros emprestados por bairro,
       considerando apenas os empréstimos feitos para alunos que tem cpf
	   e considerando apenas os empréstimos de livros que possuem autor informado." */

-- Update Livros Set NomeAutor = 'Autor José' Where CodigoLivro = 1589

Select
  A.Bairro,
  Count(*) as Total
From
  Emprestimo E Inner Join Alunos A on (A.NumeroMatriculaAluno = E.NumeroMatriculaAluno)
               Inner Join Livros L on (L.CodigoLivro = E.CodigoLivro)
Where
  (A.CPF is not null) and
  (L.NomeAutor is not null)
Group by
  A.Bairro

/* 9) "Lista pra mim a quantidade de livros por cidade." */
/* 10) "Lista pra mim a quantidade de empréstimos por cidade." */
/* 11) "Lista pra mim a quantidade de empréstimos por cidade,
        considerando apenas os alunos com 'logradouro' informado." */
/* 12) "Lista pra mim a quantidade de empréstimos por cidade,
        considerando apenas os alunos com 'logradouro' informado, e
		considerando apenas os livros emprestados que tem data de 
		lançamento informada." */
/* 13) "Lista pra mim a quantidade de empréstimos por editora
        (mostrando o nome da editora), considerando apenas
		os empréstimos realizados para alunos sem CPF."



