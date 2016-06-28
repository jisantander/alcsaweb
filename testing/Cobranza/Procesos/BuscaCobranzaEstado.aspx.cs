namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class BuscaCobranzaEstado : Page
    {
      

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        private void CargaGrilla()
        {
            this.Grilla.DataSource = ConsultasEspecificas.ConsultaCobranza(this.txtRut.Text, this.txtNroOperacion.Text);
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
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            this.Page.RegisterHiddenField("USUARIO", this.Session["Usuario"].ToString());
            if (!this.Page.IsPostBack)
            {
                this.txtRut.Focus();
                this.habilitar();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
            }
        }
    }
}

