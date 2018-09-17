using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Model;
using StockManagementSystemWebApp.DAL.Model.ViewModel;

namespace StockManagementSystemWebApp.BLL
{
    public class StockOutManager
    {
        
        StockOutGateway stockOutGateway = new StockOutGateway();



        public string Sell(List<StockOut> stockOut)
        {
            int rowEffect = stockOutGateway.Sell(stockOut);
            if (rowEffect > 0)
            {
                return "Sold all";
            }
            else
            {
                return "Faild";
            }
        }
         public string Damage(List<StockOut> stockOut)
        {
            int rowEffect = stockOutGateway.Damage(stockOut);
            if (rowEffect > 0)
            {
                return "Damage recorded";
            }
            else
            {
                return "Faild";
            }
        }

         public string Lost(List<StockOut> stockOut)
        {
            int rowEffect = stockOutGateway.Lost(stockOut);
            if (rowEffect > 0)
            {
                return "Lost recorded";
            }
            else
            {
                return "Faild";
            }
        }



        public StockIn GetAvailableStock(int companyId, string itemName)
        {
            return stockOutGateway.GetAvailableStock(companyId, itemName);
        }

        public List<Company> ItemDropDownList(int companyId)
        {
            return stockOutGateway.ItemDropDownList(companyId);
        }

        public List<Company> CompanyDropDownList()
        {
            return stockOutGateway.CompanyDropDownList();
        }

    }
}