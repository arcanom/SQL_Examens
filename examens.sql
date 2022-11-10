create database examens;

use examens;

create table dossier_inscription (
do_id int not null auto_increment,
do_numero int not null,
primary key(do_id),
el_id int
);

create table eleve (
el_id int not null auto_increment,
el_nom varchar(32),
el_prenom varchar(32),
el_datenaiss date,
primary key(el_id),
et_id int  ,
ex_id int 

);

create table etablissement(
et_id int not null auto_increment,
et_nom varchar(32),
et_adresse varchar(50),
et_ville varchar(32),
primary key(et_id)
);

create  table examen(
ex_id int not null auto_increment,
ex_nom varchar(32),
ex_date date,
primary key(ex_id)
);



create table enseignant(
es_id int not null auto_increment,
es_nom varchar(32),
es_adresse varchar(50),
es_ville varchar(32),
primary key(es_id),
el_id int
);

create table epreuve(
ep_id int not null auto_increment,
ep_nom varchar(32),
ep_coeff float,
ep_date date,
primary key(ep_id),
ex_id int
);

alter table dossier_inscription
add foreign key (el_id) references eleve (el_id);

alter table eleve
add foreign key(et_id)
references etablissement (et_id);

alter table eleve
add foreign key(ex_id)
references examen (ex_id);


alter table enseignant 
add foreign key(el_id)
references etablissement (el_id);

alter table epreuve
add foreign key(ex_id)
references examen (ex_id);


create table eleve_epreuve(
note float,
el_id int,
foreign key(el_id)
references eleve (el_id),
ep_id int,
foreign key(ep_id)
references epreuve (ep_id)
);

create table enseignant_redige_epreuve(
es_id int,
foreign key(es_id)
references enseignant(es_id),
ep_id int  ,
foreign key(ep_id)
references epreuve (ep_id)

);

create table enseignant_corrige_epreuve(
es_id int,
foreign key(es_id)
references enseignant(es_id),
ep_id int,
foreign key(ep_id)
references epreuve (ep_id)

);