using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.JQuery.Common.Response
{
    public class RetrieveEntityRecordResponse : ResponseBase
    {
        public Entity Record { get; set; }
    }
}