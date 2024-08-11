--lab 10
--1.	Create a cursor for Employee table that increases Employee salary by 10% if Salary <3000 and increases it by 20% if Salary >=3000. Use company DB

use SD

declare c101 cursor 
for
select Salary
from Employee
for update
declare @sal int
open c101
fetch c101 into @sal
while @@FETCH_STATUS = 0
begin
	if @sal < 3000
		update Employee
		set Salary= @sal * 1.1
		where current of c101
	else 
		update Employee
		set Salary =@sal *1.2
		where current of c101

	fetch c101 into @sal
end
close c101
deallocate c101
-------------------------------------------------
--2.	Display Department name with its manager name using cursor. Use ITI DB

use ITI

declare c102 cursor 
for 
select Dept_Name,Ins_Name
from Department inner join Instructor on Instructor.Ins_Id = Department.Dept_Manager
for read only
declare @dep varchar(10),@manager varchar(20)
open c102
fetch c102 into @dep,@manager
while @@FETCH_STATUS =0
begin
	select @dep Department,@manager Manager
	fetch c102 into @dep,@manager
end
close c102
deallocate c102
-----------------------------------------------------
--3.	Try to display all students first name in one cell separated by comma. Using Cursor 

declare c103 cursor 
for 
	select St_Fname
	from Student
	where St_Fname is not null 
for read only
declare @name varchar(20), @allnames varchar(200) = ''
open c103
fetch c103 into @name
while @@FETCH_STATUS =0
begin
	set @allnames = CONCAT(@allnames,' ,',@name)
	fetch c103 into @name
end
select @allnames
close c103
deallocate c103
--------------------------------------
--4.	Create full, differential Backup for SD DB.
backup database SD
to disk ='F:\ITI\database iti\Day10\Day5\SD.bak'

backup database SD
to disk ='F:\ITI\database iti\Day10\Day5\SD_Diff.bak'
with differential

------------------------------------------
--5.	Use import export wizard to display students data (ITI DB) in excel sheet

--attached excel file 
-------------------------------------------
--6.	Try to generate script from DB ITI that describes all tables and views in this DB
--attached script file
-------------------------------------------
--7.	Create a sequence object that allow values from 1 to 10 without cycling in a specific column and test it.
create sequence s1
  as int
  start with 1
  increment by 1
  maxvalue 10
  no cycle

create table SEQ
(
	ID int ,
	_Name varchar(20),
)


insert into SEQ (ID, _Name) values (next value for s1, 'Muhammad');
insert into SEQ(ID, _Name) values (next value for s1, 'Fathi');

select * from SEQ
-------------------------------------------------------------------------
