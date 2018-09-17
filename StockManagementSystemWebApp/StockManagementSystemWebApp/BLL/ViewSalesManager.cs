using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebApp.DAL.Gateway;
using StockManagementSystemWebApp.DAL.Model;
using StockManagementSystemWebApp.DAL.Model.ViewModel;

namespace StockManagementSystemWebApp.BLL
{
    public class ViewSalesManager
    {
        private ViewSalesGateway viewSales = new ViewSalesGateway();

        public List<ViewSales> GetsalesItemByDate(string fromDate, string toDate)
        {
            return viewSales.GetsalesItemByDate(fromDate, toDate);
        }
    }
}