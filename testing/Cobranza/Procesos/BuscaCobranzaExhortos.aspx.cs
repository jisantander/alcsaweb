namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class BuscaCobranzaExhortos : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hdfMostrarMensaje.Value = "0";
            hdfIdDocumento.Value = "0";

            if (this.Page.IsPostBack) return;

            hdfMostrarMensaje.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "mensaje").ToString();
            hdfIdDocumento.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_doc").ToString();
            this.txtRut.Focus();
            this.habilitar();
            this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        private void CargaGrilla()
        {
            this.Grilla.DataSource = ConsultasEspecificas.ConsultaJuicio(null, this.txtRut.Text, this.txtNroOperacion.Text);
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
            this.txtRut.BackColor = Color.LightYellow;
            this.txtNroOperacion.BackColor = Color.LightYellow;
        }
    }
}

