<%@ Page Title="Contacto" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="Universidad.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>Pagina de Contacto.</p>
   
    <div class="row">
<div class="col-md-4">
             <h2>Campus Central</h2>
    <address>
        Dirección:

        Chiriquí, San Pablo Viejo<br />
        Calle 1, Edificio 2 <br />
        <abbr title="Phone">Telefono:</abbr>
        2-250-328
    </address>

    <address>
        <strong>Soporte:</strong><a href="mailto:support@ucap.ac.pa">Support@ucap.ac.pa</a><br />
        <strong>Legal:</strong><a href="mailto:legal@ucap.ac.pa">Legal@ucap.ac.pa</a>
    </address>
        </div>


        <div class="col-md-4">
             <h2>Campus Boquete</h2>
    <address>
        Dirección:

        Chiriquí, Boquete<br />
        Calle Principal, Edificio 9 <br />
        <abbr title="Phone">Telefono:</abbr>
        2-250-320
    </address>

    <address>
        <strong>Soporte:</strong><a href="mailto:support.boquete@ucap.ac.pa">Support.boquete@ucap.ac.pa</a><br />
    </address>
        </div>

    </div>
    


</asp:Content>
