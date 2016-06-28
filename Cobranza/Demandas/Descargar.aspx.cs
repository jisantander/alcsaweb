using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Demandas
{
    public partial class Descargar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // -----------------------------------------------------------------------------------------------------------------------------
            string strIdentificador = Request.QueryString["id"];
            string strRutaIndicada = Request.QueryString["ruta"];
            // -----------------------------------------------------------------------------------------------------------------------------
            if (string.IsNullOrEmpty(strIdentificador) || string.IsNullOrEmpty(strRutaIndicada)) return;
            // -----------------------------------------------------------------------------------------------------------------------------
            string strRutaTemporal = Server.MapPath("Temporal");
            if (!strRutaTemporal.EndsWith("\\")) strRutaTemporal = string.Format("{0}\\", strRutaTemporal);
            strRutaTemporal = string.Format("{0}{1:ddMMyyyyhhmmssfffff}_{2}\\", strRutaTemporal, DateTime.Now, new Random().Next(10000, 999999));
            // -----------------------------------------------------------------------------------------------------------------------------
            if (!System.IO.Directory.Exists(strRutaTemporal))
                System.IO.Directory.CreateDirectory(strRutaTemporal);
            // -----------------------------------------------------------------------------------------------------------------------------
            GenerarDocumento(strRutaIndicada, strIdentificador, strRutaTemporal);
            // -----------------------------------------------------------------------------------------------------------------------------
        }

        private void GenerarDocumento(string ruta, string idCobranza, string rutaDestino)
        {
            using (System.IO.MemoryStream objArchivo = new System.IO.MemoryStream())
            {
                string strRuta = ResolveUrl(string.Format("~/Cobranza/Demandas/{0}?id_cob={1}", ruta, idCobranza));
                string strServidor = Request.Url.OriginalString.Replace(Request.Url.PathAndQuery, string.Empty);
                if (!strServidor.EndsWith("/")) strServidor += "/";
                if (strRuta.StartsWith("/")) strRuta = strRuta.Substring(1, strRuta.Length - 1);
                new ALCSA.Negocio.Documentos.GeneradorWord(Server).GenerarArchivoDocxDesdeRutaHtml(strServidor + strRuta, objArchivo);

                DescargarArchivo(objArchivo.ToArray(), "archivo_doc.docx", "application/msword", System.Text.Encoding.ASCII);
            }
        }

        /// <summary>
        /// Funcion que permite al usuario descargar un archivo
        /// </summary>
        /// <param name="datos">Datos a descargar</param>
        /// <param name="nombre">Nombre del archivo</param>
        /// <creador>Jonathan Contreras</creador>
        /// <fecha_creacion>03-10-2011</fecha_creacion>
        protected void DescargarArchivo(byte[] datos, String nombre, String tipo, System.Text.Encoding codificacion)
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