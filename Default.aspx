<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Universidad._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <div class="jumbotron">
        <h2>Universidad de Ciencias Agropecuarias de Panamá</h2>
        <br />
        <br />

        <div class="row">
            <div class="col-md-5"> 
                <img src="Images/Logo_Big.png" height="500"class="img-fluid"  alt="Responsive image">

            </div>

         

             <div class="col-md-4">
            <h2>Conviertete en un profesional de las Ciencias Agropecuarias</h2>
            <p>
                Con nuestras carreras aplciadas a las ciencias naturales y agropecuarias podras convertirte en un profesional en muchas áreas de la agricultura,
                medio ambiente, veterinaria, entre otras más.
            </p>
            <p>
                <a class="btn btn-default" href="About">Quiero saber más &raquo;</a>
            </p>
        </div>


        </div>
        
    </div>

    <div class="row">
       
        <div class="col-md-4">
            <h2>Calendario Academico 2020</h2>
            <p>
                <div class="col-md-5"> 
                <img src="Images/Calendario.png" height="500"class="img-fluid"  alt="Responsive image">

            </div>
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Admisiones 2021 Abiertas</h2>
            <p>
                Si estas interesado en matricularte para el año 2021 en alguna de nuestras carreras puedes entrar en el enlace para saber más
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
