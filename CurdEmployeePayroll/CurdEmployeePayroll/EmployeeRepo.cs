using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace CurdEmployeePayroll
{
    class EmployeeRepo
    {
        public static string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=payroll_service;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        SqlConnection con = new SqlConnection(connectionString);
        public bool DataBaseConnection()
        {
            try
            {
                con.Open();
                using (con)
                {
                    Console.WriteLine($"Connection is created Successful");
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return true;
        }
        public DataSet GetAllEmployee()
        {
            try
            {
                DataSet dataSet = new DataSet();
                using (con)
                {
                    
                    SqlDataAdapter adapter = new SqlDataAdapter("spGetAllEmployee_payroll", con);
                    adapter.Fill(dataSet, "Employee_payroll");
                    con.Open();
                    foreach (DataRow dataRow in dataSet.Tables["Employee_payroll"].Rows)
                    {
                        Console.WriteLine("\t" + dataRow["id"] + "  " + dataRow["name"] + " " + dataRow["salary"] +
                            " " + dataRow["start_date"] + " " + dataRow["gender"] + " " + dataRow["phn"] + " " +
                            dataRow["address"] + dataRow["department"] + " " + dataRow["basicPay"] + " " + dataRow["deduction"] + " " +
                            dataRow["taxablePay"] + " " + dataRow["incomeTax"] + " " + dataRow["net_pay"]+" ");
                    }
                    con.Close();
                }
                return dataSet;
            }
            catch (Exception e)
            {
               
                throw new Exception(e.Message);
            }
            finally
            {
                con.Close();
            }
        }
        public void AddEmployee(EmployeeModel obj)
        {
            try
            {
                using (con)
                {
                    //Creating a stored Procedure for adding employees into database
                    SqlCommand com = new SqlCommand("spAddEmployeePayroll", con);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@name", obj.name);
                    com.Parameters.AddWithValue("@salary", obj.salary);
                    com.Parameters.AddWithValue("@start_date", obj.start_date);
                    con.Open();
                    var result = com.ExecuteNonQuery();
                    Console.WriteLine("Record Successfully Inserted On Table");
                    con.Close();
                    GetAllEmployee();
                }
            }
            catch (Exception ex)
            {
                GetAllEmployee();

                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        public void UpdateEmployee(double basicPay, string name)
        {
            try
            {
                using (con)
                {
                    SqlCommand com = new SqlCommand("spUpdateEmployeePayroll", con);
                    com.CommandType = CommandType.StoredProcedure;
                    com.Parameters.AddWithValue("@name", name);
                    com.Parameters.AddWithValue("@basicPay", basicPay);
                    con.Open();
                    var result = com.ExecuteNonQuery();
                    Console.WriteLine("Record Successfully Updated On Table");
                    con.Close();
                    GetAllEmployee();
                }
            }
            catch (Exception ex)
            {
                GetAllEmployee();
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        public DataSet RetrieveAllEmployeeForParticularRange()
        {
            try
            {
                DataSet dataSet = new DataSet();
                using (con)
                {
                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter("spRetrieveAllEmployeeForParticularRange", con);
                    adapter.Fill(dataSet, "Employee_payroll");
                    foreach (DataRow dataRow in dataSet.Tables["Employee_payroll"].Rows)
                    {
                        Console.WriteLine("\t" + dataRow["Id"] + "  " + dataRow["name"] + " " + dataRow["salary"] +
                                " " + dataRow["start_date"] + " " + dataRow["gender"] + " " + dataRow["phn"] + " " +
                                dataRow["address"] + dataRow["department"] + " " + dataRow["basicPay"] + " " + dataRow["deduction"] + " " +
                                dataRow["taxablePay"] + " " + dataRow["incomeTax"] + " ");
                    }
                    con.Close();
                }
                return dataSet;
            }
            catch (Exception e)
            {
                GetAllEmployee();
                throw new Exception(e.Message);
            }
            finally
            {
                con.Close();
            }
        }
        public DataSet RetrieveAllEmployeeDeatilsUsingJoins()
        {
            try
            {
                DataSet dataSets = new DataSet();
                using (con)
                {
                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter("spGetAllemployeeAndPayroll", con);
                    adapter.Fill(dataSets, "Employee");
                    foreach (DataRow dataRow in dataSets.Tables["Employee"].Rows)
                    {
                        Console.WriteLine("\t" + dataRow["emp_id"] + "  " + dataRow["name"] + " " +
                                " " + dataRow["startdate"] + " " + dataRow["gender"] + " " + dataRow["phn"] + " " +
                                dataRow["address"] + dataRow["emp_id"] + " " + dataRow["net_pay"] + " " + dataRow["deduction"] + " " +
                                dataRow["taxable_pay"] + " " + dataRow["income_tax"] + " ");
                    }
                    con.Close();
                }
                return dataSets;
            }
            catch (Exception e)
            {
                GetAllEmployee();
                throw new Exception(e.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}
