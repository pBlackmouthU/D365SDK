using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;

using Librerias.Common;
using System.IO;

namespace Librerias.Common.IO
{
    public class FileLog: IDisposable
    {

        string _filePath = null;
        string _directory = null;

        public FileLog()
        {
            GetAssemplyPath();
        }

        public FileLog(string FilePath)
        {

            if (FilePath.IsNullOrEmpty())
            {
                GetAssemplyPath();
            }
            else
            {
                _filePath = FilePath;
            }
        }

        

        public void WriteError(string Message, string ErrorID = null)
        {
            try
            {
                using (StreamWriter sw = new StreamWriter("{0}\\log.txt".TextPlacecholders(_directory), true, Encoding.Default))
                {
                    sw.WriteLine("{0}--------------------------------------------------------------------------------------------------------------------------------------------".TextPlacecholders(DateTime.Now));
                    if (ErrorID != null)
                        sw.WriteLine("\tErrorID: {0}".TextPlacecholders(ErrorID));

                    sw.WriteLine("\t{0}".TextPlacecholders(Message));
                    sw.WriteLine("\r\n");
                }
            }
            catch (Exception ex)
            {
                // TODO: Event Viewer Log
            }
        }

        public string RegisterError(string ErrorMessage, string CustomMessage, params object[] Params)
        {
            Guid errorID = Guid.NewGuid();
            WriteError(ErrorMessage, errorID.ToString());
            string message = CustomMessage.TextPlacecholders(Params).Trim(); ;

            if(!(message.LastIndexOf('.') == (message.Length - 1)))
            {
                message = "{0}.".TextPlacecholders(message);
            }

            return "{0} Proporcione el siguiente código de error al administrador del sistema. ErrorID: {1}".TextPlacecholders(message, errorID);
        }

        private void GetAssemplyPath()
        {
            // _filePath = AppDomain.CurrentDomain.BaseDirectory;
            try
            {

                _filePath = Assembly.GetExecutingAssembly().CodeBase;
                _directory = "{0}\\Logs".TextPlacecholders(System.IO.Path.GetDirectoryName(_filePath)).Replace("file:\\", "");

                if (!Directory.Exists(_directory))
                {
                    Directory.CreateDirectory(_directory);
                }
            }
            catch (Exception ex)
            {
                // TODO: Event Viewer Log
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                _filePath = null;
                _directory = null;
            }
            
        }
    }
}
