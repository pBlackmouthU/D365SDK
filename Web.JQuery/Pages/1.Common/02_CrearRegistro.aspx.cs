using Librerias.Common;
using Librerias.Common.IO;
using Librerias.Crm.Conexion;
using Librerias.Crm.Exceptions;
using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.JQuery.Common;
//using System.Diagnostics;

namespace Web.JQuery.Pages._1.Common
{
    public partial class _02_CrearRegistro : System.Web.UI.Page
    {
        //static StackTrace stackTrace = new StackTrace();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static CreateEntityRecordResponse CreateLead(string Subject, string FirstName, string LastName, string Email)
        {
            CreateEntityRecordResponse response = new CreateEntityRecordResponse();

            using (FileLog log = new FileLog())
            {
                try
                {
                    if (Subject.IsNullOrEmpty())
                        throw new MissingParameterException("Subject", "CreateLead");

                    if (FirstName.IsNullOrEmpty())
                        throw new MissingParameterException("FirstName", "CreateLead");

                    if (LastName.IsNullOrEmpty())
                        throw new MissingParameterException("LastName", "CreateLead");


                    using (SimpleConnection365 cnn = new SimpleConnection365(Constantes.ConexionActual))
                    {
                        IOrganizationService servicio = cnn.ObtenerServicioConexion();

                        if (servicio != null)
                        {
                            Entity entity = new Entity("lead");
                            entity["subject"] = Subject;
                            entity["firstname"] = FirstName;
                            entity["lastname"] = LastName;
                            entity["emailaddress1"] = Email;

                            servicio.Create(entity);
                            response.WasSuccessful = true;
                        }
                        else
                        {
                            throw new OrganizationServiceNotFoundException();
                        }
                    }

                }
                catch (FaultException<OrganizationServiceFault> osFaultException)
                {
                    Guid errorID = Guid.NewGuid();
                    log.WriteError(osFaultException.Detail.Message, errorID.ToString());
                    response.ErrorMessage = "No fué posible crear el registro. Proporcione el siguiente código de error al administrador del sistema. ErrorID: {0}".FormatWith(errorID);
                }
                catch (Exception ex)
                {
                    Guid errorID = Guid.NewGuid();
                    log.WriteError(ex.Message, errorID.ToString());
                    response.ErrorMessage = "No fué posible crear el registro. Proporcione el siguiente código de error al administrador del sistema. ErrorID: {0}".FormatWith(errorID);
                }
            }

            return response;
        }
    }
}