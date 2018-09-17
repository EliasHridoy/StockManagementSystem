using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace StockManagementSystemWebApp.DAL.Gateway
{
    public class LogInGateway
    {
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;
        private string query;
        public LogInGateway()
        {
            string ConString = WebConfigurationManager.ConnectionStrings["StockManagementDB"].ConnectionString;
            connection = new SqlConnection(ConString);
        }


        public bool LogIn(string userName, string password)
        {
            query = " SELECT * FROM LogInTable WHERE UserName='"+userName+"' AND Password='"+password+"' ";
            command = new SqlCommand(query,connection);


            connection.Open();
            reader = command.ExecuteReader();
            bool rowEffect = reader.HasRows;
            connection.Close();

            return rowEffect;
        }
    }
}