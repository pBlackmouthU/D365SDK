using System;
using Librerias.Crm;
using Librerias.Crm.Conexion;
using System.Collections.Generic;
using System.Web.Services;
using Web.Asp._Code;

namespace Web.Asp
{
    public partial class CrearContacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //using (ConexionSimpleCRM cnn = new ConexionSimpleCRM("DevCR"))
            //{
            //    using(ContactoServicio contactSvc = new ContactoServicio(cnn.ObtenerServicioConexion()))
            //    {
            //        Contacto contact = new Contacto();
            //        contact.Nombres = "André";
            //        contact.Apellidos = "Gignac";
            //        contact.Puesto = "Delantero";

            //        Respuesta resp = contactSvc.Guardar(contact);

            //        if (resp.NoTieneError())
            //        {
            //            contact = contactSvc.ObtenerContactoPorId(resp.Id.Value);
            //        }
            //    }
            ////}

            //using (ConexionSimpleCRM cnn = new ConexionSimpleCRM("DevCR"))
            //{
            //    using (ContactoServicio contactSvc = new ContactoServicio(cnn.ObtenerServicioConexion()))
            //    {

            //        GridView1.DataSource = contactSvc.ObtenerContactos();
            //        GridView1.DataBind();
            //    }
            //}

            
        }

        [WebMethod]
        public static List<Cuenta> ObtenerCuentas()
        {
            List<Cuenta> list = null;
            try
            {
                using (SimpleConnection365 cnn = new SimpleConnection365(Constantes.ConnectionStringName))
                {
                    using(CuentaServicio cuentaSvc = new CuentaServicio(cnn.ObtenerServicioConexion()))
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
                using (SimpleConnection365 cnn = new SimpleConnection365(Constantes.ConnectionStringName))
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
        public static Respuesta CrearContactoCRM(string Nombres, string Apellidos, string Puesto, Guid EmpresaID, int MetodoContacto)
        {
            Respuesta resp = new Respuesta();
            try
            {
                using (SimpleConnection365 cnn = new SimpleConnection365(Constantes.ConnectionStringName))
                {
                    using (ContactoServicio contactoSvc = new ContactoServicio(cnn.ObtenerServicioConexion()))
                    {
                        Contacto con = new Contacto();
                        con.Nombres = Nombres;
                        con.Apellidos = Apellidos;
                        con.Puesto = Puesto;
                        con.Cuenta = new CrmLookup(EmpresaID,null,"account");
                        con.MetodoContacto = new CrmPicklist(MetodoContacto);

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

    }
}