<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSalesUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI.ViewSalesUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<%--header  start--%>

<head>

    <title>View Sales Setup</title>


    <link rel="stylesheet" href="/Contents/css/form_css/style.css" />

    <link rel="stylesheet" href="/Contents/css/ButtonStyle.css" />
    <link rel="stylesheet" href="/Contents/css/TextBoxStyle.css" />
    <link rel="stylesheet" href="/Contents/css/NavigationBarStyle.css" />
    <link rel="stylesheet" href="/Contents/css/MainDiv/main.css" />
    <link rel="stylesheet" href="/Contents/css/GridviewStyle.css" />



    <style>
        body {
            background-image: url("/Contents/images/30.jpg");
            background-size: cover; /*<------*/
            background-repeat: no-repeat;
            background-position: center center; /* optional, center the image */
        }

        .auto-style1 {
            text-align: right;
        }

        .auto-style2 {
            text-align: right;
        }
    </style>


</head>
<!--/head-->


<%--header end--%>




<body>
    <form id="form1" runat="server">



        <%-- navigationBarSticky start --%>
        <ul class="navigationBarSticky">
            <li><a href="IndexUI.html">
                <img src="../Contents/images/logo4.png" width="74px" height="54px" alt="stockLogo" />
            </a></li>
            <li class="block"><a href="LogOutUI.aspx" class="btn btn-default btn-flat">Log Out</a> </li>
            <li class="block"><a class="active" href="ViewSalesUI.aspx">View Sales</a></li>
            <li class="block"><a href="SearchAndViewItemUI.aspx">Search Items</a></li>
            <li class="block"><a href="StockOutUI.aspx">Stock Out</a></li>
            <li class="block"><a href="StockInUI.aspx">Stock In</a></li>
            <li class="block"><a href="ItemSetupUI.aspx">Item</a></li>
            <li class="block"><a href="CompanyUI.aspx">Company</a></li>
            <li class="block"><a href="CategoryUI.aspx">Category</a></li>
            <li class="block"><a href="IndexUI.html">Home</a></li>
        </ul>
        <%-- navigationBarSticky end --%>




        <div class="maindiv">
            <table align="center" class="auto-style3">

                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="From Date" Font-Bold="True" ForeColor="White"></asp:Label></td>
                    <td class="auto-style5">
                        <asp:TextBox ID="fromDateTextBox" runat="server" TextMode="Date" CssClass="divTextBox1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" runat="server" Text="To Date" Font-Bold="True" ForeColor="White"></asp:Label>

                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="toDateTextBox" runat="server" TextMode="Date" CssClass="divTextBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="outputTextBox" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:Button ID="searchButton" runat="server" Text="Search" CssClass="button1" OnClick="searchButton_Click" /></td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
            </table>

            <table align="center">
                <tr>
                    <td></td>
                    <td>
                        <asp:GridView ID="viewSalesGridView" runat="server" AutoGenerateColumns="False" CssClass="mydatagrid" BackColor="#088A68" Height="381px" Width="394px">
                            <AlternatingRowStyle BackColor="Gray" ForeColor="#2EFEF7"></AlternatingRowStyle>
                            <Columns>

                                <asp:TemplateField HeaderText="SL">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ForeColor="white" Text='<%#Eval("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Items">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("ItemName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sale Quantity">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#Eval("SellQuantity") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>


                            </Columns>
                        </asp:GridView>




                    </td>

                </tr>
                <tr>
                    <td></td>
                    <td class="auto-style2">
                        <asp:Button ID="pdfButton" runat="server" CssClass="button0" Text="Print Pdf" OnClick="pdfButton_Click" />
                    </td>

                </tr>

            </table>


        </div>





    </form>

</body>
</html>
