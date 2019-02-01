using Librerias.Crm.Conexion;
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
        static void Main(string[] args)
        {
            cnn = new SimpleConnection365("");

        }
    }
}
