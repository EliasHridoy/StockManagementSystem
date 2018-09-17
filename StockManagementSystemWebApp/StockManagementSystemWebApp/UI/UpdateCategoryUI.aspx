<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCategoryUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI.UpdateCategoryUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <link rel="stylesheet" href="/Contents/css/form_css/style.css" />

    <link rel="stylesheet" href="/Contents/css/ButtonStyle.css" />
    <link rel="stylesheet" href="/Contents/css/TextBoxStyle.css" />
    <link rel="stylesheet" href="/Contents/css/NavigationBarStyle.css" />
    <link rel="stylesheet" href="/Contents/css/MainDiv/main.css" />
    <link rel="stylesheet" href="/Contents/css/GridviewStyle.css" />


    <style>
        body {
            background-image: url("/Contents/images/update.jpg");
            background-size: cover; /*<------*/
            background-repeat: no-repeat;
            background-position: center center; /* optional, center the image */
        }

        .auto-style1 {
            text-align: right;
        }
    </style>

</head>
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
            <li class="block"><a href="ItemSetupUI.aspx">Item</a></li>
            <li class="block"><a href="CompanyUI.aspx">Company</a></li>
            <li class="block"><a class="active" href="CategoryUI.aspx">Category</a></li>
            <li class="block"><a href="IndexUI.html">Home</a></li>
        </ul>
        <%-- navigationBarSticky end --%>



        <div class="form">
            <table align="center">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Name" Font-Bold="True" ForeColor="White"></asp:Label>
                    </td>
                    <asp:HiddenField ID="idHiddenField" runat="server" />
                    <td>
                        <asp:TextBox ID="nameTextBox" runat="server" CssClass="textbox"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="outputLabel" runat="server" Text="" CssClass="auto-style4"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:Button ID="updateButton" runat="server" Text="Update" CssClass="button2" OnClick="updateButton_Click" /></td>

                </tr>

            </table>

        </div>
    </form>
</body>
</html>
