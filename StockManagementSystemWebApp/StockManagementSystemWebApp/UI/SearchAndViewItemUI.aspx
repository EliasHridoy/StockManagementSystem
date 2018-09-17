<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchAndViewItemUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI.Search_ViewItemUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<%--header copy start--%>

<head>

    <title>Search & View Item Setup</title>

    <link rel="stylesheet" href="/Contents/css/form_css/style.css" />

    <link rel="stylesheet" href="/Contents/css/ButtonStyle.css" />
    <link rel="stylesheet" href="/Contents/css/TextBoxStyle.css" />
    <link rel="stylesheet" href="/Contents/css/NavigationBarStyle.css" />
    <link rel="stylesheet" href="/Contents/css/MainDiv/main.css" />
    <link rel="stylesheet" href="/Contents/css/GridviewStyle.css" />


    <style>
        body {
            background-image: url("/Contents/images/101.jpg");
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
            <li class="block"><a class="active" href="SearchAndViewItemUI.aspx">Search Items</a></li>
            <li class="block"><a href="StockOutUI.aspx">Stock Out</a></li>
            <li class="block"><a href="StockInUI.aspx">Stock In</a></li>
            <li class="block"><a href="ItemSetupUI.aspx">Item</a></li>
            <li class="block"><a href="CompanyUI.aspx">Company</a></li>
            <li class="block"><a href="CategoryUI.aspx">Category</a></li>
            <li class="block"><a href="IndexUI.html">Home</a></li>
        </ul>
        <%-- navigationBarSticky end --%>



        <div class="form" align="center">


            <table align="center">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Company" ForeColor="White"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="companyDropDownList" ForeColor="White" BackColor="#284775" runat="server" Height="47px" Width="100%" AutoPostBack="True"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" runat="server" Text="Category" ForeColor="White"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="categoryDropDownList" ForeColor="white" BackColor="#088A68" runat="server" Height="47px" Width="100%" AutoPostBack="True"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="outputLabel" runat="server" Text="" ForeColor="White"></asp:Label></td>
                    <td>
                        <asp:Button ID="searchButton" runat="server" Text="Search" CssClass="button1" OnClick="searchButton_Click" />
                    </td>
                </tr>

            </table>
            <div>
                <br />
            </div>

            <table align="center">
                <tr>
                    <asp:GridView ID="searchItemGridView" runat="server" AutoGenerateColumns="False" Style="text-align: center" ForeColor="White" BackColor="#04B4AE" CssClass="mydatagrid">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>

                            <asp:TemplateField HeaderText=" SL ">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("CatagoryId")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="  Item  ">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("ItemName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Company">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("CompanyName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Available Quantity">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("AvailableQuantity")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Reorder Level">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("ReorderLevel")%>'></asp:Label>
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
