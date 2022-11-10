CREATE DATABASE agendabd;
USE agendabd;

CREATE TABLE contato (
  ID_cont INT PRIMARY KEY AUTO_INCREMENT,
  NOME            VARCHAR(100) NOT NULL,
  SOBRENOME         VARCHAR(100),
  DATA_NASCIMENTO DATE
 );

CREATE TABLE telefone(
  ID_tel INT PRIMARY KEY AUTO_INCREMENT,
  NUMERO VARCHAR(20) NOT NULL,
  TIPO   VARCHAR(20) NOT NULL
  );

CREATE TABLE email (
  ID_ema INT PRIMARY KEY AUTO_INCREMENT,
  ENDERECO VARCHAR(100) NOT NULL,
  TIPO     VARCHAR(20)  NOT NULL
);
/*Inserindo uma coluna da tabela*/
ALTER TABLE telefone ADD COLUMN fk_ID_cont INT;
ALTER TABLE email ADD COLUMN ID_cont INT;

/*O comando Alter pode tanto aletar para inserir como Excluir uma coluna da tabela*/
ALTER TABLE telefone DROP COLUMN ID_cont;

/*alterando a tabela telefone e add foreign key*/
ALTER TABLE telefone ADD CONSTRAINT  fk_ID_cont
FOREIGN KEY(fk_ID_cont) REFERENCES contato(ID_cont);

/*alterando a tabela Email e add foreign key*/
ALTER TABLE email ADD CONSTRAINT  ID_cont
FOREIGN KEY(ID_cont) REFERENCES contato(ID_cont);

/*descrevendo todas as tabela*/
show tables;

/*Excluir uma  tabela*/
DROP TABLE contato;  
/*Excluir um Banco de Dados*/
drop database AGENDABD;
/*Irá contar a quantidade de emails inseridos na tabela Banco de Dados*/
SELECT COUNT(*) FROM contato;

/*O comando INSERT INTO irá inserir dados na tabela Banco de Dados, é possível inserir 
mais de um registro em apenas um INSERT INTO, vide exemplo*/
INSERT INTO contato( NOME, SOBRENOME, DATA_NASCIMENTO) 
VALUES('Italo', 'Nunes', '1989-03-24'),
      ('Gessica', 'Miron', '1991-05-22');
      
  /*Excluir um registro de uma tabela*/  
DELETE FROM contato WHERE ID_cont=2;
  
  /*Listar o conteúdo de uma tabela*/    
  SELECT * FROM contato;
  
   /*Usando Inner Join nas tabelas*/   
SELECT c.ID_cont, c.NOME, c.SOBRENOME, t.NUMERO 
FROM contato c
INNER JOIN telefone t ON c.ID_cont = t.ID_tel;

/*Usando left Join nas tabelas*/
SELECT c.ID_cont, c.NOME, c.SOBRENOME, t.NUMERO 
FROM contato c
LEFT JOIN telefone t ON c.ID_cont = t.ID_tel;

/*Usando rigth Join nas tabelas*/
SELECT c.ID_cont, c.NOME, c.SOBRENOME, t.NUMERO 
FROM contato c
RIGHT JOIN telefone t ON c.ID_cont = t.ID_tel;

/*Usando cross Join nas tabelas*/
SELECT c.ID_cont, c.NOME, c.SOBRENOME, t.NUMERO 
FROM contato c
CROSS JOIN telefone t ON c.ID_cont = t.ID_tel;

/*Unindo tabelas, para isso é necessário chamar "atributos" que seja
parecidos em ambas as tabelas*/
SELECT ID_cont FROM contato
UNION
SELECT ID_ema FROM email;

/*Usando UNION nos Joins nas tabelas*/
SELECT c.ID_cont, c.NOME, c.SOBRENOME, t.NUMERO 
FROM contato c
CROSS JOIN telefone t ON c.ID_cont = t.ID_tel
UNION
SELECT c.ID_cont, c.NOME, c.SOBRENOME, t.NUMERO 
FROM contato c
LEFT JOIN telefone t ON c.ID_cont = t.ID_tel;

/*Usando Allias para trazer nome diferente em um único campo da tabela apenas para uma única consulta*/
SELECT SOBRENOME AS SEGUNDO_NOME
FROM contato;

  /*Usando Allias para trazer mais de um nome diferente na tabela 
  lembrando que ele seguirá a ordem de solicitação, buscando primeiro da 
  esquerda para direita apenas para uma única consulta*/
SELECT SOBRENOME AS SEGUNDO_NOME, NOME AS APELIDO
FROM contato; 

/*Usando Allias com a consição WHERE para buscar um resultado especifico a partir do ID na tabela.
A regra antes da condição WHERE de busca, segue a regra logo acima*/
SELECT SOBRENOME AS SEGUNDO_NOME, NOME AS APELIDO
FROM contato WHERE ID_cont = 1;
  