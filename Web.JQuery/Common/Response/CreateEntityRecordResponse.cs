using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web.JQuery.Common.Response;

namespace Web.JQuery.Common
{
    public class CreateEntityRecordResponse : ResponseBase
    {
        public CreateEntityRecordResponse()
        {
            this.CreatedId = null;
        }
        public Guid? CreatedId { get; set; }
    }
}