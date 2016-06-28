using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Documentos.Formatos.DocumentosSeis
{
    public partial class CartaPlanNormalizacionBBVA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ALCSA.FWK.Web.Control.AsignarValor(lblFecha, DateTime.Now, true);

            ALCSA.Negocio.Cobranzas.Cobranza objCobranza = new ALCSA.Negocio.Cobranzas.Cobranza(
                ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_cob"));

            ALCSA.FWK.Web.Control.AsignarValor(lblNombreDeudor, objCobranza.NombreDeudor);
            
        }
    }
}