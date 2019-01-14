(function () {

    window.crmjs = function (uri) {
        var webApiVersion = "/api/data/v8.2/";

        try {

            if ($ === undefined) {
                throw "Es necesario agregar la librería jQuery.";
            }

            if (uri === undefined || uri === null || uri === "") {
                throw "No se ha especificado la url de la instancia de Dynamics CRM.";
            }

            $.ajaxSetup({
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("OData-MaxVersion", "4.0");
                    xhr.setRequestHeader("OData-Version", "4.0");
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
                }
            });

        } catch (e) {
            Error(e);
        }

        function webApiUriBase() {
            if (uri === undefined || uri === null || uri === "") {
                throw "No se ha especificado la url de la instancia de Dynamics CRM.";
            }

            return uri + webApiVersion;
        }

        function obtenerEntidad(entitySetName, entityID, columns) {            

            try {

                if (entitySetName === undefined || entitySetName === null || entitySetName === "") {
                    throw "Para hacer la consulta de la entidad es necesario especificar el entitySetName de la entidad."
                }

                if (entityID === undefined || entityID === null || entityID === "") {
                    throw "Para hacer la consulta de la entidad es necesario especificar el ID de la entidad."
                }

                var urlCrm = webApiUriBase() + entitySetName + "(" + entityID + ")";
                urlCrm += ((columns !== undefined && columns !== null && columns !== "") ? "?$select=" + columns : "");

                return $.ajax({
                    type: "GET",
                    url: urlCrm,
                    headers: { "Prefer":"odata.include-annotations=\"*\""}
                });
            } catch (e) {
                Error(e);
            }
        }

        function obtenerListado(entitySetName, columns, filter) {
            try {

                if (entitySetName === undefined || entitySetName === null || entitySetName === "") {
                    throw "Para hacer la consulta de la entidad es necesario especificar el entitySetName de la entidad."
                }

                var urlCrm = webApiUriBase() + entitySetName;
                urlCrm += (columns !== undefined && columns !== null && columns !== "") ? "?$select=" + columns : "";
                urlCrm += (filter !== undefined && filter !== null && filter !== "") ? "&$filter=" + filter : "";

                return $.ajax({
                    type: "GET",
                    url: urlCrm,
                    headers: { "Prefer": "odata.include-annotations=\"*\"" }
                });
            } catch (e) {
                Error(e);
            }
        }

        function getOptionSetValues(entityName, attributeName) {
            
            try {

                var urlCrm = webApiUriBase() + "EntityDefinitions(LogicalName='" + entityName + "')/Attributes(LogicalName='" + attributeName + "')";
                urlCrm += "/Microsoft.Dynamics.CRM.PicklistAttributeMetadata?$select=LogicalName&$expand=OptionSet,GlobalOptionSet";

                return $.ajax({
                    type: "GET",
                    url: urlCrm
                });

            } catch (e) {
                Error(e);
            }
        }

        function actualizarEntidad(entitySetName, entityID, jsonData) {
            try {
                if (entitySetName === undefined || entitySetName === null || entitySetName === "") {
                    throw "Para actualizar la entidad es necesario especificar el entitySetName de la entidad."
                }

                if (entityID === undefined || entityID === null || entityID === "") {
                    throw "Para actualizar la entidad es necesario especificar el ID de la entidad."
                }

                var urlCrm = webApiUriBase() + entitySetName + "(" + entityID + ")";
                var stringJsonData = JSON.stringify(jsonData);
                return $.ajax({
                    type: "PATCH",
                    url: urlCrm,
                    dataType: "json",
                    data: stringJsonData
                });

            } catch (e) {
                Error(e);
            }
        }

        function crearEntidad(entitySetName, jsonData) {
            try {
                if (entitySetName === undefined || entitySetName === null || entitySetName === "") {
                    throw "Para crear la entidad es necesario especificar el entitySetName de la entidad."
                }

                var urlCrm = webApiUriBase() + entitySetName;
                var stringJsonData = JSON.stringify(jsonData);
                return $.ajax({
                    type: "POST",
                    url: urlCrm,
                    dataType: "json",
                    data: stringJsonData
                });

            } catch (e) {
                Error(e);
            }
        }

        function borrarEntidad(entitySetName, entityID) {
            try {
                if (entitySetName === undefined || entitySetName === null || entitySetName === "") {
                    throw "Para borrar el registro de entidad es necesario especificar el entitySetName de la entidad."
                }

                if (entityID === undefined || entityID === null || entityID === "") {
                    throw "Para borrar el registro de entidad es necesario especificar el ID del registro de entidad."
                }

                var urlCrm = webApiUriBase() + entitySetName + "(" + entityID + ")";
                return $.ajax({
                    type: "DELETE",
                    url: urlCrm
                });

            } catch (e) {
                Error(e);
            }
        }


        function Error(e) {
            console.error("crm.js", e);
            
        }

        return {
            ObtenerEntidad: obtenerEntidad,
            ObtenerListado: obtenerListado,
            ActualizarEntidad: actualizarEntidad,
            CrearEntidad: crearEntidad,
            BorrarEntidad: borrarEntidad,
            Metadata: {
                GetOptionSetValues: getOptionSetValues
            },

            WebApiUriBase: webApiUriBase
        }
    };


})();