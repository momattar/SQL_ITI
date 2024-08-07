select d.Dname,d.Dname, e.ssn, e.Fname
from Departments d inner join Employee e
on d.MGRSSN=e.SSN

select d.dname, p.pname
from Departments d inner join Project p
on d.Dnum=p.Dnum

select d.*, concat(e.fname,e.Lname) as name
from Dependent d inner join Employee e
on d.ESSN=e.SSN

select p.pnumber,p.pname,p.plocation
from Project p
where p.City='Alex' or p.City='Cairo'

select *
from project
where Pname like 'a%'

select *
from Employee
where dno=30 and Salary between 1000 and 2000

select e.fname
from Employee e inner join Works_for w
on e.ssn=w.ESSn
inner join Project p
on w.Pno=p.Pnumber
where p.Pname='AL Rabwah' and w.Hours >= 10 and e.Dno=10

select e.fname
from Employee e inner join Employee s
on e.Superssn=s.SSN
where s.Fname='Kamel' and s.Lname='Mohamed'

select e.fname,e.Lname , p.pname
from Employee e inner join Works_for w
on e.SSN=w.ESSn
inner join Project p
on w.Pno=p.Pnumber
order by p.Pname


select p.pnumber , d.dname, e.Lname, e.Address,e.Bdate
from Project p inner join Departments d 
on p.Dnum=d.Dnum inner join Employee e
on d.MGRSSN=e.SSN
where p.City='Cairo'

select distinct s.*
from Employee e inner join Employee s
on e.Superssn=s.SSN

select e.* , d.*
from Employee e left outer join Dependent d
on e.SSN=d.ESSN
 
insert into Employee(dno,SSN,Superssn,Salary)
values (30,102672,112233,3000)

insert into Employee(dno,SSN)
values (30,102660)

update Employee
set Salary= Salary*1.2
where Lname='Mattar'