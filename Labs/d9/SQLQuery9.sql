--1
use ITI
create proc stNum
as
	select d.Dept_Name,COUNT(s.st_id)
	from Department d join Student s
	on d.Dept_Id=s.Dept_Id
	group by d.Dept_Name
stnum

--2
use SD
create proc empcountp1 
as	
	declare @empcount int
	select @empcount  = count (*) from Works_On where ProjectNo=1

	if @empcount>=3
	begin
		select 'The number of employees in the project p1 is '+cast(@empcount as varchar(10))
	end
	else
	begin
		select 'The following employees work for the project p1'
		union all
		select (e.EmpFname + ' ' +e.EmpLname) as fullName
		from HumanResource.EMPLOYEE e join Works_On w on e.EmpNo=w.EmpNo
		join Company.PROJECT p on w.ProjectNo=p.ProjectNo
		where p.ProjectNo=1
	end
empcountp1

--3
create proc transferpj @old int, @new int, @pjno int
as
	update Works_On
	set EmpNo=@new
	from HumanResource.EMPLOYEE join Works_On
	on HumanResource.EMPLOYEE.EmpNo=Works_On.EmpNo
	where Works_On.EmpNo=@old and ProjectNo=@pjno
transferpj 2581,28559,3

--4
create table audit(
pjno int,
username varchar(20),
modifiedDate date,
oldBudget int,
newBudget int
)

create trigger t1
on company.project
after update
as
	if UPDATE(budget)
	begin 
	declare @new int,@old int,@pj int
	
	select @old=budget from deleted
	select @new=Budget from inserted
	select @pj = projectno from company.PROJECT where Budget=@new
	insert into audit
	values(@pj,SUSER_NAME(),GETDATE(),@old,@new)
	end

update Company.PROJECT
set Budget=90000
where ProjectNo=2

--5
use ITI
create trigger t1
on department
instead of insert
as
	select 'can’t insert a new record in that table'

insert into Department(Dept_Id,Dept_Location)
values(777,'jhv')

--6
use SD
create trigger t1
on humanresource.employee
after insert 
as
	if format(GETDATE(),'mmmm')='march'
		begin
		select 'cant insert'
		rollback
		end

--7
use ITI

create table studentaudit(
username varchar(128),
date date,
notes varchar(128))

alter trigger t2
on student
after insert
as
	begin
	DECLARE @UserName NVARCHAR(128)= SYSTEM_USER
	declare @key int,@note varchar(128),@tableeName varchar(20)='Student'
	select @key=st_id from inserted
	set @note= @UserName + 'Insert New Row with Key= ' + cast(@key as varchar(10)) + ' in table ' +@tableeName
	insert into studentaudit
	values(@UserName,GETDATE(),@note)
	end

insert into Student(St_Id,St_Fname,St_Lname,St_Age)
values(15,'john','wick',21)

select * from studentaudit

--8
create trigger t3
on student
instead of delete
as
	begin
	DECLARE @UserName NVARCHAR(128)= SYSTEM_USER
	declare @note varchar(128)
	declare @key int
	select @key=st_id from deleted
	set @note= 'try to delete Row with Key= '+cast(@key as varchar(10))
	insert into studentaudit
	values(@UserName,GETDATE(),@note)
	end

delete from Student
where St_Id=15

select * from studentaudit

--9
use AdventureWorks2012

select *
from HumanResources.Employee
for XML raw('student')

select *
from HumanResources.Employee
for XML raw('student'),elements

--11
use SD

declare @docs xml ='<customers>
              <customer FirstName="Bob" Zipcode="91126">
                     <order ID="12221">Laptop</order>
              </customer>
              <customer FirstName="Judy" Zipcode="23235">
                     <order ID="12221">Workstation</order>
              </customer>
              <customer FirstName="Howard" Zipcode="20009">
                     <order ID="3331122">Laptop</order>
              </customer>
              <customer FirstName="Mary" Zipcode="12345">
                     <order ID="555555">Server</order>
              </customer>
       </customers>'
declare @hdocs int

exec sp_xml_preparedocument @hdocs output, @docs

select * into customers
from openxml (@hdocs,'//customer')
with(customerName nvarchar(50) '@FirstName',
	zipcode int '@Zipcode',
	orderID int 'order/@ID',
	product nvarchar(50) 'order')

exec sp_xml_removedocument @hdocs

select * from customers
