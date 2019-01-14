using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Xrm.Sdk;

namespace Librerias.Crm
{
    public partial class Cuenta : EntidadCrm
    {
        private static string _entityName = "account";

        public Guid? CuentaID { get; set; }

        public string Nombre { get; set; }

        public Cuenta()
            :base(_entityName)
        {
            CuentaID = null;
            Nombre = null;
        }



        protected override void ObtenerObjetoEntity()
        {
            _entity = new Entity(_entityName);

            try
            {
                if (CuentaID != null && CuentaID.Value != Guid.Empty)
                {
                    _entity.Id = CuentaID.Value;
                }

                if (Nombre.IsNotNull())
                {
                    _entity["firstname"] = Nombre;
                }
                

            }
            catch (Exception ex)
            {
                _entity = null;
            }
        }

    }
}
