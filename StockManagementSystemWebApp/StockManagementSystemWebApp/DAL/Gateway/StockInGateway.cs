using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebApp.DAL.Model;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class StockInGateway
    {


        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;
        string query;




        public int SaveQuantity(StockIn stockIn)
        {
            string ConString = WebConfigurationManager.ConnectionStrings["StockManagementDB"].ConnectionString;
            connection = new SqlConnection(ConString);

            query = "UPDATE ItemTable SET AvailableQuantity='"+stockIn.AvailableQuantity+"' WHERE CompanyId='"+stockIn.CompanyId+"' AND ItemName='"+stockIn.ItemName+"' ";
            command = new SqlCommand(query,connection);

            connection.Open();
            int rowEffect = command.ExecuteNonQuery();
            connection.Close();

            return rowEffect;
        }



        public StockIn GetAvailableStock(int companyId , string itemName)
        {
            string ConString = WebConfigurationManager.ConnectionStrings["StockManagementDB"].ConnectionString;
            connection = new SqlConnection(ConString);


            query = "SELECT * FROM ItemTable WHERE CompanyId='" + companyId + "' AND ItemName='"+itemName+"' ";

            command = new SqlCommand(query, connection);

            StockIn stockIn = new StockIn();

            connection.Open();
            
            reader = command.ExecuteReader();
            reader.Read();
            stockIn.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
            stockIn.AvailableQuantity = Convert.ToInt32(reader["AvailableQuantity"]);
            
        
            reader.Close();
            connection.Close();

            return stockIn;
        }
        




        public List<string> ItemDropDownList(int companyId)
        {
            string ConString = WebConfigurationManager.ConnectionStrings["StockManagementDB"].ConnectionString;
            connection = new SqlConnection(ConString);


            query = "SELECT (ItemName) FROM ItemTable WHERE CompanyId='"+companyId+"'";

            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<string> itemList = new List<string>();
            while (reader.Read())
            {
                string company;
                company = reader["ItemName"].ToString();
                itemList.Add(company);
            }
            reader.Close();
            connection.Close();

            return itemList;
        }

        public List<Company> CompanyDropDownList()
        {
            string ConString = WebConfigurationManager.ConnectionStrings["StockManagementDB"].ConnectionString;
            connection = new SqlConnection(ConString);


            query = "SELECT * FROM CompanyTable";

            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<Company> companyList = new List<Company>();
            while (reader.Read())
            {
                Company company = new Company();
                company.Id = Convert.ToInt32(reader["Id"]);
                company.Name = reader["CompanyName"].ToString();
                companyList.Add(company);
            }
            reader.Close();
            connection.Close();

            return companyList;
        }
    }
}