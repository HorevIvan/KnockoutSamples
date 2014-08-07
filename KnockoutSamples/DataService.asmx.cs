using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace KnockoutSamples
{
    /// <summary>
    /// Summary description for DataService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    [ScriptService]
    public class DataService : WebService
    {
        [WebMethod]
        public String HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<Employee> GetEmployees()
        {
            return (new List<Employee>
            {
                new Employee { FirstName = "Ivan", LastName = "Horev" },
                new Employee { FirstName = "Aleksandr", LastName = "Pushkin" },
            });
        }
    }

    [Serializable]
    public class Employee
    {
        public String FirstName { set; get; }

        public String LastName { set; get; }
    }
}
