(function () {

    window.udemcontext = function () {
        var crmforms = new window.crmformsjs();
        var crm = new window.crmjs(crmforms.GetClientUrl());

        var contactColumns = "firstname,lastname,jobtitle,_parentcustomerid_value,preferredcontactmethodcode";
        var accountColumns = "accountid, name";

        function obtenerContactos() {            
            return crm.ObtenerListado("contacts", contactColumns, null);
        }

        function obtenerContactoPorID(ContactoID) {
            return crm.ObtenerEntidad("contacts", ContactoID, contactColumns);
        }

        function obtenerMetodosDeContacto() {
            return crm.Metadata.GetOptionSetValues("contact", "preferredcontactmethodcode");
        }

        function obtenerCuentas() {
            return crm.ObtenerListado("accounts", accountColumns, null);
        }

        function obtenerImagenContacto(ContactoID) {
            return crm.ObtenerEntidad("contacts", ContactoID, "contactid,entityimage_url");
        }

        function actualizarContactoCRM(ContactoID, Nombres, Apellidos, Puesto, EmpresaID, MetodoContacto) {

            var json = {};
            json.firstname = Nombres;
            json.lastname = Apellidos;
            json.jobtitle = Puesto;
            json["parentcustomerid_account@odata.bind"] = crm.WebApiUriBase() + "accounts(" + EmpresaID + ")";
            json.preferredcontactmethodcode = MetodoContacto;


            return crm.ActualizarEntidad("contacts", ContactoID, json);
        }

        function crearContactoCRM(Nombres, Apellidos, Puesto, EmpresaID, MetodoContacto) {

            var json = {};
            json.firstname = Nombres;
            json.lastname = Apellidos;
            json.jobtitle = Puesto;
            json["parentcustomerid_account@odata.bind"] = crm.WebApiUriBase() + "accounts(" + EmpresaID + ")";
            json.preferredcontactmethodcode = MetodoContacto;


            return crm.CrearEntidad("contacts", json);
        }

        function eliminarContacto(ContactoID) {
            return crm.BorrarEntidad("contacts",ContactoID);
        }

        function Error(e) {
            console.error("crm.contexto.udem.js", e);
        }

        return {
            ObtenerContactoPorID: obtenerContactoPorID,
            ObtenerContactos: obtenerContactos,
            ObtenerMetodosDeContacto: obtenerMetodosDeContacto,
            ObtenerImagenContacto: obtenerImagenContacto,

            ActualizarContactoCRM: actualizarContactoCRM,
            CrearContactoCRM: crearContactoCRM,
            EliminarContacto: eliminarContacto,

            ObtenerCuentas: obtenerCuentas
        }
    }

})();