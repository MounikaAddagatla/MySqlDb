using System;
using System.Collections.Generic;
using System.Text;

namespace CurdEmployeePayroll
{
    class EmployeeModel
    {
        public int Id { get; set; }
        public string name { get; set; }
        public double salary { get; set; }
        public string start_date { get; set; }
        public string gender { get; set; }
        public int phn { get; set; }
        public string address { get; set; }
        public double basicpay { get; set; }
        public double deductions { get; set; }
        public double taxablePay { get; set; }
        public double incomeTax{ get; set; }
        public double net_pay{ get; set; }
        public int dept_id { get; set; }

    }
}
