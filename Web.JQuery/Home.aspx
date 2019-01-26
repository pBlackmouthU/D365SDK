<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Web.JQuery.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/AppStyles/Home.css" rel="stylesheet" />
</head>
<body>
    <div class="container">


        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
          <a class="navbar-brand" href="#">
            <img src="Content/Images/windows2.png" class="logo" />
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item">
                <a class="nav-link" href="#">Clientes Potenciales <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Contactos</a>
              </li>
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
            <h2 id="Ejercicios">Ejercicios</h2>
            <p>
                Ejemplos de uso del SDK
            </p>
            <ul>
                <li>
                    <a href="Pages/1.Common/01_ObtenerListado.aspx">Obtener listado de clientes potenciales</a>
                </li>
                <li>
                    <a href="Pages/1.Common/02_CrearRegistro.aspx">Crear registro de cliente potencial</a>
                </li>
                <li>
                    <a href="Pages/1.Common/03_ObtenerRegistro.aspx?id=8BA82838-081E-E911-A970-000D3A170740">Obtener registro de cliente potencial</a>
                </li>
                <li>
                    <a href="Pages/1.Common/04_ActualizarRegistro.aspx?id=8BA82838-081E-E911-A970-000D3A170740">Actualizar registro de cliente potencial</a>
                </li>
            </ul>
        </form>
    </div>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

</body>
</html>
