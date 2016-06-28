using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.mantenedores.SubTramite
{
    public partial class Listar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IList<ALCSA.Entidades.Tramites.SubTramite> arrSubTramites = new ALCSA.Negocio.Tramites.SubTramite().Listar();
            for (int intIndice = 0; intIndice < arrSubTramites.Count; intIndice++)
            {
                arrSubTramites[intIndice].Codigo = arrSubTramites[intIndice].Vigente ? "SI" : "NO";
                arrSubTramites[intIndice].Termino = arrSubTramites[intIndice].Termino == "N" ? "NO" : "SI";
            }

            gvSubTramites.DataSource = arrSubTramites;
            gvSubTramites.DataBind();

            if (Page.IsPostBack) return;

            lblMensaje.Text = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "mensaje") == 1 ? "Sub-Tramite Guardado Correctamente" : string.Empty;
        }
    }
}