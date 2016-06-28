using ALCLOCAL;
using System;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Procesos
{
    public partial class BuscaCobranza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.txtRut.Focus();
                this.habilitar();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
            }
        }
        public void habilitar()
        {
            this.txtRut.BackColor = Color.LightYellow;
            this.txtNroOperacion.BackColor = Color.LightYellow;
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
            this.Grilla.DataSource = ConsultasEspecificas.ConsultaCobranza(this.txtRut.Text, this.txtNroOperacion.Text);
            this.Grilla.DataBind();
        }
    }
}