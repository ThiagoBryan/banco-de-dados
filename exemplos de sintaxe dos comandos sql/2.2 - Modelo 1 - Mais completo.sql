-- Cria o banco de dados
Create Database Biblioteca1

-- Alterna para o banco criado
Use Biblioteca1

-- Cria a tabela de Alunos
Create Table Alunos (NumeroMatricula int, NomeAluno VarChar(100), DataNascimento Date)

-- Cria a tabela de Livros
Create Table Livros (CodigoLivro int, NomeLivro VarChar(50))

-- Cria a tabela de Empréstimo
Create Table Emprestimo (CodigoEmprestimo int, NumeroMatricula int, CodigoLivro int, DataEmprestimo Date)



---------------------------------------------------------------------------------------------

-- ALTERANDO A ESTRUTURA DAS TABELAS

-- Como adicionar uma coluna à uma tabela existente
Alter Table Livros Add NomeAutor VarChar(100)
Alter Table Livros Add DataLancamento Date
Alter Table Livros Add CodigoISBN int

-- Como alterar o tipo de dados de uma coluna
Alter Table Livros Alter Column NomeLivro VarChar(120)

Alter Table Alunos Add CPF Char(11)
Alter Table Alunos Add Logradouro VarChar(100)
Alter Table Alunos Add NumeroLogradouro VarChar(10)
Alter Table Alunos Add Complemento VarChar(50)
Alter Table Alunos Add Bairro VarChar(50)
Alter Table Alunos Add Cidade VarChar(50)

--------------------------------------------------------------------------------------------


/* Brincadeiras/Testes de Conversão

Select GetDate()

-- Convert(TipoDeDados, O_Que_Eu_Quero_Converter)
Select Convert(Date, GetDate())
Select Convert(int, '25abc')
Select Day('03/05/2019')
Select Month('03/05/2019')
Select Year('03/05/2019')
                   -- aaaa-mm-dd
Select Convert(Date, '2020-05-31') -- Formato padrão (SEMPRE funciona)
Select Convert(Date, '31/05/2020') -- Funciona se estiver em português
Select Convert(Date, '05/31/2020') -- Funciona se estiver em inglês
Select Convert(Date, 'xpto')
*/
