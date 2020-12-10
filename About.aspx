<%@ Page Title="Acerca de" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.vb" Inherits="Universidad.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div class="jumbotron">

        <h1>Universidad de Ciencias Agropecuarias de Panamá</h1>
        <p class="lead">Universidad especializada en carreras afines a las ciencas agropecuarias, naturales y ambientales que busca aumentar y generar valor e importancia de ciencias agropecuarias y la naturaleza</p>
        
        <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 800px; height:400px; margin: 0 auto">
  <!-- Indicators -->
      <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="Images/about1.jpg" alt="Chania"/>
            </div>

            <div class="item">
                <img src="Images/about2.jpg" alt="Chania"/>
            </div>

            <div class="item">
                <img src="Images/about4.jpg" alt="Flower"/>
            </div>

            <div class="item">
                <img src="Images/about3.jpg" alt="Flower"/>
            </div>
      </div>

  <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
      </a>
 </div>

    </div>


</asp:Content>
