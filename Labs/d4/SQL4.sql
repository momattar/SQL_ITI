--dml 

insert into Departments
values('DEPT IT',100,112233,1-11-2006)

update Departments
set MGRSSN=968574
where Dnum=100

update Departments
set MGRSSN=102672
where Dnum=20

update Employee
set Superssn=102672
where ssn=102660

delete from Dependent
where ESSN=223344

update Departments
set MGRSSN=102672
where MGRSSN=223344

update Employee
set Superssn=102672
where Superssn=223344

update Works_for
set ESSn=102672
where essn=223344

delete from Employee
where ssn=223344

--dql

