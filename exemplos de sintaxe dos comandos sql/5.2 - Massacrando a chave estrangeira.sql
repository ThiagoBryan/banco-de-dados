Create Database ControleDePessoas
Use ControleDePessoas

Create Table Pessoa
(
 IdPessoa int Identity Primary Key,
 Nome VarChar(100),
 Telefone VarChar(100)
)
Insert Into Pessoa (Nome) Values ('Pedro'), ('Jos�')
Select * From Pessoa

Create Table PessoaEndereco
(
 IdPessoaEndereco int Identity Primary Key,
 Logradouro VarChar(100),
 Bairro VarChar(30),
 IdPessoa int REFERENCES Pessoa (IdPessoa) ON DELETE CASCADE
)

      
Insert Into PessoaEndereco (Bairro, IdPessoa) 
Values ('Comary',300)
Select * From PessoaEndereco
------------------------------------------------------------

Delete From Pessoa Where IdPessoa = 1

Update PessoaEndereco
Set Logradouro = 'Rua', Bairro = 'S�o Pedro'
Where
  IdPessoaEndereco = 2

Update PessoaEndereco Set IdPessoa = 2 Where IdPessoa = 1 and Bairro = 'S�o Pedro'
Update PessoaEndereco Set IdPessoa = 2589 Where IdPessoa = 2 and Bairro = 'S�o Pedro'
-----------------------------------------------------------------

Delete From Pessoa Where IdPessoa = 2
Delete From PessoaEndreco Where IdPessoa = 2