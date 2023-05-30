--zad 1. Napisz zapytanie, które wykorzystuje transakcjê (zaczyna j¹), a nastêpnie
--aktualizuje cenê produktu o ProductID równym 680 w tabeli Production.Product o 10% i nastêpnie zatwierdza transakcjê.SELECT * FROM Production.ProductBEGIN TRANSACTION
UPDATE Production.Product SET ListPrice = ListPrice*1.1
WHERE ProductID = 680;
COMMIT


--zad 2. Napisz zapytanie, które zaczyna transakcjê, usuwa produkt o ProductID równym
--707 z tabeli Production.Product, ale nastêpnie wycofuje transakcjê.
SELECT * FROM Production.Product where ProductID = 707
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all" -- S³u¿y do wy³¹czania wszystkich ograniczeñ na wszystkich tabelach w bazie danych (?-aktualna tabela)

BEGIN TRANSACTION;
DELETE FROM Production.Product 
WHERE ProductID = 707;
SELECT * FROM Production.Product where ProductID = 707
ROLLBACK TRANSACTION;


--zad 3. Napisz zapytanie, które zaczyna transakcjê, dodaje nowy produkt do tabeli
--Production.Product, a nastêpnie zatwierdza transakcjê.

SELECT * FROM Production.Product where Name = 'Gigarower'

BEGIN TRANSACTION;
INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color,SafetyStockLevel,ReorderPoint, StandardCost, ListPrice,DaysToManufacture,SellStartDate,ModifiedDate) 
VALUES ('GigaRower', 'AR-3039' ,0,0, 'Czarny',2000 ,800 , 17.70 ,0 ,0 ,'2008-04-30 00:00:00.000','2014-02-08 10:01:36.827');
COMMIT TRANSACTION;


--zad 4. Napisz zapytanie, które zaczyna transakcjê i aktualizuje StandardCost wszystkich
--produktów w tabeli Production.Product o 10%, je¿eli suma wszystkich
--StandardCost po aktualizacji nie przekracza 50000. W przeciwnym razie zapytanie powinno wycofaæ transakcjê.
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


--zad 5. Napisz zapytanie SQL, które zaczyna transakcjê i próbuje dodaæ nowy produkt do
--tabeli Production.Product. Jeœli ProductNumber ju¿ istnieje w tabeli, zapytanie powinno wycofaæ transakcjê.

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


--zad 6. Napisz zapytanie SQL, które zaczyna transakcjê i aktualizuje wartoœæ OrderQty
--dla ka¿dego zamówienia w tabeli Sales.SalesOrderDetail. Je¿eli którykolwiek z
--zamówieñ ma OrderQty równ¹ 0, zapytanie powinno wycofaæ transakcjê.
SELECT * FROM Sales.SalesOrderDetail

BEGIN TRANSACTION
IF EXISTS (SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0 )
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Zamówienie ma ordrQty równe 0';
END
ELSE
BEGIN
	UPDATE Sales.SalesOrderDetail SET OrderQty = OrderQty * 1.1
    COMMIT TRANSACTION
END



--zad 7. Napisz zapytanie SQL, które zaczyna transakcjê i usuwa wszystkie produkty,
--których StandardCost jest wy¿szy ni¿ œredni koszt wszystkich produktów w tabeli
--Production.Product. Je¿eli liczba produktów do usuniêcia przekracza 10, zapytanie powinno wycofaæ transakcjê

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