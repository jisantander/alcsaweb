namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ReporteReconMarca : Page
    {
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
            this.txtNroOperacion.Text = "";
            this.txtRut.Text = "";
            this.txtNombreCliente.Text = "";
            this.txtRut.Focus();
        }

        private void CargaGrilla()
        {
            DataTable table = null;
            table = ConsultasEspecificas.ConsultaReconstitucionMARCA(this.txtRut.Text.ToString().Trim(), this.txtNroOperacion.Text.ToString().Trim(), this.txtNombreCliente.Text.ToString());
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();
        }

        protected void cbxEstados_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
        }

        protected void cbxRemesas_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void cbxResponsable_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
        }

        private void ComboEstados()
        {
        }

        private void ComboRemesas()
        {
        }

        private void ComboResponsables()
        {
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla();
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        public void habilitar()
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.txtRut.Focus();
                this.habilitar();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
            }
        }
    }
}

