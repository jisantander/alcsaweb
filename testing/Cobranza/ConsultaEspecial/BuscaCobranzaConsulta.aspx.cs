namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    using ALCLOCAL;
    using System;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class BuscaCobranzaConsulta : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack) return;

            this.txtRut.Focus();
            this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        private void CargaGrilla()
        {
            this.Grilla.DataSource = ConsultasEspecificas.ConsultaCobranzaConsulta(this.txtRut.Text.Trim(), this.txtNroOperacion.Text.Trim(), this.txtRol.Text.Trim());
            this.Grilla.DataBind();
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla();
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }
    }
}

