namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class BuscaGeneral : Page
    {

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        private void CargaGrilla()
        {
            DataTable table = new DataTable();
            table = ConsultasEspecificas.ConsultaCobranzaConsulta(this.txtRut.Text, this.txtNroOperacion.Text);
            this.Session["snomdeudor"] = table.Rows[0]["nomdeudor"].ToString();
            this.Session["srutdeudor"] = table.Rows[0]["rut_deudor"].ToString();
            this.Grilla.DataSource = table;
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

