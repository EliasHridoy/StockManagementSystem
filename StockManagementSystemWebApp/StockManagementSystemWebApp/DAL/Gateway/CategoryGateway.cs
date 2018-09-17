using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebApp.DAL.Model;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class CategoryGateway
    {
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;
        private string query;
       public CategoryGateway ()
        {
            string ConString = WebConfigurationManager.ConnectionStrings["StockManagementDB"].ConnectionString;
            connection = new SqlConnection(ConString);
        }




        public int UpdateCategoryById(Category category)
        {
            bool isExists = IsCategoryExists(category.Name);
            int rowEffect = 0;
            if (isExists == false)
            {
                
                query = "UPDATE CategoryTable SET CategoryName='" + category.Name + "' WHERE ID='" + category.Id + "' ";
                command = new SqlCommand(query, connection);

                connection.Open();
                rowEffect = command.ExecuteNonQuery();
                connection.Close();
            }
            return rowEffect;
        }
        
       public Category ShowACategoryById(int id)
       {
           query = "SELECT * FROM CategoryTable WHERE ID='"+id+"' ";
           command = new SqlCommand(query, connection);
           
           connection.Open();
           reader = command.ExecuteReader();

           Category aCatagory = null;
           reader.Read();
           if (reader.HasRows)
           {
               aCatagory = new Category();
               aCatagory.Id = Convert.ToInt32(reader["Id"]);
               aCatagory.Name = reader["CategoryName"].ToString();
           }
           reader.Close();
           connection.Close();


           return aCatagory;
       }

        
        public List<Category> ShowAll()
        {
            query = "SELECT * FROM CategoryTable";
            command = new SqlCommand(query,connection);

            List<Category> catagoriList = new List<Category>();

            connection.Open();
            reader = command.ExecuteReader();
            
            while (reader.Read())
            {
             Category aCatagory = new Category();

                aCatagory.Id = Convert.ToInt32(reader["Id"]);
                aCatagory.Name = reader["CategoryName"].ToString();
                catagoriList.Add(aCatagory);

            }
            reader.Close();
            connection.Close();

            return catagoriList ;
        }


        public int Save(Category category)
        {

            bool isExists = IsCategoryExists(category.Name);
                 
            int rowEffect=0;
            if (isExists == false)
            {
                query = "INSERT INTO CategoryTable VALUES ('" + category.Name + "') ";
                command = new SqlCommand(query, connection);

                connection.Open();
                 rowEffect = command.ExecuteNonQuery();
                connection.Close();
                return rowEffect;

            }

            return rowEffect;
        }


        private bool IsCategoryExists(string CategoryName)
        {
            string query = "SELECT * FROM CategoryTable WHERE CategoryName='" + CategoryName + "'";
            command = new SqlCommand(query, connection);

            connection.Open();
            reader = command.ExecuteReader();
            bool isExists = reader.HasRows;
            connection.Close();
            return isExists;
        }



    }
}