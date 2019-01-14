<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarContacto.aspx.cs" Inherits="Web.Asp.Contactos.EditarContacto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <style>
        .logo {
            height: 40px;
            margin-top: -10px;
        }
    </style>
    <script src="../../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../../Scripts/object-watch.js"></script>

    <script>  
        var ContactoID = null;
        var contacto = null;
        
        var selects = {
            cuentasCargadas: false,
            metodosCargados: false,
            todosCargados: false
        }

        $(function () {
            ContactoID = getParameterByName("id");
            PageMethods.ObtenerContactoPorID(ContactoID, ObtenerContactoPorIDSuccess, OnError);

            selects.watch('cuentasCargadas', function (id, oldval, newval) {
                console.log('selects.' + id + ' changed from ' + oldval + ' to ' + newval);
                LlenarFormulario(newval, selects.metodosCargados);
                return newval;
            });

            selects.watch('metodosCargados', function (id, oldval, newval) {
                console.log('selects.' + id + ' changed from ' + oldval + ' to ' + newval);
                LlenarFormulario(selects.cuentasCargadas, newval);
                return newval;
            });

            

            

            $("#btnActualizar").click(function () {
                var Nombres = $("#txtNombres").val();
                var Apellidos = $("#txtApellidos").val();
                var Puesto = $("#txtPuesto").val();
                var EmpresaID = $("#cboEmpresa").val();
                var MetodoContacto = $("#cboMetodoContacto").val();
                PageMethods.ActualizarContactoCRM(ContactoID, Nombres, Apellidos, Puesto, EmpresaID, MetodoContacto, ActualizarContactoCRM, OnError);

            });
        });

        function ObtenerContactoPorIDSuccess(data) {
            console.log("Contacto", data);
            contacto = data;
            PageMethods.ObtenerCuentas(ObtenerCuentasSuccess, OnError);
            
        }

        function ObtenerCuentasSuccess(data) {
            var optionsAsString = "<option value='00000000-0000-0000-0000-000000000000'>Seleccione...</option>";
            $(data).each(function (index, item) {

                optionsAsString += "<option value='" + item.CuentaID + "'>" + item.Nombre + "</option>";

            });
            
            $('#cboEmpresa').html(optionsAsString);
            selects.cuentasCargadas = true;
            PageMethods.ObtenerMetodosDeContacto(ObtenerMetodosDeContactoSuccess, OnError);
        }

        function ObtenerMetodosDeContactoSuccess(data) {
            var optionsAsString = "<option value='0'>Seleccione...</option>";
            $(data).each(function (index, item) {

                optionsAsString += "<option value='" + item.Id + "'>" + item.Nombre + "</option>";

            });

            $('#cboMetodoContacto').html(optionsAsString);
            selects.metodosCargados = true;
        }

        function OnError(error) {
            console.error("Contactos error:", error);
        }

        function ActualizarContactoCRM(resp) {
            console.log(resp);
            window.location = "ListaContactos.aspx";
        }

        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }

        function LlenarFormulario(cuentasCargadas, metodosCargados) {
            if (cuentasCargadas && metodosCargados) {
                $("#txtNombres").val(contacto.Nombres);
                $("#txtApellidos").val(contacto.Apellidos);
                $("#txtPuesto").val(contacto.Puesto);
                $("#cboEmpresa option[value=" + contacto.Cuenta.Id + "]").prop('selected', true);
                $("#cboMetodoContacto option[value=" + contacto.MetodoContacto.Id + "]").prop('selected', true);
            }
        }


    </script>
</head>
<body>
    <div class="container">
        <%-- NAVBAR --%>
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
            <li><a href="ListaContactos.aspx">Contactos</a></li>
            <li class="active">Contacto nuevo</li>
        </ol>

        <h1>Contacto Nuevo</h1>

        <%-- FORMULARIO --%>
        <form id="form1" runat="server" class="form">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <input type="button" class="btn btn-default" value="Actualizar" id="btnActualizar" />
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="txtNombres">Nombres</label>
                        <input type="text" class="form-control" id="txtNombres"
                            placeholder="Nombres" />
                    </div>
                    <div class="form-group">
                        <label for="txtApellidos">Apellidos</label>
                        <input type="text" class="form-control" id="txtApellidos"
                            placeholder="Apellidos" />
                    </div>
                    <div class="form-group">
                        <label for="txtPuesto">Puesto</label>
                        <input type="text" class="form-control" id="txtPuesto"
                            placeholder="Puesto" />
                    </div>
                    <div class="form-group">
                        <label for="cboEmpresa">Empresa</label>
                        <select id="cboEmpresa" class="form-control">
                            <option value="00000000-0000-0000-0000-000000000000">Cargando...</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="cboMetodoContacto">Método de contacto preferido</label>
                        <select id="cboMetodoContacto" class="form-control">
                            <option value="0">Cargando...</option>
                        </select>
                    </div>
                </div>
            </div>
        </form>

    </div>
</body>
</html>
