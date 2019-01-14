using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Librerias.Crm
{
    public class Respuesta
    {

        public Guid? Id { get; set; }
        public string Error { get; set; }

        public Respuesta()
        {
            Id = null;
            Error = null;
        }

        public Respuesta(Guid? Id, string MensajeError)
        {
            this.Id = Id;
            Error = MensajeError;
        }

        public bool TieneError()
        {
            bool value = false;
            if (Error.IsNotNullOrEmpty())
            {
                value = true;
            }
            return value;
        }

        public bool NoTieneError()
        {
            return !TieneError();
        }


    }
}
