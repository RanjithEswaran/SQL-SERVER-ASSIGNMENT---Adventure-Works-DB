Lab 1  :            							 Introduction

1.	Human Resources
2.	EmployeeId
3.	ContactID -----> Contact Table
        ManagerID -----> Manager Table
4.	ManagerId
5.	S / M
6.	NationalIDNumber
        LoginID	
        Title
7. 1---->Salaried,Exempt from collective bargaining

---------------------------------------------------------------------------------------------------------------------------------------------
									Basic Select Statements
Lab 2 :

	SELECT Person.Contact.FirstName,Person.Contact.LastName,HumanResources.Employee.Title,Sales.SalesPerson.SalesYTD,Sales.SalesTerritory.Name
	FROM Person.Contact INNER JOIN 	HumanResources.Employee ON Person.Contact.ContactID=HumanResources.Employee.ContactID INNER JOIN
	Sales.SalesPerson ON HumanResources.Employee.EmployeeID=Sales.SalesPerson.SalesPersonID INNER JOIN
	Sales.SalesTerritory ON Sales.SalesPerson.TerritoryID=Sales.SalesTerritory.TerritoryID

Lab 2 Challenge :
	SELECT Production.Product.Name,Purchasing.Vendor.Name AS EXPR1,Person.Address.City
	FROM Purchasing.Vendor CROSS JOIN Production.Product CROSS JOIN	Person.Address

---------------------------------------------------------------------------------------------------------------------------------------------
Lab 3 :

									Languages in SQL

DDL		DML		DCL

CREATE		SELECT		GRANT
DROP		INSERT		DENY
ALTER		DELETE		
		UPDATE

Security                  ------- GRANT,DENY

Make Changes to the table ------- ALTER

Add Content               ------- UPDATE

------------------------------------------------------------------------------------------------------------------------------------------------

LAB 4 :

	1.SELECT * FROM AdventureWorks.HumanResources.Employee;

	2.SELECT LoginID, Title,VacationHours FROM HumanResources.Employee

	3.SELECT HumanResources.Employee.MaritalStatus,Person.Contact.FirstName FROM HumanResources.Employee 
          INNER JOIN Person.Contact ON HumanResources.Employee.ContactID=Person.Contact.ContactID WHERE HumanResources.Employee.MaritalStatus='S';

        4.SELECT HumanResources.Employee.MaritalStatus,Person.Contact.FirstName FROM HumanResources.EmployeeINNER JOIN
          Person.ContactONHumanResources.Employee.ContactID=Person.Contact.ContactID WHERE HumanResources.Employee.MaritalStatus='M';

        5.SELECT * FROM HumanResources.EmployeeorderbyHireDate;

LAB 4 Challenge:
       
 	SELECT EmployeeID FROM AdventureWorks.HumanResources.Employee WHERE ManagerID IS NOT NULL ORDER BY Title,Birth_Date;

-------------------------------------------------------------------------------------------------------------------------------------------------

Lab 5 :							The Select Command Comparison Operators

	1.SELECT Name, Color FROM Production.Productwhere Color='Black';

	2.SELECT SafetyStockLevel FROM Production.ProductwhereSafetyStockLevel < 100;

	3.SELECT ProductNumber FROM Production.ProductwhereProductNumber LIKE 'BK%';

	4.SELECT Name FROM Production.Product WHERE Name LIKE '%Lock%';

	5.SELECT Name, Color, Size FROM Production.Product WHERE Size NOT IN ('L','M','null');


Lab 5 Challenge :
	
	SELECT Name,ListPrice,DaysToManufacture,ProductID  FROM Production.Product WHERE DaysToManufacture BETWEEN 3 AND 6 ORDER BY ListPrice DESC;

----------------------------------------------------------------------------------------------------------------------------------------------------
							The Select Command Expanded Filtering
Lab 6 : I

       1.SELECT Sales.SalesPerson.Bonus,Person.Contact.FirstName,Person.Contact.LastName FROM Sales.SalesPerson CROSS JOIN Person.Contact
       WHERE (Sales.SalesPerson.Bonus BETWEEN 1000.00 AND 5000.00) ORDER BY Sales.SalesPerson.Bonus;

       2.SELECT TerritoryID,SalesPersonID FROM Sales.SalesPerson WHERE TerritoryID IN(1,2,4);

       3.SELECT TOP 10 * FROM Sales.SalesPerson

       4.SELECT TerritoryID,SalesPersonID FROM Sales.SalesPerson WHERE TerritoryID=NULL ORDER BY SalesPersonID DESC;


Lab 6 Challenge: 

	SELECT TOP (25) PERCENTSalesLastYear,SalesPersonID FROM Sales.SalesPerson WHERE (SalesLastYear IS NOT NULL);

-----------------------------------------------------------------------------------------------------------------------------------------------------

Lab 7: 							The SQL Aggregate Functions

	1.SELECT CommissionPct AS AVG,SalesPersonID FROM Sales.SalesPerson

	
	2.SELECT COUNT(Gender) FROM HumanResources.Employee where Gender='M'


	3.SELECT max(ListPrice)	FROM Production.Product

	4.SELECT LEN(Description) FROM Production.ProductDescription

	5.SELECT CurrencyCode,Name FROM Sales.Currency WHERE Name LIKE'AB%'

	

Lab 7 Challenge: 

	SELECT DATEDIFF(DAY,SellEndDate,SellStartDate) FROM Production.Product where SellEndDate is NOT NULL;

----------------------------------------------------------------------------------------------------------------------------------------------------------

Lab 8: 							The Aggregation and Grouping 
	
	1.SELECT Title, MIN(LoginID) AS Login FROM HumanResources.Employee WHERE Title IN('Buyer', 'Recruiter' , 'Stocker') GROUP BY Title;

	2.SELECT ProductSubCategoryID, MIN(Name) AS Name, MAX(ListPrice) FROM Production.Product GROUP BY ProductSubCategoryID
	HAVING COUNT(ProductSubCategoryID) > 20 ORDER BY Name;

	3.SELECT Title, Gender, AVG(VacationHours) FROM HumanResources.Employee GROUP BY Title, Gender WITH ROLLUP;

Lab 8 Challenge :

SELECT        ManagerID,COUNT(EmployeeID)
FROM            HumanResources.Employee WHERE ManagerID is not NULL GROUP BY ManagerID ;


-----------------------------------------------------------------------------------------------------------------------------------------------------------
							The Multi-Table Queries
Lab 9 : 

	1.SELECT Name, SubTotal FROM Purchasing.Vendor INNER JOIN Purchasing.PurchaseOrderHeader ON Vendor.VendorID = PurchaseOrderHeader.VendorID
	ORDER BY Name;

	2.SELECT ProductSubCategory.Name AS SubCategory,Product.Name AS ProductName FROM Production.ProductSubCategory INNER JOIN Production.Product
	ON Production.ProductSubCategory.ProductSubCategoryID = Product.ProductSubCategoryID LEFT OUTER JOIN Sales.SalesOrderDetail 
	ON Product.ProductID = Sales.SalesOrderDetail.ProductID WHERE SalesOrderDetail.ProductID IS NOT NULL;

Lab 9 Challenge :

	SELECT  Person.Contact.FirstName FROM  Person.Contact INNER JOIN HumanResources.Employee ON Person.Contact.ContactID 
	= HumanResources.Employee.ContactID AND Person.Contact.ContactID = HumanResources.Employee.ContactID  WHERE HumanResources.Employee.EmployeeID IN
 	(Select HumanResources.Employee.ManagerID from HumanResources.Employee) ORDER BY  Person.Contact.FirstName
						 
------------------------------------------------------------------------------------------------------------------------------------------------------------
