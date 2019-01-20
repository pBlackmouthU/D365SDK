<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01_ObtenerListado.aspx.cs" Inherits="Web.JQuery.Pages._1.Common._01_ObtenerListado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/fontawesome.min.css" rel="stylesheet" />
    <link href="../../Content/AppStyles/RetrieveMultiple.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div>
            <div class="container">
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

                    </tbody>
                </table>
            </div>
        </div>
    </form>

    <script src="../../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../../Scripts/fontawesome/all.js"></script>
    <script src="../../Scripts/mustache.js"></script>

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
            PageMethods.ObtenerClientesPotenciales(ObtenerClientesPotencialesSuccess, OnError);
        });

        function ObtenerClientesPotencialesSuccess(data) {
            console.log("ObtenerClientesPotencialesSuccess: ", data);
            var collection = null;

            if (data && data.length > 0) {
                collection = { "leads": [] };
                $(data).each(function (index, item) {
                    var entity = CreateJsonEntity(item);
                    if (entity) {
                        collection.leads.push(entity);
                    }
                });
            }

            if (collection) {
                var template = $('#leadTableTemplate').html();
                Mustache.parse(template);   // optional, speeds up future uses
                var rendered = Mustache.render(template,collection);
                $('#tableLeadsBody').html(rendered);
            }

        }

        function OnError(error) {
            console.error(error);
        }

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
    </script>
</body>
</html>
