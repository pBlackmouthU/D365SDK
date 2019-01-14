﻿using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Services.Protocols;

namespace Librerias.Crm
{
    public abstract class ServicioBaseCRM 
    {

        protected IOrganizationService _servicio;
        public ServicioBaseCRM(IOrganizationService servicio)
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

            }
            catch (Exception ex)
            {

                throw;
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

            }
            catch (Exception ex)
            {

                throw;
            }

            return _id;
        }

    }
}