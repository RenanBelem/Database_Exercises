create database EMPRESA;
use EMPRESA;

create table TBDepartamento(
	Numero int,
    Nome varchar (100),
    sigla char (4),
    primary key (numero));
    
insert into TBDepartamento values (1, "Especificacao de Novos Projetos", "EDNP");
insert into TBDepartamento values (2, "Acompanhamento de Projetos", "ACDP");
insert into TBDepartamento values (3, "Fiscalizacao de Projetos", "FIDP");
insert into TBDepartamento values (4, "Gestao de Pessoas", "GEDP");
    
create table TBLocalizacao(
	Codigo int,
    Descricao varchar (100),
    primary key (Codigo));
   
insert into TBLocalizacao values (1, "Prado Velho");  
insert into TBLocalizacao values (2, "Guabirotuba");  
insert into TBLocalizacao values (3, "Jardim Botanico");  
insert into TBLocalizacao values (4, "Cristo Rei");  
insert into TBLocalizacao values (5, "Vila Guaira");  

create table TBDepartamento_Localizacao(
	Numero int,
    Codigo int,
    foreign key(Numero) references TBDepartamento(Numero),
    foreign key(Codigo) references TBLocalizacao(Codigo),
    primary key (numero, codigo));   
    
insert into TBDepartamento_Localizacao values (1, 1);  
insert into TBDepartamento_Localizacao values (1, 2);   
insert into TBDepartamento_Localizacao values (2, 3);  
insert into TBDepartamento_Localizacao values (3, 3);
insert into TBDepartamento_Localizacao values (4, 5);
insert into TBDepartamento_Localizacao values (1, 4);

 create table TBSexo(
	Codigo int,
    Descricao varchar (20),
    primary key (Codigo));
    
insert into TBSexo values (1, "Feminino");
insert into TBSexo values (2, "Masculino");
insert into TBSexo values (3, "Nao binario");
    
create table TBEmpregado(
	Numero_BI int,
    Pre_nome varchar (100),
    Sobrenome varchar (100),
    End_Rua varchar (100),
    End_Numero varchar (20),
    End_CEP char (8),
    CPF char (11),
    sexo int,
    Numero_BI_supervisor int,
    Depto_numero int,
    primary key (Numero_BI),
    foreign key (Numero_BI_supervisor) references TBEmpregado (NUmero_BI),
    foreign key (sexo) references TBSexo(codigo));    
    
insert into TBEmpregado values (1, "Joao", "Couves", "R 123 de oliveira 4", 378, 
        "80000000", "11111111111", 2, NULL, 1);
insert into TBEmpregado values (2, "Joaquim", "Martinr", "R das Flores", 3, 
        "80000000", "11111111111", 2, 1, 1);
insert into TBEmpregado values (3, "Paulo", "Silva", "R Machado", 54, 
        "80000000", "11111111111", 2, 1, 1);
insert into TBEmpregado values (4, "Beatriz", "Marcondes", "Av Luz", 34, 
        "80000000", "11111111111", 1, NULL, 2);
insert into TBEmpregado values (5, "Joao", "Gouveia", "Travessa Pinheiro", 135, 
        "80000000", "11111111111", 2, 2, 1);     
insert into TBEmpregado values (6, "Marcos", "Vinicius", "R 13 de abril", 435, 
        "80000000", "11111111111", 2, 2, 1);
insert into TBEmpregado values (7, "Ana", "Silva", "R Paineiras", 355, 
        "80000000", "11111111111", 1, NULL, 3);
insert into TBEmpregado values (8, "Juranda", "Oliveira", "R silvia", 3675, 
        "80000000", "11111111111", 1, NULL, 4);
insert into TBEmpregado values (10, "Felipe", "Couves", "R 123 de oliveira 4", 35, 
        "80000000", "11111111111", 2, 3, 1);
        
create table TBGerencia(
    Numero_depto int,
    Numero_BI int,
    Data_inicio date,
    primary key (Numero_depto, Numero_BI),
    foreign key (Numero_BI) references TBEmpregado (NUmero_BI),
    foreign key(Numero_depto) references TBDepartamento(Numero));
    
insert into TBGerencia values (1, 1, "2021/01/10");
insert into TBGerencia values (2, 4, "2021/01/10");
insert into TBGerencia values (3, 7, "2021/01/10");
insert into TBGerencia values (4, 8, "2021/01/10");   

 create table TBProjeto(
    numero int,
    nome varchar(100),
    codigo_localizacao int,
    numero_depto int,
    primary key(numero),
    foreign key(Numero_depto) references TBDepartamento(Numero),
    foreign key(Codigo_localizacao) references TBLocalizacao(Codigo));
   
insert into TBProjeto values (1, "Casa do Colono Migrante", 1, 1);
insert into TBProjeto values (2, "Recuoeracao do Pinheirao", 1, 1);
insert into TBProjeto values (3, "Teatro Paiol", 1, 2);
insert into TBProjeto values (4, "Praca Espanha", 1, 2);
insert into TBProjeto values (5, "Praca Italia", 3, 2);
insert into TBProjeto values (6, "Av Candico de Abreu", 3, 2);
insert into TBProjeto values (7, "Mercado MUnicipal", 1, 2);
insert into TBProjeto values (8, "Folha de Pagamento", 5, 4);

create table TBTrabalha(
    Numero_BI int,
    Numero_projeto int,
    NUmero_horas int,
    primary key(Numero_BI,Numero_projeto),
    foreign key (Numero_BI) references TBEmpregado (NUmero_BI),
    foreign key (Numero_Projeto) references TBProjeto (NUmero));

insert into TBTRabalha values (2, 1, 30);
insert into TBTRabalha values (2, 2, 20);
insert into TBTRabalha values (3, 1, 10);
insert into TBTRabalha values (3, 3, 30);
insert into TBTRabalha values (5, 5, 40);
insert into TBTRabalha values (6, 7, 30);
insert into TBTRabalha values (6, 6, 30);
insert into TBTRabalha values (10, 8, 40);
    
create table TBGrau(
	Codigo int,
    Descricao varchar (20),
    primary key (Codigo));

insert into TBGrau values (1, "Conjuge");
insert into TBGrau values (2, "Filho/a");
insert into TBGrau values (3, "Pai");
insert into TBGrau values (4, "Mae");
insert into TBGrau values (5, "Irmao");
    
create table TBDependente(
    Numero_BI int,
    Sequencia int,
    Nome varchar(100),
    Grau int,
    Data_nasc date,
    primary key(Numero_BI,Sequencia),
    foreign key (Numero_BI) references TBEmpregado (NUmero_BI),
    foreign key (Grau) references TBGrau (codigo));

insert into TBDependente values (1, 1,"Joao das Couve JR", 2, "2015/05/31");
insert into TBDependente values (1, 2,"Maria das Couve JR", 2, "2015/05/31");
insert into TBDependente values (2, 1,"Joana Martins", 1, "2000/04/20");

        

-- Informacoes a serem extraidas

-- 1. quais sao os empregados que estao trabalhando mais de 40 horas por semana?

SELECT TBEmpregado.pre_nome, TBEmpregado.sobrenome, sum(TBTrabalha.numero_horas)
	FROM TBEmpregado, TBTrabalha
    WHERE TBEmpregado.numero_BI = TBTrabalha.numero_BI
	GROUP BY (TBEmpregado.numero_BI)
    having sum(TBTrabalha.numero_horas) > 40;

-- 2. qual e o projeto que tem o maior numero de empregados?
   
SELECT TBProjeto.nome, count(*)
	FROM TBProjeto, TBTrabalha
    WHERE TBProjeto.numero = TBTrabalha.Numero_projeto
    GROUP BY TBProjeto.nome
    ORDER BY count(*) desc
    LIMIT 1;

-- 3. quais sao os empregados que tem filhos como dependentes?

  SELECT DISTINCT TBEmpregado.pre_nome, TBEmpregado.sobrenome
	FROM TBEmpregado, TBDependente
    WHERE TBEmpregado.numero_BI = TBDependente.Numero_BI
    AND TBDependente.grau = 2;
    
    
    

    
    