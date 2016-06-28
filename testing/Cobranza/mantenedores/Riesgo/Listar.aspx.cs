using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.mantenedores.Riesgo
{
    public partial class Listar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            string strMensaje = Request.QueryString["mensaje"];
            lblMensaje.Text = !string.IsNullOrEmpty(strMensaje) ? "Riesgo Guardado correctamente" : string.Empty;

            CargarGrilla(0);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mantenedor.aspx?id=0", true);
        }

        protected void btnModificar_Click(object sender, ImageClickEventArgs e)
        {
            string strId = ((ImageButton)sender).CommandArgument;
            Response.Redirect(string.Format("Mantenedor.aspx?id={0}", strId), true);
        }

        protected void btnEliminar_Click(object sender, ImageClickEventArgs e)
        {
            string strId = ((ImageButton)sender).CommandArgument;
            ALCSA.Negocio.Juicios.Riesgo objRiesgo = new ALCSA.Negocio.Juicios.Riesgo();
            objRiesgo.ID = Convert.ToInt32(strId);
            objRiesgo.Eliminar();
            CargarGrilla(gvRiesgos.PageIndex);
            lblMensaje.Text = "Riesgo Eliminado correctamente.";
        }

        protected void gvRiesgos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrilla(e.NewPageIndex);
        }

        private void CargarGrilla(int indice)
        {
            gvRiesgos.PageIndex = indice;
            gvRiesgos.DataSource = new ALCSA.Negocio.Juicios.Riesgo().Listar();
            gvRiesgos.DataBind();
        }
    }
}