using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Messages;
using Microsoft.Xrm.Sdk.Metadata;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Librerias.Crm
{
    public class Metadata : IDisposable
    {
        private IOrganizationService _servicio;

        public Metadata(IOrganizationService servicio)
        {
            this._servicio = servicio;
        }

        public List<CrmPicklist> ObtenerOptionSetGlobal(string optionsetName)
        {
            List<CrmPicklist> lista = null;


            try
            {


                RetrieveOptionSetRequest retrieveOptionSetRequest =
                    new RetrieveOptionSetRequest
                    {
                        Name = optionsetName
                    };

                // Execute the request.
                RetrieveOptionSetResponse retrieveOptionSetResponse =
                    (RetrieveOptionSetResponse)_servicio.Execute(retrieveOptionSetRequest);

                // Access the retrieved OptionSetMetadata.
                OptionSetMetadata retrievedOptionSetMetadata = (OptionSetMetadata)retrieveOptionSetResponse.OptionSetMetadata;

                // Get the current options list for the retrieved attribute.
                OptionMetadata[] optionList = retrievedOptionSetMetadata.Options.ToArray();

                if (optionList != null)
                {
                    lista = new List<CrmPicklist>();
                    foreach (OptionMetadata optionMetadata in optionList)
                    {

                        //optionsetSelectedText = optionMetadata.Label.UserLocalizedLabel.Label.ToString();

                        CrmPicklist item = new CrmPicklist();

                        item.Id = optionMetadata.Value;
                        item.Nombre = optionMetadata.Label.UserLocalizedLabel.Label;
                        lista.Add(item);
                    }
                }
            }
            catch (Exception)
            {
            }
            return lista;

        }


        public List<CrmPicklist> ObtenerOptionSetEntidad(string NombreEntidad, string NombreAtributo)
        {

            List<CrmPicklist> lista = null;

            RetrieveEntityRequest retrieveDetails = new RetrieveEntityRequest
            {
                EntityFilters = EntityFilters.All,
                LogicalName = NombreEntidad
            };
            RetrieveEntityResponse retrieveEntityResponseObj = (RetrieveEntityResponse)_servicio.Execute(retrieveDetails);

            Microsoft.Xrm.Sdk.Metadata.EntityMetadata metadata = retrieveEntityResponseObj.EntityMetadata;

            Microsoft.Xrm.Sdk.Metadata.PicklistAttributeMetadata picklistMetadata =
                metadata.Attributes.FirstOrDefault(
                    attribute => String.Equals(attribute.LogicalName, NombreAtributo, StringComparison.OrdinalIgnoreCase)
                ) as Microsoft.Xrm.Sdk.Metadata.PicklistAttributeMetadata;

            Microsoft.Xrm.Sdk.Metadata.OptionSetMetadata options = picklistMetadata.OptionSet;

            IList<OptionMetadata> OptionsList = (from o in options.Options
                                                 select o).ToList();


            if (OptionsList != null)
            {
                lista = new List<CrmPicklist>();
                foreach (OptionMetadata option in OptionsList)
                {
                    CrmPicklist item = new CrmPicklist();

                    item.Id = option.Value;
                    item.Nombre = option.Label.UserLocalizedLabel.Label;
                    lista.Add(item);
                }
            }


            return lista;
        }

        #region IDisposable Support
        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects).
                }

                // TODO: free unmanaged resources (unmanaged objects) and override a finalizer below.
                // TODO: set large fields to null.
                _servicio = null;

                disposedValue = true;
            }
        }

        // TODO: override a finalizer only if Dispose(bool disposing) above has code to free unmanaged resources.
        //~Metadata()
        //{
        //    // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
        //    Dispose(false);
        //}

        // This code added to correctly implement the disposable pattern.
        public void Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            // TODO: uncomment the following line if the finalizer is overridden above.
            GC.SuppressFinalize(this);
        }
        #endregion

    }
}
