using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.JQuery.Common.Response
{
    public class RetrieveRecordListResponse : ResponseBase
    {
        public List<Entity> List { get; set; }

    }
}