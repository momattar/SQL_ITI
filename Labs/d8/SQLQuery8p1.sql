--1
create view gr
as
select concat(s.st_fname,' ',s.St_Lname) as fullName,c.crs_name,sc.Grade
from student s join Stud_Course sc
on s.St_Id=sc.St_Id
join Course c on sc.Crs_Id=c.Crs_Id
where sc.Grade>50
select * from gr

--3
create view insD
as
select i.Ins_Name,d.Dept_Name
from Instructor i join Department d
on i.Dept_Id=d.Dept_Id
where d.Dept_Name in ('SD','Java')
select * from insd

--2
create view mgrC
with encryption
as
select i.Ins_Name, c.Crs_Name
from Instructor i join Department d
on i.Ins_Id=d.Dept_Manager
join Ins_Course ic on i.Ins_Id=ic.Ins_Id
join Course c on ic.Crs_Id=c.Crs_Id
select * from mgrc

--4
create view V1
as
select *
from Student
where St_Address in ('Cairo','Alex')
with check option
Update V1 set st_address='tanta'
Where st_address='alex'

--5
Use Company_SD
create view pjEmp
as
select p.Pname,count(w.essn) as empCount
from Project p join Works_for w on p.Pnumber=w.Pno
group by p.Pname
select * from pjEmp

