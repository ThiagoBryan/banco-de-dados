-- Cria o banco de dados
Create Database Biblioteca1

-- Alterna para o banco criado
Use Biblioteca1

-- Cria a tabela de Alunos
Create Table Alunos (NumeroMatricula int, NomeAluno VarChar(100), DataNascimento Date)

-- Cria a tabela de Livros
Create Table Livros (CodigoLivro int, Descricao VarChar(50))

-- Cria a tabela de Empréstimo
Create Table Emprestimo (CodigoEmprestimo int, NumeroMatricula int, CodigoLivro int, DataEmprestimo Date)

