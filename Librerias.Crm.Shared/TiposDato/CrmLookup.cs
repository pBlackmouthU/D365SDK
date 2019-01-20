using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Librerias.Common;

namespace Librerias.Crm
{
    public class CrmLookup
    {
        public Guid? Id { get; set; }
        public string Nombre { get; set; }
        public string NombreLogico { get; set; }


        public CrmLookup()
        {
            Id = null;
            Nombre = null;
            NombreLogico = null;
        }

        public CrmLookup(Guid Id)
        {
            this.Id = Id;
            Nombre = null;
            NombreLogico = null;
        }

        public CrmLookup(Guid Id, string Nombre, string NombreLogico)
        {
            this.Id = Id;
            this.Nombre = Nombre;
            this.NombreLogico = NombreLogico;
        }

        public CrmLookup(EntityReference ReferenciaEntidad)
        {
            if (ReferenciaEntidad != null)
            {
                this.Id = ReferenciaEntidad.Id;
                this.Nombre = ReferenciaEntidad.Name;
                this.NombreLogico = ReferenciaEntidad.LogicalName;
            }
        }


        public bool IsEmpty()
        {
            bool value = false;

            if(Id == null && Nombre.IsNull() && NombreLogico.IsNull())
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
