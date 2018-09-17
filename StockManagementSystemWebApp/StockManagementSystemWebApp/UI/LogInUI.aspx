<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInUI.aspx.cs" Inherits="StockManagementSystemWebApp.UI.LogInUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign-Up/Login Form</title>
    <%-- <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>--%>


    <link rel="stylesheet" href="/Contents/css/form_css/style.css" />

    <style>
        body {
            background-image: url("/Contents/images/StockRates.jpg");
        }

        p {
            color: #00fa9a;
        }
    </style>



</head>
<body>
    <form id="form1" runat="server">
        <div class="form">
            <ul class="tab-group">
                <li class="tab active"><a href="#login">Log In</a></li>
                <li class="tab"><a href="#signup">Sign Up</a></li>
            </ul>

            <div id="login">
                <asp:Label ID="Label1" runat="server" Text="User Name" ForeColor="White"></asp:Label>

                <asp:TextBox ID="userNameTextBox" CssClass="input" runat="server"></asp:TextBox>
                <asp:Label ID="userNameLabel" ForeColor="red" runat="server" Text=""></asp:Label>
                <br />
                <br />

                <asp:Label ID="Label2" runat="server" Text="Password" ForeColor="White"></asp:Label>
                <asp:TextBox ID="passwordTextBox" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
                <asp:Label ID="passwordLabel" runat="server" ForeColor="red" Text=""></asp:Label>
                <br />
                <asp:Label ID="logInLabel" runat="server" Font-Size="Medium" Font-Strikeout="False" ForeColor="Red"></asp:Label>
                <br />
                <p class="forgot">forgot password?</p>
                <br />
                <asp:Button ID="loginButton" runat="server" Text="LogIn" CssClass="button button-block" OnClick="loginButton_Click" />
                
            </div>


            <div id="signup">
            </div>




        </div>



    </form>


    <%--<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>--%>



    <%--<script  src="/css/form_js/index.js"></script>--%>
</body>
</html>
