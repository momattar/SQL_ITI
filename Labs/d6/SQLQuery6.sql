CREATE TABLE DEPARTMENT(
DeptNo int primary key,
DeptName nvarchar(20),
Location loc)

sp_addtype loc,'nchar(2)'
create default d1 as 'NY'
create rule r1 as @x in ('NY','DS','KW')
sp_bindrule r1,loc
sp_bindefault d1,loc

CREATE TABLE EMPLOYEE(
EmpNo int primary key,
EmpFname nvarchar(10) not null,
EmpLname nvarchar(10) not null,
DeptNo int foreign key references department(deptno),
salary int unique)

create rule r2 as @x<6000
sp_bindrule r2,'employee.salary'

insert into DEPARTMENT
values (1,'Research','NY'),(2,'Accounting','DS'),(3,'Marketing','KW')

insert into EMPLOYEE
values (25348,'Mathew','Smith',3,2500),(10102,'Ann','Jones',3,3000),(18316,'John','Barrimore',1,2400)
,(29346,'James','James',2,2800),(9031	,'Lisa'	,'Bertoni'	,2,	4000),
(2581,'Elisa'	,'Hansel',	2,	3600),
(28559	,'Sybl',	'Moser'	,1,	2900)

insert into PROJECT
values (1,	'Apollo',	120000),
(2	,'Gemini'	,95000),
(3	,'Mercury'	,185600)

use SD
insert into works_on
values
(10102,	1,	'Analyst',	'2006.10.1'),
(10102,	3,	'Manager',	'2012.1.1'),
(25348,	2,	'Clerk',	'2007.2.15'),
(18316	,2,	NULL,	'2007.6.1'),
(29346	,2,	NULL,	'2006.12.15'),
(2581	,3,	'Analyst',	'2007.10.15'),
(9031	,1,	'Manager',	'2007.4.15'),
(28559	,1,	NULL,	'2007.8.1')

insert into works_on
values
(28559,	2,	'Clerk',	'2012.2.1'),
(9031,	3,	'Clerk',	'2006.11.15'),
(29346,	1,	'Clerk',	'2007.1.4')

--wont run
insert into works_on
values (11111,2,'Clerk',	'2012.2.1')
--wont run
update EMPLOYEE
set empno = 22222
where empno = 10102

create schema Company
alter schema Company transfer department

create schema HumanResource 
alter schema HumanResource transfer employee

create synonym emp for humanresource.employee
a.	Select * from Employee
b.	Select * from HumanResource.Emp
c.	Select * from Emp
d.	Select * from HumanResource.EMPLOYEE

select * from Company.PROJECT

update Company.PROJECT 
set Budget=Budget*1.1
from Company.PROJECT p join Works_On w
on p.ProjectNo=w.ProjectNo
where EmpNo=10102

update Company.DEPARTMENT
set DeptName='Sales'
from Company.DEPARTMENT d join HumanResource.EMPLOYEE e
on d.DeptNo=e.DeptNo
where EmpFname='James'

update Works_On
set Enter_Date='12.12.2007'
from Works_On w join HumanResource.EMPLOYEE e
on w.EmpNo=e.EmpNo
join Company.DEPARTMENT d 
on e.DeptNo=d.DeptNo
where ProjectNo=1 and DeptName='Sales'

delete from Works_On
from Works_On w join HumanResource.EMPLOYEE e
on w.EmpNo=e.EmpNo
join Company.DEPARTMENT d 
on e.DeptNo=d.DeptNo
where Location='KW'