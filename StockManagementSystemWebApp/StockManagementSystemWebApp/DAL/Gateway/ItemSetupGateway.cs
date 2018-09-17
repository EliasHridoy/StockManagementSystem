using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebApp.DAL.Model;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class ItemSetupGateway
    {


        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;
        string query;

        public ItemSetupGateway()
        {
            string ConString = WebConfigurationManager.ConnectionStrings["StockManagementDB"].ConnectionString;
            connection = new SqlConnection(ConString);
            
        }


        public int Save(ItemSetup itemSetup)
        {
            if (IsItemExists(itemSetup) == false)
            {
                query = "INSERT INTO itemTable VALUES ('" + itemSetup.CatagoryId + "', '" + itemSetup.CompanyId + "', '" +
                        itemSetup.ItemName + "'," + itemSetup.ReorderLevel + ", "+itemSetup.AvailableQuantity+" )";
                command = new SqlCommand(query, connection);
                connection.Open();
                int check = command.ExecuteNonQuery();
                connection.Close();

                return check;
            }
            return -1;
        }

        private bool IsItemExists(ItemSetup itemSetup)
        {
            query = "SELECT * FROM itemTable WHERE CompanyId = '" + itemSetup.CompanyId + "' AND ItemName='" + itemSetup.ItemName + "' ";

            command = new SqlCommand(query, connection);

            connection.Open();
            reader = command.ExecuteReader();
            bool check = reader.HasRows;
            reader.Close();
            connection.Close();

            return check;
        }

        



        public List<Category> CatagoryDropDownList()
        {
            string query = "SELECT * FROM CategoryTable";

            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<Category> catagoryList = new List<Category>();
            while (reader.Read())
            {
                Category catagory = new Category();

                catagory.Id = Convert.ToInt32(reader["Id"]);
                catagory.Name = reader["CategoryName"].ToString();
                catagoryList.Add(catagory);

            }
            reader.Close();
            connection.Close();

            return catagoryList;
        }





        public List<Company> CompanyDropDownList()
        {
            string query = "SELECT * FROM CompanyTable";

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