use Payrollservice;
--- ===================create a payroll service ====================================
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
--======================= Get values ============================================
alter procedure spGetAllemployee_payroll
(
@Name varchar(250),
@Salary int,
@Start_date date)
As 
Begin try
insert into Employee_payroll(Name,Salary,Start_date)values(@Name,@Salary,@Start_date)
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec spGetAllemployee_payroll 'Mamatha','12000','2021-10-05'
 --===================== update =============================================
create procedure spUpdateEmployeePayroll
(
@Name varchar(20),
@Basic_pay money
)
As 
Begin try
update Employee_payroll set Basic_pay=@Basic_pay where Name=@Name
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec spUpdateEmployeePayroll
@Basic_pay=10000, @name='Mamatha'

select * from Employee_payroll
--=============================Delete procedure==================================
create procedure spDeleteEmployeePayroll
(
@Name varchar(20),
@Basic_pay money
)
As 
Begin try
delete Employee_payroll  where Name=@Name or Basic_pay=10000
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  
exec spDeleteEmployeePayroll
 @name='Mamatha', @Basic_pay=10000

 select * from Employee_payroll
 --================= retrieve data particular range===============================
 create procedure spRetrieveAllEmployeeForParticularRange
As 
Begin try
select * from employee_payroll where department ='QA' or department='CS'
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH 

exec spRetrieveAllEmployeeForParticularRange
 select * from Employee_payroll

 --====================== sum of female date ===========================
 create procedure spSumOfSalaryOfEmployee
As 
Begin try
select SUM(Salary) As Salary from Employee_payroll where gender='F' group by gender;
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH

exec spSumOfSalaryOfEmployee
--=========================== Add payroll ==============================================

create procedure spGetAllEmployeeAndPayrollservice
As 
Begin try
select * from Employee AS e join Payroll_services AS p on e.id=p.id where basicpay>5000
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH 

exec spGetAllEmployeeAndPayrollservice

select * from Employee_payroll