<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaContactos.aspx.cs" Inherits="Web.Asp.ListaContactos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../Content/jquery-ui.css" rel="stylesheet" />
    <style>
        #listaContactos {
            border: 1px solid #DDD;
            border-radius: 5px;
        }

        .table-row-header {
            background-color: black;
        }

        .table-header {
            background-color: black;
            color: white;
            font-weight: bold;
        }

        .boton-grid {
            border: 1px solid #DDD;
            border-radius: 4px;
            cursor: pointer;
            width: 20px;
            height: 20px;
            padding: 4px;
        }

            .boton-grid.rojo {
                color: red;
            }

        .loading {
            height: 40px;
            width: 40px;
        }

        .hideElement {
            visibility: hidden;
            display: none;
        }

        .showElement {
            visibility: visible;
        }

        .logo {
            height: 40px;
            margin-top: -10px;
        }

        .outscreen {
            position: absolute;
            top: -1000px;
        }
    </style>
    <script src="../../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../../Scripts/jquery-ui.js"></script>
    <script>   

        $(function () {
            PageMethods.ObtenerContactos(ObtenerContactosSuccess, OnError);
            $("#btnNuevo").click(function () {
                window.location = "CrearContacto.aspx"
            });
        });


        function ObtenerContactosSuccess(data) {
            console.log("Contactos", data);
            var contentHTML = "";

            $("#pError").removeClass("showElement").addClass("hideElement");
            $("#pLoading").removeClass("showElement").addClass("hideElement");
            $(".panel-body").removeClass("showElement").addClass("hideElement");

            $("#listaContactos").removeClass("hideElement").addClass("showElement");

            $(data).each(function (index, item) {
                contentHTML += "<tr><td>" + item.Nombres + "</td><td>" + item.Apellidos + "</td><td>" + item.Puesto + "</td><td><i class='fa fa-trash boton-grid .rojo' onclick=\"BorrarContacto(\'" + item.ContactoID + "\')\"></i></td><td><a href='EditarContacto.aspx?id=" + item.ContactoID + "'><i class='fa fa-pencil boton-grid'></i></a></td></tr>";
            });

            $("#listaContactos").append(contentHTML);
        }

        function OnError(error) {
            console.log("Error", error);
            $("#pError").removeClass("hideElement").addClass("showElement");
            $("#pLoading").removeClass("showElement").addClass("hideElement");
            $("#listaContactos").removeClass("showElement").addClass("hideElement");
        }

        function BorrarContacto(id) {
            console.log("Contacto ID", id);
            $("#dialog-confirm").dialog({
                resizable: false,
                height: "auto",
                width: 400,
                modal: true,
                buttons: {
                    "Aceptar": function () {
                        PageMethods.EliminarContacto(id, EliminarContactoSuccess, EliminarContactoError);
                        $(this).dialog("close");
                    },
                    "Cancelar": function () {
                        $(this).dialog("close");
                    }
                }
            });
        }

        function EliminarContactoSuccess(data) {
            console.log("Contacto Eliminado", data);
            window.location.reload();
        }

        function EliminarContactoError(error) {
            console.log("Error", error);
        }
    </script>
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
                <a class="navbar-brand" href="../Home.aspx">
                    <img src="../../Images/windows2.png" class="logo" />
                </a>
            </div>

            <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Contactos</a></li>
                    <li><a href="#">Cuentas</a></li>
                </ul>
            </div>
        </nav>

        <%-- BREADCRUMB --%>
        <ol class="breadcrumb">
            <li><a href="../Home.aspx">Inicio</a></li>
            <li class="active">Contactos</li>
        </ol>
        <%-- FORMULARIO --%>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
            <h1>Lista de Contactos</h1>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <input type="button" id="btnNuevo" value="Nuevo" />
                </div>
                <div class="panel-body showElement">
                    <p id="pLoading" class="showElement">
                        <img class="loading" src="../../Images/loading.gif" />
                        Cargando...
                    </p>
                    <p id="pError" class="hideElement">
                        <img class="loading" src="../../Images/alert.png" />
                        Error al cargar los datos.
                    </p>
                </div>
                <table class="table table-striped table-hover hideElement" id="listaContactos">
                    <tr class="table-row-header">
                        <td class="table-header">Nombres</td>
                        <td class="table-header">Apellidos</td>
                        <td class="table-header">Puesto</td>
                        <td class="table-header"></td>
                        <td class="table-header"></td>
                    </tr>
                </table>
            </div>
            <div class="hide">
                <div id="dialog-confirm" title="Eliminar Contacto?">
                    <p><span class="ui-icon ui-icon-alert" style="float: left; margin: 12px 12px 20px 0;"></span>Esto eliminará permanentemente  de Dynamics CRM al contacto seleccionado. ¿Está seguro?</p>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
