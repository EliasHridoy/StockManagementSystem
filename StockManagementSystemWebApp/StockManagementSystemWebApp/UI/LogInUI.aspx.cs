using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebApp.BLL;

namespace StockManagementSystemWebApp.UI
{
    public partial class LogInUI : System.Web.UI.Page
    {
        LogInManager logInManager = new LogInManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            string userName = userNameTextBox.Text;
            string password = passwordTextBox.Text;

            if (userName != "")
            {
                if (password != "")
                {


                    bool check = logInManager.LogIn(userName, password);
                    if (check)
                    {
                        Session["LogIn"] = userName;
                        Response.Redirect("IndexUI.html");
                    }
                    else
                    {
                        userNameLabel.Text = "";
                        passwordLabel.Text = "";
                        logInLabel.Text = "Incorrect User Name and Password";
                        logInLabel.ForeColor = Color.Orange;
                    }
                }
                else
                {
                    userNameLabel.Text = "";
                    passwordLabel.Text = "Enter Your Password";
                    passwordLabel.ForeColor = Color.Red;
                }
            }
            else
            {
                userNameLabel.Text = "Please Enter User Name";
                userNameLabel.ForeColor = Color.Red;
            }

        }



    }
}