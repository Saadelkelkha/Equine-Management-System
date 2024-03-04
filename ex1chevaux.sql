mysql> create database chevaux;
Query OK, 1 row affected (0.07 sec)

mysql> use chevaux;
Database changed
mysql> create table personne(
    -> id_personne int primary key,
    -> nom varchar(15),
    -> prenom varchar(15),
    -> adresse varchar(45),
    -> telephone varchar(15),
    -> fonction enum('directeur','secrétaire','éleveur','comptable','propriétaire','entretien','éleveur-propriétaire'),
    -> id_Encadrant int)
    -> ;
Query OK, 0 rows affected (0.13 sec)

mysql> create table cheval(
    -> id_cheval int primary key,
    -> nom varchar(15),
    -> couleur varchar(15),
    -> no_tatouage int unique,
    -> id_female int,
    -> id_male int,
    -> id_personne int,
    -> id_race int,
    -> id_proprietaire int);
Query OK, 0 rows affected (0.07 sec)

mysql> create table cheval_concours(
    -> id_cheval int,
    -> nom varchar(15),
    -> place int);
Query OK, 0 rows affected (0.04 sec)

mysql> create table race(
    -> id_race int primary key,
    -> poid_type varchar(15),
    -> taille_type varchar(15));
Query OK, 0 rows affected (0.04 sec)

mysql> create table concours(
    -> nom varchar(15) primary key,
    -> No_participants int);
Query OK, 0 rows affected (0.04 sec)

mysql> create table Transaction(
    -> id_transaction int primary key,
    -> prix decimal,
    -> id_cheval int,
    -> id_vendeur int,
    -> id_acheteur int);
Query OK, 0 rows affected (0.04 sec)

mysql> create table Evolution(
    -> id_evolution int primary key,
    -> mois date,
    -> poid decimal,
    -> taille decimal,
    -> id_cheval int);
Query OK, 0 rows affected (0.04 sec)

mysql> alter table evolution
    -> add foreign key (id_cheval) references cheval(id_cheval);
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table evolution
    -> ;
Query OK, 0 rows affected (0.00 sec)

mysql> alter table transaction
    -> add foreign key (id_cheval) references cheval(id_cheval);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table transaction
    -> add foreign key (id_vendeur) references personne(id_personne);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table transaction
    -> add foreign key (id_acheteur) references personne(id_personne);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table cheval_concours
    -> add primary key(id_cheval,nom);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table cheval_concours
    -> add foreign key (id_cheval) references cheval(id_cheval);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table transaction
    -> add foreign key (nom) references concours(nom);

mysql> alter table concours
    -> add index nom_index (nom);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table concours
    -> add foreign key (nom) references concours(nom);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table cheval
    -> add foreign key (id_personne) references personne(id_personne);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table cheval
    -> add foreign key (id_female) references cheval(id_cheval);
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table cheval
    -> add foreign key (id_male) references cheval(id_cheval);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table cheval
    -> add foreign key (id_race) references race(id_race);
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table cheval
    -> add foreign key (id_proprietaire) references personne(id_personne);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table personne
    -> add foreign key (id_encadrant) references personne(id_personne);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0