using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Model;

namespace StockManagementSystemWebApp.BLL
{
    public class SearchAndViewItemManager
    {
        SearchAndViewItemGateway searchAndViewItemGateway = new SearchAndViewItemGateway();

        public List<ItemSetup> SearchItems(string query)
        {
            return searchAndViewItemGateway.SearchItems(query);
        }


        public List<Category> CatagoryDropDownList()
        {
            return searchAndViewItemGateway.CatagoryDropDownList();
        }


        public List<Category> CatagoryDropDownListByCompany(int id)
        {
            return searchAndViewItemGateway.CatagoryDropDownListByCompany(id);
        }



        public List<Company> CompanyDropDownListByCategory(int id)
        {
            return searchAndViewItemGateway.CompanyDropDownListByCategory(id);
        }

        public List<Company> CompanyDropDownList()
        {
            return searchAndViewItemGateway.CompanyDropDownList();
        }
    }
}