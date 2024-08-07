--part 02
------------------
--01
select SalesOrderID, ShipDate, OrderDate
from Sales.SalesOrderHeader
where OrderDate between '2002-07-28' and '2014-07-29'
--------------------------
--02
select ProductID, Name
from Production.Product 
where StandardCost < 110
------------------------------
--03
select ProductID, Name
from Production.Product
where Weight is not null
----------------------------
--04
select *
from Production.Product
where Color in('silver','black','red')
-------------------------------------
--05
select *
from Production.Product
where Name like 'B%'
------------------------------------
--06
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3


select *
from Production.ProductDescription
where Description like '%[_]%'
-----------------------------------
--07
select sum(TotalDue),OrderDate
from Sales.SalesOrderHeader
where OrderDate between '7/1/2001' and '7/31/2014'
group by OrderDate
----------------------------------
--08
select distinct HireDate
from HumanResources.Employee 
----------------------------------
--09
select avg(distinct ListPrice)
from Production.Product
----------------------------------
--10
select CONCAT('The ',Name,' is only!  ' , ListPrice)
from Production.Product
where ListPrice between 100 and 120
order by ListPrice asc
---------------------------------------
--11
--a)
select rowguid, Name, SalesPersonID, Demographics into store_Archive
from Sales.Store
--------------------------------------------
--b)
select rowguid, Name, SalesPersonID, Demographics into store_Archive1
from Sales.Store
where 1>2
---------------------------------------
--12
select GETDATE()
union all
select SYSDATETIME()
union all
select SYSDATETIMEOFFSET()

