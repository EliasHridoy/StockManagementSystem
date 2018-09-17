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
    public partial class StockInUI : System.Web.UI.Page
    {
        StockInManager stockInManager = new StockInManager();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LogIn"] == null)
            {
                Response.Redirect("LogInUI.aspx");
            }
            if (!IsPostBack)
            {
                companyDropDownList.DataSource = stockInManager.CompanyDropDownList();
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataBind();
                companyDropDownList.Items.Insert(0, new ListItem("--Select Company--", "0"));
            }
        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {


            if (companyDropDownList.DataValueField != "0")
            {
                int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                ItemDropDownList.DataSource = stockInManager.ItemDropDownList(companyId);
                ItemDropDownList.DataBind();
                ItemDropDownList.Items.Insert(0, new ListItem("--Select Item--", "0"));

                reorderlevelTextBox.Text = "";
                availableQuantityTextBox.Text = "";
            }
            else
            {
                outputLabel.Text = "Please First Select Company";
                outputLabel.ForeColor = Color.Red;
            }
        }

        protected void ItemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ItemDropDownList.SelectedIndex != 0)
            {
                int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                string itemName = ItemDropDownList.SelectedItem.ToString();
                StockIn stockIn = stockInManager.GetAvailableStock(companyId, itemName);

                reorderlevelTextBox.Text = stockIn.ReorderLevel.ToString();
                availableQuantityTextBox.Text = stockIn.AvailableQuantity.ToString();
            }

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {

            if (companyDropDownList.SelectedIndex > 0 && ItemDropDownList.SelectedIndex > 0)
            {
                if (stockInQantityTextBox.Text != "")
                {
                    int stockInQantity = Convert.ToInt32(stockInQantityTextBox.Text);
                    if (stockInQantity > 0)
                    {
                        StockIn stockIn = new StockIn();
                        stockIn.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                        stockIn.ItemName = ItemDropDownList.SelectedItem.ToString();

                        stockIn.AvailableQuantity = Convert.ToInt32(availableQuantityTextBox.Text) +
                                                    stockInQantity;
                        outputLabel.Text = stockInManager.SaveQuantity(stockIn);
                        outputLabel.ForeColor = Color.Green;
                        availableQuantityTextBox.Text = stockIn.AvailableQuantity.ToString();
                        stockInQantityTextBox.Text = "";
                    }
                    else
                    {
                        outputLabel.Text = "Negative value entered";
                    }
                }
                else
                {

                    outputLabel.Text = "Please Enter Valid Stock In Quantity";
                    outputLabel.ForeColor = Color.Red;
                }
            }
            else
            {


                outputLabel.Text = "Please Select Company and Item";
                outputLabel.ForeColor = Color.Red;
            }

        }


    }
}