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
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <h1 class="auto-style1">Login</h1>
        ID Administrativo:
        <asp:TextBox ID="TextBox1" runat="server" AutoCompleteType="Disabled" MaxLength="8"></asp:TextBox>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\d+" ControlToValidate="TextBox1"> Error: Solo se Permiten Números</asp:RegularExpressionValidator>
        <br />
        Contraseña:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>


        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Iniciar Sesión" />
        <p>
            &nbsp;</p>


    </form>
</body>
</html>
