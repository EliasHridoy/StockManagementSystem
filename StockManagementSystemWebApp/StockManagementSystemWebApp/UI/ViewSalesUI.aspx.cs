using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using StockManagementSystemWebApp.BLL;
using StockManagementSystemWebApp.DAL.Model.ViewModel;
using Color = System.Drawing.Color;

namespace StockManagementSystemWebApp.UI
{
    public partial class ViewSalesUI : System.Web.UI.Page
    {
        ViewSalesManager viewSalesManager = new ViewSalesManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LogIn"] == null)
            {
                Response.Redirect("LogInUI.aspx");
            }
            pdfButton.Enabled = false;
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string fromDate = fromDateTextBox.Text;
            string toDate = toDateTextBox.Text;
            int dateValidity = String.Compare(fromDate, toDate, true);


            if (fromDate != "")
            {
                if (toDate != "")
                {
                    if (dateValidity < 0)
                    {
                        List<ViewSales> salesList = viewSalesManager.GetsalesItemByDate(fromDate, toDate);
                        viewSalesGridView.DataSource = salesList;
                        viewSalesGridView.DataBind();
                        outputTextBox.Text = "";

                        if (salesList.Count == 0)
                        {
                            outputTextBox.Text = "No data found";
                        }

                        pdfButton.Enabled = true;
                    }
                    else
                    {
                        viewSalesGridView.DataSource = null;
                        viewSalesGridView.DataBind();
                        outputTextBox.Text = "Date Selection Invalid";
                        outputTextBox.ForeColor = Color.OrangeRed;
                    }
                }
                else
                {

                    viewSalesGridView.DataSource = null;
                    viewSalesGridView.DataBind();
                    outputTextBox.Text = "Select 'To Date' ";
                    outputTextBox.ForeColor = Color.OrangeRed;
                }

            }
            else
            {

                viewSalesGridView.DataSource = null;
                viewSalesGridView.DataBind();
                outputTextBox.Text = "Select 'From Date' ";
                outputTextBox.ForeColor = Color.OrangeRed;
            }

        }

        protected void pdfButton_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Sales List.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            viewSalesGridView.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 10f);
            HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();
            htmlParser.Parse(sr);
            pdfDoc.Close();

            Response.Write(pdfDoc);
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            return;
        }
    }
}