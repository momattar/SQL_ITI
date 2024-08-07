--1
create function getMon(@d date)
returns varchar(10)
begin
return MONTH(@d)
end
select dbo.getMon('12-25-2010')

--2
create function medVal(@x int,@y int)
returns @t table (vals int)
as
begin
while @x <> @y - 1
begin
if @x = @y
break
set @x = @x + 1
insert into @t select @x
end
return
end
select * from medval(8,18)

--3
create function getStud(@id int)
returns table as return(
select d.dept_name, s.st_fname+' '+s.st_lname as fullName
from Student s join Department d
on s.Dept_Id=d.Dept_Id
where s.St_Id=@id)
select * from getstud(11)

--4
create function nameCheck(@id INT)
returns varchar(40)
begin
declare @msg varchar(40)
select @msg=case 
when St_Fname is null and St_lname is null then  'First name & last name are null'
when St_Fname is null then  'first name is null'
when St_lname is null then  'last name is null'
else 'First name & last name are not null'
end 
from Student
where  st_id=@id
return @msg
end
select dbo.namecheck(14)

--5
create function getmgr(@id int)
returns table as return(
select d.dept_name, i.ins_name, d.manager_hiredate
from Instructor i join Department d
on i.Ins_Id=d.Dept_Manager
where d.Dept_Manager=@id)
select * from getmgr(2)

--6
create function stName(@stringg varchar(10))
returns @t table
(id int,
name varchar(20))
as
begin
if @stringg='first name'
   insert into @t
   select st_id,st_fname from Student
else if @stringg='last name'
   insert into @t
   select st_id,st_lname from Student
else if @stringg='full name'
   insert into @t
   select st_id,st_fname+' '+st_lname from Student
return
end
select * from stname('full name')

--7
select St_Id,LEFT(St_Fname,len(st_fname)-1)
from Student

--8
update Stud_Course
set grade=null
from Stud_Course s join Student ss 
on s.St_Id=ss.St_Id
join Department d
on ss.Dept_Id=d.Dept_Id
where d.Dept_Name='SD'

