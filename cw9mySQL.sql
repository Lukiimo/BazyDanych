create database Tabele2;
create schema geo;

#tabela

create table geo.GeoEon(id_eon int primary key,nazwa_eon varchar(30));

create table geo.GeoEra( id_era int primary key, nazwa_era varchar(30),	id_eon int, foreign key (id_eon) references geo.GeoEon(id_eon));

create table geo.GeoOkres(id_okres int primary key, nazwa_okres varchar(30),id_era int, foreign key (id_era) references geo.GeoEra(id_era));

create table geo.GeoEpoka( id_epoka int primary key, nazwa_epoka varchar(30),id_okres int, foreign key (id_okres) references geo.GeoOkres(id_okres));

create table geo.GeoPietro(id_pietro int primary key, nazwa_pietro varchar(30),	id_epoka int, foreign key (id_epoka) references geo.GeoEpoka(id_epoka));

select * from geo.GeoOkres;



#dane
select * from geo.geopietro;

insert into geo.GeoEon values(1,'fanerozoik');

insert into geo.GeoEra values(1,'paleozoik',1);
insert into geo.GeoEra values(2,'mezozoik',1);
insert into geo.GeoEra values(3,'kenozoik',1);

insert into geo.GeoOkres values(1, 'dewon',1);
insert into geo.GeoOkres values(2, 'karbon',1);
insert into geo.GeoOkres values(3, 'perm',1);
insert into geo.GeoOkres values(4, 'trias',2);
insert into geo.GeoOkres values(5, 'jura',2);
insert into geo.GeoOkres values(6, 'kreda',2);
insert into geo.GeoOkres values(7, 'palogen',3);
insert into geo.GeoOkres values(8, 'neogen',3);
insert into geo.GeoOkres values(9, 'czwartorzad',3);

insert into geo.GeoEpoka values(1, 'dolny', 1);
insert into geo.GeoEpoka values(2, 'srodkowy', 1);
insert into geo.GeoEpoka values(3, 'gorny', 1);
insert into geo.GeoEpoka values(4, 'dolny', 2);
insert into geo.GeoEpoka values(5, 'gorny', 2);
insert into geo.GeoEpoka values(6, 'dolny', 3);
insert into geo.GeoEpoka values(7, 'gorny', 3);
insert into geo.GeoEpoka values(8, 'dolny', 4);
insert into geo.GeoEpoka values(9, 'srodkowy', 4);
insert into geo.GeoEpoka values(10, 'gorny', 4);
insert into geo.GeoEpoka values(11, 'dolna', 5);
insert into geo.GeoEpoka values(12, 'srodkowa', 5);
insert into geo.GeoEpoka values(13, 'gorna', 5);
insert into geo.GeoEpoka values(14, 'dolna', 6);
insert into geo.GeoEpoka values(15, 'gorna', 6);
insert into geo.GeoEpoka values(16, 'paleocen', 7);
insert into geo.GeoEpoka values(17, 'eocen', 7);
insert into geo.GeoEpoka values(18, 'oligocen', 7);
insert into geo.GeoEpoka values(19, 'miocen', 8);
insert into geo.GeoEpoka values(20, 'pliocen', 8);
insert into geo.GeoEpoka values(21, 'plejstocen', 9);
insert into geo.GeoEpoka values(22, 'holocen', 9);

insert into geo.GeoPietro values (1,'megalaj',22);
insert into geo.GeoPietro values(2,'nortgryp',22);
insert into geo.GeoPietro values(3,'grenland',22);
insert into geo.GeoPietro values(4,'tarant',21);
insert into geo.GeoPietro values(5,'chiban',21);
insert into geo.GeoPietro values(6,'kalabr',21);
insert into geo.GeoPietro values(7,'gelas',21);
insert into geo.GeoPietro values(8,'piacent',20);
insert into geo.GeoPietro values(9,'zankl',20);
insert into geo.GeoPietro values(10,'messyn',19);
insert into geo.GeoPietro values(11,'torton',19);
insert into geo.GeoPietro values(12,'serrawal',19);
insert into geo.GeoPietro values(13,'lang',19);
insert into geo.GeoPietro values(14,'burdyga',19);
insert into geo.GeoPietro values(15,'akwitan',19);
insert into geo.GeoPietro values(16,'szat',18);
insert into geo.GeoPietro values(17,'rupel',18);
insert into geo.GeoPietro values(18,'priabon',17);
insert into geo.GeoPietro values(19,'barton',17);
insert into geo.GeoPietro values(20,'lutet',17);
insert into geo.GeoPietro values(21,'iprez',17);
insert into geo.GeoPietro values(22,'tanet',16);
insert into geo.GeoPietro values(23,'zeland',16);
insert into geo.GeoPietro values(24,'dan',16);
insert into geo.GeoPietro values(25,'mastrycht',15);
insert into geo.GeoPietro values(26,'kampan',15);
insert into geo.GeoPietro values(27,'santon',15);
insert into geo.GeoPietro values(28,'koniak',15);
insert into geo.GeoPietro values(29,'turon',15);
insert into geo.GeoPietro values(30,'cenoman',15);
insert into geo.GeoPietro values(31,'alb',14);
insert into geo.GeoPietro values(32,'apt',14);
insert into geo.GeoPietro values(33,'barrem',14);
insert into geo.GeoPietro values(34,'hoteryw',14);
insert into geo.GeoPietro values(35,'walanzyn',14);
insert into geo.GeoPietro values(36,'berrias',14);
insert into geo.GeoPietro values(37,'tyton',13);
insert into geo.GeoPietro values(38,'kimeryd',13);
insert into geo.GeoPietro values(39,'oksford',13);
insert into geo.GeoPietro values(40,'kelowej',12);
insert into geo.GeoPietro values(41,'baton',12);
insert into geo.GeoPietro values(42,'bajos',12);
insert into geo.GeoPietro values(43,'aalen',12);
insert into geo.GeoPietro values(44,'toark',11);
insert into geo.GeoPietro values(45,'pliensbach',11);
insert into geo.GeoPietro values(46,'synemur',11);
insert into geo.GeoPietro values(47,'hettang',11);
insert into geo.GeoPietro values(48,'retyk',10);
insert into geo.GeoPietro values(49,'noryk',10);
insert into geo.GeoPietro values(50,'karnik',10);
insert into geo.GeoPietro values(51,'ladyn',9);
insert into geo.GeoPietro values(52,'anizyk',9);
insert into geo.GeoPietro values(53,'olenek',8);
insert into geo.GeoPietro values(54,'ind',8);
insert into geo.GeoPietro values(55,'czangsing',7);
insert into geo.GeoPietro values(56,'wucziaping',7);
insert into geo.GeoPietro values(57,'kapitan',7);
insert into geo.GeoPietro values(58,'word',7);
insert into geo.GeoPietro values(59,'road',7);
insert into geo.GeoPietro values(60,'kungur',6);
insert into geo.GeoPietro values(61,'artinsk',6);
insert into geo.GeoPietro values(62,'sakmar',6);
insert into geo.GeoPietro values(63,'assel',6);
insert into geo.GeoPietro values(64,'gzel',5);
insert into geo.GeoPietro values(65,'kasimow',5);
insert into geo.GeoPietro values(66,'moskow',5);
insert into geo.GeoPietro values(67,'baszkir',5);
insert into geo.GeoPietro values(68,'serpuchow',4);
insert into geo.GeoPietro values(69,'wizen',4);
insert into geo.GeoPietro values(70,'turnej',4);
insert into geo.GeoPietro values(71,'famen',3);
insert into geo.GeoPietro values(72,'fran',3);
insert into geo.GeoPietro values(73,'zywet',2);
insert into geo.GeoPietro values(74,'eifel',2);
insert into geo.GeoPietro values(75,'ems',1);
insert into geo.GeoPietro values(76,'prag',1);
insert into geo.GeoPietro values(77,'lochkow',1);




#nieznaturalizowana tabela
CREATE TABLE geo.GeoTabela AS (SELECT * FROM geo.geopietro NATURAL JOIN geo.geoepoka NATURAL
JOIN geo.geookres NATURAL JOIN geo.geoera NATURAL JOIN geo.geoeon );

select * from geo.GeoPietro;
ALTER TABLE geo.GeoTabela ADD PRIMARY KEY(ID_pietro);

create table geo.Dziesiec(cyfra int,bit int);

insert into geo.Dziesiec values (0,1);
insert into geo.Dziesiec values (1,1);
insert into geo.Dziesiec values (2,1);
insert into geo.Dziesiec values (3,1);
insert into geo.Dziesiec values (4,1);
insert into geo.Dziesiec values (5,1);
insert into geo.Dziesiec values (6,1);
insert into geo.Dziesiec values (7,1);
insert into geo.Dziesiec values (8,1);
insert into geo.Dziesiec values (9,1);
select * from geo.Dziesiec;


#tabela milion
create table geo.Milion(liczba int,cyfra int, bit int);

INSERT INTO geo.milion select a1.cyfra+10*a2.cyfra+100*a3.cyfra+1000*a4.cyfra
+10000*a5.cyfra+10000*a6.cyfra as liczba, a1.cyfra as cyfra, a1.bit as bit
from geo.dziesiec a1, geo.dziesiec a2, geo.dziesiec a3, geo.dziesiec a4, geo.dziesiec a5, geo.dziesiec a6;
select * from geo.Milion;


#Zapytanie 1 (1 ZL)
SELECT COUNT(*) FROM geo.Milion INNER JOIN geo.GeoTabela ON
(mod(Milion.liczba,77)=(GeoTabela.id_pietro));

#Zapytanie 2 (2 ZL)
SELECT COUNT(*) FROM geo.Milion INNER JOIN geo.GeoPietro ON
(mod(Milion.liczba,77)=geo.GeoPietro.id_pietro) NATURAL JOIN geo.GeoEpoka NATURAL JOIN
geo.GeoOkres NATURAL JOIN geo.GeoEra NATURAL JOIN geo.GeoEon;

#Zapytanie 3 (3 ZG)
SELECT COUNT(*) FROM geo.Milion WHERE mod(Milion.liczba,77)=
(SELECT id_pietro FROM geo.GeoTabela WHERE mod(Milion.liczba,68)=(id_pietro));

#Zapytanie 4 (4 ZG)
SELECT COUNT(*) FROM geo.Milion WHERE mod(Milion.liczba,77) in
(SELECT geo.GeoPietro.id_pietro FROM geo.GeoPietro NATURAL JOIN geo.GeoEpoka
    NATURAL JOIN geo.GeoOkres NATURAL JOIN geo.GeoEra NATURAL JOIN geo.GeoEon);


#tworzenie indeksów;

create index indxEon on geo.GeoEon(id_eon);
create index indxEra on geo.GeoEra(id_era, id_eon);
create index indxOkres on geo.GeoOkres(id_okres, id_era);
create index indxEpoka on geo.GeoEpoka(id_epoka, id_okres);
create index indxPietro on geo.GeoPietro(id_pietro, id_epoka);

create index indxGeoTabela on geo.GeoTabela(id_pietro, id_epoka, id_era, id_okres,id_eon);

create index indxLiczba on geo.Milion(liczba);)
