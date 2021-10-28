use payroll_service

---===============Stored Procedures for Employeepayroll========
create procedure spGetAllemployee_payroll
As 
Begin try
select * from Employee_payroll
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH 

exec spGetAllemployee_payroll
---===================================================================

create procedure spAddEmployeePayroll
(
@name varchar(250),
@salary int,
@start_date date)
As 
begin
insert into Employee_payroll(name,salary,start_date)values(@name,@salary,@start_date)
end

exec spAddEmployeePayroll
'Sneha',15000.0,'2021-09-15'

select * from Employee_payroll

--===========================================================
create procedure spUpdateEmployeePayroll
(
@name varchar(20),
@basicPay money
)
As 
begin
update Employee_payroll set basicPay=@basicPay where name=@name
end
exec spUpdateEmployeePayroll
@basicPay=50000, @name='Sneha'

select * from Employee_payroll
---==================================================================
select * from employee_payroll

create procedure spRetrieveAllEmployeeForParticularRange
As 
begin
select * from Employee_payroll where Id between 1 and 6
end
exec spRetrieveAllEmployeeForParticularRange

-----===========================================================

create procedure spSumOfSalaryOfFemaleEmployee
As 
Begin 
select SUM(salary) As salary from Employee_payroll where gender='F' group by gender;
End

exec spSumOfSalaryOfFemaleEmployee

--=================================================================
create procedure spGetAllemployeeAndPayroll
As 
Begin 
select * from Employee AS e join Payroll AS p on e.emp_id=p.emp_id where net_pay>5000
end
exec spGetAllemployeeAndPayroll