using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.JQuery.Common.Request
{
    public class ListRequest : RequestBase
    {
        public EntityCollection List { get; set; }

    }
}