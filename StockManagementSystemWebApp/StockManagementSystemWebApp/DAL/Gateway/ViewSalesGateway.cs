using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebApp.DAL.Model.ViewModel;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class ViewSalesGateway
    {
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;
        private string query;
        public ViewSalesGateway()
        {
            string ConString = WebConfigurationManager.ConnectionStrings["StockManagementDB"].ConnectionString;
            connection = new SqlConnection(ConString);
        }

        public List<ViewSales> GetsalesItemByDate(string fromDate, string toDate)
        {

            query = " SELECT ItemName,SELL FROM StockOutTable as s LEFT JOIN ItemTable AS i ON S.ItemID=I.ItemID WHERE SellDate	BETWEEN '"+fromDate+"' AND '"+toDate+"' AND StockOutType='sell' ";
            command = new SqlCommand(query,connection);
            List<ViewSales>  salesItemList =new List<ViewSales>();

            connection.Open();
            reader = command.ExecuteReader();
            int sl = 1;
            while (reader.Read())
            {
                ViewSales salesItem = new ViewSales();
                salesItem.Id = sl++;
                salesItem.ItemName = reader["ItemName"].ToString();
                salesItem.SellQuantity = Convert.ToInt32(reader["Sell"]);
                salesItemList.Add(salesItem);
            }
            reader.Close();
            connection.Close();

            return salesItemList;
        }

    }
}