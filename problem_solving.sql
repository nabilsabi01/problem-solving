create database problem_solving;
use problem_solving;
create table Invités(
	id_invite int primary key not null,
    nom varchar(255),
    statut varchar(255)
);

INSERT INTO Invités(id_invite, nom, statut) VALUES (1,
'Jean Dupont'
,
'Suspect');
INSERT INTO Invités (id_invite, nom, statut) VALUES (2,
'Marie Curie'
,
'Innocent');
INSERT INTO Invités (id_invite, nom, statut) VALUES (3,
'Albert Einstein'
,
'Suspect');
INSERT INTO Invités (id_invite, nom, statut) VALUES (4,
'Isaac Newton'
,
'Innocent');
INSERT INTO Invités (id_invite, nom, statut) VALUES (5,
'Niels Bohr'
,
'Suspect');

create table rooms(
	id_room int primary key not null,
    nom varchar(255)
);

INSERT INTO rooms (id_room, nom) VALUES (1,
'Salle de Bal');
INSERT INTO rooms (id_room, nom) VALUES (2,
'Bibliothèque');
INSERT INTO rooms (id_room, nom) VALUES (3,
'Cuisine');
INSERT INTO rooms (id_room, nom) VALUES (4,
'Salon');
INSERT INTO rooms (id_room, nom) VALUES (5,
'Jardin');

create table Mouvements(
	id_mouvement int primary key not null,
    id_invite int,
    room_id int,
    dateM date,
    foreign key(id_invite) references Invités(id_invite),
    foreign key(room_id) references Rooms(id_room)
);

INSERT INTO Movements (id_mouvement, id_invite, room_id, dateM) VALUES
(1,1, 1, '2023-06-01'),
(2,2, 1, '2023-06-01'),
(3,3, 2, '2023-06-01'),
(4,4, 3, '2023-06-01'),
(5,1, 2, '2023-06-02');


create table Objets(
	id_objet int primary key not null,
    nom_objet varchar(255),
    id_room int,
	foreign key(id_room) references Rooms(id_room)
);

INSERT INTO Objets (id_objet, nom_objet, id_room) VALUES (1,
'Vase Ancien'
, 1);
INSERT INTO Objets (id_objet, nom_objet, id_room) VALUES (2,
'Tableau de Maître'
, 2);
INSERT INTO Objets (id_objet, nom_objet, id_room) VALUES (3,
'Statue en Bronze'
, 3);
INSERT INTO Objets (id_objet, nom_objet, id_room) VALUES (4,
'Coffre à Bijoux'
, 2);
INSERT INTO Objets (id_objet, nom_objet, id_room) VALUES (5,
'Lampe en Cristal'
, 4);

create table Indices(
	id_indice int primary key not null,
    description varchar(255),
    id_room int,
	foreign key(id_room) references Rooms(id_room)
);
INSERT INTO Indices (id_indice, description, id_room) VALUES (1,
'Empreintes de pas trouvées près du vase'
, 1);
INSERT INTO Indices (id_indice, description, id_room) VALUES (2,
'Traces de sang sur la table'
, 2);
INSERT INTO Indices (id_indice, description, id_room) VALUES (3,
'Foulard déchiré retrouvé sur le sol'
, 3);
INSERT INTO Indices (id_indice, description, id_room) VALUES (4,
'Clé ancienne trouvée sous le canapé'
, 4);
INSERT INTO Indices (id_indice, description, id_room) VALUES (5,
'Bijou abandonné dans le jardin'
, 5);


/*Q1*/
select * from Invités;
/*Q2*/
select nom, statut from Invités;
/*Q3*/
select count(*) from Invités;
/*Q4*/
select count(*) from Invités where statut = 'Suspect';
/*Q8*/
select * from Movements order by dateM;
/*Q9*/ 
select count(m.id_mouvement) , i.nom from Mouvements m left join Invités on m.id_invite = v.id_invite;



