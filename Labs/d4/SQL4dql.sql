select Dependent.Dependent_name,Dependent.Sex
from Dependent join Employee
on Dependent.ESSN=Employee.ssn
where Dependent.Sex='F'and Employee.sex='F'
union 
select Dependent.Dependent_name,Dependent.Sex
from Dependent join Employee
on Dependent.ESSN=Employee.ssn
where Dependent.Sex='M'and Employee.sex='M'
 
select p.Pname,sum(w.Hours) as [Total hours]
from Project p join Works_for w
on p.Pnumber=w.Pno
group by p.Pname

select Departments.*
from Departments join Employee
on Departments.Dnum=Employee.Dno
where Employee.SSN=(select min(Employee.ssn) from Employee)

select d.Dname,max(e.Salary),min(e.Salary),avg(e.Salary)
from Departments d left join Employee e
on D.Dnum=E.Dno
group by d.Dname

select distinct e.Lname
from Employee e join Departments d
on e.ssn=d.MGRSSN
left join Dependent s
on e.ssn=s.essn
where s.ESSN is null

select d.Dname,d.Dnum, count(e.ssn)
from Departments d join Employee e
on d.Dnum=e.Dno
group by d.Dname,d.Dnum
having avg(e.salary)<(select avg(Salary) from Employee)

select (e.Fname + e.Lname) as name ,p.Pname,d.Dnum
from Employee e join Departments d
on e.Dno=d.Dnum
join Project p
on d.Dnum=p.Dnum
order by d.Dnum,e.Lname,e.Fname

select top 2 salary from Employee order by Salary desc

select (e.fname+e.lname)
from Employee e , Dependent d
where e.lname like d.Dependent_name

update Employee 
set Salary= Salary*1.3
where dno=(select d.dnum from Departments d join Project p on d.Dnum=p.Dnum where P.Pname='Al Rowad')

select e.ssn,(e.fname+e.lname)
from Employee e
where exists (select e.ssn from Employee e join Dependent d on e.SSN=d.ESSN)
