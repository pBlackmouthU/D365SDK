(function () {

    window.crmformsjs = function () {
        try {
            var Xrm = Xrm || window.Xrm || window.parent.Xrm || null;


            if (Xrm === undefined || Xrm === null) {
                throw "No se ha encontrado el objeto Xrm en el formulario de Dynamics CRM.";
            }



        } catch (e) {
            Error(e);
        }


        function getClientUrl() {
            return Xrm.Page.context.getClientUrl();
        }


        function getUserId() {
            return Xrm.Page.context.getUserId();
        }

        function getQueryStringParameters() {
            return Xrm.Page.context.getQueryStringParameters();
        }

        function getEntityID() {
            return guidToStringValue(Xrm.Page.data.entity.getId());
        }

        function Error(e) {
            console.error("crm.forms.js", e);
        }

        function getAttributeValue(attrName) {
            return Xrm.Page.getAttribute(attrName).getValue();
        }

        function setAttributeValue(attrName, value) {
            return Xrm.Page.getAttribute(attrName).setValue(value);
        }

        function saveForm() {
            Xrm.Page.data.entity.save();
        }

        function guidToStringValue(guid) {
            var guidStr = ""
            if (guid) {
                guidStr = guid.replace('{', '');
                guidStr = guidStr.replace('}', '');
            }
            return guidStr;
        }

        return {
            GetClientUrl: getClientUrl,
            GetUserId: getUserId,
            GetEntityID: getEntityID,
            GetQueryStringParameters: getQueryStringParameters,
            GetAttributeValue: getAttributeValue,
            SetAttributeValue: setAttributeValue,
            SaveForm: saveForm
        }
    }


})();