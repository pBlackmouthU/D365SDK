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

namespace Web.Asp.Contactos
{
    public partial class EditarContacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<Cuenta> ObtenerCuentas()
        {
            List<Cuenta> list = null;
            try
            {
                using (ConexionSimpleCRM cnn = new ConexionSimpleCRM(Constantes.ConnectionStringName))
                {
                    using (CuentaServicio cuentaSvc = new CuentaServicio(cnn.ObtenerServicioConexion()))
                    {
                        list = cuentaSvc.ObtenerCuentas();
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return list;
        }

        [WebMethod]
        public static List<CrmPicklist> ObtenerMetodosDeContacto()
        {
            List<CrmPicklist> list = null;
            try
            {
                using (ConexionSimpleCRM cnn = new ConexionSimpleCRM(Constantes.ConnectionStringName))
                {
                    using (Metadata metadataSvc = new Metadata(cnn.ObtenerServicioConexion()))
                    {
                        list = metadataSvc.ObtenerOptionSetEntidad("contact", "preferredcontactmethodcode");
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return list;
        }

        [WebMethod]
        public static Respuesta ActualizarContactoCRM(Guid ContactoID, string Nombres, string Apellidos, string Puesto, Guid EmpresaID, int MetodoContacto)
        {
            Respuesta resp = new Respuesta();
            try
            {
                using (ConexionSimpleCRM cnn = new ConexionSimpleCRM(Constantes.ConnectionStringName))
                {
                    using (ContactoServicio contactoSvc = new ContactoServicio(cnn.ObtenerServicioConexion()))
                    {
                        Contacto con = new Contacto();
                        con.ContactoID = ContactoID;
                        con.Nombres = Nombres;
                        con.Apellidos = Apellidos;
                        con.Puesto = Puesto;
                        con.Cuenta = new CrmLookup(EmpresaID, null, "account");
                        con.MetodoContacto = new CrmPicklist(MetodoContacto);
                        con.LimpiarAtributos(new string[] { "jobtitle" });
                        

                        resp = contactoSvc.Guardar(con);
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return resp;
        }

        [WebMethod]
        public static Contacto ObtenerContactoPorID(Guid ContactoID)
        {
            Contacto con = null;
            try
            {
                using (ConexionSimpleCRM cnn = new ConexionSimpleCRM(Constantes.ConnectionStringName))
                {
                    using (ContactoServicio contactoSvc = new ContactoServicio(cnn.ObtenerServicioConexion()))
                    {
                        con = contactoSvc.ObtenerContactoPorId(ContactoID);
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return con;
        }
    }
}