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
    }
}
