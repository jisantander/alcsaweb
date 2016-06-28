namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ConsultaJuicioEtapa : Page
    {
       

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        private void CargaGrilla()
        {
            DataTable table = null;
            table = Consulta.JuicioEtapa(this.Etapas.SelectedValue.ToString());
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.Session["Excel_jui_etapa"] = table;
                this.casos.Text = table.Rows.Count.ToString();
                this.Grilla.DataSource = table;
                this.Grilla.DataBind();
            }
            else
            {
                this.casos.Text = "0";
                this.Session["Excel_jui_etapa"] = null;
            }
        }

        private void ComboEtapa()
        {
            this.Etapas.DataTextField = "etapa";
            this.Etapas.DataValueField = "etapa";
            this.Etapas.DataSource = Consulta.ComboetapaJui();
            this.Etapas.DataBind();
        }

        protected void Etapas_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Grilla.DataSource = null;
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
                this.Etapas.Focus();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
                this.casos.Text = "0";
                this.ComboEtapa();
            }
        }
    }
}

