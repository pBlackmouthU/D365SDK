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
    public class FileLog
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

        public void WriteError(string Message)
        {
            using(StreamWriter sw = new StreamWriter("{0}\\log.txt".FormatWith(_directory), true ,Encoding.Default))
            {
                sw.WriteLine("{0}----------------------------------------------------------------------------------------------------------------------------".FormatWith(DateTime.Now));
                sw.WriteLine("\t{0}".FormatWith(Message));
                sw.WriteLine("\r\n");
            }
        }

        private void GetAssemplyPath()
        {
            // _filePath = AppDomain.CurrentDomain.BaseDirectory;

            _filePath = Assembly.GetExecutingAssembly().CodeBase;
            _directory = "{0}\\Logs".FormatWith(System.IO.Path.GetDirectoryName(_filePath)).Replace("file:\\","");

            if (!Directory.Exists(_directory))
            {
                Directory.CreateDirectory(_directory);
            }
        }
    }
}
