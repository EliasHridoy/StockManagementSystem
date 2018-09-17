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
    public partial class ItemSetupUI : System.Web.UI.Page
    {
        ItemSetupManager itemSetupManager = new ItemSetupManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LogIn"] == null)
            {
                Response.Redirect("LogInUI.aspx");
            }

            if (!IsPostBack)
            {
                CatagoryDropDownList.DataSource = itemSetupManager.CatagoryDropDownList();
                CatagoryDropDownList.DataTextField = "Name";
                CatagoryDropDownList.DataValueField = "Id";
                CatagoryDropDownList.DataBind();
                CatagoryDropDownList.Items.Insert(0, new ListItem("--Select Category--", "0"));

                CompanyDropDownList.DataSource = itemSetupManager.CompanyDropDownList();
                CompanyDropDownList.DataTextField = "Name";
                CompanyDropDownList.DataValueField = "Id";
                CompanyDropDownList.DataBind();
                CompanyDropDownList.Items.Insert(0, new ListItem("--Select Company--", "0"));
                ReorderLevelTextBox.Text = "0";
            }

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            if (itemNameTextBox.Text.ToString() != "")
            {
                ItemSetup itemSetup = new ItemSetup();
                if (CatagoryDropDownList.Text != "0" && CompanyDropDownList.Text != "0")
                {
                    itemSetup.CatagoryId = Convert.ToInt32(CatagoryDropDownList.SelectedValue);
                    itemSetup.CompanyId = Convert.ToInt32(CompanyDropDownList.SelectedValue);
                    itemSetup.ItemName = itemNameTextBox.Text;
                    if (ReorderLevelTextBox.Text.ToString() == "")
                    {
                        itemSetup.ReorderLevel = 0;
                    }
                    else
                    {
                        itemSetup.ReorderLevel = Convert.ToInt32(ReorderLevelTextBox.Text);
                    }

                    outputLabel.Text = itemSetupManager.Save(itemSetup);

                    itemNameTextBox.Text = "";
                    ReorderLevelTextBox.Text = "0";
                }
                else
                {
                    outputLabel.Text = "Please Select an Item";
                    outputLabel.ForeColor = Color.Orange;

                }
            }
            else
            {
                outputLabel.Text = "Please Enter a Item Name";
                outputLabel.ForeColor = Color.Orange;
            }


        }

    }
}