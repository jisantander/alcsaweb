using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC
{
    public partial class Indice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strValor = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "codigo");
            if (string.IsNullOrWhiteSpace(strValor)) return;

            ALCSA.Negocio.Documentos.Fisicos.CodigoBarra objCodigo = new ALCSA.Negocio.Documentos.Fisicos.CodigoBarra(strValor);
            if (objCodigo.ID < 1) return;

            Session["RUTA_CODIGO_BARRA_QR"] = objCodigo.RutaMantenedor;
        }
    }
}