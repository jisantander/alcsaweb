using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace ALCLOCAL
{
    public class UTIL
    {
        public static string SubirArchivo(FileUpload filesubir, string Path, string NomArchivo)
        {
            string result;
            try
            {
                if (filesubir.PostedFile == null || filesubir.PostedFile.ContentLength <= 0)
                {
                    result = "Seleccione un archivo para cargar";
                    return result;
                }
                string filename = Path + "\\" + NomArchivo;
                filesubir.PostedFile.SaveAs(filename);
            }
            catch (Exception var_2_4F)
            {
                result = "No fue posible subir el archivo, intentelo más tarde...";
                return result;
            }
            result = "OK";
            return result;
        }
    }
}//namespace
