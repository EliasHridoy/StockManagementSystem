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
    public partial class UpdateCategoryUI : System.Web.UI.Page
    {
        private CategoryManager categoryManager = new CategoryManager();
        Category category = new Category();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                category = categoryManager.ShowACategoryById(id);
                idHiddenField.Value = category.Id.ToString();
                nameTextBox.Text = category.Name;
            }

        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            if (nameTextBox.Text.Length > 1)
            {

                category.Id = Convert.ToInt32(idHiddenField.Value);
                category.Name = nameTextBox.Text;
                outputLabel.Text = categoryManager.UpdateCategoryById(category);
                Response.Redirect("CategoryUI.aspx");

            }
            else
            {
                outputLabel.Text = "Please enter valid Category Name";
                outputLabel.ForeColor = Color.Red;
            }
        }
    }
}