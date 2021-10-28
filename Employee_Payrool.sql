--UC1
create database payroll_service

--UC2
use payroll_service

create table Employee_payroll
(
 Id int identity(1,1) primary key,
 name varchar(100) not null,
 salary int not null,
 start_date date not null
)

--UC3

insert into Employee_payroll values
('Mounika',300000.0,'2021-09-13'),
('Nibedita',400000.0,'2021-09-9'),
('Mabel',300000.0,'2021-09-18')

--UC4

select * from employee_payroll

--UC5
select salary from Employee_payroll where name = 'Mounika'

select * from Employee_payroll
where start_date between cast('2021-09-09' As date) and GETDATE()

--UC6

ALTER TABLE Employee_payroll
ADD gender char(20)

update Employee_payroll set gender = 'F' where name = 'Mounika' or name = 'Nibedita'
update Employee_payroll set gender = 'F' where name = 'Mabel';

select * from Employee_payroll

select sum(salary) from Employee_payroll where gender='F' group by gender;

select sum(salary) from Employee_payroll  group by gender;

select sum(salary) as 'totalSalary',gender from Employee_payroll group by gender;

select avg(salary) as 'averageSalary',gender from Employee_payroll group by gender;

select min(salary) as 'minimumSalary',gender from Employee_payroll group by gender;

select max(salary) as 'maximumSalary',gender from Employee_payroll group by gender;


select count(gender) as 'female' from Employee_payroll where gender='F' 

select * from Employee_payroll

--UC8

alter table Employee_payroll add 
phn varchar(20),
department varchar(20) not null default 'CS',
address varchar(20) not null default 'Hyd'

select * from Employee_payroll

--UC9

alter table Employee_payroll add
basicPay float,
deduction float,
taxablePay float,
incomeTax float
 
 select * from Employee_payroll


 --UC10

insert into Employee_payroll values
('Terisa',700000.0,'2021-09-13','F','1234567890','sales','india',100.0,12000.0,2000.0,1250.0)

insert into Employee_payroll values
('Terisa',500000.0,'2021-09-12','F','9876543210','Marketing','india',100.0,12000.0,2000.0,1350.0)

select * from Employee_payroll where name='Terisa'

--UC11

create table Employee
(
emp_id int identity primary key,
name varchar(20),
start_date date,
gender char(10),
phn varchar(20),
address varchar(20),
)

insert into Employee values
 ('Reshma','2020-01-01','F','1234519630','Bangalore')
 insert into Employee values
 ('Viha','2021-02-01','F','9988719630','Mumbai')
 insert into Employee values
 ('Monitha','2020-05-01','F','77558419630','Chennai')
  insert into Employee values
 ('Dhruvi','2020-07-01','F','6037219630','Pune')

 select * from Employee

 create table Department
(
dept_id int identity primary key,
rooms int,
emp_id int FOREIGN KEY REFERENCES employee(emp_id)
)


insert into Department values
(101,1)

insert into Department values
(102,1)





create table Payroll
(
emp_id int FOREIGN KEY REFERENCES employee(emp_id),
basicpay money,
deduction money,
taxable_pay money,
income_tax money,
net_pay money,
)

insert into Payroll values
(1,10000,200,150,100,9550)
insert into Payroll values
(2,60000,300,150,100,55450)

create table Company
(
emp_id int foreign key references employee(emp_id),
company_name varchar(50),
)

insert into Company values
(1,'Bridgelabz')
insert into Company values
(2,'Amazon')
insert into Company values
(3,'TCS')

select * from Company


Alter table Employee_payroll ADD dept_id int foreign key references Department(dept_id);
 

select * from Employee_payroll

update Employee_payroll set department='HR' where Id=1;

select * from Employee_payroll

update Employee_payroll set phn='1235869458' where Id=1;
update Employee_payroll set phn='8956231458' where Id=2;
update Employee_payroll set phn='7412365897' where Id=3;

create table EmployeeDepartment
(
emp_id int foreign key references Employee(emp_id),
dept_id int foreign key references Department(dept_id)
)

select * from Employee
select * from Department
select * from Payroll
select * from Company
select * from EmployeeDepartment

select * from Employee AS e join EmployeeDepartment AS d on e.emp_id=d.emp_id

select * from Employee AS e join Payroll AS p on e.emp_id=p.emp_id where net_pay>5000

