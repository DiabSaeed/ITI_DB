USE AdventureWorks2012
-- problem 1
SELECT SalesOrderID, ShipDate 
FROM Sales.SalesOrderHeader 
WHERE shipDate BETWEEN '7/28/2002' AND '7/29/2014';

-- problem 2
SELECT ProductID, Name 
FROM Production.Product
WHERE StandardCost < 110.00;

-- problem 3
SELECT ProductID, Name
FROM Production.Product
WHERE Weight IS NULL;

-- problem 4
SELECT *
FROM Production.Product
WHERE Color IN ('Silver','Black','Red');

-- problem 5 
SELECT *
FROM Production.Product
WHERE Name LIKE 'B%';

-- problem 6
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

SELECT *
FROM Production.ProductDescription
WHERE  Description LIKE '%[_]%';

-- problem 7 
SELECT sum(TotalDue), OrderDate
FROM Sales.SalesOrderHeader
GROUP BY OrderDate
HAVING OrderDate between  '7/1/2001' and '7/31/2014';

-- problem 8 
SELECT DISTINCT HireDate
FROM HumanResources.Employee;

-- problem 9 
SELECT AVG(DISTINCT ListPrice) AveragePrices
FROM Production.Product;

-- problem 10 
SELECT CONCAT('The ', Name ,' is only!' ,ListPrice)
FROM Production.Product
WHERE ListPrice BETWEEN 100 AND 200;

-- problem 11.a
SELECT rowguid ,Name, SalesPersonID, Demographics
INTO store_Archive
from Sales.Store;

-- problem 11.b 
SELECT rowguid ,Name, SalesPersonID, Demographics
INTO store_Archive_NODATA
from Sales.Store
WHERE 1=2;

-- problem 12
SELECT CONVERT(VARCHAR(20), GETDATE(), 105)
UNION
SELECT FORMAT(GETDATE(), 'd-MM-yyyy')