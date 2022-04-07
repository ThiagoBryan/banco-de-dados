-- Cria o banco de dados
Create Database Biblioteca1
go

-- Alterna para o banco criado
Use Biblioteca1

-- Cria a tabela de Alunos
--Drop Table Alunos
Create Table Alunos
(
 NumeroMatriculaAluno int Identity not null Primary Key, 
 Nome VarChar(100) not null, 
 DataNascimento Date,
 CPF Char(11) null -- Unique
)

-- Cria a tabela de Livros
--Drop Table Livros
Create Table Livros
(
 CodigoLivro int not null Primary Key, 
 NomeLivro VarChar(50) not null
)

-- Cria a tabela de Empr�stimo
--Drop Table Emprestimo
Create Table Emprestimo
(
 CodigoEmprestimo int Identity not null Primary Key, 
 NumeroMatriculaAluno int not null References Alunos (NumeroMatriculaAluno),
 CodigoLivro int not null References Livros (CodigoLivro),
 DataEmprestimo Date not null Default GetDate()
)

Create Table Editora
(
 CodigoEditora int not null Primary Key,
 Nome          VarChar(50) not null
)


---------------------------------------------------------------------------------------------

-- ALTERANDO A ESTRUTURA DAS TABELAS

-- Como adicionar uma coluna � uma tabela existente
Alter Table Livros Add NomeAutor VarChar(100)
Alter Table Livros Add DataLancamento Date
Alter Table Livros Add CodigoISBN int not null

-- Como alterar o tipo de dados de uma coluna
Alter Table Livros Alter Column NomeLivro VarChar(120) not null
Alter Table Livros Add CodigoEditora int not null References Editora (CodigoEditora)

Alter Table Alunos Add Logradouro VarChar(100)
Alter Table Alunos Add NumeroLogradouro VarChar(10)
Alter Table Alunos Add Complemento VarChar(50)
Alter Table Alunos Add Bairro VarChar(50)
Alter Table Alunos Add Cidade VarChar(50)

Alter Table Emprestimo Add DataEntrega Date not null

--------------------------------------------------------------------------------------------


/* Brincadeiras/Testes de Convers�o

Select GetDate()

-- Convert(TipoDeDados, O_Que_Eu_Quero_Converter)
Select Convert(Date, GetDate())
Select Convert(int, '25abc')
Select Day('03/05/2019')
Select Month('03/05/2019')
Select Year('03/05/2019')
                   -- aaaa-mm-dd
Select Convert(Date, '2020-05-31') -- Formato padr�o (SEMPRE funciona)
Select Convert(Date, '31/05/2020') -- Funciona se estiver em portugu�s
Select Convert(Date, '05/31/2020') -- Funciona se estiver em ingl�s
Select Convert(Date, 'xpto')
*/

/* TRANSA��O

-- Inicia uma transa��o
Begin Tran Nome_Transacao

-- Desfaz uma transa��o (e desfaz tudo que voc� fez dentro dela)
Rollback Tran Nome_Transacao

-- Confirma uma transa��o (e efetiva tudo o que voc� fez dentro dela)
Commit Tran Nome_Transacao
*/


-- ALTER TABLE Nome_Tabela ADD DEFAULT Valor_Padrao FOR Nome_Coluna
-- Alter Table Emprestimo Add Default GetDate() For DataEmprestimo