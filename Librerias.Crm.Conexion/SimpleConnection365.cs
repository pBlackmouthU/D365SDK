using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Tooling.Connector;
using System;
using System.Net;
using System.Configuration;
namespace Librerias.Crm.Conexion
{
    /// <summary>
    /// Provee una conexión hacia Dynamics CRm
    /// </summary>
    public class SimpleConnection365 :IDisposable
    {
        private CrmServiceClient _crmClient;
        private IOrganizationService _orgService;
        


        public SimpleConnection365(string connectionStringName)
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            _crmClient = new CrmServiceClient(ConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString);
            _orgService = (IOrganizationService)_crmClient.OrganizationWebProxyClient != null ? (IOrganizationService)_crmClient.OrganizationWebProxyClient : (IOrganizationService)_crmClient.OrganizationServiceProxy;
        }

        public IOrganizationService ObtenerServicioConexion()
        {
            return _orgService;
        }

        public CrmServiceClient ObtenerCrmServiceClient()
        {
            return _crmClient;
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
                    _crmClient.Dispose();
                }
                _orgService = null;
                

                disposedValue = true;
            }
        }

        // TODO: override a finalizer only if Dispose(bool disposing) above has code to free unmanaged resources.
        ~SimpleConnection365()
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
