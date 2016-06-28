using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zen.Barcode;
using ALCSA.Negocio.Documentos.Fisicos;

namespace CobranzaALC.Cobranza.Documentos.General
{
    public partial class GeneradorCodigoBarra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int intId = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id");
            string strTipo = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "tipo");

            CodigoBarra objCodigo = new CodigoBarra(intId, strTipo);

            string strRutaVirtual = "~/Cobranza/Documentos/Temporal/";
            string strRuta = Server.MapPath(strRutaVirtual);
            if (!strRuta.EndsWith("\\")) strRuta += "\\";

            string strImagenCodigoQr = string.Format("QR{0:ddMMyyyy_hhmmss_ffffff}.jpeg", DateTime.Now);
            string strImagenCodigoBarra = string.Format("BR{0:ddMMyyyy_hhmmss_ffffff}.jpeg", DateTime.Now);

            string strRutaQr = string.Format(System.Configuration.ConfigurationManager.AppSettings["RUTA_QR"], objCodigo.Codigo);

            BarcodeDrawFactory.CodeQr.Draw(strRutaQr, 50).Save(strRuta + strImagenCodigoQr, System.Drawing.Imaging.ImageFormat.Jpeg);
            BarcodeDrawFactory.Code128WithChecksum.Draw(objCodigo.Codigo, 90).Save(strRuta + strImagenCodigoBarra, System.Drawing.Imaging.ImageFormat.Jpeg);

            imgCodigoQr.ImageUrl = ResolveUrl(strRutaVirtual + strImagenCodigoQr);
            imgCodigoBarra.ImageUrl = ResolveUrl(strRutaVirtual + strImagenCodigoBarra);

            lblTexto.Text = objCodigo.Codigo;
        }
    }
}