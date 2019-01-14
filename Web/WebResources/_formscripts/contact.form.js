function EmailChange(executionObj) {
    console.log("Email executionObj.getEventSource()", executionObj.getEventSource());
    var obj = executionObj.getEventSource()["$2_2"];

    var attributeName = obj["$CD_2"];
    var value = Xrm.Page.getAttribute(attributeName).getValue();
    console.log("Email value", value);

    var iFrame = Xrm.Page.getControl("WebResource_Contacto").getObject().contentWindow.window;
    if (iFrame && iFrame.setEmail) {
        iFrame.setEmail(value);
    }

    var iFrame2 = Xrm.Page.ui.controls.get('WebResource_Contacto').getObject().contentWindow.window;
    if (iFrame2 && iFrame2.setEmail) {
        console.log("También funciona");
    }
}

function PhoneChange(executionObj) {
    console.log("Phone executionObj.getEventSource()", executionObj.getEventSource());
    var obj = executionObj.getEventSource()["$2_2"];

    var attributeName = obj["$CD_2"];
    var value = Xrm.Page.getAttribute(attributeName).getValue();
    console.log("Phone value", value);

    var iFrame = Xrm.Page.getControl("WebResource_Contacto").getObject().contentWindow.window;
    if (iFrame && iFrame.setPhone) {
        iFrame.setPhone(value);
    }
}