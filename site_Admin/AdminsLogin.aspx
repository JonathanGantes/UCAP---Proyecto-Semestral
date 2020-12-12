<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AdminsLogin.aspx.vb" Inherits="Universidad.AdminsLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: center;
            width: 305px;
            height: 273px;
            margin: 0 auto;
            background-color: #cccccc;
        }
        .auto-style3 {
            height: 362px;
            text-align: center;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">

        <h1 class="auto-style1">Login</h1>
        <p class="auto-style1">&nbsp;</p>
        <div class="auto-style3">
        <div class="auto-style2">
            <br class="auto-style4" />
            <br />
        ID Administrativo:
            <br />
        <asp:TextBox ID="TextBox1" runat="server" AutoCompleteType="Disabled" MaxLength="8"></asp:TextBox>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\d+" ControlToValidate="TextBox1"> Error: Solo se Permiten Números</asp:RegularExpressionValidator>
        <br />
            Contraseña:<br />
&nbsp;<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>


        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Iniciar Sesión" />
        </div>
            <br />
        </div>


    </form>
</body>
</html>
