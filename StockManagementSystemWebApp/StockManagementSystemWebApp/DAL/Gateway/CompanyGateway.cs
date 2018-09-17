using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebApp.DAL.Model;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class CompanyGateway
    {

        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;

       public CompanyGateway ()
        {
            string ConString = WebConfigurationManager.ConnectionStrings["StockManagementDB"].ConnectionString;
            connection = new SqlConnection(ConString);
        }
        public List<Company> ShowAllCompany()
        {
           string  query = "SELECT * FROM CompanyTable";
            command = new SqlCommand(query,connection);

            List<Company> companyList = new List<Company>();

            connection.Open();
            reader = command.ExecuteReader();
            
            int sl = 1;
            while (reader.Read())
            {
             Company aCompany = new Company();

                aCompany.Id = sl++;
                aCompany.Name = reader["CompanyName"].ToString();
                companyList.Add(aCompany);

            }
            reader.Close();
            connection.Close();

            return companyList ;
        }


        public int Save(Company company)
        {

            string query = "SELECT * FROM CompanyTable WHERE CompanyName='" + company.Name + "'";
            command = new SqlCommand(query,connection);

            connection.Open();
            reader = command.ExecuteReader();
            bool isExists = reader.HasRows;
            connection.Close();
            int rowEffect = 0;
            if (isExists == false)
            {
                query = "INSERT INTO CompanyTable VALUES ('" + company.Name + "') ";
                command = new SqlCommand(query, connection);

                connection.Open();
                rowEffect = command.ExecuteNonQuery();
                connection.Close();
                return rowEffect;

            }
            return rowEffect;

        }
        


    }
}