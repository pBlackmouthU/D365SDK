<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01_ObtenerListado.aspx.cs" Inherits="Web.JQuery.Pages._1.Common._01_ObtenerListado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/themes/base/jquery-ui.min.css" rel="stylesheet" />
    <link href="../../Content/themes/base/dialog.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/fontawesome.min.css" rel="stylesheet" />
   
    <link href="../../Content/AppStyles/RetrieveMultiple.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div>
            <div class="container">
                <div class="common-toolbar" >  <a href="../../Home.aspx">Regresar...</a> </div>
                <h2><i class="fas fa-list-alt"></i> Clientes potenciales</h2>
                <table id="tableLeads" class="table table-hover col-sm-12">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Correo electrónico</th>
                            <th>Puesto</th>
                            <th>Empresa</th>
                        </tr>
                    </thead>
                    <tbody id="tableLeadsBody">
                        <tr>
                            <td colspan="4" style="padding-left:20px; font-size: 20px; color:#777;"><i class="fas fa-cog fa-spin"></i> Loading...</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </form>

    <div id="dialog-message" title="Download complete">
        <p>
            <i class="fas fa-exclamation-circle" style="float:left; margin:0 7px 50px 0; color: red;"></i>
            <span id="modalContentText" ></span>
        </p>
    </div>

    <script src="../../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../../Scripts/fontawesome/all.js"></script>
    <script src="../../Scripts/mustache.js"></script>
    <script src="../../Scripts/jquery-ui-1.12.1.min.js"></script>

    <%--Template Mustache para el render de los renglones de la tabla.--%>
    <script id="leadTableTemplate" type="x-tmpl-mustache">
        {{#leads}}
            <tr>
                <td>{{fullname}}</td>
                <td>{{emailaddress1}}</td>
                <td>{{jobtitle}}</td>
                <td>{{companyname}}</td>
            </tr>
        {{/leads}}
    </script>
    <script>
        $(function () {
            // Al cargarse el DOM se hace la petición para obtener el listado de clientes potenciales.
            PageMethods.GetLeads(GetLeadsSuccess, OnError);
        });

        // Función de callback que retorna el listado de entidades.
        function GetLeadsSuccess(response) {
            console.log("GetLeadsSuccess: ", response);
            var collection = null;

            if (response && response.WasSuccessful) {
                // Se valida que data no sea nulo o vacío.
                if (response.List && response.List.length > 0) {
                    collection = { "leads": [] };

                    // Recorre cada elemento del array de Entity's para convertirlo y asignarlo a la variable que será dibujada en el UI.
                    $(response.List).each(function (index, item) {

                        // Cata entidad es devuelta como un objeto entity por lo que es necesario acceder a la propiedad Attributes, 
                        // para convertirlo a un objeto más legible.
                        var entity = CreateJsonEntity(item);

                        if (entity) {
                            collection.leads.push(entity);
                        }
                    });
                }

                // Si la colección es distinta de nula es dibujada en el en la tabla con mustache.
                if (collection) {
                    var template = $('#leadTableTemplate').html();
                    Mustache.parse(template);   // optional, speeds up future uses
                    var rendered = Mustache.render(template, collection);
                }

            } else {
                if (response.ErrorMessage !== null && response.ErrorMessage !== "") {
                    $('#tableLeadsBody').html('<tr><td colspan="4" class="text-center" style="height: 200px; vertical-align: middle;"><i class="fas fa-database"></i> Sin resultados </td></tr>');
                    showModal("Error",response.ErrorMessage,navigateToHome);
                }
            }

        }

        // Función que despliega el error en consola.
        function OnError(error) {
            console.error(error);
        }

        function navigateToHome() {
            
            //window.location.href ="../../Home.aspx";
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
    </script>
</body>
</html>
