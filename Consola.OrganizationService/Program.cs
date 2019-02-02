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
        private static ColumnSet columns = null;
        static void Main(string[] args)
        {
            cnn = new SimpleConnection365("Dev00");
            if(cnn != null)
            {
                servicio = cnn.ObtenerServicioConexion();
            }

            columns = new ColumnSet(new string[] { "firstname", "lastname", "emailaddress1", "jobtitle", "companyname" });

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

                    case ConsoleKey.D3:
                        GetLead();
                        break;

                    case ConsoleKey.D4:
                        UpdateLead();
                        break;

                    case ConsoleKey.D5:
                        DeleteLead();
                        break;

                    case ConsoleKey.D6:
                        GetSampleLeads();
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
            Console.WriteLine("3. Leer el cliente potencial creado.");
            Console.WriteLine("4. Actualizar el cliente potencial creado.");
            Console.WriteLine("5. Eliminar el cliente potencial creado.");
            Console.WriteLine("6. Lista de clientes potenciales de ejemplo.");
            Console.WriteLine("Q. Salir ");
        }

        private static void GetLeads()
        {
            if(servicio != null)
            {
                Console.Clear();
                Console.WriteLine("Obteniendo lista de Clientes Potenciales...");

                EntityCollection collection = RetrieveMultipleEntities();
                if (collection != null && collection.Entities != null && collection.Entities.Count > 0)
                {
                    foreach (Entity entity in collection.Entities)
                    {
                        string firstname = entity.Attributes.Contains("firstname") ? entity["firstname"].ToString() : "";
                        string lastname = entity.Attributes.Contains("lastname") ? entity["lastname"].ToString() : "";
                        string emailaddress1 = entity.Attributes.Contains("emailaddress1") ? entity["emailaddress1"].ToString() : "";
                        string jobtitle = entity.Attributes.Contains("jobtitle") ? entity["jobtitle"].ToString() : "";
                        string companyname = entity.Attributes.Contains("companyname") ? entity["companyname"].ToString() : "";

                        PrintLead(firstname, lastname, emailaddress1, jobtitle, companyname);
                    }
                }

                PressEnter();
            }
        }

        private static void GetSampleLeads()
        {
            if (servicio != null)
            {
                Console.Clear();
                Console.WriteLine("Obteniendo lista de Clientes Potenciales...");

                EntityCollection collection = RetrieveMultipleEntitiesWithCondition();
                if (collection != null && collection.Entities != null && collection.Entities.Count > 0)
                {
                    foreach (Entity entity in collection.Entities)
                    {
                        string firstname = entity.Attributes.Contains("firstname") ? entity["firstname"].ToString() : "";
                        string lastname = entity.Attributes.Contains("lastname") ? entity["lastname"].ToString() : "";
                        string emailaddress1 = entity.Attributes.Contains("emailaddress1") ? entity["emailaddress1"].ToString() : "";
                        string jobtitle = entity.Attributes.Contains("jobtitle") ? entity["jobtitle"].ToString() : "";
                        string companyname = entity.Attributes.Contains("companyname") ? entity["companyname"].ToString() : "";

                        PrintLead(firstname, lastname, emailaddress1, jobtitle, companyname);
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
                    CreateEntity(firstname, lastname, emailaddress1, jobtitle, companyname);
                    Console.WriteLine("Cliente potencial creado con exito: {0}", createEntityId);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Creación fallida: {0}", ex.Message);
                }
            }

            PressEnter();
        }
        
        private static void GetLead()
        {
            if(servicio != null){
                try
                {
                    Console.Clear();
                    Console.WriteLine("Obteniendo cliente potencial...");

                    if (createEntityId != null)
                    {
                        Entity entity = GetEntity();

                        if (entity != null)
                        {
                            string firstname = entity.Attributes.Contains("firstname") ? entity["firstname"].ToString() : "";
                            string lastname = entity.Attributes.Contains("lastname") ? entity["lastname"].ToString() : "";
                            string emailaddress1 = entity.Attributes.Contains("emailaddress1") ? entity["emailaddress1"].ToString() : "";
                            string jobtitle = entity.Attributes.Contains("jobtitle") ? entity["jobtitle"].ToString() : "";
                            string companyname = entity.Attributes.Contains("companyname") ? entity["companyname"].ToString() : "";

                            PrintLead(firstname, lastname, emailaddress1, jobtitle, companyname);
                        }
                    }
                    else
                    {
                        Console.WriteLine("Primero cree un nuevo cliente potencial y luego seleccione esta opción.");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("No se pudo obtener el cliente potencial. {0}", ex.Message);
                }
            }

            PressEnter();
        }        

        private static void UpdateLead()
        {
            if(servicio != null)
            {
                try
                {
                    Console.Clear();
                    Console.WriteLine("Actualizar el cliente potencial.");

                    Console.WriteLine("Cambie el Nombre: ");
                    string firstname = Console.ReadLine();

                    if (createEntityId != null)
                    {
                        Console.WriteLine("Actualizando cliente potencial...");
                        UpdateEntity(firstname);
                        Console.WriteLine("Cliente potencial actualizado con exito: {0}", createEntityId);
                    }
                    else
                    {
                        Console.WriteLine("Primero cree un nuevo cliente potencial y luego seleccione esta opción.");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("No se pudo actualizar el cliente potencial. {0}", ex.Message);
                }
            }
        }        

        private static void DeleteLead()
        {
            if (servicio != null)
            {
                try
                {
                    Console.Clear();
                    Console.WriteLine("Eliminando cliente potencial...");

                    if (createEntityId != null)
                    {
                        DeleteEntity();
                        Console.WriteLine("Cliente potencial actualizado con exito: {0}", createEntityId);
                    }
                    else
                    {
                        Console.WriteLine("Primero cree un nuevo cliente potencial y luego seleccione esta opción.");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("No se pudo actualizar el cliente potencial. {0}", ex.Message);
                }
            }
        }

        

        private static void PressEnter()
        {
            Console.WriteLine("Presione Enter para continuar...");
            Console.ReadLine();
        }

        private static void PrintLead(string firstname, string lastname, string emailaddress1, string jobtitle, string companyname)
        {
            Console.WriteLine("Nombre: {0}\t\tApellido:{1}\t\tEmail:{2}\t\tPuesto:{3}\t\tEmpresa:{4}".FormatWith(firstname, lastname, emailaddress1, jobtitle, companyname));
        }



        private static void CreateEntity(string firstname, string lastname, string emailaddress1, string jobtitle, string companyname)
        {
            Entity lead = new Entity("lead");
            lead["firstname"] = firstname;
            lead["lastname"] = lastname;
            lead["emailaddress1"] = emailaddress1;
            lead["jobtitle"] = jobtitle;
            lead["companyname"] = companyname;

            createEntityId = servicio.Create(lead);
        }

        private static Entity GetEntity()
        {
            return servicio.Retrieve("lead", createEntityId.Value, columns);
        }

        private static void UpdateEntity(string firstname)
        {
            Entity lead = new Entity("lead");
            lead.Id = createEntityId.Value;
            lead["firstname"] = firstname;

            servicio.Update(lead);
        }

        private static void DeleteEntity()
        {
            servicio.Delete("lead", createEntityId.Value);
        }

        private static EntityCollection RetrieveMultipleEntities()
        {
            QueryExpression qe = new QueryExpression("lead");
            qe.ColumnSet = columns;

            EntityCollection collection = servicio.RetrieveMultiple(qe);
            return collection;
        }

        private static EntityCollection RetrieveMultipleEntitiesWithCondition()
        {     
            ConditionExpression condition = new ConditionExpression();
            condition.AttributeName = "fullname";
            condition.Operator = ConditionOperator.Like;
            condition.Values.Add("%(ejemplo)%");

            FilterExpression filter = new FilterExpression();
            filter.Conditions.Add(condition);
            filter.FilterOperator = LogicalOperator.And;

            QueryExpression qe = new QueryExpression("lead");
            qe.Criteria = filter;
            qe.ColumnSet = columns;

            EntityCollection collection = servicio.RetrieveMultiple(qe);
            return collection;
        }



    }
}
