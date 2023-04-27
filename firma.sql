--zad 1 Utwórz nową bazę danych nazywając ją firma1. 
create database firma1;

--zad 2 Dodaj schemat o nazwie ksiegowosc.
create schema ksiegowosc;

--zad 4 Dodaj cztery tabele: 
create table ksiegowosc.pracownicy(id_pracownika char(3) primary key, imie text NOT NULL, nazwisko text NOT NULL, adres text NOT NULL, telefon text NOT NULL);
create table ksiegowosc.godziny(id_godziny char(3) primary key, data date NOT NULL, liczba_godzin int NOT NULL, id_pracownika char(3) NOT NULL);
create table ksiegowosc.pensje(id_pensji char(3) primary key, stanowisko varchar(30), kwota money NOT NULL);
create table ksiegowosc.premie(id_premii char(3) primary key, rodzaj text, kwota money NOT NULL);
create table ksiegowosc.wynagrodzenie(id_wynagrodzenia char(3) primary key, data date NOT NULL, id_pracownika char(3) NOT NULL, id_godziny char(3) NOT NULL, id_pensji char(3) NOT NULL, id_premii char(3) NOT NULL);

alter table rozliczenia.pensje alter column id_pensji char(3) primary key, stanowisko varchar(30), kwota money NOT NULL;

--klucze glowne i obce
alter table ksiegowosc.godziny add foreign key (id_pracownika) references ksiegowosc.pracownicy(id_pracownika);

alter table ksiegowosc.wynagrodzenie add foreign key(id_pracownika) references ksiegowosc.pracownicy(id_pracownika);
alter table ksiegowosc.wynagrodzenie add foreign key(id_godziny) references ksiegowosc.godziny(id_godziny);
alter table ksiegowosc.wynagrodzenie add foreign key(id_pensji) references ksiegowosc.pensje(id_pensji);
alter table ksiegowosc.wynagrodzenie add foreign key(id_premii) references ksiegowosc.premie(id_premii);


--opisy/komentarze
EXEC sys.sp_addextendedproperty 
@name=N'Opis', 
@value=N'Tabela pracownicy',
@level0type=N'Schema', @level0name='ksiegowosc',
@level1type=N'Table', @level1name='pracownicy'
GO

SELECT value AS Opis
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.pracownicy')
  AND minor_id = 0
  AND class = 1;


EXEC sys.sp_addextendedproperty 
@name=N'Opis', 
@value=N'Tabela godziny',
@level0type=N'Schema', @level0name='ksiegowosc',
@level1type=N'Table', @level1name='godziny'
GO

SELECT value AS Opis
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.godziny')
  AND minor_id = 0
  AND class = 1;


EXEC sys.sp_addextendedproperty 
@name=N'Opis', 
@value=N'Tabela pensje',
@level0type=N'Schema', @level0name='ksiegowosc',
@level1type=N'Table', @level1name='pensje'
GO

SELECT value AS Opis
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.pensje')
  AND minor_id = 0
  AND class = 1;


EXEC sys.sp_addextendedproperty 
@name=N'Opis', 
@value=N'Tabela premie',
@level0type=N'Schema', @level0name='ksiegowosc',
@level1type=N'Table', @level1name='premie'
GO

SELECT value AS Opis
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.premie')
  AND minor_id = 0
  AND class = 1;


EXEC sys.sp_addextendedproperty 
@name=N'Opis', 
@value=N'Tabela wynagrodzenie',
@level0type=N'Schema', @level0name='ksiegowosc',
@level1type=N'Table', @level1name='wynagrodzenie'
GO

SELECT value AS Opis
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.wynagrodzenie')
  AND minor_id = 0
  AND class = 1;






--zad 5 Wypełnij każdą tabelę 10. rekordami.

insert into ksiegowosc.pracownicy values('A01', 'Czeslaw', 'Michniewicz', 'Sezamowa', '298409142');
insert into ksiegowosc.pracownicy values('A03', 'Tomasz', 'Gorik', 'Zelazowa', '344339545');
insert into ksiegowosc.pracownicy values('B09', 'Bartomiej', 'Lysy', 'Bienowska', '472492487');
insert into ksiegowosc.pracownicy values('D07', 'Piotr', 'Farmazon', 'Jabolowice', '426733812');
insert into ksiegowosc.pracownicy values('K18', 'Wiktor', 'Strzala', 'Kobierzyn', '748728942');
insert into ksiegowosc.pracownicy values('E02', 'Bartosz', 'Szczesinki', 'Balycka', '492604248');
insert into ksiegowosc.pracownicy values('G03', 'Lukasz', 'Firak', 'Choroszczanka', '5720424282');
insert into ksiegowosc.pracownicy values('M32', 'Robert', 'Lewogolski', 'Brandenburska', '523532935');
insert into ksiegowosc.pracownicy values('K24', 'Jan', 'Bezziemi', 'Krolewska', '863424653');
insert into ksiegowosc.pracownicy values('P64', 'Piotr', 'Wolski', 'Beczkowa', '863969147');

select * from ksiegowosc.pracownicy;


insert into ksiegowosc.godziny values('J03', '2023-04-15', 46 , 'A01');
insert into ksiegowosc.godziny values('T53', '2023-02-24', 66 , 'A03');
insert into ksiegowosc.godziny values('H44', '2023-02-10', 76 , 'B09');
insert into ksiegowosc.godziny values('T52', '2023-04-13', 23 , 'D07');
insert into ksiegowosc.godziny values('G32', '2023-04-07', 84 , 'K18');
insert into ksiegowosc.godziny values('B62', '2023-06-10', 44 , 'E02');
insert into ksiegowosc.godziny values('A23', '2023-02-05', 57 , 'G03');
insert into ksiegowosc.godziny values('J56', '2023-01-11', 85 , 'M32');
insert into ksiegowosc.godziny values('G73', '2023-02-23', 55 , 'K24');
insert into ksiegowosc.godziny values('P53', '2023-03-12', 8 , 'P64');

select * from ksiegowosc.godziny;


insert into ksiegowosc.pensje values('K42', 'programista', 4242.25);
insert into ksiegowosc.pensje values('G23', 'malarz', 6264);
insert into ksiegowosc.pensje values('F24', 'recznikowy', 6234);
insert into ksiegowosc.pensje values('F25', 'prezes', 4145);
insert into ksiegowosc.pensje values('G42', 'zastsepca_prezesa', 4245);
insert into ksiegowosc.pensje values('W24', 'wiceszef', 5232.25);
insert into ksiegowosc.pensje values('R23', 'kucharz', 7474.25);
insert into ksiegowosc.pensje values('K64', 'konserwator', 2434.25);
insert into ksiegowosc.pensje values('V34', 'kierowca', 4535 );
insert into ksiegowosc.pensje values('G43', 'kierowca', 2446);

select * from ksiegowosc.pensje;


insert into ksiegowosc.premie values('A11', 'wakacyjna', 900);
insert into ksiegowosc.premie values('A22', 'swiateczna', 400);
insert into ksiegowosc.premie values('A33', 'wyroznienie', 300);
insert into ksiegowosc.premie values('A44', 'swiateczna', 450);
insert into ksiegowosc.premie values('A55', 'swiateczna', 800);
insert into ksiegowosc.premie values('A66', 'wakacyjna', 500);
insert into ksiegowosc.premie values('A77', 'wakacyjna', 200);
insert into ksiegowosc.premie values('A88', 'swiateczna', 100);
insert into ksiegowosc.premie values('A99', 'wyroznienie', 400);
insert into ksiegowosc.premie values('A10', 'wakacyjna', 700);

select * from ksiegowosc.premie;


insert into ksiegowosc.wynagrodzenie values('G24', '2012-04-24', 'A01', 'J03', 'K42', 'A11');
insert into ksiegowosc.wynagrodzenie values('H63', '2023-01-24', 'A03', 'T53', 'G23', 'A22');
insert into ksiegowosc.wynagrodzenie values('G52', '2023-04-21', 'B09', 'H44', 'F24', 'A33');
insert into ksiegowosc.wynagrodzenie values('V32', '2023-02-21', 'D07', 'T52', 'F25', 'A44');
insert into ksiegowosc.wynagrodzenie values('V33', '2023-01-05', 'K18', 'G32', 'G42', 'A55');
insert into ksiegowosc.wynagrodzenie values('B32', '2023-02-25', 'E02', 'B62', 'W24', 'A66');
insert into ksiegowosc.wynagrodzenie values('J62', '2023-03-30', 'G03', 'A23', 'R23', 'A77');
insert into ksiegowosc.wynagrodzenie values('B62', '2023-03-26', 'M32', 'J56', 'K64', 'A88');
insert into ksiegowosc.wynagrodzenie values('E31', '2023-01-24', 'K24', 'G73', 'V34', 'A99');
insert into ksiegowosc.wynagrodzenie values('N72', '2023-02-04', 'P64', 'P53', 'G43', 'A10');

select * from ksiegowosc.wynagrodzenie;



--zad 6 
--a) Wyświetl tylko id pracownika oraz jego nazwisko.
select id_pracownika, nazwisko from ksiegowosc.pracownicy;

--b) Wyświetl id pracowników, których płaca jest większa niż 1000

select ksiegowosc.wynagrodzenie.id_pracownika, ksiegowosc.pensje.kwota
from ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
where ksiegowosc.pensje.kwota > 1000;


--c) Wyświetl id pracowników nieposiadających premii, których płaca jest większa niż 2000. 
select ksiegowosc.wynagrodzenie.id_pracownika, ksiegowosc.premie.rodzaj, ksiegowosc.pensje.kwota
from ksiegowosc.premie inner join (ksiegowosc.pensje inner join ksiegowosc.wynagrodzenie on ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji) on ksiegowosc.premie.id_premii=ksiegowosc.wynagrodzenie.id_premii
where ksiegowosc.pensje.kwota > 2000 and ksiegowosc.premie.rodzaj like '0';


--d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’. 
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.id_pracownika from ksiegowosc.pracownicy
where ksiegowosc.pracownicy.imie like 'j%'


--e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pracownicy.nazwisko from ksiegowosc.pracownicy
where  ksiegowosc.pracownicy.imie like '%a' and ksiegowosc.pracownicy.nazwisko like '%n%'


--f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie. 
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.godziny.liczba_godzin
from ksiegowosc.pracownicy inner join (ksiegowosc.wynagrodzenie inner join ksiegowosc.godziny 
on ksiegowosc.wynagrodzenie.id_godziny = ksiegowosc.godziny.id_godziny) 
on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
where ksiegowosc.godziny.liczba_godzin - 160 > 0


--g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 – 3000 PLN.
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensje.kwota
from (ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje 
on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji) 
inner join ksiegowosc.pracownicy 
on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
where ksiegowosc.pensje.kwota > 1500 and ksiegowosc.pensje.kwota < 3000;


--h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
from ksiegowosc.pracownicy 
inner join ksiegowosc.wynagrodzenie on ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
inner join ksiegowosc.godziny on ksiegowosc.wynagrodzenie.id_godziny = ksiegowosc.godziny.id_godziny
inner join ksiegowosc.premie on ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii 
where ksiegowosc.godziny.liczba_godzin - 160 > 0 and ksiegowosc.premie.kwota = 0


--i) Uszereguj pracowników według pensji.
select ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pensje.kwota
from (ksiegowosc.wynagrodzenie 
inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika)
inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
order by ksiegowosc.pensje.kwota;


--j) Uszereguj pracowników według pensji i premii malejąco.
select ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pensje.kwota, ksiegowosc.premie.kwota
from ( (ksiegowosc.wynagrodzenie 
inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika)
inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji) 
inner join ksiegowosc.premie on ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
order by ksiegowosc.premie.kwota desc, ksiegowosc.pensje.kwota desc;


--k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’.
select ksiegowosc.pensje.stanowisko, count( ksiegowosc.pensje.stanowisko ) as liczba
from ( ksiegowosc.wynagrodzenie 
inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika)
inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
group by ksiegowosc.pensje.stanowisko;


--l) Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierowca’.
select ksiegowosc.pensje.stanowisko,
AVG( ksiegowosc.pensje.kwota ) as srednia, 
min( ksiegowosc.pensje.kwota ) as minim,
max(ksiegowosc.pensje.kwota) as maxim
from ksiegowosc.pensje
group by ksiegowosc.pensje.stanowisko having ksiegowosc.pensje.stanowisko='kierowca';


--m) Policz sumę wszystkich wynagrodzeń.
select sum( ksiegowosc.premie.kwota + ksiegowosc.pensje.kwota ) as suma
from ksiegowosc.wynagrodzenie 
inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
inner join ksiegowosc.premie on ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii;


--n) Policz sumę wynagrodzeń w ramach danego stanowiska.
select sum( ksiegowosc.pensje.kwota ) as suma, ksiegowosc.pensje.stanowisko
from ksiegowosc.wynagrodzenie 
inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
group by ksiegowosc.pensje.stanowisko;


--o) Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.
select ksiegowosc.pensje.stanowisko, count( ksiegowosc.premie.kwota ) as liczba
from ksiegowosc.wynagrodzenie 
inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
inner join ksiegowosc.premie on ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
group by ksiegowosc.pensje.stanowisko;


--p) Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł.
delete ksiegowosc.wynagrodzenie
from ksiegowosc.wynagrodzenie 
inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
inner join  ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
where ksiegowosc.pensje.kwota < 1200;
