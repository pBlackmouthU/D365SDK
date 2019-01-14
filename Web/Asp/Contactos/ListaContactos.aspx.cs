using Librerias.Crm;
using Librerias.Crm.Conexion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Asp._Code;

namespace Web.Asp
{
    public partial class ListaContactos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<Contacto> ObtenerContactos()
        {
            List<Contacto> list = null;

            using (ConexionSimpleCRM cnn = new ConexionSimpleCRM(Constantes.ConnectionStringName))
            {
                using (ContactoServicio contactSvc = new ContactoServicio(cnn.ObtenerServicioConexion()))
                {
                    list = contactSvc.ObtenerContactos();
                }
            }

            return list;
        }

        [WebMethod]
        public static Respuesta EliminarContacto(Guid ContactoID)
        {
            Respuesta resp = new Respuesta();

            using (ConexionSimpleCRM cnn = new ConexionSimpleCRM(Constantes.ConnectionStringName))
            {
                using (ContactoServicio contactSvc = new ContactoServicio(cnn.ObtenerServicioConexion()))
                {
                    resp = contactSvc.Eliminar(ContactoID);
                }
            }

            return resp;
        }
    }
}