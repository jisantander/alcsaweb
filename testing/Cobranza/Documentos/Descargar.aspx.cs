using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ALCSA.Negocio.Documentos.Fisicos;

namespace CobranzaALC.Cobranza.Documentos
{
    public partial class Descargar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // -----------------------------------------------------------------------------------
            string strIdentificadores = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "ids");
            string strRutaIndicada = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "ruta");
            string strNombreIdDoc = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "nom_id_doc");
            string strTipoIdDoc = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "tipo_id_doc");
            // -----------------------------------------------------------------------------------
            string[] arrFormatosIdentificadores = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "for_dat").Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            int intIdDocumento = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_doc");
            int intIdDocumentoParametro = 0;
            // -----------------------------------------------------------------------------------
            if (string.IsNullOrEmpty(strRutaIndicada)) return;
            // -----------------------------------------------------------------------------------
            string strRutaTemporal = Server.MapPath("Temporal");
            if (!strRutaTemporal.EndsWith("\\")) strRutaTemporal = string.Format("{0}\\", strRutaTemporal);
            strRutaTemporal = string.Format("{0}{1:ddMMyyyyhhmmssfffff}_{2}\\", strRutaTemporal, DateTime.Now, new Random().Next(10000, 999999));
            // -----------------------------------------------------------------------------------
            if (!System.IO.Directory.Exists(strRutaTemporal))
                System.IO.Directory.CreateDirectory(strRutaTemporal);
            // -----------------------------------------------------------------------------------
            if(string.IsNullOrWhiteSpace(strTipoIdDoc)) strTipoIdDoc = CodigoBarra.INICIAL_CODIGO_DOCUMENTO_FISICO;

            if (intIdDocumento.Equals(0))
                intIdDocumento = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id");
             // -----------------------------------------------------------------------------------
            // Multiples archivos 
            if (!string.IsNullOrWhiteSpace(strIdentificadores))
            {
                string[] arrIdentificadores = strIdentificadores.Split(new char[] { '-' }, StringSplitOptions.RemoveEmptyEntries), arrSubIdentificadores = null;

                foreach (string strIdentificador in arrIdentificadores)
                {
                    arrSubIdentificadores = strIdentificador.Split(new char[] { ',' });
                    intIdDocumentoParametro = intIdDocumento;

                    int intIndiceParametro = 0;
                    string strNombreParametro = string.Empty;
                    StringBuilder strbParametros = new StringBuilder();

                    while (intIndiceParametro < arrSubIdentificadores.Length)
                    {
                        strNombreParametro = arrFormatosIdentificadores.Length > intIndiceParametro ? arrFormatosIdentificadores[intIndiceParametro] : string.Format("par_{0}", intIndiceParametro);

                        strbParametros.AppendFormat("&{0}={1}", strNombreParametro, arrSubIdentificadores[intIndiceParametro]);

                        if (intIdDocumentoParametro == 0 && strNombreParametro == strNombreIdDoc)
                            intIdDocumentoParametro = ALCSA.FWK.Texto.ConvertirTextoEnEntero(arrSubIdentificadores[intIndiceParametro]);

                        intIndiceParametro++;
                    }

                    GenerarDocumento(strRutaIndicada, strbParametros.ToString(), strRutaTemporal, intIdDocumentoParametro, strTipoIdDoc);
                }
            }
            else
            {
                StringBuilder strbTexto = new StringBuilder();
                foreach (string strLlave in Request.QueryString.AllKeys)
                    if (strLlave != "ids" && strLlave != "ruta" && strLlave != "for_dat")
                    {
                        intIdDocumentoParametro = intIdDocumento; 
                        strbTexto.AppendFormat("&{0}={1}", strLlave, Request.QueryString[strLlave]);

                        if(intIdDocumentoParametro == 0 && strLlave == strNombreIdDoc)
                            intIdDocumentoParametro = ALCSA.FWK.Texto.ConvertirTextoEnEntero(Request.QueryString[strLlave]);
                    }

                GenerarDocumento(strRutaIndicada, strbTexto.ToString(), strRutaTemporal, intIdDocumentoParametro, strTipoIdDoc);
            }
            // -----------------------------------------------------------------------------------
            string[] arrArchivos = System.IO.Directory.GetFiles(strRutaTemporal);
            if (arrArchivos.Length.Equals(1))
            {
                DescargarArchivo(System.IO.File.ReadAllBytes(arrArchivos[0]), "archivo_doc.docx", "application/msword", System.Text.Encoding.ASCII);
                return;
            }
            // -----------------------------------------------------------------------------------
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
            // -----------------------------------------------------------------------------------
        }

        private void GenerarDocumento(string ruta, string parametros, string rutaDestino, int identificadorCodigoBarra, string tipoIdentificadorCodigoBarra)
        {
            using (System.IO.MemoryStream objArchivo = new System.IO.MemoryStream())
            {
                if (parametros.StartsWith("&")) parametros = parametros.Remove(0, 1);
                string strRuta = ResolveUrl(string.Format("~/Cobranza/Documentos/{0}?{1}", ruta, parametros));

                string strServidor = Request.Url.OriginalString.Replace(Request.Url.LocalPath, string.Empty);
                if (strServidor.Contains("?")) strServidor = strServidor.Substring(0, strServidor.IndexOf("?"));
                if (!strServidor.EndsWith("/")) strServidor += "/";
                if (strRuta.StartsWith("/")) strRuta = strRuta.Substring(1, strRuta.Length - 1);

                string[] arrRutas = rutaDestino.Contains("GeneradorCodigoBarra.aspx")
                                    ? new string[] { strServidor + strRuta }
                                    : new string[] { 
                                        strServidor + strRuta,
                                        strServidor + ResolveUrl(string.Format("~/Cobranza/Documentos/General/GeneradorCodigoBarra.aspx?id={0}&tipo={1}", identificadorCodigoBarra, tipoIdentificadorCodigoBarra))
                                    };

                new ALCSA.Negocio.Documentos.GeneradorWord(Server).GenerarArchivoDocxDesdeRutasHtml(arrRutas, objArchivo);

                string strRutaFinal = string.Format("{0}DOC_{1:yyyyMMdd_hhmmss_fffff}.docx", new object[] { rutaDestino, DateTime.Now });
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