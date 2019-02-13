using System;
using System.Configuration;
using System.Net;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Tooling.Connector;


namespace Consola.ConexionCRM
{
    class Program
    {
        private static CrmServiceClient _crmClient;
        private static IOrganizationService crmService = null;
        static void Main(string[] args)
        {
            DynamicsConnection();  
            Console.ReadLine();
        }

        static void DynamicsConnection()
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            _crmClient = new CrmServiceClient(ConfigurationManager.ConnectionStrings["Dev01"].ConnectionString);
            crmService = (IOrganizationService)_crmClient.OrganizationWebProxyClient != null ? (IOrganizationService)_crmClient.OrganizationWebProxyClient : (IOrganizationService)_crmClient.OrganizationServiceProxy;

            if (_crmClient != null && _crmClient.IsReady)
            {
                Console.WriteLine("Conectado a CRM! (Version{0}; Organization Unique Name: {1}, Organization Friendly Name: {2}, Endpoints: {3})", _crmClient.ConnectedOrgVersion, _crmClient.ConnectedOrgUniqueName, _crmClient.ConnectedOrgFriendlyName);
            }
        }

        static void CrmConnect()
        {
            
        }

        
        
    }
}
