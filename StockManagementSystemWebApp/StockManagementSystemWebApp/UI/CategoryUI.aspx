<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI.CategoryUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head>
    <title>Category</title>


    <link rel="stylesheet" href="/Contents/css/MainDiv/main.css" />
    <link rel="stylesheet" href="/Contents/css/ButtonStyle.css" />
    <link rel="stylesheet" href="/Contents/css/TextBoxStyle.css" />
    <link rel="stylesheet" href="/Contents/css/NavigationBarStyle.css" />
    <link rel="stylesheet" href="/Contents/css/GridviewStyle.css" />



    <style>
        body {
            background-image: url("/Contents/images/17.png");
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
                <img src="../Contents/images/logo4.png" width="84px" height="64px" alt="stockLogo" />
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




        <div class="maindiv" align="center">

            <table>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Name" Font-Size="Large" ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="nameTextBox" runat="server" CssClass="textbox" placehold="Name.."></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="outputLabel" runat="server" CssClass="auto-style4" Font-Bold="True" Font-Size="Medium"></asp:Label></td>
                    <td class="auto-style2">
                        <asp:Button ID="saveButton" runat="server" CssClass="button0" Text="Save" OnClick="saveButton_Click" /></td>

                </tr>

            </table>
            <br />
            <br />

            <table align="center">
                <%--<table align="center" >--%>
                <tr>
                    <td>
                        <asp:GridView ID="categoryGridView" runat="server" AutoGenerateColumns="False" BackColor="#0489B1" CssClass="mydatagrid" Caption="Category List" CaptionAlign="Top" Style="text-align: center" ForeColor="White" Height="340px" Width="600px">
                            <AlternatingRowStyle BackColor="#086A87" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField ControlStyle-ForeColor="Black" HeaderText="SL">
                                    <ItemTemplate>

                                        <asp:Label runat="server" Font-Bold="True" ForeColor="white" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                        <asp:HiddenField ID="idHiddenField" Value='<%#Eval("Id") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>

                                        <asp:Label runat="server" Font-Bold="True" ForeColor="white" Text='<%#Eval("Name")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="editButton" runat="server" OnClick="editButton_OnClick">Edit</asp:LinkButton>

                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <RowStyle BorderStyle="None" Font-Bold="False" ForeColor="Black" />
                            <SelectedRowStyle BackColor="Aqua" BorderColor="#99FF66" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <%--</table>--%>
        </div>




    </form>

</body>
</html>
