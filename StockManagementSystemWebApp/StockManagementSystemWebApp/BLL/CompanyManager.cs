using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Model;

namespace StockManagementSystemWebApp.BLL
{
    public class CompanyManager
    {

        CompanyGateway companyGateway = new CompanyGateway();

        public List<Company> ShowAllCompany()
        {

            return companyGateway.ShowAllCompany();

        }
        public string Save(Company company)
        {

            int rowEffect = companyGateway.Save(company);
            if (rowEffect > 0)
            {
                return "Save Successful!!!";
            }
            else
            {
                return "Company already Exists";
            }

        }
    }
}