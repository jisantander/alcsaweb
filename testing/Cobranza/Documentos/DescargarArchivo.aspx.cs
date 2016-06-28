using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Documentos
{
    public partial class DescargarArchivo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int intId = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id");
            if (intId < 1) return;

            ALCSA.Negocio.Documentos.Fisicos.Documento objDocumento = new ALCSA.Negocio.Documentos.Fisicos.Documento(intId);
            if (objDocumento.ID.Equals(0)) return;

            DescargarArchivoFisico(objDocumento.Archivo, objDocumento.Nombre, "application/octet-stream", System.Text.Encoding.ASCII);
        }

        protected void DescargarArchivoFisico(byte[] datos, String nombre, String tipo, System.Text.Encoding codificacion)
        {
            try
            {
                nombre = nombre.Replace(" ", "_");

                string[] arrCaracteres = { ",", "?", "¿", "'", "!", "¡", "=", "|", "/", "\\" };
                for (int intIndice = 0; intIndice < arrCaracteres.Length; intIndice++)
                    nombre = nombre.Replace(arrCaracteres[intIndice], string.Empty);

                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", String.Format("attachment;filename={0}", nombre));
                Response.AddHeader("Content-Length", datos.Length.ToString());
                Response.Charset = "";
                Response.ContentType = tipo;
                Response.ContentEncoding = codificacion;
                Response.BinaryWrite(datos);
                Response.Flush();
                Response.End();
            }
            catch { }
        }
    }
}