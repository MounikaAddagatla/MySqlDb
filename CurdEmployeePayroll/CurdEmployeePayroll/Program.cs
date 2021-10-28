using System;

namespace CurdEmployeePayroll
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("  Curd operation on Employee Payroll service");
            EmployeeRepo empRepository = new EmployeeRepo();

            int options;
            bool isExit = false;
           
            while (!isExit)
            {
                Console.WriteLine("choose \n 1. AllEmployeeDetails \n 2. AddEmployeeDetails " +
                    " \n3. UpdateEmployeeDetails \n 4. RetrieveAllEmployeeForParticularRange " +
                    "\n5. Retrieve Sal from Employee and Payroll using joins");
                options = Convert.ToInt32(Console.ReadLine());
                switch (options)
                {

                    case 1:
                        empRepository.GetAllEmployee();
                        break;
                    case 2:
                        EmployeeModel obj = new EmployeeModel(); //'Sneha',15000.0,'2021-09-15'
                        obj.name = "Sneha";
                        obj.salary = 15000.0;
                        obj.start_date = "2021-09-15";
                        empRepository.AddEmployee(obj);
                        break;
                    case 3:
                        empRepository.UpdateEmployee(50000, "Sneha");
                        break;
                    case 4:
                        empRepository.RetrieveAllEmployeeForParticularRange();
                        break;
                    case 5:
                        empRepository.RetrieveAllEmployeeDeatilsUsingJoins();
                        break;
                    default:
                        Console.WriteLine("enter valid option");
                        break;
                }
                Console.ReadLine();
            }
        }
    }
}
