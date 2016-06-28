using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.mantenedores.RelacionBienes
{
    public partial class Descargar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // -----------------------------------------------------------------------------------------------------------------------------
            string strIdentificadores = Request.QueryString["ids"];
            string strRutaIndicada = Request.QueryString["ruta"];
            // -----------------------------------------------------------------------------------------------------------------------------
            if (string.IsNullOrEmpty(strIdentificadores) || string.IsNullOrEmpty(strRutaIndicada)) return;
            // -----------------------------------------------------------------------------------------------------------------------------
            string[] arrIdentificadores = strIdentificadores.Split(new char[] { ',' }), arrSubIdentificadores = null;
            // -----------------------------------------------------------------------------------------------------------------------------
            string strRutaTemporal = Server.MapPath("Temporal");
            if (!strRutaTemporal.EndsWith("\\")) strRutaTemporal = string.Format("{0}\\", strRutaTemporal);
            strRutaTemporal = string.Format("{0}{1:ddMMyyyyhhmmssfffff}_{2}\\", strRutaTemporal, DateTime.Now, new Random().Next(10000, 999999));
            // -----------------------------------------------------------------------------------------------------------------------------
            if (!System.IO.Directory.Exists(strRutaTemporal))
                System.IO.Directory.CreateDirectory(strRutaTemporal);
            // -----------------------------------------------------------------------------------------------------------------------------
           // foreach (string strIdentificador in arrIdentificadores)
               // if ((arrSubIdentificadores = strIdentificador.Split(new char[] { ',' })).Length.Equals(3))
            GenerarDocumento(strRutaIndicada, strIdentificadores, strRutaTemporal);
            // -----------------------------------------------------------------------------------------------------------------------------
            string[] arrArchivos = System.IO.Directory.GetFiles(strRutaTemporal);
            if (arrArchivos.Length.Equals(1))
            {
                DescargarArchivo(System.IO.File.ReadAllBytes(arrArchivos[0]), "archivo_doc.docx", "application/msword", System.Text.Encoding.ASCII);
                return;
            }
            // -----------------------------------------------------------------------------------------------------------------------------
            // COMPRIMIR TODOS LOS ARCHIVOS
            string strNombreZip = string.Format("{0}Documentos_{1}.zip", strRutaTemporal, new Random().Next(10000, 999999));
            using (Ionic.Zip.ZipFile objArchivoZip = new Ionic.Zip.ZipFile())
            {
                foreach (string strArchivo in arrArchivos)
                    objArchivoZip.AddFile(strArchivo, string.Empty);
                objArchivoZip.Save(strNombreZip);
            }

            // DESCARGAR
            DescargarArchivo(System.IO.File.ReadAllBytes(strNombreZip), "Documentos.zip", "application/msword", System.Text.Encoding.ASCII);
            // -----------------------------------------------------------------------------------------------------------------------------
        }

        private void GenerarDocumento(string ruta, string parametros, string rutaDestino)
        {
            using (System.IO.MemoryStream objArchivo = new System.IO.MemoryStream())
            {
                string strRuta = ResolveUrl(string.Format("~/Cobranza/Documentos/{0}?ID_BIEN_RAIZ={1}", ruta, parametros));
                string strServidor = Request.Url.OriginalString.Replace(Request.Url.PathAndQuery, string.Empty);
                if (!strServidor.EndsWith("/")) strServidor += "/";
                if (strRuta.StartsWith("/")) strRuta = strRuta.Substring(1, strRuta.Length - 1);
                new ALCSA.Negocio.Documentos.GeneradorWord(Server).GenerarArchivoDocxDesdeRutaHtml(strServidor + strRuta, objArchivo);

                string strRutaFinal = string.Format("{0}Cob{1}.docx", new object[] { rutaDestino, parametros });
                if (System.IO.File.Exists(strRutaFinal)) System.IO.File.Delete(strRutaFinal);
                System.IO.File.WriteAllBytes(strRutaFinal, objArchivo.ToArray());
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