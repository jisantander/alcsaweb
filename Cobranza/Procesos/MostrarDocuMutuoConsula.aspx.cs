namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MostrarDocuMutuoConsula : Page
    {
 
        public GridViewRow gridViewRow = null;

        private void CargaGrilla(string idcobranza)
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDoc_mutuo(idcobranza);
            this.Session["docu_mutu_o"] = table;
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();
        }

        public void Editar(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                this.gridViewRow = ((Control) e.CommandSource).BindingContainer as GridViewRow;
                if (e.CommandName.CompareTo("Editar") == 0)
                {
                    Label label = (Label) this.gridViewRow.FindControl("lblArchivo");
                    ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Error", "Mostrar('" + label.Text.ToString() + "');", true);
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Error", "alert('No existe documento');", true);
            }
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
                this.txtNrooperacion.Text = this.Session["snoperacion"].ToString();
                this.txtRutDeudor.Text = this.Session["srutdeudor"].ToString();
                if (!string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
                {
                    string idcobranza = base.Request.QueryString["Codigo"].ToString();
                    this.hiddidjuicio.Value = idcobranza.ToString();
                    this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
                    this.CargaGrilla(idcobranza);
                }
            }
        }
    }
}

