select * from ksiegowosc.pracownicy;

--a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj¹c do niego kierunkowy dla Polski w nawiasie (+48)

update ksiegowosc.pracownicy set telefon = CONCAT( '(+48)', telefon)


--b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony by³ myœlnikami wg wzoru: ‘555-222-333’

update ksiegowosc.pracownicy set telefon = CONCAT( SUBSTRING(telefon,1,8),'-',SUBSTRING(telefon,9,3),'-',SUBSTRING(telefon,12,3) )

--c) Wyœwietl dane pracownika, którego nazwisko jest najd³u¿sze, u¿ywaj¹c du¿ych liter
select * from ksiegowosc.pracownicy;

alter table ksiegowosc.pracownicy alter column nazwisko varchar(30);
alter table ksiegowosc.pracownicy alter column imie varchar(30);

select ksiegowosc.pracownicy.id_pracownika as ID, UPPER(ksiegowosc.pracownicy.imie) as imie, UPPER(ksiegowosc.pracownicy.nazwisko) as nazwisko
from ksiegowosc.pracownicy where LEN(ksiegowosc.pracownicy.nazwisko) = ( select MAX(len(ksiegowosc.pracownicy.nazwisko)) from ksiegowosc.pracownicy);


--d) Wyœwietl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5 
select * from ksiegowosc.wynagrodzenie;
select * from ksiegowosc.pensje;
select * from ksiegowosc.godziny;


alter table ksiegowosc.pracownicy alter column nazwisko varchar(30);
alter table ksiegowosc.pensje alter column kwota varchar(30);

select HASHBYTES('md5',ksiegowosc.pracownicy.id_pracownika) as ID, HASHBYTES('md5',imie) as imie, HASHBYTES('md5',nazwisko) as nazwisko, HASHBYTES('md5',ksiegowosc.pensje.kwota) as pensja
from ksiegowosc.wynagrodzenie 
inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji 
inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika 


--f) Wyœwietl pracowników, ich pensje oraz premie. Wykorzystaj z³¹czenie lewostronne.
select ksiegowosc.pracownicy.id_pracownika as ID, ksiegowosc.pracownicy.imie as imie,ksiegowosc.pracownicy.nazwisko as nazwisko, ksiegowosc.pensje.kwota as pensja, ksiegowosc.premie.kwota as kwota_premii
from ksiegowosc.wynagrodzenie
left join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika 
left join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji 
left join ksiegowosc.premie on ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii;


--g) wygeneruj raport (zapytanie), które zwróci w wyniki treœæ wg poni¿szego szablonu:
-- Pracownik Jan Nowak, w dniu 7.08.2017 otrzyma³ pensjê ca³kowit¹ na kwotê 7540 z³, gdzie
-- wynagrodzenie zasadnicze wynosi³o: 5000 z³, premia: 2000 z³, nadgodziny: 540 z³

select CONCAT('Pracownik ', pracownicy.imie,' ', pracownicy.nazwisko, ', w dniu ', DATEPART(day,wynagrodzenie.data),'-0',DATEPART(month,wynagrodzenie.data),'-',DATEPART(year,wynagrodzenie.data), 
' otrzyma³ pensjê ca³kowit¹ na kwotê ', pensje.kwota + premie.kwota,' zl, gdzie wynagrodzenie zasadnicze wynosilo: ', pensje.kwota , ' zl, premia: ', 
premie.kwota, ' zl, nadgodziny: ',( case when (ksiegowosc.godziny.liczba_godzin - 52)*20 > 0 then ((ksiegowosc.godziny.liczba_godzin - 52)*20) else 0 end) ,' zl')
from ksiegowosc.wynagrodzenie
inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika 
inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji 
inner join ksiegowosc.premie on ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
inner join ksiegowosc.godziny on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.godziny.id_pracownika;



---------------------
--Przydatne komendy--
---------------------

alter table ksiegowosc.pracownicy add telefon varchar(18) NOT NULL;
alter table firma1.ksiegowosc.pracownicy alter column telefon varchar(18);


update ksiegowosc.pracownicy set telefon = 
	case
		when id = 1 then '298409142'
		when id = 2 then'344339545'
		when id = 3 then'472492487'
		when id = 4 then'426733812'
		when id = 5 then'748728942'
		when id = 6 then'492604248'
		when id = 7 then'5720424282'
		when id = 8 then'523532935'
		when id = 9 then'863424653'
		when id = 10 then'863969147'
	end;

	update ksiegowosc.pracownicy set telefon = 
	case
		when ROW_NUMBER = 1 then '298409142'
		when ROW_NUMBER = 2 then'344339545'		
	end;

insert into ksiegowosc.pracownicy (telefon) values ('298409142');

update ksiegowosc.pracownicy set telefon = CONCAT( SUBSTRING(telefon,1,8),SUBSTRING(telefon,10,1))

BEGIN transaction;
ROLLBACK
---------
