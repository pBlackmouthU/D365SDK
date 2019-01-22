using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.JQuery.Common.Response

{
    public class ResponseBase
    {
        public ResponseBase()
        {
            WasSuccessful = false;
            ErrorMessage = null;
        }
        public bool WasSuccessful { get; set; }

        public string ErrorMessage { get; set; }
    }
}