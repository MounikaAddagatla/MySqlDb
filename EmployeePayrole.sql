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

--- UC8 add department
alter table Employee_payroll add 
Phn varchar(20),
department varchar(20) not null default 'QA',
Address varchar(20) not null default 'Hyd'

select * from Employee_payroll

---UC9 to have Basic Pay,Deductions, Taxable Pay,Income Tax, Net Pay
Alter table Employee_payroll ADD Basic_pay money,Deductions money,
Taxable_pay money,Incometax_pay money ,Netpay money;

----UC10
insert into Employee_payroll(Name,Salary,Start_date,gender,Phn,department,Basic_pay,Deductions,
Taxable_pay,Incometax_pay,Netpay) 
values ('Terissa',25000.00,SYSDATETIME(),'F','236336','CS',2000,1000,1000,1000,20000)

insert into Employee_payroll(Name,Salary,Start_date,gender,Phn,department,Basic_pay,Deductions,
Taxable_pay,Incometax_pay,Netpay) 
values ('Terissa',40000.00,SYSDATETIME(),'F','236446','HR',4000,2000,2000,2000,30000)

select * from Employee_payroll
select * from Employee_payroll where Name='Terissa';
--ER daigram added for UC10

---UC11 for adding new department
Create Table Employee_department(
dept_id int identity(1,1) primary key,

department varchar(20) not null default 'CS'
);


Alter table Employee_payroll ADD dept_id int foreign key references Employee_department(dept_id); 
update Employee_payroll set dept_id=2 where id=8;
update Employee_department set department='HR' where dept_id=2;