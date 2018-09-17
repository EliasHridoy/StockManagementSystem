using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebApp.BLL;
using StockManagementSystemWebApp.DAL.Model;

namespace StockManagementSystemWebApp.UI
{
    public partial class CompanyUI : System.Web.UI.Page
    {
        CompanyManager companyManager = new CompanyManager();
        Company company = new Company();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LogIn"] == null)
            {
                Response.Redirect("LogInUI.aspx");
            }
            ShowGridView();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string name = nameTextBox.Text;
            if (name.Length > 1)///Empty name check
            {
                company.Name = name;
                string message = companyManager.Save(company);
                outputLabel.Text = message;
                ShowGridView();
            }
            else
            {
                outputLabel.Text = "Please insert a valid Company";
                outputLabel.ForeColor = Color.Red;
            }

        }


        void ShowGridView()
        {
            companyGridView.DataSource = companyManager.ShowAllCompany();
            companyGridView.DataBind();
        }



    }
}