using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebApp.DAL.Model;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class SearchAndViewItemGateway
    {

        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;


        public SearchAndViewItemGateway()
        {

            string ConString = WebConfigurationManager.ConnectionStrings["StockManagementDB"].ConnectionString;
            connection = new SqlConnection(ConString);
            
        }


        public List<ItemSetup> SearchItems(string query)
        {
            
            command = new SqlCommand(query,connection);

            List<ItemSetup> searchItemList = new List<ItemSetup>();
            int sl = 1;
            connection.Open();
            reader = command.ExecuteReader();
            while (reader.Read())
            {
                ItemSetup aSearchItem = new ItemSetup();
                aSearchItem.CatagoryId = sl++; //categoryId = SL
                aSearchItem.CompanyName = reader["CompanyName"].ToString();
                aSearchItem.ItemName = reader["ItemName"].ToString();
                aSearchItem.AvailableQuantity = Convert.ToInt32(reader["AvailableQuantity"]);
                aSearchItem.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);

                searchItemList.Add(aSearchItem);
            }
            reader.Close();
            connection.Close();

            return searchItemList;
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

                catagory.Id = Convert.ToInt32(reader["ID"]);
                catagory.Name = reader["CategoryName"].ToString();
                catagoryList.Add(catagory);

            }
            reader.Close();
            connection.Close();

            return catagoryList;
        }



        public List<Category> CatagoryDropDownListByCompany(int id)
        {

            string query = "SELECT CategoryTable.CategoryName, CategoryTable.ID  FROM  CategoryTable INNER JOIN ItemTable ON CategoryTable.ID = ItemTable.CategoryID WHERE  (ItemTable.CompanyID = "+id+")  ";

            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<Category> catagoryList = new List<Category>();
            while (reader.Read())
            {
                Category catagory = new Category();

                catagory.Id = Convert.ToInt32(reader["ID"]);
                catagory.Name = reader["CategoryName"].ToString();
                catagoryList.Add(catagory);

            }
            reader.Close();
            connection.Close();

            return catagoryList;
        }








        public List<Company> CompanyDropDownListByCategory(int id)
        {
            string query = "SELECT  CompanyTable.CompanyName, CompanyTable.ID FROM  ItemTable INNER JOIN CompanyTable ON ItemTable.CompanyID = CompanyTable.ID WHERE (ItemTable.CategoryID = " + id + ");";

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