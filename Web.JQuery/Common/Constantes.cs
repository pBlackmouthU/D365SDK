using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Web.JQuery.Common
{
    public class Constantes
    {
        public static string ConexionActual = ConfigurationManager.AppSettings["ConexionActual"];
    }
}