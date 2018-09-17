<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemSetupUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI.ItemSetupUI" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">


<head>

    <title>Item Setup</title>

    <link rel="stylesheet" href="/Contents/css/ButtonStyle.css" />
    <link rel="stylesheet" href="/Contents/css/TextBoxStyle.css" />
    <link rel="stylesheet" href="/Contents/css/NavigationBarStyle.css" />
    <link rel="stylesheet" href="/Contents/css/MainDiv/main.css" />
    <link rel="stylesheet" href="/Contents/css/GridviewStyle.css" />



    <style type="text/css">
        body {
            background-image: url("/Contents/images/slider/1.jpg");
            background-size: cover; /*<------*/
            background-repeat: no-repeat;
            background-position: center center; /* optional, center the image */
        }

        .auto-style1 {
            text-align: right;
        }
    </style>

</head>
<!--/head-->



<body>
    <form id="form1" runat="server">


        <%-- navigationBarSticky start --%>
        <ul class="navigationBarSticky">
            <li><a href="IndexUI.html">
                <img src="../Contents/images/logo4.png" width="74px" height="54px" alt="stockLogo" />
            </a></li>
            <li class="block"><a href="LogOutUI.aspx" class="btn btn-default btn-flat">Log Out</a> </li>
            <li class="block"><a href="ViewSalesUI.aspx">View Sales</a></li>
            <li class="block"><a href="SearchAndViewItemUI.aspx">Search Items</a></li>
            <li class="block"><a href="StockOutUI.aspx">Stock Out</a></li>
            <li class="block"><a href="StockInUI.aspx">Stock In</a></li>
            <li class="block"><a class="active" href="ItemSetupUI.aspx">Item</a></li>
            <li class="block"><a href="CompanyUI.aspx">Company</a></li>
            <li class="block"><a href="CategoryUI.aspx">Category</a></li>
            <li class="block"><a href="IndexUI.html">Home</a></li>
        </ul>
        <%-- navigationBarSticky end --%>



        <div class="maindiv" align="center">
            <table>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Catagory" ForeColor="White"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="CatagoryDropDownList" runat="server" AutoPostBack="True" CssClass="auto-style1" Height="47px" Width="100%">
                            <asp:ListItem Value="0">-- Select Category</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" runat="server" Text="Company" ForeColor="White"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="CompanyDropDownList" runat="server" AutoPostBack="True" Height="47px" Width="100%">
                            <asp:ListItem Value="0">-- Select Category</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label3" runat="server" Text="Item Name" ForeColor="White"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="itemNameTextBox" runat="server" CssClass="textbox"></asp:TextBox></td>
                </tr>

                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label4" runat="server" Text="Reorder Level" ForeColor="White"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="ReorderLevelTextBox" runat="server" CssClass="textbox" TextMode="Number"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="outputLabel" runat="server"></asp:Label>
                    </td>
                    <td>

                        <asp:Button ID="saveButton" runat="server" Text="Save" CssClass="button2" OnClick="saveButton_Click" /></td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>

                </tr>
            </table>
        </div>





    </form>


</body>
</html>
