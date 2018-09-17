using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Model;

namespace StockManagementSystemWebApp.BLL
{
    public class StockInManager
    {
        StockInGateway stockInGateway = new StockInGateway();


        public string SaveQuantity(StockIn stockIn)
        {
            int rowEffect = stockInGateway.SaveQuantity(stockIn);
            if (rowEffect > 0)
            {
                return "Stock In Successful";
            }
            else
            {
                return "Stock in Faild ";
            }


        }




        public StockIn GetAvailableStock(int companyId,string itemName)
        {
            return stockInGateway.GetAvailableStock(companyId, itemName);
        }
     
        
        
        public List<string> ItemDropDownList(int companyId)
        {
            return stockInGateway.ItemDropDownList(companyId);
        } 
        
        public List<Company> CompanyDropDownList()
        {
            return stockInGateway.CompanyDropDownList();
        }
    }
}