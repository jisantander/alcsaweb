namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MostrarfonosDeudor : Page
    {
     

        private void CargaGrilla(string idcobranza)
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarFonoDeudor(idcobranza);
            this.Session["Excel_fo_nos"] = table;
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla(this.hiddidjuicio.Value.ToString());
            this.Grilla.PageIndex = e.NewPageIndex;
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
                this.txtnomDeudor.Text = this.Session["snomdeudor"].ToString();
                if (this.Session["snoperacion"] == null)
                {
                    this.txtNrooperacion.Text = base.Request.QueryString["estado"].ToString();
                }
                else
                {
                    this.txtNrooperacion.Text = this.Session["snoperacion"].ToString();
                }
                this.txtRutDeudor.Text = this.Session["srutdeudor"].ToString();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
                this.CargaGrilla(this.txtRutDeudor.Text.ToString().Trim());
            }
        }
    }
}

