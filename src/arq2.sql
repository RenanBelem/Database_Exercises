/*Exemplo adotado durante a aula para trabalharmos juntos o passo-a-passo para a construcao do Modelo Fisico

  Exercicio proposto no slide 21
*/

create database AULA20220516;
use AULA20220516;

create table TBDepartamento(
     cod int,
     nome varchar(50),
     primary key (cod));
     
insert into TBDepartamento 
    values (1, "Computação");
    
create table TBDisciplina(
    cod int,
    nome varchar(50),
    coddepto int,
    primary key(cod),
    foreign key (coddepto) 
        references TBDepartamento(cod));
    
insert into TBDisciplina values (1,"BD",1);
insert into TBDisciplina values (3,"CD",1);
insert into TBDisciplina values (4,"EXP1",1);
insert into TBDisciplina values (6,"EXP2",1);
insert into TBDisciplina values (7,"Big Data",1);

create table TBPrerequisito(
      E int,
      TEM int,
      primary key(E,TEM),
      foreign key (E) references TBDisciplina(cod),
      foreign key (TEM) references TBDisciplina(cod));
  
  insert into TBPrerequisito Values (1,3);
  insert into TBPrerequisito Values (4,6);
  insert into TBPrerequisito Values (1,7);

create table TBCurso(
   cod int,
   nome varchar (100),
   primary key (cod));

insert into TBCurso values (1,"TIC");
insert into TBCurso values (2,"Seguranca");
insert into TBCurso values (5,"Logistica");   
   
create table TBAluno(
   mat int,
   nome varchar (100),
   codcurso int,
   data_matricula date,
   primary key (mat),
   foreign key(codcurso) references TBCurso(cod));  
   
insert into TBAluno values (1,"Deborah", 1, "2022/05/02");
insert into TBAluno values (2,"Joao", 1, "2022/05/02");
insert into TBAluno values (3,"Beatriz", 1,"2022/05/02");
insert into TBAluno values (4,"Julio", 2,"2022/05/02");
insert into TBAluno values (5,"Tulio", 2,"2021/05/02");
insert into TBAluno values (6,"Joao das couves", 2,"2021/05/02");

create table TBDisc_Curso(
   cod_disc int,
   cod_curso int,
   primary key (cod_curso,cod_disc),
   foreign key(cod_curso) references TBCurso(cod),
   foreign key(cod_disc) references TBDisciplina(cod));
   
insert into TBDisc_Curso values (1,1);
insert into TBDisc_Curso values (1,2);

/*quantos alunos por curso
  produto cartesiano*/
Select c.nome, count(*)
from TBCurso c, TBAluno a
where c.cod=a.codcurso
group by c.nome
order by c.nome;

/*quantos alunos por curso
  Inner join*/
Select c.nome, count(*)
from TBCurso c
inner join TBAluno a
   on c.cod=a.codcurso
group by c.nome
order by c.nome;


/*quais estudantes se matricularam antes de 2022*/

select nome
from TBAluno
where year(data_matricula)< 2022;

/*quais disciplinas nao tem prerequisito*/

select nome
from TBDisciplina
where cod not in
      ( select tem
		from TBPrerequisito);

/*quais estudantes tem o nome iniciando com a letra "J" */
Select Nome
from TBAluno
where nome like "J%";
