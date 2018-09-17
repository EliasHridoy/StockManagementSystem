<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI.CompanyUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<%--header start--%>

<head>

    <title>Company Setup</title>


    <link rel="stylesheet" href="/Contents/css/form_css/style.css" />



    <link rel="stylesheet" href="/Contents/css/ButtonStyle.css" />
    <link rel="stylesheet" href="/Contents/css/TextBoxStyle.css" />
    <link rel="stylesheet" href="/Contents/css/NavigationBarStyle.css" />
    <link rel="stylesheet" href="/Contents/css/MainDiv/main.css" />
    <link rel="stylesheet" href="/Contents/css/GridviewStyle.css" />




    <style>
        body {
            background-image: url("/Contents/images/52.jpg");
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
                <img src="../Contents/images/logo4.png" width="84px" height="64px" alt="stockLogo" />
            </a></li>
            
            <li class="block"><a href="LogOutUI.aspx" class="btn btn-default btn-flat">Log Out</a> </li>
            <li class="block"><a href="ViewSalesUI.aspx">View Sales</a></li>
            <li class="block"><a href="SearchAndViewItemUI.aspx">Search Items</a></li>
            <li class="block"><a href="StockOutUI.aspx">Stock Out</a></li>
            <li class="block"><a href="StockInUI.aspx">Stock In</a></li>
            <li class="block"><a href="ItemSetupUI.aspx">Item</a></li>
            <li class="block"><a class="active" href="CompanyUI.aspx">Company</a></li>
            <li class="block"><a href="CategoryUI.aspx">Category</a></li>
            <li class="block"><a href="IndexUI.html">Home</a></li>

        </ul>

        <%-- navigationBarSticky end --%>



        <div align="center" class="form">

            <table>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Name" ForeColor="white"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="nameTextBox" runat="server" CssClass="input"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="outputLabel" runat="server" Text="" ForeColor="White"></asp:Label></td>
                    <td>
                        <asp:Button ID="saveButton" runat="server" Text="Save" CssClass="button1" OnClick="saveButton_Click" /></td>

                </tr>

            </table>
            <div class="auto-style1">
                <br />
            </div>
            <table align="center">
                <tr>
                    <asp:GridView ID="companyGridView" runat="server" AutoGenerateColumns="False" BackColor="#04B4AE" ForeColor="white" CssClass="mydatagrid" Style="text-align: center" Caption="Company List" CaptionAlign="Top" Height="237px" Width="313px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="SL">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("Id")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </tr>
            </table>
        </div>



    </form>

</body>
</html>
