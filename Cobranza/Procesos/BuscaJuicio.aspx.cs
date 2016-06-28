namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class BuscaJuicio : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack) return;

            this.txtRol.Focus();
            this.habilitar();
            this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
        }

        public void habilitar()
        {
            this.txtRol.BackColor = Color.LightYellow;
            this.txtNroOperacion.BackColor = Color.LightYellow;
            this.txtRutDeudor.BackColor = Color.LightYellow;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla();
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        private void CargaGrilla()
        {
            this.Grilla.DataSource = ConsultasEspecificas.ConsultaJuicio(this.txtRol.Text, this.txtRutDeudor.Text, this.txtNroOperacion.Text);
            this.Grilla.DataBind();
        }
    }
}

