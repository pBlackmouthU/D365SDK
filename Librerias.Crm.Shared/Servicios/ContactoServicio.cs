using Microsoft.Crm.Sdk.Messages;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Services.Protocols;

namespace Librerias.Crm
{
    public partial class ContactoServicio : CrmServiceBase, IDisposable
    {

        private string[] _columnas = new string[] { "contactid", "firstname", "lastname", "jobtitle", "parentcustomerid","preferredcontactmethodcode" };
        private string _nombreEntidad = "contact";

        public ContactoServicio(IOrganizationService servicio)
            : base(servicio)
        {

        }

        

        public Respuesta Guardar(Contacto contacto)
        {

            Respuesta resp = new Respuesta();
            try
            {
                Entity entity = contacto.MapEntity();

                if (contacto.ContactoID == null)
                {
                    resp.Id = _servicio.Create(entity);
                }
                else
                {
                    resp.Id = contacto.ContactoID.Value;
                    _servicio.Update(entity);
                }
            }
            catch (Exception ex)
            {
                resp.Error = ex.Message;
            }

            return resp;
            
        }

        public Contacto ObtenerContactoPorId(Guid Id)
        {
            Contacto item = null;
            try
            {
                Entity entity = _servicio.Retrieve(_nombreEntidad, Id, new ColumnSet(_columnas));
                if(entity != null)
                {
                    item = new Contacto();
                    item.ContactoID = entity.Id;
                    if (entity.Attributes.ContainsKey("firstname") && entity["firstname"] != null)
                        item.Nombres = entity["firstname"].ToString();

                    if (entity.Attributes.ContainsKey("lastname") && entity["lastname"] != null)
                        item.Apellidos = entity["lastname"].ToString();

                    if (entity.Attributes.ContainsKey("jobtitle") && entity["jobtitle"] != null)
                        item.Puesto = entity["jobtitle"].ToString();

                    if (entity.Attributes.ContainsKey("parentcustomerid") && entity["parentcustomerid"] != null)
                        item.Cuenta = new CrmLookup((EntityReference)entity["parentcustomerid"]);

                    if (entity.Attributes.ContainsKey("preferredcontactmethodcode") && entity["preferredcontactmethodcode"] != null)
                        item.MetodoContacto = new CrmPicklist("preferredcontactmethodcode", entity);

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return item;
        }


        public List<Contacto> ObtenerContactos()
        {
            List<Contacto> list = null;

            ColumnSet cols = new ColumnSet(_columnas);

            QueryExpression query = new QueryExpression(_nombreEntidad);
            query.ColumnSet = cols;

            EntityCollection collection = _servicio.RetrieveMultiple(query);
            if (collection != null && collection.Entities != null && collection.Entities.Count > 0)
            {
                list = new List<Contacto>();
                foreach (Entity ent in collection.Entities)
                {
                    Contacto item = new Contacto();
                    item.ContactoID = ent.Id;

                    if (ent.Attributes.ContainsKey("firstname") && ent["firstname"] != null)
                        item.Nombres = ent["firstname"].ToString();

                    if (ent.Attributes.ContainsKey("lastname") && ent["lastname"] != null)
                        item.Apellidos = ent["lastname"].ToString();

                    if (ent.Attributes.ContainsKey("jobtitle") && ent["jobtitle"] != null)
                        item.Puesto = ent["jobtitle"].ToString();

                    if (ent.Attributes.ContainsKey("parentcustomerid") && ent["parentcustomerid"] != null)
                        item.Cuenta = new CrmLookup((EntityReference)ent["parentcustomerid"]);

                    if (ent.Attributes.ContainsKey("preferredcontactmethodcode") && ent["preferredcontactmethodcode"] != null)
                        item.MetodoContacto = new CrmPicklist("preferredcontactmethodcode", ent);

                    list.Add(item);
                }
            }

            return list;
        }

        public List<Contacto> ObtenerContactoPorNombres(string Nombres)
        {
            List<Contacto> list = null;
            try
            {
                //Definir las columnas.
                ColumnSet cols = new ColumnSet(_columnas);

                //Definir las condiciones.
                ConditionExpression condition = new ConditionExpression("firstname", ConditionOperator.Like, "%" + Nombres + "%");

                //Agregacr las condiciones al filtro.
                FilterExpression filter = new FilterExpression();
                filter.AddCondition(condition);

                //Construir el query.
                QueryExpression query = new QueryExpression(_nombreEntidad);
                query.ColumnSet = cols;
                query.Criteria = filter;

                //Realizar la consulta.
                EntityCollection collection = _servicio.RetrieveMultiple(query);

                //Mapear los datos.
                if(collection != null && collection.Entities != null && collection.Entities.Count > 0)
                {
                    foreach(Entity ent in collection.Entities)
                    {
                        Contacto item = new Contacto();

                        if (ent.Attributes.ContainsKey("firstname") && ent["firstname"] != null)
                            item.Nombres = ent["firstname"].ToString();

                        if (ent.Attributes.ContainsKey("lastname") && ent["lastname"] != null)
                            item.Apellidos = ent["lastname"].ToString();

                        if (ent.Attributes.ContainsKey("jobtitle") && ent["jobtitle"] != null)
                            item.Puesto = ent["jobtitle"].ToString();

                        if (ent.Attributes.ContainsKey("parentcustomerid") && ent["parentcustomerid"] != null)
                            item.Cuenta = new CrmLookup((EntityReference)ent["parentcustomerid"]);

                        if (ent.Attributes.ContainsKey("preferredcontactmethodcode") && ent["preferredcontactmethodcode"] != null)
                            item.MetodoContacto = new CrmPicklist("preferredcontactmethodcode", ent);

                        list.Add(item);
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return list;
        }

        public Respuesta Eliminar(Guid Id)
        {
            Respuesta resp = new Respuesta();
            if(Id != Guid.Empty)
            {
                try
                {
                    _servicio.Delete(_nombreEntidad, Id);
                }
                catch (Exception ex)
                {
                    resp.Error = ex.Message;
                }
            }
            return resp;
        }

        public Respuesta Asignar(Guid ContactoID,Guid UsuarioID)
        {
            Respuesta resp = new Respuesta();
            try
            {
                AssignRequest assign = new AssignRequest();
                assign.Assignee = new EntityReference("systemuser", UsuarioID);
                assign.Target = new EntityReference(_nombreEntidad, ContactoID);
                AssignResponse response = (AssignResponse)_servicio.Execute(assign);
                var name = response.ResponseName;

            }
            catch (Exception ex)
            {
                resp.Error = ex.Message;
            }

            return resp;
        }
        public Respuesta Asignar(Guid ContactoID, Guid UsuarioID, IOrganizationService Servicio)
        {
            Respuesta resp = new Respuesta();
            try
            {
                AssignRequest assign = new AssignRequest();
                assign.Assignee = new EntityReference("systemuser", UsuarioID);
                assign.Target = new EntityReference(_nombreEntidad, ContactoID);
                AssignResponse response = (AssignResponse)Servicio.Execute(assign);
                var name = response.ResponseName;

            }
            catch (Exception ex)
            {
                resp.Error = ex.Message;
            }

            return resp;
        }

        #region IDisposable Support
        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects).
                }
                _servicio = null;

                disposedValue = true;
            }
        }

        // TODO: override a finalizer only if Dispose(bool disposing) above has code to free unmanaged resources.
        ~ContactoServicio()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(false);
        }

        // This code added to correctly implement the disposable pattern.
        public void Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            // TODO: uncomment the following line if the finalizer is overridden above.
            GC.SuppressFinalize(this);
        }
        #endregion



    }
}
