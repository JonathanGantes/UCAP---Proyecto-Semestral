<%@ Page Title="Personas" Language="vb" AutoEventWireup="false" MasterPageFile="~/site_Admin/Admins.Master" CodeBehind="Personas.aspx.vb" Inherits="Universidad.Personas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/Inscripcion.js"></script>
    
    <h1>Listado de Personas</h1>

    <br />
    <br />
    Añadir una Nueva Persona:
    <br />
    <br />
    Cedula: <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
    <br />
    <br />
    Nombre 1: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>  Nombre 2: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> Apellido1: <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox> Apellido2: <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox> 
    <br />
    <br />
    Fecha de Nacimiento: <asp:TextBox ID="TextBox5" runat="server" TextMode="Date"></asp:TextBox> Correo: <asp:TextBox ID="TextBox6" runat="server" TextMode="Email"></asp:TextBox>  Dirección: <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox> &nbsp;Sexo: <asp:CheckBox ID="CheckBox1" runat="server" OnClick="ValidaM()" Text="Masculino" /> <asp:CheckBox ID="CheckBox2" runat="server" OnClick="ValidaF()" Text="Femenino" />
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Añadir Persona" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1120px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Cedula" HeaderText="Cedula" SortExpression="Cedula" />
            <asp:BoundField DataField="Nombre1" HeaderText="Nombre1" SortExpression="Nombre1" />
            <asp:BoundField DataField="Nombre2" HeaderText="Nombre2" SortExpression="Nombre2" />
            <asp:BoundField DataField="Apellido1" HeaderText="Apellido1" SortExpression="Apellido1" />
            <asp:BoundField DataField="Apellido2" HeaderText="Apellido2" SortExpression="Apellido2" />
            <asp:BoundField DataField="Fecha_Nac" HeaderText="Fecha_Nac" SortExpression="Fecha_Nac" />
            <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
            <asp:BoundField DataField="Sexo" HeaderText="Sexo" SortExpression="Sexo" />
            <asp:BoundField DataField="Correo_E" HeaderText="Correo_E" SortExpression="Correo_E" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UCAP-MainConnectionString3 %>" DeleteCommand="DELETE FROM Persona WHERE ID = ?" InsertCommand="INSERT INTO [Persona] (ID, Cedula, Nombre1, Nombre2, Apellido1, Apellido2, Fecha_Nac, Direccion, Sexo, Correo_E) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:UCAP-MainConnectionString3.ProviderName %>" SelectCommand="SELECT * FROM Persona" UpdateCommand="UPDATE Persona SET Cedula = ?, Nombre1 = ?, Nombre2 = ?, Apellido1 = ?, Apellido2 = ?, Fecha_Nac = ?, Direccion = ?, Sexo = ?, Correo_E = ? WHERE ID = ?" OldValuesParameterFormatString="original_{0}">
    <DeleteParameters>
        <asp:Parameter Name="original_ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ID" Type="Int32" />
        <asp:Parameter Name="Cedula" Type="String" />
        <asp:Parameter Name="Nombre1" Type="String" />
        <asp:Parameter Name="Nombre2" Type="String" />
        <asp:Parameter Name="Apellido1" Type="String" />
        <asp:Parameter Name="Apellido2" Type="String" />
        <asp:Parameter Name="Fecha_Nac" Type="DateTime" />
        <asp:Parameter Name="Direccion" Type="String" />
        <asp:Parameter Name="Sexo" Type="String" />
        <asp:Parameter Name="Correo_E" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Cedula" Type="String" />
        <asp:Parameter Name="Nombre1" Type="String" />
        <asp:Parameter Name="Nombre2" Type="String" />
        <asp:Parameter Name="Apellido1" Type="String" />
        <asp:Parameter Name="Apellido2" Type="String" />
        <asp:Parameter Name="Fecha_Nac" Type="DateTime" />
        <asp:Parameter Name="Direccion" Type="String" />
        <asp:Parameter Name="Sexo" Type="String" />
        <asp:Parameter Name="Correo_E" Type="String" />
        <asp:Parameter Name="original_ID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
