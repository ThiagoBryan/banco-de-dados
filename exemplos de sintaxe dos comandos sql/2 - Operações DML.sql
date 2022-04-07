Use Biblioteca1

-- Insere <na tabela tal> <lista de campos> os valores <lista de valores>
Insert Into Alunos (Nome, DataNascimento) Values ('Alfredo', '1980-07-20')
Insert Into Alunos (Nome, DataNascimento) Values ('Gilberto', '1984-07-15')

Insert Into Alunos (Nome, DataNascimento)
Values ('Astolfo', '1990-05-31'), ('Espiriquidiberto', '1982-10-25'), ('Gertrudes', '1983-01-18')

----------------------------------------------------------------------------------------------------

Insert Into Editora (CodigoEditora, Nome) Values (100, 'Editora 1'), (200, 'Editora 2')

Insert Into Livros (CodigoLivro, NomeLivro, CodigoISBN, CodigoEditora)
Values
  (8, 'Livro 1', 354897, 100), (14, 'Livro 2', 546578, 100), (1589, 'Livro 3', 15869, 200)


-- Selecione <todas as colunas> da tabela <tabela tal>
Select * From Alunos
Select * From Editora
Select * From Livros

-- Selecione <todas as colunas> da tabela <tabela tal> onde <campo> <operador> <conteúdo>
Select * From Alunos Where DataNascimento = '1982-10-25'
Select * From Alunos Where DataNascimento >= '1982-10-25'
Select * From Alunos Where DataNascimento <= '1982-10-25'

Select * From Livros Where CodigoEditora = 100
Select * From Livros Where CodigoEditora = 100 and CodigoISBN = 354897

-- Limpar toda a tabela (ou seja, excluir todos os registros)
-- Delete Alunos

-- Excluir os alunos cujo número de matrícula seja superior a 5
-- Delete Alunos Where NumeroMatriculaAluno > 5