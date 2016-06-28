namespace CobranzaALC.Cobranza.Digitalizar
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class DigiConsulta : Page
    {

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("digitalizar.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
        }

        private void CargaGrilla()
        {
            this.Grilla.DataSource = Consulta.MostrarDocumentosDigitalizadosInfo(this.txtRut.Text.ToString(), this.txtFolio.Text.ToString());
            this.Grilla.DataBind();
        }

        private void habilitar()
        {
            this.txtRut.BackColor = Color.LightYellow;
            this.txtFolio.BackColor = Color.LightYellow;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            this.Session.Contents.Clear();
            this.Session.RemoveAll();
            base.Response.Write("<script>window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
            base.Response.End();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.txtRut.Focus();
                this.habilitar();
            }
        }
    }
}

