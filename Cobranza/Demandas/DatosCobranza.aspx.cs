using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Demandas
{
    public partial class DatosCobranza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // int intIdDocumentoFisico = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_doc");

            if (ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "gen_doc").Equals(1))
            {
                hdfIdCobranza.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "id_cob");
                hdfTipo.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "tipo");
                return;
            }

            int intIdCobranza = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_cob");
            string strTipo = new ALCSA.Negocio.Cobranzas.Cobranza().BuscarTipoActividad(intIdCobranza);
            string strRuta = string.Empty;

            if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_JUICIO)
                strRuta = "DocuJuicio.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_PAGARE)
                strRuta = "DocuPagare.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_MUTUO)
                strRuta = "Mutuo.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_ESTANDAR_UNO)
                strRuta = "DocEstandard_1.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_ESTANDAR_DOS)
                strRuta = "DocEstandard_2.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_ESTANDAR_TRES)
                strRuta = "DocEstandard_3.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_ESTANDAR_CUATRO)
                strRuta = "DocEstandard_4.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_CUOTA_COLEGIO)
                strRuta = "cuotacolegio.aspx";

            if (!string.IsNullOrEmpty(strRuta))
                Response.Redirect(string.Format("../Procesos/{0}?id_cob={1}", strRuta, intIdCobranza), true);
            else Response.Redirect("Listar.aspx", true);
        }
    }
}