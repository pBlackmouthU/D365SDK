using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Librerias.Crm
{
    public class EntidadCrm : IEntidadCrm
    {
        protected Entity _entity;

        public EntidadCrm(string entityName)
        {
            _entity = new Entity(entityName);
        }
        public virtual Entity MapearEntidad()
        {
            ObtenerObjetoEntity();
            return _entity;
        }

        protected virtual void ObtenerObjetoEntity()
        {
            throw new NotImplementedException();
        }

        public void LimpiarAtributos(string[] Atributos)
        {
            foreach(string attr in Atributos)
            {
                _entity[attr] = null;
            }
        }


    }
}
