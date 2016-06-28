namespace CobranzaALC.Cobranza.Abonos
{
    using ALCLOCAL;
    using System;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class buscaCobranzaAbonos : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack) return;
            this.txtRut.Focus();
            this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla(0);
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargaGrilla(e.NewPageIndex);
        }

        private void CargaGrilla(int indice)
        {
            this.Grilla.PageIndex = indice;
            this.Grilla.DataSource = ConsultasEspecificas.ConsultaAbonoGeneral(string.Empty, txtRut.Text.Trim(), txtNroOperacion.Text.Trim(), txtNombreDeudor.Text.Trim());
            this.Grilla.DataBind();
        }
    }
}

