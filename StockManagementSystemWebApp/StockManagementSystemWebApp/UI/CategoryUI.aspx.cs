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
    public partial class CategoryUI : System.Web.UI.Page
    {
        CategoryManager categoryManager = new CategoryManager();
        Category catagory = new Category();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["LogIn"]==null)
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
                catagory.Name = name;
                string message = categoryManager.Save(catagory);
                outputLabel.Text = message;
                nameTextBox.Text = "";
                ShowGridView();
            }
            else
            {
                outputLabel.Text = "Please insert a valid catagory";
                outputLabel.ForeColor = Color.Red;

            }
        }




        void ShowGridView()
        {
            categoryGridView.DataSource = categoryManager.ShowAll();
            categoryGridView.DataBind();
        }


        protected void editButton_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            DataControlFieldCell cell = (DataControlFieldCell)linkButton.Parent;
            GridViewRow row = (GridViewRow)cell.Parent;
            HiddenField hiddenField = (HiddenField)row.FindControl("idHiddenField");
            int id = Convert.ToInt32(hiddenField.Value);

            Response.Redirect("UpdateCategoryUI.aspx?id=" + id);
        }
    }
}