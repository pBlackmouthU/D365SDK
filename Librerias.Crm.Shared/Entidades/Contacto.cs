using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Librerias.Common;

namespace Librerias.Crm
{
    public partial class Contacto : CrmEntity
    {
        private static string _entityName = "contact";
        public Contacto()
            :base(_entityName)
        {
            ContactoID = null;
            Nombres = null;
            Apellidos = null;
            Puesto = null;
            Cuenta = null;
        }

        public Guid? ContactoID { get; set; }

        public string Nombres { get; set; }

        public string Apellidos { get; set; }        

        public string Puesto { get; set; }

        public CrmLookup Cuenta { get; set; }

        public CrmPicklist MetodoContacto { get; set; }


        protected override void GetEntityObject()
        {
            try
            {
                if(ContactoID != null && ContactoID.Value != Guid.Empty)
                {
                    _entity.Id = ContactoID.Value;
                }

                if (Nombres.IsNotNull())
                {
                    _entity["firstname"] = Nombres;
                }

                if(Apellidos.IsNotNull())
                {
                    _entity["lastname"] = Apellidos;
                }

                if (Puesto.IsNotNull())
                {
                    _entity["jobtitle"] = Puesto;
                }

                if(Cuenta != null && Cuenta.IsNotEmpty())
                {
                    _entity["parentcustomerid"] = new EntityReference(Cuenta.NombreLogico, Cuenta.Id.Value);
                }

                if (MetodoContacto != null && MetodoContacto.IsNotEmpty())
                {
                    _entity["preferredcontactmethodcode"] = new OptionSetValue(MetodoContacto.Id.Value);
                }
                

            }
            catch (Exception ex)
            {
                _entity = null;
            }
            
        }
        

    }
}
