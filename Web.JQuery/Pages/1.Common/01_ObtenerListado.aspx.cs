using Librerias.Common.IO;
using Librerias.Crm.Conexion;
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

namespace Web.JQuery.Pages._1.Common
{
    public partial class _01_ObtenerListado : System.Web.UI.Page
    {
         

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        // Iniciar regresando el EntityCollection
        // Después mejorar solo regresando el listado de entidades
        [WebMethod]
        public static List<Entity> ObtenerClientesPotenciales()
        {
            List<Entity> list = null;
            FileLog log = new FileLog();

            try
            {
                using (ConexionSimpleCRM cnn = new ConexionSimpleCRM(Constantes.ConexionActual))
                {
                    // Obtenemos el servicio de la organizacion.
                    IOrganizationService servicio = cnn.ObtenerServicioConexion();

                    // Validamos que el servicio haya sido obtenido.
                    if (servicio != null)
                    {
                        // 1. Definimos las columnas que serán consultadas de cada cliente potencial.
                        ColumnSet columns = new ColumnSet(new string[] { "fullname", "jobtitle", "emailaddress1", "companyname" });

                        // 2. Definimos las condiciones de búsqueda.
                        // TODO: Definir condiciones.

                        // 3. Definimos las opciones de filtrado.
                        // TODO: Asignar las condiciones de filtrado.

                        // 4. Creamos la consulta.
                        QueryExpression qe = new QueryExpression("lead");
                        qe.ColumnSet = columns;

                        // Ejecutamos la consulta.
                        EntityCollection collection = servicio.RetrieveMultiple(qe);

                        // Se valida que la colección no sea nula o vacía.
                        if(collection != null && collection.Entities != null && collection.Entities.Count > 0)
                        {
                            list = collection.Entities.ToList();
                        }
                    }
                }
            }
            catch (FaultException<OrganizationServiceFault> osFaultException)
            {
                log.WriteError(osFaultException.Detail.Message);
            }
            catch (Exception ex)
            {
                log.WriteError(ex.Message);
            }

            return list;
        }
    }
}