<%@ Page Title="Facultades" Language="vb" AutoEventWireup="false" MasterPageFile="~/site_Admin/Admins.Master" CodeBehind="Facultades.aspx.vb" Inherits="Universidad.Facultades" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Listado de Facultades</h1>

    <br />
    <br />
    Añadir una Nueva Facultad:
    <br />
    <asp:Label ID="Label1" runat="server" Text="Nombre:"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Width="222px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Insertar" Width="127px" />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:UCAP-MainConnectionString4 %>" DeleteCommand="DELETE FROM Facultad WHERE ID_Facultad = ?" InsertCommand="INSERT INTO Facultad (ID_Facultad, Descripción) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:UCAP-MainConnectionString4.ProviderName %>" SelectCommand="SELECT * FROM Facultad" UpdateCommand="UPDATE Facultad SET Descripción = @Param1 WHERE (ID_Facultad = @Param2)">
        <DeleteParameters>
            <asp:Parameter Name="ID_Facultad" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ID_Facultad" Type="Int32" />
            <asp:Parameter Name="Descripción" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Descripción" Type="String" />
            <asp:Parameter Name="ID_Facultad" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>


    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_Facultad" CellPadding="4" ForeColor="#333333" GridLines="None" Height="19px" Width="530px" ShowFooter="True"  ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID_Facultad" HeaderText="ID_Facultad" InsertVisible="False" ReadOnly="True" SortExpression="ID_Facultad" />
            <asp:BoundField DataField="Descripción" HeaderText="Descripción" SortExpression="Descripción" />
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

    
    <br />
    <asp:Button ID="Button2" runat="server" Text="Export" />
    <br />

    
</asp:Content>
