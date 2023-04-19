--zad 1
create database firma;

--zad 2
create schema rozliczenia;

--zad 3
--a) b) c)
create table rozliczenia.pracownicy(id_pracownika char(3) primary key, imie text NOT NULL, nazwisko text NOT NULL, adres text NOT NULL, telefon text NOT NULL);
create table rozliczenia.godziny(id_godziny char(3) primary key, data date NOT NULL, liczba_godzin int NOT NULL, id_pracownika char(3) NOT NULL);
create table rozliczenia.pensje(id_pensji char(3) primary key, stanowisko text, kwota money NOT NULL, id_premii char(3) NOT NULL);
create table rozliczenia.premie(id_premii char(3) primary key, rodzaj text, kwota money NOT NULL);


-- d)
alter table rozliczenia.godziny add foreign key (id_pracownika) references rozliczenia.pracownicy(id_pracownika);
alter table rozliczenia.pensje add foreign key (id_premii) references rozliczenia.premie(id_premii);

--zad 4
insert into rozliczenia.pracownicy values('A01', 'Czes³aw', 'Michniewicz', 'Sezamowa', '298409142');
insert into rozliczenia.pracownicy values('A03', 'Tomasz', 'Górnik', '¯elazowa', '344339545');
insert into rozliczenia.pracownicy values('B09', 'Bart³omiej', '£ysy', 'Bie¿anowska', '472492487');
insert into rozliczenia.pracownicy values('D07', 'Piotr', 'Farmazon', 'Jabolowice', '426733812');
insert into rozliczenia.pracownicy values('K18', 'Wiktor', 'Strzala', 'Kobierzyn', '748728942');
insert into rozliczenia.pracownicy values('E02', 'Bartosz', 'Szczesiñski', 'Ba³tycka', '492604248');
insert into rozliczenia.pracownicy values('G03', '£ukasz', 'Firak', 'Choroszczañska', '5720424282');
insert into rozliczenia.pracownicy values('M32', 'Robert', 'Lewogolski', 'Brandenburska', '523532935');
insert into rozliczenia.pracownicy values('K24', 'Jan', 'Bezziemi', 'Królewska', '863424653');
insert into rozliczenia.pracownicy values('P64', 'Piotr', 'Wolski', '£êckowa', '863969147');

select * from rozliczenia.pracownicy;


insert into rozliczenia.godziny values('J03', '2023-04-15', 46 , 'A01');
insert into rozliczenia.godziny values('T53', '2023-02-24', 66 , 'A03');
insert into rozliczenia.godziny values('H44', '2023-02-10', 76 , 'B09');
insert into rozliczenia.godziny values('T52', '2023-04-13', 23 , 'D07');
insert into rozliczenia.godziny values('G32', '2023-04-07', 84 , 'K18');
insert into rozliczenia.godziny values('B62', '2023-06-10', 44 , 'E02');
insert into rozliczenia.godziny values('A23', '2023-02-05', 57 , 'G03');
insert into rozliczenia.godziny values('J56', '2023-01-11', 85 , 'M32');
insert into rozliczenia.godziny values('G73', '2023-02-23', 55 , 'K24');
insert into rozliczenia.godziny values('P53', '2023-03-12', 8 , 'P64');

select * from rozliczenia.godziny;


insert into rozliczenia.pensje values('K42', 'programista', 4242.25 , 'A11');
insert into rozliczenia.pensje values('G23', 'malarz', 6264 , 'A22');
insert into rozliczenia.pensje values('F24', 'rêcznikowy', 6234 , 'A33');
insert into rozliczenia.pensje values('F25', 'prezes', 4145 , 'A44');
insert into rozliczenia.pensje values('G42', 'zastêpca_prezesa', 4245 , 'A55');
insert into rozliczenia.pensje values('W24', 'wiceszef', 5232.25 , 'A66');
insert into rozliczenia.pensje values('R23', 'kucharz', 7474.25 , 'A77');
insert into rozliczenia.pensje values('K64', 'konserwator', 2434.25 , 'A88');
insert into rozliczenia.pensje values('V34', 'kierowca', 4535 , 'A99');
insert into rozliczenia.pensje values('G43', 'kierowca', 2446 , 'A10');

select * from rozliczenia.pensje;


insert into rozliczenia.premie values('A11', 'wakacyjna', 900);
insert into rozliczenia.premie values('A22', 'swi¹teczna', 400);
insert into rozliczenia.premie values('A33', 'wyró¿nienie', 300);
insert into rozliczenia.premie values('A44', 'swi¹teczna', 450);
insert into rozliczenia.premie values('A55', 'swi¹teczna', 800);
insert into rozliczenia.premie values('A66', 'wakacyjna', 500);
insert into rozliczenia.premie values('A77', 'wakacyjna', 200);
insert into rozliczenia.premie values('A88', 'swi¹teczna', 100);
insert into rozliczenia.premie values('A99', 'wyró¿nienie', 400);
insert into rozliczenia.premie values('A10', 'wakacyjna', 700);


select * from rozliczenia.premie;


--zad 5
select nazwisko, adres from rozliczenia.pracownicy


--zad 6
select DATEPART(WEEKDAY, data) as 'Dzieñ tygodnia', DATEPART(MONTH, data) as 'Miesi¹c' from rozliczenia.godziny;

--zad 7
exec sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'column';
alter table rozliczenia.pensje add kwota_netto money;
update rozliczenia.pensje set kwota_netto= 0.77*kwota_brutto
