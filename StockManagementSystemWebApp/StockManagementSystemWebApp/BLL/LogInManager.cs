using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;

namespace StockManagementSystemWebApp.BLL
{
    public class LogInManager
    {
        LogInGateway logInGateway = new LogInGateway();

        public bool LogIn(string userName, string password)
        {
            return logInGateway.LogIn(userName, password);
        }
    }
}