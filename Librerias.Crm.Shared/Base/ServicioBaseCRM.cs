using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Services.Protocols;

namespace Librerias.Crm
{
    public abstract class CrmServiceBase 
    {

        protected IOrganizationService _servicio;
        public CrmServiceBase(IOrganizationService servicio)
        {
            _servicio = servicio;
        }


        private Guid? Crear(Entity entity)
        {
            Guid? _id = null;

            try
            {
                
                _servicio.Create(entity);
                
            }
            catch (SoapException ex) // Agregar referencia System.Web.Services
            {
                throw ex;
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return _id;
        }

        private Guid? Actualizar(Entity entity)
        {
            Guid? _id = null;

            try
            {

                _servicio.Create(entity);

            }
            catch (SoapException ex) // Agregar referencia System.Web.Services
            {
                throw ex;
            }
            catch (Exception ex)
            {

                throw ex;
            }

            return _id;
        }

    }
}
