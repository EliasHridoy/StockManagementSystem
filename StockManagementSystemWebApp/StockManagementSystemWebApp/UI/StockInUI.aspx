<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockInUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI.StockInUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<%--header copy start--%>

<head>

    <title>Stock In Setup</title>

    <link rel="stylesheet" href="/Contents/css/form_css/style.css" />

    <link rel="stylesheet" href="/Contents/css/ButtonStyle.css" />
    <link rel="stylesheet" href="/Contents/css/TextBoxStyle.css" />
    <link rel="stylesheet" href="/Contents/css/NavigationBarStyle.css" />
    <link rel="stylesheet" href="/Contents/css/MainDiv/main.css" />
    <link rel="stylesheet" href="/Contents/css/GridviewStyle.css" />

    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }


        body {
            background-image: url("/Contents/images/31.jpg");
            background-size: cover; /*<------*/
            background-repeat: no-repeat;
            background-position: center center; /* optional, center the image */
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
            <li class="block"><a class="active" href="StockInUI.aspx">Stock In</a></li>
            <li class="block"><a href="ItemSetupUI.aspx">Item</a></li>
            <li class="block"><a href="CompanyUI.aspx">Company</a></li>
            <li class="block"><a href="CategoryUI.aspx">Category</a></li>
            <li class="block"><a href="IndexUI.html">Home</a></li>
        </ul>
        <%-- navigationBarSticky end --%>

        <div class="form">
            <table align="center">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Company" ForeColor="White"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="companyDropDownList" runat="server" CssClass="textbox" Height="52px" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" runat="server" Text="Item" ForeColor="White"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ItemDropDownList" runat="server" CssClass="textbox" Height="47px" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="ItemDropDownList_SelectedIndexChanged"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label3" runat="server" Text="Reorder Level" ForeColor="White"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="reorderlevelTextBox" runat="server" CssClass="textbox" Enabled="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label4" runat="server" Text="Available Quantity" ForeColor="White"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="availableQuantityTextBox" runat="server" CssClass="textbox" Enabled="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label5" runat="server" Text="Stock In Quantity" ForeColor="White"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="stockInQantityTextBox" runat="server" CssClass="textbox" TextMode="Number"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style2">
                        <asp:Button ID="saveButton" runat="server" Text="Save" CssClass="button button-block" OnClick="saveButton_Click" /></td>
                    <td>
                        <asp:Label ID="outputLabel" runat="server" Text="" ForeColor="White"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>




    </form>




</body>
</html>
