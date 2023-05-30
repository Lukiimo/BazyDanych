--zad 1. Napisz zapytanie, kt�re wykorzystuje transakcj� (zaczyna j�), a nast�pnie
--aktualizuje cen� produktu o ProductID r�wnym 680 w tabeli Production.Product o 10% i nast�pnie zatwierdza transakcj�.SELECT * FROM Production.ProductBEGIN TRANSACTION
UPDATE Production.Product SET ListPrice = ListPrice*1.1
WHERE ProductID = 680;
COMMIT


--zad 2. Napisz zapytanie, kt�re zaczyna transakcj�, usuwa produkt o ProductID r�wnym
--707 z tabeli Production.Product, ale nast�pnie wycofuje transakcj�.
SELECT * FROM Production.Product where ProductID = 707
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all" -- S�u�y do wy��czania wszystkich ogranicze� na wszystkich tabelach w bazie danych (?-aktualna tabela)

BEGIN TRANSACTION;
DELETE FROM Production.Product 
WHERE ProductID = 707;
SELECT * FROM Production.Product where ProductID = 707
ROLLBACK TRANSACTION;


--zad 3. Napisz zapytanie, kt�re zaczyna transakcj�, dodaje nowy produkt do tabeli
--Production.Product, a nast�pnie zatwierdza transakcj�.

SELECT * FROM Production.Product where Name = 'Gigarower'

BEGIN TRANSACTION;
INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color,SafetyStockLevel,ReorderPoint, StandardCost, ListPrice,DaysToManufacture,SellStartDate,ModifiedDate) 
VALUES ('GigaRower', 'AR-3039' ,0,0, 'Czarny',2000 ,800 , 17.70 ,0 ,0 ,'2008-04-30 00:00:00.000','2014-02-08 10:01:36.827');
COMMIT TRANSACTION;


--zad 4. Napisz zapytanie, kt�re zaczyna transakcj� i aktualizuje StandardCost wszystkich
--produkt�w w tabeli Production.Product o 10%, je�eli suma wszystkich
--StandardCost po aktualizacji nie przekracza 50000. W przeciwnym razie zapytanie powinno wycofa� transakcj�.
SELECT * FROM Production.Product

BEGIN TRANSACTION;

IF (SELECT 1.1*SUM(StandardCost) FROM Production.Product) <= 50000
BEGIN
	 UPDATE Production.Product SET StandardCost = StandardCost * 1.10;
	 COMMIT TRANSACTION;
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
END


--zad 5. Napisz zapytanie SQL, kt�re zaczyna transakcj� i pr�buje doda� nowy produkt do
--tabeli Production.Product. Je�li ProductNumber ju� istnieje w tabeli, zapytanie powinno wycofa� transakcj�.

BEGIN TRANSACTION
IF EXISTS (SELECT 1 FROM Production.Product WHERE ProductNumber = 'BR-3039')
BEGIN
    ROLLBACK TRANSACTION;
	PRINT 'Taki produkt juz istnieje'
END
ELSE
BEGIN
	INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color,SafetyStockLevel,ReorderPoint, StandardCost, ListPrice,DaysToManufacture,SellStartDate,ModifiedDate) 
	VALUES ('GigaRower', 'AR-3039' ,0,0, 'Czarny',2000 ,800 , 17.70 ,0 ,0 ,'2008-04-30 00:00:00.000','2014-02-08 10:01:36.827');
	COMMIT TRANSACTION;
END


--zad 6. Napisz zapytanie SQL, kt�re zaczyna transakcj� i aktualizuje warto�� OrderQty
--dla ka�dego zam�wienia w tabeli Sales.SalesOrderDetail. Je�eli kt�rykolwiek z
--zam�wie� ma OrderQty r�wn� 0, zapytanie powinno wycofa� transakcj�.
SELECT * FROM Sales.SalesOrderDetail

BEGIN TRANSACTION
IF EXISTS (SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0 )
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Zam�wienie ma ordrQty r�wne 0';
END
ELSE
BEGIN
	UPDATE Sales.SalesOrderDetail SET OrderQty = OrderQty * 1.1
    COMMIT TRANSACTION
END



--zad 7. Napisz zapytanie SQL, kt�re zaczyna transakcj� i usuwa wszystkie produkty,
--kt�rych StandardCost jest wy�szy ni� �redni koszt wszystkich produkt�w w tabeli
--Production.Product. Je�eli liczba produkt�w do usuni�cia przekracza 10, zapytanie powinno wycofa� transakcj�

BEGIN TRANSACTION;
DELETE FROM Production.Product WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product);
IF @@ROWCOUNT > 10    --ROWCOUN zlicza ilosc wierszy ktory zostaly wybrane przez SELECTa
BEGIN
	ROLLBACK TRANSACTION
	PRINT 'Liczba produktow przekracza 10'
END
ELSE
BEGIN
	COMMIT TRANSACTION
END