using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Librerias.Crm
{
    public class CrmEntity : ICrmEntity
    {
        protected Entity _entity;

        public CrmEntity(string entityName)
        {
            _entity = new Entity(entityName);
        }
        public virtual Entity MapEntity()
        {
            GetEntityObject();
            return _entity;
        }

        protected virtual void GetEntityObject()
        {
            throw new NotImplementedException();
        }

        public void ClearAttributes(string[] Atributos)
        {
            foreach(string attr in Atributos)
            {
                _entity[attr] = null;
            }
        }


    }
}
