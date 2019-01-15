using Librerias.Crm.Conexion;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Tooling.Connector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace Consola.ConexionCRM
{
    class Program
    {
        static string connectionStringName = "Dev00";
        static void Main(string[] args)
        {
            try
            {
                ConexionSimple();
            }
            catch (FaultException<OrganizationServiceFault> osFaultException)
            {
                Console.WriteLine("Fault Exception caught");
                Console.WriteLine(osFaultException.Detail.Message);
            }
            catch (Exception e)
            {
                Console.WriteLine("Uncaught Exception");
                Console.WriteLine(e);
            }

            Console.ReadLine();
        }

        static void ConexionSimple()
        {
            using (ConexionSimpleCRM cnn = new ConexionSimpleCRM(connectionStringName))
            {
                if (cnn != null)
                {
                    CrmServiceClient crmSvc = cnn.ObtenerCrmServiceClient();
                    if (crmSvc != null && crmSvc.IsReady)
                    {
                        Console.WriteLine("Conectado a CRM! (Version{0}; Organization Unique Name: {1}, Organization Friendly Name: {2}, Endpoints: {3})", crmSvc.ConnectedOrgVersion, crmSvc.ConnectedOrgUniqueName, crmSvc.ConnectedOrgFriendlyName);
                    }
                }
            }
        }

        static void CrmConnect()
        {
            CrmServerLoginControl
        }

        
        
    }
}
