using System;
using System.Collections.Generic;
using System.Text;
namespace Librerias.Common.Exceptions
{
    public class MissingParameterException : Exception
    {
        public MissingParameterException(string ParameterName, string MethodName = null) :
            base(MethodName == null ? "El parámetro {0} es nulo o vacío.".FormatWith(ParameterName) : "El parámetro {0} es nulo o vacío en el método {1}.".FormatWith(ParameterName, MethodName))
        {
            
        }
    }
}
