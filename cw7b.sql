--ODPAL AdventureWorks2019

--zad 1. Napisz procedurê wypisuj¹c¹ do konsoli ci¹g Fibonacciego. Procedura musi przyjmowaæ jako
--argument wejœciowy liczbê n. Generowanie ci¹gu Fibonacciego musi zostaæ
--zaimplementowane jako osobna funkcja, wywo³ywana przez procedurê.



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



--zad 2. Napisz trigger DML, który po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko tak, aby by³o napisane du¿ymi literami. 

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


--zad 3.  Przygotuj trigger ‘taxRateMonitoring’, który wyœwietli komunikat o b³êdzie, je¿eli nast¹pi zmiana wartoœci w polu ‘TaxRate’ o wiêcej ni¿ 30%.
SELECT * FROM Sales.SalesTaxRate

CREATE TRIGGER taxRateMonitoring
	ON Sales.SalesTaxRate 
	AFTER UPDATE
	AS
		BEGIN
			IF EXISTS (SELECT nowe.TaxRate, usuniete.TaxRate FROM deleted AS usuniete INNER JOIN Inserted AS nowe
			ON usuniete.TaxRate*1.3 < nowe.TaxRate OR usuniete.TaxRate*0.7 > nowe.TaxRate) 
		BEGIN
			PRINT 'Wyst¹pi³ b³¹d!';
	END
END;


UPDATE Sales.SalesTaxRate SET TaxRate = 0.2 * TaxRate;