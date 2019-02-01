using Librerias.Common;
using Librerias.Crm.Conexion;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Consola.OrganizationService
{
    public class Program
    {
        private static SimpleConnection365 cnn = null;
        private static IOrganizationService servicio = null;
        private static Guid? createEntityId = null;
        static void Main(string[] args)
        {
            cnn = new SimpleConnection365("Dev00");
            if(cnn != null)
            {
                servicio = cnn.ObtenerServicioConexion();
            }

            bool continuar = true;
            while (continuar)
            {
                Menu();
                switch (Console.ReadKey().Key)
                {
                    case ConsoleKey.D1:
                        // Obtener listado de Clientes potenciales.
                        GetLeads();
                        break;

                    case ConsoleKey.D2:
                        // Crear Lead.
                        CreateLead();
                        break;

                    case ConsoleKey.Q:
                        continuar = false;
                        break;

                    default:
                        Console.Clear();
                        Console.WriteLine("Opción inválida...");
                        PressEnter();                        
                        break;
                }
            }   

        }

        private static void Menu()
        {
            Console.Clear();
            Console.WriteLine("Seleccione una opcion: ");
            Console.WriteLine("1. Lista de clientes potenciales.");
            Console.WriteLine("2. Crear un cliente potencial.");
            Console.WriteLine("Q. Salir ");
        }

        private static void GetLeads()
        {
            if(servicio != null)
            {
                Console.Clear();
                Console.WriteLine("Obteniendo lista de Clientes Potenciales...");

                ColumnSet columns = new ColumnSet(new string[] { "firstname","lastname","emailaddress1","jobtitle","companyname" });

                QueryExpression qe = new QueryExpression("lead");
                qe.ColumnSet = columns;

                EntityCollection collection = servicio.RetrieveMultiple(qe);
                if(collection != null && collection.Entities != null && collection.Entities.Count > 0)
                {
                    foreach(Entity entity in collection.Entities)
                    {
                        string firstname = entity.Attributes.Contains("firstname") ? entity["firstname"].ToString() : "";
                        string lastname = entity.Attributes.Contains("lastname") ? entity["lastname"].ToString() : "";
                        string emailaddress1 = entity.Attributes.Contains("emailaddress1") ? entity["emailaddress1"].ToString() : "";
                        string jobtitle = entity.Attributes.Contains("jobtitle") ? entity["jobtitle"].ToString() : "";
                        string companyname = entity.Attributes.Contains("companyname") ? entity["companyname"].ToString() : "";

                        Console.WriteLine("Nombre: {0}\t\tApellido:{1}\t\tEmail:{2}\t\tPuesto:{3}\t\tEmpresa:{4}".FormatWith(firstname, lastname, emailaddress1, jobtitle, companyname));
                    }
                }

                PressEnter();
            }
        }

        private static void CreateLead()
        {  
            if(servicio != null)
            {
                try
                {
                    Console.Clear();
                    Console.WriteLine("Crear un nuevo cliente potencial.");

                    Console.WriteLine("Escriba el Nombre: ");
                    string firstname = Console.ReadLine();

                    Console.WriteLine("Escriba el Apellido: ");
                    string lastname = Console.ReadLine();

                    Console.WriteLine("Escriba el correo electrónico: ");
                    string emailaddress1 = Console.ReadLine();

                    Console.WriteLine("Escriba el Puesto: ");
                    string jobtitle = Console.ReadLine();

                    Console.WriteLine("Escriba la empresa: ");
                    string companyname = Console.ReadLine();

                    Console.WriteLine("Creando cliente potencial...");
                    Entity lead = new Entity("lead");
                    lead["firstname"] = firstname;
                    lead["lastname"] = lastname;
                    lead["emailaddress1"] = emailaddress1;
                    lead["jobtitle"] = jobtitle;
                    lead["companyname"] = companyname;

                    createEntityId = servicio.Create(lead);
                    Console.WriteLine("Cliente potencial creado con exito: {0}", createEntityId);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Creación fallida: {0}", ex.Message);
                }
            }

            PressEnter();
        }

        private static void PressEnter()
        {
            Console.WriteLine("Presione Enter para continuar...");
            Console.ReadLine();
        }



    }
}
