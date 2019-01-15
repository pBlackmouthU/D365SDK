<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Web.JQuery.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Application.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-inverse" role="navigation">
            <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Desplegar navegación</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Home.aspx">
                    <img src="Content/Images/windows2.png" class="logo" />
                </a>
            </div>

            <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#">Clientes Potenciales</a></li>
                    <li><a href="#">Contactos</a></li>
                </ul>
            </div>
        </nav>

        <%-- BREADCRUMB --%>
        <ol class="breadcrumb">
            <li class="active">Inicio</li>
        </ol>

        <form id="form1" runat="server">
            <div class="jumbotron">
                <div class="container">
                    <h1>SDK .NET Dynamics CRM</h1>
                    <p>
                        Todo lo que necesitas para comenzar a desarrollar aplicaciones y extensiones para Dynamics CRM.
                    </p>
                </div>
            </div>
            <h2>Objetivo del curso</h2>
            <p>
                Proveer una base solida de conocimiento para el desarrollo de aplicaciones y extensiones para Dynamics CRM, utilizando tecnologías y métodos de desarrollo modernos para facilitar su comprensión.
            </p>
            <h2>Alcance de este curso</h2>
            <p>
                Este curso no pretende ser un curso de desarrollo de aplicaciones Web, estará enfocado únicamente en medios y herramientas necesarios 
                para lograr completar los objetivos de cada tema propuesto en relación con Dynamics CRM, por lo que es necesario contar con conocimiento previo y bien simentado del
                desarrollo de aplicaiones Web en todas sus formas.
            </p>
            <h2>Pre - requisitos</h2>
            <p>
                Para poder llegar a la conclusión exitosa de este curso es necesario contar con los siguientes requisitos:
            </p>
            <ul>
                <li>Instancia de Dynamics 365 para desarrollo. (De preferencia personal. Una de prueba)</li>
                <li>Visual Studio 2015 o superior (Cualquier version)</li>
                <li>Conocimiento básico de jQuery</li>
                <li>Conocimiento básico a intermedio de C#</li>
                <li>Conocimiento básico de Dynamics CRM (Deseable)</li>
            </ul>
            <h2 id="Temario">Temario</h2>
            <h4><a href="#Tema1">1. Conexión a Dynamics 365</a></h4>
        </form>
    </div>

    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
