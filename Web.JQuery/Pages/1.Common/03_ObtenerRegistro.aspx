<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="03_ObtenerRegistro.aspx.cs" Inherits="Web.JQuery.Pages._1.Common._03_ObtenerRegistro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/themes/base/jquery-ui.min.css" rel="stylesheet" />
    <link href="../../Content/themes/base/dialog.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/fontawesome.min.css" rel="stylesheet" />
    <link href="../../Content/toastr.min.css" rel="stylesheet" />
    <link href="../../Content/AppStyles/CommonStyles.css" rel="stylesheet" />
</head>
<body>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
            <div class="container">
                <div class="common-toolbar" >  <a href="../../Home.aspx">Regresar...</a> </div>
                <h2><i class="fas fa-user-tag"></i> Crear Cliente Potencial</h2>
                    <div class="form-group">
                        <label for="subject">Asunto</label>
                        <input type="text" class="form-control" id="subject" placeholder="Asunto" />
                    </div>
                    <div class="form-group">
                        <label for="firstname">Nombre</label>
                        <input type="text" class="form-control" id="firstname" placeholder="Nombre" />
                    </div>
                    <div class="form-group">
                        <label for="lastname">Apellido</label>
                        <input type="text" class="form-control" id="lastname" placeholder="Apellido" />
                    </div>
                    <div class="form-group">
                        <label for="email">Correo electrónico</label>
                        <input type="email" class="form-control" id="email" placeholder="Correo electrónico" />
                    </div>
            </div>
        </form>
        

    <div style="visibility: hidden;">
        <div id="dialog-message" title="">
            <p>
                <i class="fas fa-exclamation-circle" style="float:left; margin:0 7px 50px 0; color: red;"></i>
                <span id="modalContentText" ></span>
            </p>
        </div>
    </div>

    <script src="../../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../../Scripts/fontawesome/all.js"></script>
    <script src="../../Scripts/mustache.js"></script>
    <script src="../../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="../../Scripts/toastr.min.js"></script>
    <script>
        var lead = null;
        $(function () {
            var id = getUrlVars()["id"];
            // Al cargarse el DOM se hace la petición para obtener el listado de clientes potenciales.
            PageMethods.GetLead(id, GetLeadSuccess, OnError);
        });

        // Función de callback que retorna el listado de entidades.
        function GetLeadSuccess(response) {
            console.log("CreateLeadSuccess: ", response);

            if (response && response.WasSuccessful) {
                showToastr("success", "Cliente Potencial obtenido exitosamente. ");
                lead = CreateJsonEntity(response.Record);
                console.log("Lead: ", lead);
                $("#firstname").val(lead.firstname);
                $("#lastname").val(lead.lastname);
                $("#subject").val(lead.subject);
                $("#email").val(lead.emailaddress1);

            } else {
                if (response.ErrorMessage !== null && response.ErrorMessage !== "") {
                    showModal("Error",response.ErrorMessage);
                }
            }

        }

        // Función que despliega el error en consola.
        function OnError(error) {
            console.error(error);
            showModal("Error",error);
        }


        // Conviert un objeto Entity a una estructura de objeto:
        // { leadid: "valor", fullname: "valor", jobtitle: "valor", companyname:"valor"}
        function CreateJsonEntity(entity) {
            var obj = null;
            if (entity) {
                if (entity.Attributes) {
                    obj = {};
                    $(entity.Attributes).each(function (index, valuePair) {
                        obj[valuePair.Key] = valuePair.Value;
                    });
                }
            }
            return obj;
        }


        function showModal(title, message, callback) {
            $("#modalContentText").html(message);
            $("#dialog-message").attr("title",title);
            $( "#dialog-message" ).dialog({
              modal: true,
              buttons: {
                Aceptar: function() {
                    $(this).dialog("close");
                    if (callback)
                        callback();
                }
              },
              width: "800px",
              maxWidth: "768px"
            });
        }

        function showToastr(type, message) {
            toastr.options = {
              "closeButton": false,
              "debug": false,
              "newestOnTop": false,
              "progressBar": false,
              "positionClass": "toast-top-right",
              "preventDuplicates": false,
              "onclick": null,
              "showDuration": "300",
              "hideDuration": "1000",
              "timeOut": "5000",
              "extendedTimeOut": "1000",
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut"
            }
            toastr[type](message);
        }


        // Read a page's GET URL variables and return them as an associative array.
        function getUrlVars()
        {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for(var i = 0; i < hashes.length; i++)
            {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }
    </script>
</body>
</html>

