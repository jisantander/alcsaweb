using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Zen.Barcode;

namespace CobranzaALC.Cobranza.Documentos.General
{
    public partial class CodigoBarra1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int intIdJuicio = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_jui");

            ALCSA.Negocio.Juicios.Juicio objJuicio = new ALCSA.Negocio.Juicios.Juicio(intIdJuicio);
            ALCSA.Negocio.Cobranzas.Cobranza objCobranza = new ALCSA.Negocio.Cobranzas.Cobranza(objJuicio.IdCobranza);

            string strTexto = string.Format("{0}_{1}", objCobranza.RutDeudor, objJuicio.Rol);

            string strRutaVirtual = "~/Cobranza/Documentos/Temporal/";
            string strRuta = Server.MapPath(strRutaVirtual);
            if (!strRuta.EndsWith("\\")) strRuta += "\\";

            string strImagenCodigoQr = string.Format("QR{0:ddMMyyyy_hhmmss_ffffff}.jpeg", DateTime.Now);
            string strImagenCodigoBarra = string.Format("BR{0:ddMMyyyy_hhmmss_ffffff}.jpeg", DateTime.Now);

            BarcodeDrawFactory.CodeQr.Draw(strTexto, 50).Save(strRuta + strImagenCodigoQr, System.Drawing.Imaging.ImageFormat.Jpeg);
            BarcodeDrawFactory.Code128WithChecksum.Draw(strTexto, 80).Save(strRuta + strImagenCodigoBarra, System.Drawing.Imaging.ImageFormat.Jpeg);

            imgCodigoQr.ImageUrl = ResolveUrl(strRutaVirtual + strImagenCodigoQr);
            imgCodigoBarra.ImageUrl = ResolveUrl(strRutaVirtual + strImagenCodigoBarra);
            lblTexto.Text = strTexto;
        }
    }
}