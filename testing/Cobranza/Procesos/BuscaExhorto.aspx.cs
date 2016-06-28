namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class BuscaExhorto : Page
    {
       

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        private void CargaGrilla()
        {
            this.Grilla.DataSource = ConsultasEspecificas.ConsultaExhorto(this.txtRol.Text, this.txtRutDeudor.Text, this.txtNroOperacion.Text);
            this.Grilla.DataBind();
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla();
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        public void habilitar()
        {
            this.txtRol.BackColor = Color.LightYellow;
            this.txtNroOperacion.BackColor = Color.LightYellow;
            this.txtRutDeudor.BackColor = Color.LightYellow;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.txtRol.Focus();
                this.habilitar();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
            }
        }
    }
}

