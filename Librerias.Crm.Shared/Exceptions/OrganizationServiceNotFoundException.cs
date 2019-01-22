using System;
using System.Collections.Generic;
using System.Text;

namespace Librerias.Crm.Exceptions
{
    public class OrganizationServiceNotFoundException: Exception
    {
        public OrganizationServiceNotFoundException() : 
            base("No hay conexión con Dynamics 365, verifique la cadena de conexión en el web.config e intente de nuevo.")
        {
            
        }
    }
}
