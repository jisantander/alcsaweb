using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Demandas.Formatos
{
    public partial class _06_DemandaEjecutivaPagareCreditoUniversitario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int intIdCobranza = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_cob");
            new ALCSA.Negocio.Documentos.Demandas.ParseadorPagina(Page).CargarDatosCobranza(intIdCobranza);
        }
    }
}