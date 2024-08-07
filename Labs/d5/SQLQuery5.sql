--Part 1

select count(St_Age)
from student

select distinct ins_name
from Instructor

select s.St_Id,concat(s.St_Fname,s.St_Lname) as fullName,d.Dept_Name
from Student s join Department d
on s.Dept_Id=d.Dept_Id

select s.Ins_Name,d.Dept_Name
from Instructor s left join Department d
on s.Dept_Id=d.Dept_Id

select concat(s.St_Fname,' ',s.St_Lname) as fullName,c.Crs_Name,x.Grade
from Student s join Stud_Course x
on s.St_Id=x.St_Id
join Course c
on x.Crs_Id=c.Crs_Id
where x.Grade is not null

select count(c.Crs_Name),t.Top_Name
from Course c join Topic t
on c.Top_Id=t.Top_Id
group by t.Top_Name

select max(salary),min(salary)
from Instructor

select Ins_Name
from Instructor
where Salary<(select avg(salary) from Instructor)

select d.Dept_Name
from Instructor s join Department d
on s.Dept_Id=d.Dept_Id
where s.Salary=(select min(salary) from Instructor)

select top 2 salary
from Instructor
order by Salary desc

select ins_name,coalesce(Salary,ins_bonus)
from Instructor

select avg(salary)
from Instructor

select s.St_Fname,v.*
from Student s join Student v
on s.st_super=v.st_id

select * from(
select Salary,Dept_Id,ROW_NUMBER()over(partition by dept_id order by salary desc) as rn
from Instructor
) ranked_sal
where rn<= 2

select * from(
select St_Id,Dept_Id,St_Fname,ROW_NUMBER()over(partition by dept_id order by newid()) as rn
from Student
) rand_stud
where rn=1

--Part 2

select SalesOrderID,ShipDate,OrderDate
from sales.SalesOrderHeader
where OrderDate between '2002-07-28' and '2014-07-29'

select ProductID,Name
from Production.Product
where StandardCost<110

select ProductID,Name
from Production.Product
where Weight is not null

select ProductID,Name
from Production.Product
where Color in ('Silver','Black','Red')

select ProductID,Name
from Production.Product
where Name like 'B%'

UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3
--continue
select description
from Production.ProductDescription
where Description like '%[_]%'

select sum(totaldue) as sum,OrderDate
from sales.SalesOrderHeader
where OrderDate between '7/1/2001' and '7/31/2014'
group by OrderDate

select distinct hiredate
from HumanResources.Employee

select avg(distinct ListPrice)
from Production.Product

select concat('The ',name,' is only! ',listprice)
from Production.Product
where ListPrice between 100 and 120
order by ListPrice

select rowguid ,Name, SalesPersonID, Demographics into store_ArchiveX
from Sales.Store
where 1<>1

select GETDATE()
union all
select SYSDATETIME()
union all
select SYSDATETIMEOFFSET()