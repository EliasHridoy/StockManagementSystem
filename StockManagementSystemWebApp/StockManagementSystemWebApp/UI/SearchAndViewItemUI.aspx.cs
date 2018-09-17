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
    public partial class Search_ViewItemUI : System.Web.UI.Page
    {

        SearchAndViewItemManager searchAndViewItemManager = new SearchAndViewItemManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LogIn"] == null)
            {
                Response.Redirect("LogInUI.aspx");
            }
            if (!IsPostBack)
            {
                companyDropDownList.DataSource = searchAndViewItemManager.CompanyDropDownList();
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataBind();
                companyDropDownList.Items.Insert(0, new ListItem("--Select Company--", "0"));
                //ReorderLevelTextBox.Text = "0";

                categoryDropDownList.DataSource = searchAndViewItemManager.CatagoryDropDownList();
                categoryDropDownList.DataTextField = "Name";
                categoryDropDownList.DataValueField = "Id";
                categoryDropDownList.DataBind();
                categoryDropDownList.Items.Insert(0, new ListItem("--Select Category--", "0"));

            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            int companyId;
            int categoryId;
            bool ChangeText = true;
            List<ItemSetup> searchItemList = new List<ItemSetup>();

            if (companyDropDownList.SelectedIndex > 0 && categoryDropDownList.SelectedIndex > 0)
            {
                companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                categoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
                string query = " SELECT * FROM ItemTable as i INNER JOIN CompanyTable as c ON i.CompanyID=c.ID where CompanyID = '" + companyId + "' AND CategoryId='" + categoryId + "' ";
                searchItemList = searchAndViewItemManager.SearchItems(query);

            }
            else if (companyDropDownList.SelectedIndex > 0)
            {
                companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                categoryId = 0;
                string query = " SELECT * FROM ItemTable as i INNER JOIN CompanyTable as c ON i.CompanyID=c.ID where CompanyID = '" + companyId + "' ";
                searchItemList = searchAndViewItemManager.SearchItems(query);

            }
            else if (categoryDropDownList.SelectedIndex > 0)
            {
                companyId = 0;
                categoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
                string query = " SELECT * FROM ItemTable as i INNER JOIN CompanyTable as c ON i.CompanyID=c.ID where CategoryId='" + categoryId + "' ";
                searchItemList = searchAndViewItemManager.SearchItems(query);
            }
            else
            {
                outputLabel.Text = "Please Select Company Or Category";
                outputLabel.ForeColor = Color.OrangeRed;
                ChangeText = false;
            }
            if (ChangeText)
            {
                if (searchItemList.Count > 0)
                {
                    searchItemGridView.DataSource = searchItemList;
                    searchItemGridView.DataBind();
                    outputLabel.Text = "";
                }
                else
                {
                    searchItemGridView.DataSource = null;
                    searchItemGridView.DataBind();
                    outputLabel.Text = "No Data Found";
                    outputLabel.ForeColor = Color.Orange;
                }
            }



        }


        //protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int id = companyDropDownList.SelectedIndex;

        //    if (id > 0)
        //    {
        //        categoryDropDownList.DataSource = searchAndViewItemManager.CatagoryDropDownListByCompany(id);
        //        categoryDropDownList.DataTextField = "Name";
        //        categoryDropDownList.DataValueField = "Id";
        //        categoryDropDownList.DataBind();
        //        categoryDropDownList.Items.Insert(0, new ListItem("--Select Category--", "0"));
        //    }
        //    else
        //    {
        //        outputLabel.Text = "Please Select Company";
        //        outputLabel.ForeColor = Color.Red;
        //    }

        //}

        //protected void categoryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int id = categoryDropDownList.SelectedIndex;
        //    if (id > 0)
        //    {
        //        companyDropDownList.DataSource = searchAndViewItemManager.CompanyDropDownList();
        //        companyDropDownList.DataTextField = "Name";
        //        companyDropDownList.DataValueField = "Id";
        //        companyDropDownList.DataBind();
        //        companyDropDownList.Items.Insert(0, new ListItem("--Select Company--", "0"));
        //    }
        //    else
        //    {
        //        outputLabel.Text = "Please Select Category";
        //        outputLabel.ForeColor = Color.Red;
        //    }
        //}





    }
}