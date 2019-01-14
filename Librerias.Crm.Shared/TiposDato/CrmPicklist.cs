using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Librerias.Crm
{
    public class CrmPicklist
    {
        public int? Id { get; set; }
        public string Nombre { get; set; }

        public CrmPicklist()
        {
            Id = null;
            Nombre = null;
        }

        public CrmPicklist(int Id)
        {
            this.Id = Id;
            Nombre = null;
        }

        public CrmPicklist(int Id, string Nombre)
        {
            this.Id = Id;
            this.Nombre = Nombre;
        }

        public CrmPicklist(string NombreAtributo, Entity Entidad)
        {
            if (Entidad != null && NombreAtributo.IsNotNullOrEmpty())
            {
                this.Id = ((OptionSetValue)Entidad[NombreAtributo]).Value;

                if (Entidad.FormattedValues.Count > 0)
                    this.Nombre = Entidad.FormattedValues[NombreAtributo].ToString();
            }
        }


        public bool IsEmpty()
        {
            bool value = false;

            if (Id == null && Nombre.IsNull())
            {
                value = true;
            }

            return value;
        }

        public bool IsNotEmpty()
        {
            return !IsEmpty();
        }
    }
}
