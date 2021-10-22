-- UC1
create database Payrollservice;

use  Payrollservice;
--UC2
Create Table Employee_payroll (Id int identity(1,1) primary key ,
Name varchar(20) not null, Salary int not null, Start_date date not null);

select * from Employee_payroll
--UC3
insert into Employee_payroll values
('Mounika',30000, '2021-09-13'),
('Mabel',30000, '2021-09-16'),
('Nibedita',40000, '2021-09-07');

--UC4
select *from Employee_payroll

--UC5
 select salary from Employee_payroll
where name = 'Mounika'
----for retrieve date of employee by name
select Start_date from Employee_payroll where name = 'Nibedita'

---- retrieve all start dates of employee using Cast & Get function

select * from Employee_payroll where Start_date between 
CAST('2021-09-07' As date) and GETDATE()

-----UC6
alter table Employee_payroll add gender varchar(10) not null
select * from Employee_payroll
update Employee_payroll set gender = 'F' where name ='Mounika' or name='Mabel'
update Employee_payroll set gender ='F' where name ='nibedita' 
select * from Employee_payroll
 
 -----UC7
 -- using sum()
 select SUM(salary) from Employee_payroll
WHERE gender = 'F' GROUP BY gender;
--- using max()
select MAX(salary) from Employee_payroll
WHERE gender = 'F' GROUP BY gender;
--- using Avg()
select AVG(salary) from Employee_payroll
WHERE gender = 'F' GROUP BY gender;
---using Min()
select MIN(salary) from Employee_payroll
WHERE gender = 'F' GROUP BY gender;

select * from Employee_payroll