using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Gestion.Metricas
{
    public partial class Listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            ALCSA.Negocio.Gestion.Metricas.ParametroGeneral objParametro = new ALCSA.Negocio.Gestion.Metricas.ParametroGeneral("DIAS_INGRESO_JUICIO");
            ALCSA.FWK.Web.Control.AsignarValor(txtPlazoMaximo, objParametro.Valornumerico, 0);

            objParametro = new ALCSA.Negocio.Gestion.Metricas.ParametroGeneral("DIAS_POR_VENCER");
            ALCSA.FWK.Web.Control.AsignarValor(txtDiasPorVencer, objParametro.Valornumerico, 0);

            gvTramites.DataSource = new ALCSA.Negocio.Gestion.Metricas.PlazoCobranzaCliente().Listar();
            gvTramites.DataBind();

            if (gvTramites.Rows.Count.Equals(0))
            {
                Response.Redirect("Mantenedor.aspx", true);
                return;
            }

            if(ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "mensaje") == 1)
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Los Plazos se guardaron correctamente.');</script>");
        }

        protected void btnVer_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(string.Format("Mantenedor.aspx?id={0}", (sender as ImageButton).CommandArgument), true);
        }

        protected void btnGuardarParametros_Click(object sender, EventArgs e)
        {
            ALCSA.Negocio.Gestion.Metricas.ParametroGeneral objParametro = new ALCSA.Negocio.Gestion.Metricas.ParametroGeneral("DIAS_INGRESO_JUICIO");
            objParametro.Valornumerico = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtPlazoMaximo);
            objParametro.Guardar();

            objParametro = new ALCSA.Negocio.Gestion.Metricas.ParametroGeneral("DIAS_POR_VENCER");
            objParametro.Valornumerico = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtDiasPorVencer);
            objParametro.Guardar();

            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Parametros guardados correctamente.');</script>");
        }
    }
}