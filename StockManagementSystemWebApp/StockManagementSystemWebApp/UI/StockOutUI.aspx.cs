using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebApp.BLL;
using StockManagementSystemWebApp.DAL.Model;
using StockManagementSystemWebApp.DAL.Model.ViewModel;

namespace StockManagementSystemWebApp.UI
{

    public partial class StockOutUI : System.Web.UI.Page
    {

        StockOutManager stockOutManager = new StockOutManager();
        public List<StockOut> stockOutList;



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LogIn"] == null)
            {
                Response.Redirect("LogInUI.aspx");
            }
            if (!IsPostBack)
            {
                companyDropDownList.DataSource = stockOutManager.CompanyDropDownList();
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataBind();
                companyDropDownList.Items.Insert(0, new ListItem("--Select Company--", "0"));
                stockOutList = new List<StockOut>();
                sellButton.Enabled = false;
                damageButton.Enabled = false;
                lostButton.Enabled = false;
            }


        }



        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (companyDropDownList.DataValueField != "0")
            {
                int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                itemDropDownList.DataSource = stockOutManager.ItemDropDownList(companyId);
                itemDropDownList.DataValueField = "Id";
                itemDropDownList.DataTextField = "Name";
                itemDropDownList.DataBind();
                itemDropDownList.Items.Insert(0, new ListItem("--Select Item--", "0"));

                reorderlevelTextBox.Text = "";
                quantityTextBox.Text = "";
                companyLabel.Text = "";
            }
            else
            {
                companyLabel.Text = "Please First Select Company";
                companyLabel.ForeColor = Color.Orange;
            }
        }

        protected void ItemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (itemDropDownList.SelectedIndex > 0)
            {
                int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                string itemName = itemDropDownList.SelectedItem.ToString();
                StockIn stockIn = stockOutManager.GetAvailableStock(companyId, itemName);

                reorderlevelTextBox.Text = stockIn.ReorderLevel.ToString();
                quantityTextBox.Text = stockIn.AvailableQuantity.ToString();

                stockOutQantityTextBox.Text = "";
                itemLabel.Text = "";
            }
            else
            {
                reorderlevelTextBox.Text = "";
                quantityTextBox.Text = "";
                itemLabel.Text = "Please Select a Item";
                itemLabel.ForeColor = Color.Orange;
            }

        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            sellButton.Enabled = true;
            damageButton.Enabled = true;
            lostButton.Enabled = true;

            if (companyDropDownList.SelectedIndex > 0)
            {
                if (itemDropDownList.SelectedIndex > 0)
                {
                    //Response.Write(itemDropDownList.SelectedIndex);
                    if (Convert.ToInt32(stockOutQantityTextBox.Text) > 0)
                    {

                        if (ViewState["gridVS"] == null)
                        {
                            CreateViewState();
                        }
                        else
                        {
                            if (CheckRowValidity() == false)
                            {
                                AddToViewState();
                            }
                        }

                    }
                    else
                    {
                        companyLabel.Text = "";
                        itemLabel.Text = "";
                        outputLabel.Text = "Please enter valid quantity";
                        outputLabel.ForeColor = Color.Orange;
                    }
                }
                else
                {
                    companyLabel.Text = "";
                    itemLabel.Text = "Please select Item";
                    itemLabel.ForeColor = Color.Red;
                }
            }
            else
            {
                companyLabel.Text = "Please select Company ";
                companyLabel.ForeColor = Color.Orange;
            }

        }




        public void CreateViewState()
        {
            int quantity = Convert.ToInt32(quantityTextBox.Text);
            int stockOutAmount = Convert.ToInt32(stockOutQantityTextBox.Text);
            if (quantity > stockOutAmount)
            {
                StockOut stockOut = new StockOut();
                stockOut.ItemId = Convert.ToInt32(itemDropDownList.SelectedValue);
                stockOut.ItemName = itemDropDownList.SelectedItem.Text;
                stockOut.CompanyName = companyDropDownList.SelectedItem.Text;
                stockOut.Quantity = Convert.ToInt32(stockOutQantityTextBox.Text);
                stockOut.AvailableQuantity = Convert.ToInt32(quantityTextBox.Text) - stockOut.Quantity;

                List<StockOut> stockOutList = new List<StockOut>();
                stockOutList.Add(stockOut);
                ViewState["gridVS"] = stockOutList;
                stockOutGridView.DataSource = stockOutList;
                stockOutGridView.DataBind();
                outputLabel.Text = "";
            }
            else
            {
                outputLabel.Text = "Quantity out-of-range";
                outputLabel.ForeColor = Color.Red;
            }

        }


        public void AddToViewState()
        {
            if (CheckRowValidity() == false)
            {
                List<StockOut> stockOutList = (List<StockOut>)ViewState["gridVS"];
                StockOut stockOut = new StockOut();

                stockOut.ItemId = Convert.ToInt32(itemDropDownList.SelectedValue);
                stockOut.ItemName = itemDropDownList.SelectedItem.Text;
                stockOut.CompanyName = companyDropDownList.SelectedItem.Text;
                stockOut.Quantity = Convert.ToInt32(stockOutQantityTextBox.Text);
                stockOut.AvailableQuantity = Convert.ToInt32(quantityTextBox.Text) - stockOut.Quantity;

                stockOutList.Add(stockOut);

                ViewState["gridVS"] = stockOutList;

                stockOutGridView.DataSource = stockOutList;
                stockOutGridView.DataBind();
                outputLabel.Text = "";
            }

        }


        public bool CheckRowValidity()
        {
            List<StockOut> stockOutList = (List<StockOut>)ViewState["gridVS"];

            foreach (StockOut aStockOut in stockOutList)
            {

                if (aStockOut.ItemName == itemDropDownList.SelectedItem.Text)
                {
                    int stockOutAmount = Convert.ToInt32(stockOutQantityTextBox.Text);
                    int totalQuantity = aStockOut.Quantity + stockOutAmount;

                    if (totalQuantity <= Convert.ToInt32(quantityTextBox.Text))
                    {
                        aStockOut.Quantity = totalQuantity;
                        aStockOut.AvailableQuantity = Convert.ToInt32(quantityTextBox.Text) - Convert.ToInt32(stockOutQantityTextBox.Text);
                        outputLabel.Text = "";

                    }
                    else
                    {
                        outputLabel.Text = "Quantity out-of-range";
                        outputLabel.ForeColor = Color.Red;

                    }

                    ViewState["gridVS"] = stockOutList;

                    stockOutGridView.DataSource = stockOutList;
                    stockOutGridView.DataBind();

                    return true;
                }
            }
            return false;
        }


        protected void clearButton_Click(object sender, EventArgs e)
        {
            ClearGrid();
        }

        protected void ClearGrid()
        {
            ViewState["gridVS"] = null;
            stockOutGridView.DataSource = null;
            stockOutGridView.DataBind();
            sellButton.Enabled = false;
            damageButton.Enabled = false;
            lostButton.Enabled = false;
            outputLabel.Text = null;
        }

        protected void sellButton_Click(object sender, EventArgs e)
        {
            List<StockOut> stockOutList = (List<StockOut>)ViewState["gridVS"];
            outputLabel.Text = stockOutManager.Sell(stockOutList);
            ClearGrid();
            Response.Redirect("StockOutUI.aspx");
        }

        protected void damageButton_Click(object sender, EventArgs e)
        {
            List<StockOut> stockOutList = (List<StockOut>)ViewState["gridVS"];
            outputLabel.Text = stockOutManager.Damage(stockOutList);
            ClearGrid();
            Response.Redirect("StockOutUI.aspx");
        }

        protected void lostButton_Click(object sender, EventArgs e)
        {
            List<StockOut> stockOutList = (List<StockOut>)ViewState["gridVS"];
            outputLabel.Text = stockOutManager.Lost(stockOutList);
            ClearGrid();
            Response.Redirect("StockOutUI.aspx");
        }



    }
}