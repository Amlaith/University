/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [DepartmentID]
      ,[Name]
      ,[GroupName]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[HumanResources].[Department]
  

select * from AdventureWorks2017.HumanResources.Department

select * from AdventureWorks2017.HumanResources.Employee

select hre.LoginID, hrd.DepartmentID, hre.BirthDate
from HumanResources.Employee hre
left join HumanResources.EmployeeDepartmentHistory hrd
on hrd.BusinessEntityID = hre.BusinessEntityID
where YEAR(hre.BirthDate) > 1980
group by DepartmentID, BirthDate, LoginID

select hre.LoginID, hrd.DepartmentID, hre.BirthDate
from HumanResources.Employee hre, HumanResources.EmployeeDepartmentHistory hrd
where hre.BusinessEntityID = hrd.BusinessEntityID and hre.BirthDate > '1980'

select sst.CountryRegionCode, ssp.SalesQuota, ssp.SalesLastYear, sst.[Group], sst.[Name]
from Sales.SalesTerritory sst
inner join Sales.SalesPerson ssp
on sst.TerritoryID = ssp.TerritoryID
group by sst.CountryRegionCode, ssp.SalesQuota, ssp.SalesLastYear , sst.[Group], sst.[Name]


SELECT p.FirstName, p.MiddleName, p.LastName, sp.SalesQuota, sp.SalesYTD, sp.Bonus
FROM Sales.SalesPerson sp
LEFT JOIN Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
