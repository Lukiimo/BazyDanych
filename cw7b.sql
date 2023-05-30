--ODPAL AdventureWorks2019

--zad 1. Napisz procedur� wypisuj�c� do konsoli ci�g Fibonacciego. Procedura musi przyjmowa� jako
--argument wej�ciowy liczb� n. Generowanie ci�gu Fibonacciego musi zosta�
--zaimplementowane jako osobna funkcja, wywo�ywana przez procedur�.



create function dbo.fibonacci(@parametr int)
returns @ciag table(wynik int)
as
begin
	declare
	@parametr1 int = 0,
	@parametr2 int = 0,
	@parametr3 int = 1,
	@i int = 2;
	
	while (@i <= @parametr + 1)
		begin
		set @parametr1 = @parametr2 + @parametr3
		set @parametr3 = @parametr2
		set @parametr2 = @parametr1
		set @i=@i+1
		insert into @ciag values(@parametr2)
		end
	return
end;


create or alter procedure dbo.fibonacci2(@zmienna int)
as
begin
select *from dbo.fibonacci(@zmienna)
end;


exec fibonacci2 10;



--zad 2. Napisz trigger DML, kt�ry po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko tak, aby by�o napisane du�ymi literami. 

CREATE TRIGGER trigger_Persons
	ON Person.Person
	AFTER INSERT
	AS
		BEGIN
			UPDATE Person.Person
			SET LastName = UPPER(LastName)
			WHERE Person.LastName IN (SELECT LastName FROM inserted);
		END

SELECT * FROM Person.BusinessEntity
SELECT * FROM Person.Person

INSERT INTO Person.BusinessEntity (rowguid) VALUES (NEWID());
INSERT INTO Person.Person(BusinessEntityID, PersonType, FirstName, LastName) VALUES (20779, 'EM', 'Jan', 'Nepomucen II')


--zad 3.  Przygotuj trigger �taxRateMonitoring�, kt�ry wy�wietli komunikat o b��dzie, je�eli nast�pi zmiana warto�ci w polu �TaxRate� o wi�cej ni� 30%.
SELECT * FROM Sales.SalesTaxRate

CREATE TRIGGER taxRateMonitoring
	ON Sales.SalesTaxRate 
	AFTER UPDATE
	AS
		BEGIN
			IF EXISTS (SELECT nowe.TaxRate, usuniete.TaxRate FROM deleted AS usuniete INNER JOIN Inserted AS nowe
			ON usuniete.TaxRate*1.3 < nowe.TaxRate OR usuniete.TaxRate*0.7 > nowe.TaxRate) 
		BEGIN
			PRINT 'Wyst�pi� b��d!';
	END
END;


UPDATE Sales.SalesTaxRate SET TaxRate = 0.2 * TaxRate;