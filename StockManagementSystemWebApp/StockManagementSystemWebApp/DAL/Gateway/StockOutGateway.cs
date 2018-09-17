using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebApp.DAL.Model;
using StockManagementSystemWebApp.DAL.Model.ViewModel;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class StockOutGateway
    {

        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;
        string query;

        public StockOutGateway()
        {
            string ConString = WebConfigurationManager.ConnectionStrings["StockManagementDB"].ConnectionString;
            connection = new SqlConnection(ConString);
        }


        public int Lost(List<StockOut> stockOutList)
        {
            int rowEffect = 0;
            DateTime today = DateTime.Now;

            foreach (StockOut stockOut in stockOutList)
            {
                query = " INSERT INTO StockOutTable VALUES( " + stockOut.ItemId + " ," + stockOut.Quantity + " , '" + today + "' , 'lost') ";
                command = new SqlCommand(query, connection);

                connection.Open();
                rowEffect = command.ExecuteNonQuery();
                connection.Close();
                if (rowEffect == 0)
                {
                    return rowEffect;
                }



                query = "UPDATE ItemTable SET AvailableQuantity= "+stockOut.AvailableQuantity+" WHERE ItemID="+stockOut.ItemId+"; ";
                command = new SqlCommand(query, connection);

                connection.Open();
                rowEffect = command.ExecuteNonQuery();
                connection.Close();
                if (rowEffect == 0)
                {
                    return rowEffect;
                }




            }
            return rowEffect;
        }





        public int Damage(List<StockOut> stockOutList)
        {
            int rowEffect = 0;
            DateTime today = DateTime.Now;

            foreach (StockOut stockOut in stockOutList)
            {
                query = " INSERT INTO StockOutTable VALUES( " + stockOut.ItemId + " ," + stockOut.Quantity + " , '" + today + "' , 'damage') ";
                command = new SqlCommand(query, connection);

                connection.Open();
                rowEffect = command.ExecuteNonQuery();
                connection.Close();
                if (rowEffect == 0)
                {
                    return rowEffect;
                }



                query = "UPDATE ItemTable SET AvailableQuantity= " + stockOut.AvailableQuantity + " WHERE ItemID=" + stockOut.ItemId + "; ";
                command = new SqlCommand(query, connection);

                connection.Open();
                rowEffect = command.ExecuteNonQuery();
                connection.Close();
                if (rowEffect == 0)
                {
                    return rowEffect;
                }
            }





            return rowEffect;
        }















        public int Sell(List<StockOut> stockOutList)
        {
            int rowEffect = 0;
            DateTime today = DateTime.Now;

            foreach (StockOut stockOut in stockOutList)
            {
                query = " INSERT INTO StockOutTable VALUES( " + stockOut.ItemId + " ," + stockOut.Quantity + " , '"+today+"' , 'sell') ";
                command = new SqlCommand(query, connection);

                connection.Open();
                rowEffect = command.ExecuteNonQuery();
                connection.Close();
                    if (rowEffect == 0)
                    {
                        return rowEffect;
                    }


                    query = "UPDATE ItemTable SET AvailableQuantity= " + stockOut.AvailableQuantity + " WHERE ItemID=" + stockOut.ItemId + "; ";
                    command = new SqlCommand(query, connection);

                    connection.Open();
                    rowEffect = command.ExecuteNonQuery();
                    connection.Close();
                    if (rowEffect == 0)
                    {
                        return rowEffect;
                    }

            }
            return rowEffect;
        }













        public StockIn GetAvailableStock(int companyId, string itemName)
        {
            


            query = "SELECT * FROM ItemTable WHERE CompanyId='" + companyId + "' AND ItemName='" + itemName + "' ";

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


        public List<Company> ItemDropDownList(int companyId)
        {


            query = "SELECT ItemName, ItemId FROM ItemTable WHERE CompanyId='" + companyId + "'";

            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<Company> itemList = new List<Company>(); ///Company model used for ItemList
            while (reader.Read())
            {
                Company company = new Company();
                 company.Id = Convert.ToInt32(reader["ItemId"]);
                company.Name = reader["ItemName"].ToString();
                itemList.Add(company);
            }
            reader.Close();
            connection.Close();

            return itemList;
        }

        public List<Company> CompanyDropDownList()
        {
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