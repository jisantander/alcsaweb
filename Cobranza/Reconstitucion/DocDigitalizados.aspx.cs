namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class DocDigitalizados : Page
    {
        private void CargaGrilla()
        {
            this.Grilla.DataSource = Consulta.MostrarDigitalizadosReconstitucion(this.hddOT.Value.ToString());
            this.Grilla.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!this.Page.IsPostBack)
            {
                string str = base.Request.QueryString["OT"].ToString();
                this.hddOT.Value = str;
                this.CargaGrilla();
            }
        }
    }
}

