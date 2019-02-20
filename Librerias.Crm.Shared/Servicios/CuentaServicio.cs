using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Query;
using System;
using System.Collections.Generic;

namespace Librerias.Crm
{
    public class CuentaServicio : CrmServiceBase, IDisposable
    {
        private string[] _columnas = new string[] { "accountid", "name" };
        private string _nombreEntidad = "account";

        public CuentaServicio(IOrganizationService servicio)
            : base(servicio)
        {

        }

        public Respuesta Guardar(Cuenta cuenta)
        {

            Respuesta resp = new Respuesta();
            try
            {
                Entity entity = cuenta.MapEntity();

                if (cuenta.CuentaID == null)
                {
                    resp.Id = _servicio.Create(entity);
                }
                else
                {
                    resp.Id = cuenta.CuentaID.Value;
                    _servicio.Update(entity);
                }
            }
            catch (Exception ex)
            {
                resp.Error = ex.Message;
            }

            return resp;

        }

        public List<Cuenta> ObtenerCuentas()
        {
            List<Cuenta> list = null;

            ColumnSet cols = new ColumnSet(_columnas);

            QueryExpression query = new QueryExpression(_nombreEntidad);
            query.ColumnSet = cols;

            EntityCollection collection = _servicio.RetrieveMultiple(query);
            if(collection != null && collection.Entities != null && collection.Entities.Count > 0)
            {
                list = new List<Cuenta>();
                foreach(Entity ent in collection.Entities)
                {
                    Cuenta cuenta = new Cuenta();
                    cuenta.CuentaID = ent.Id;
                    cuenta.Nombre = ent["name"].ToString();
                    list.Add(cuenta);
                }
            }

            return list;
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
        ~CuentaServicio()
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
