namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ConsultaAbonos : Page
    {

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
        }

        private void CargaGrilla()
        {
            DataTable table = null;
            table = ConsultasEspecificas.ConsultaEspAbonos(this.txtCliente.Text.Replace(".", ""), this.TipoComprobante.SelectedValue.ToString(), this.txtfechaini.Text.ToString(), this.txtfechafin.Text.ToString());
            this.Session["Excel"] = table;
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla();
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.txtCliente.Focus();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
            }
        }
    }
}

