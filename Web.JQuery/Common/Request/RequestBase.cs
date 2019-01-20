using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.JQuery.Common.Request
{
    public class RequestBase
    {
        public bool WasSuccessful { get; set; }

        public string ErrorMessage { get; set; }
    }
}