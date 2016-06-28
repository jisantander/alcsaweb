namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class BuscaAsignacion : Page
    {
        public GridViewRow gridViewRow = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (this.Page.IsPostBack) return;

            this.txtRut.Focus();
            this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla(0);
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
            this.txtNroOperacion.Text = "";
            this.txtRut.Text = "";
            this.txtFechaRemesa.Text = "";
            this.txtRut.Focus();
        }

        private void CargaGrilla(int indice)
        {
            DataTable table = ConsultasEspecificas.ConsultaReconstitucionSinAsignar(
                this.txtRut.Text.Trim(), 
                this.txtNroOperacion.Text.Trim(), 
                this.txtFechaRemesa.Text.Trim()
            );
            this.Grilla.PageIndex = indice;
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla(e.NewPageIndex);
        }
    }
}

