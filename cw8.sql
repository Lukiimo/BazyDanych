--zad 1. Wykorzystuj�c wyra�enie CTE zbuduj zapytanie, kt�re znajdzie informacje na temat stawki pracownika oraz jego danych, 
--   a nast�pnie zapisze je do tabeli tymczasowej TempEmployeeInfo. Rozwi�� w oparciu o AdventureWorks.
select * from HumanResources.EmployeePayHistory;
select * from Person.Person;

with tabela1 (BusinessEntityID, PersonType, FirstName, LastName, Rate) as 
(
	select  HumanResources.EmployeePayHistory.BusinessEntityID, PersonType, FirstName, LastName, Rate 
	from Person.Person
	inner join HumanResources.EmployeePayHistory on HumanResources.EmployeePayHistory.BusinessEntityID = Person.Person.BusinessEntityID
)
select * into TempEmployeeInfo from tabela1

select * from TempEmployeeInfo



--zad 2. Uzyskaj informacje na temat przychod�w ze sprzeda�y wed�ug firmy i kontaktu (za pomoc� CTE i bazy AdventureWorksLT).
select * from SalesLT.Customer
select * from SalesLT.SalesOrderHeader

with tabela2 (CompanyContact, Revenue) as 
(
	select CONCAT(CompanyName, ' (',FirstName,' ', LastName,')') as CompanyContact, TotalDue as Revenue
	from SalesLT.Customer
	inner join SalesLT.SalesOrderHeader on Customer.CustomerID = SalesOrderHeader.CustomerID
)
select * into tabela2a from tabela2

select * from tabela2a order by CompanyContact ASC;



--zad 3. Napisz zapytanie, kt�re zwr�ci warto�� sprzeda�y dla poszczeg�lnych kategorii produkt�w. Wykorzystaj CTE i baz� AdventureWorksLT.
select * from SalesLT.Product
select * from SalesLT.ProductCategory
select * from SalesLT.SalesOrderDetail

with tabela3 (Category, SalesValue) as
(
select ProductCategory.Name as Category, Round(LineTotal, 2) as SalesValue from SalesLT.Product
	inner join SalesLT.ProductCategory on ProductCategory.ProductCategoryID  = Product.ProductCategoryID
	inner join SalesLT.SalesOrderDetail on Product.ProductID = SalesOrderDetail.ProductID
)
select * into tabela3 from tabela3

select Category, CAST(ROUND(SUM(SalesValue),2) AS DECIMAL (12,2)) as SalesValue from tabela3 group by Category;

select Category, CAST(SUM(ROUND(SalesValue,2)) AS DECIMAL (12,2)) as SalesValue from tabela3 group by Category;
