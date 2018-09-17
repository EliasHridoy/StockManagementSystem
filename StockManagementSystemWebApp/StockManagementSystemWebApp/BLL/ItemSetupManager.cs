using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Model;

namespace StockManagementSystemWebApp.BLL
{
    public class ItemSetupManager
    {

        ItemSetupGateway itemSetupGateway = new ItemSetupGateway();





        public string Save(ItemSetup itemSetup)
        {
            int check = itemSetupGateway.Save(itemSetup);

            if (check > 0)
            {
                return "Save Successful";
            }
            return "Save Faild";
        }




        public List<Category> CatagoryDropDownList()
        {
            return itemSetupGateway.CatagoryDropDownList();
        }

        public List<Company> CompanyDropDownList()
        {
            return itemSetupGateway.CompanyDropDownList();
        }

    }
}