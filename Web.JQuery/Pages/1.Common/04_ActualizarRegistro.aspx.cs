using Librerias.Common.IO;
using Librerias.Crm.Conexion;
using Librerias.Crm.Exceptions;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.JQuery.Common;
using Web.JQuery.Common.Response;

namespace Web.JQuery.Pages._1.Common
{
    public partial class _04_ActualizarRegistro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static RetrieveEntityRecordResponse GetLead(Guid id)
        {
            RetrieveEntityRecordResponse response = new RetrieveEntityRecordResponse();
            string customErrorMsg = "No fué posible obtener el cliente potencial con id: {0}.";

            using (FileLog log = new FileLog())
            {
                try
                {
                    using (SimpleConnection365 cnn = new SimpleConnection365(Constantes.ConexionActual))
                    {
                        IOrganizationService servicio = cnn.ObtenerServicioConexion();

                        if (servicio != null)
                        {
                            response.Record = servicio.Retrieve("lead", id, new ColumnSet(new string[] { "firstname", "lastname", "subject", "emailaddress1" }));
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
                    response.ErrorMessage = log.RegisterError(osFaultException.Detail.Message, customErrorMsg, id);
                }
                catch (Exception ex)
                {
                    response.ErrorMessage = log.RegisterError(ex.Message, customErrorMsg, id);
                }
            }

            return response;
        }

        [WebMethod]
        public static UpdateEntityRecordResponse UpdateLead(Guid Id, string Subject, string FirstName, string LastName, string Email, string JobTitle, string CompanyName)
        {
            UpdateEntityRecordResponse response = new UpdateEntityRecordResponse();
            string customErrorMsg = "No fué posible actualizar el Cliente Potencial.";

            using (FileLog log = new FileLog())
            {
                try
                {
                    using(SimpleConnection365 cnn = new SimpleConnection365(Constantes.ConexionActual))
                    {
                        IOrganizationService servicio = cnn.ObtenerServicioConexion();

                        if(servicio != null)
                        {
                            Entity entity = new Entity("lead");
                            entity.Id = Id;
                            entity["subject"] = Subject;
                            entity["firstname"] = FirstName;
                            entity["lastname"] = LastName;
                            entity["emailaddress1"] = Email;
                            entity["jobtitle"] = JobTitle;
                            entity["companyname"] = CompanyName;


                            servicio.Update(entity);
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
                    response.ErrorMessage = log.RegisterError(osFaultException.Detail.Message, customErrorMsg);
                }
                catch (Exception ex)
                {
                    response.ErrorMessage = log.RegisterError(ex.Message, customErrorMsg);
                }
            }

            return response;
        }

    }
}