<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI.StockOutUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<%--header copy start--%>

<head>

    <title>Stock Out Setup</title>

    <link rel="stylesheet" href="/Contents/css/form_css/style.css" />

    <link rel="stylesheet" href="/Contents/css/ButtonStyle.css" />
    <link rel="stylesheet" href="/Contents/css/TextBoxStyle.css" />
    <link rel="stylesheet" href="/Contents/css/NavigationBarStyle.css" />
    <link rel="stylesheet" href="/Contents/css/MainDiv/main.css" />
    <link rel="stylesheet" href="/Contents/css/GridviewStyle.css" />


    <style>
        body {
            background-image: url("/Contents/images/33.jpg");
            background-size: cover; /*<------*/
            background-repeat: no-repeat;
            background-position: center center; /* optional, center the image */
        }


        .btnSell {
            border: none; /* Remove borders */
            color: white; /* Add a text color */
            padding: 14px 28px; /* Add some padding */
            cursor: pointer; /* Add a pointer cursor on mouse-over */
            background-color: #4CAF50;
        }

            .btnSell:hover {
                background-color: #46a049;
            }

        .btnDamage {
            border: none; /* Remove borders */
            color: white; /* Add a text color */
            padding: 14px 28px; /* Add some padding */
            cursor: pointer; /* Add a pointer cursor on mouse-over */
            background-color: #f44336;
        }

            .btnDamage:hover {
                background: #da190b;
            }


        .btnLost {
            border: none; /* Remove borders */
            color: white; /* Add a text color */
            padding: 14px 28px; /* Add some padding */
            cursor: pointer; /* Add a pointer cursor on mouse-over */
            background-color: #ff9800;
        }

            .btnLost:hover {
                background: #e68a00;
            }




        .auto-style1 {
            text-align: right;
        }

        .button2:hover {
            background-color: #e22347;
            color: white;
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
            <li class="block"><a class="active" href="StockOutUI.aspx">Stock Out</a></li>
            <li class="block"><a href="StockInUI.aspx">Stock In</a></li>
            <li class="block"><a href="ItemSetupUI.aspx">Item</a></li>
            <li class="block"><a href="CompanyUI.aspx">Company</a></li>
            <li class="block"><a href="CategoryUI.aspx">Category</a></li>
            <li class="block"><a href="IndexUI.html">Home</a></li>
        </ul>
        <%-- navigationBarSticky end --%>




        <div class="maindiv" align="center">
            <table>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Company" ForeColor="White"></asp:Label></td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="companyDropDownList" runat="server" CssClass="textbox" Height="50px" Width="101%" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged"></asp:DropDownList></td>
                    <td>
                        <asp:Label ID="companyLabel" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" runat="server" Text="Item" ForeColor="White"></asp:Label></td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="itemDropDownList" runat="server" CssClass="textbox" Height="50px" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="ItemDropDownList_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="itemLabel" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label3" runat="server" Text="Reorder Level" ForeColor="White"></asp:Label></td>
                    <td class="auto-style3">
                        <asp:TextBox ID="reorderlevelTextBox" runat="server" CssClass="textbox" Enabled="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label4" runat="server" Text="Available Quantity" ForeColor="White"></asp:Label></td>
                    <td class="auto-style3">
                        <asp:TextBox ID="quantityTextBox" runat="server" CssClass="textbox" Enabled="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label5" runat="server" Text="Stock Out Quantity" ForeColor="White"></asp:Label></td>
                    <td class="auto-style3">
                        <asp:TextBox ID="stockOutQantityTextBox" runat="server" CssClass="textbox" TextMode="Number"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td class="auto-style3">
                        <asp:Button ID="addButton" runat="server" Text="Add" CssClass="button0" OnClick="addButton_Click" Height="52px" Width="130px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="clearButton" runat="server" Text="Clear All" CssClass="button2" OnClick="clearButton_Click" Height="54px" Width="131px" />
                    </td>
                    <td>
                        <asp:Label ID="outputLabel" runat="server" Text=""></asp:Label>
                    </td>
                </tr>

            </table>
            <br />

            &nbsp;<table align="center">
                <asp:GridView ID="stockOutGridView" runat="server" AutoGenerateColumns="False" BackColor="#088A69" CssClass="mydatagrid" Style="text-align: center">
                    <AlternatingRowStyle BackColor="#086A87" ForeColor="#284775"></AlternatingRowStyle>
                    <Columns>
                        <asp:TemplateField HeaderText=" SL ">
                            <ItemTemplate>
                                <%--<asp:Label runat="server" Text='<%#Eval("ItemId")%>'></asp:Label>--%>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="  Item  ">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("ItemName")%>' Font-Bold="True" ForeColor="white"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Company">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("CompanyName")%>' Font-Bold="True" ForeColor="white"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Available Quantity">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("Quantity")%>' Font-Bold="True" ForeColor="white"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>

                </asp:GridView>

            </table>
            <br />
            <table class="auto-style2" align="center">
                <tr>
                    <td>
                        <asp:Button ID="sellButton" runat="server" Text="Sell" CssClass="btnSell" OnClick="sellButton_Click" /></td>
                    <td>
                        <asp:Button ID="damageButton" runat="server" Text="Damage" CssClass="btnDamage" OnClick="damageButton_Click" /></td>
                    <td>
                        <asp:Button ID="lostButton" runat="server" Text="Lost" CssClass="btnLost" OnClick="lostButton_Click" />
                    </td>
                </tr>
            </table>


        </div>

    </form>

</body>
</html>
