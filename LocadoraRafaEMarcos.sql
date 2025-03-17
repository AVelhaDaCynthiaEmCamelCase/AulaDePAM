/*Alunos: Marcos Ferreira Teodoro Alves 
          Rafael Martins Nogueira*/


CREATE DATABASE LocadoraDeVideo

USE LocadoraDeVideo

CREATE TABLE Cliente(CodCli NUMBER(4) CONSTRAINT cli_cod_pk PRIMARY KEY,
                     Prenome VARCHAR(10) CONSTRAINT cli_pro_nn NOT NULL,
                     Sobrenome VARCHAR(25) CONSTRAINT cli_sob_nn NOT NULL,
                     Endereco VARCHAR(75) CONSTRAINT cli_ende_nn NOT NULL,
                     Telefone CHAR(10) CONSTRAINT cli_tel_nn NOT NULL,
                     fk_dvd_cli NUMBER(4) CONSTRAINT cli_dvd_fk references DVD);
                
CREATE TABLE DVD(NumDVD NUMBER(4) CONSTRAINT dvd_num_pk PRIMARY KEY,
                 Tipo VARCHAR(20) CONSTRAINT dvd_tipo_nn NOT NULL,
                 fk_cli_dvd NUMBER(4) CONSTRAINT dvd_cli_fk references Cliente);

CREATE TABLE Cli_DVD(DataRet DATE CONSTRAINT clidvd_dare_nn NOT NULL,
                     DataDev DATE CONSTRAINT clidvd_dade_nn NOT NULL,
                     fk_dvd_clidvd NUMBER(4) CONSTRAINT clidvd_dvd_fk references DVD,
                     fk_cli_clidvd NUMBER(4) CONSTRAINT clidvd_cli_fk references Cliente);

CREATE TABLE Filme(CodFilme NUMBER(4) CONSTRAINT filme_cod_pk PRIMARY KEY,
                   Titulo VARCHAR(208) CONSTRAINT filme_tit_nn NOT NULL,
                   fk_dvd_filme NUMBER(4) CONSTRAINT filme_dvd_fk references DVD,
                   fk_ator_filme NUMBER(4) CONSTRAINT filme_ator_fk references Ator);

CREATE TABLE Ator(CodAtor NUMBER(4) CONSTRAINT ator_cod_pk PRIMARY KEY,
                  Nome_popular VARCHAR(20) CONSTRAINT ator_nopo_nn NOT NULL,
                  Nome_Artistico VARCHAR(75) CONSTRAINT ator_noar_nn NOT NULL,
                  DataNasc Date CONSTRAINT ator_datanasc_nn NOT NULL,
                  fk_filme_ator NUMBER(4) CONSTRAINT ator_filme_fk references Filme);

CREATE TABLE Categoria(CodCateg NUMBER(4) CONSTRAINT categ_cod_pk PRIMARY KEY,
                       Descricao VARCHAR(900) CONSTRAINT cat_desc_nn NOT NULL,
                       fk_filme_categ NUMBER(4) CONSTRAINT categ_filme_fk references Filme);