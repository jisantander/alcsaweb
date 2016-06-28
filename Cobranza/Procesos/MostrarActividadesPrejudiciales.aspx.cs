namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using CobranzaALC.Dto;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MostrarActividadesPrejudiciales : Page
    {
 

        private void CargaGrilla(string idcobranza)
        {
            this.Grilla.DataSource = ConsultasEspecificas.MostrarActividadesPrejudicial(idcobranza);
            this.Grilla.DataBind();
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla(this.hiddidCobranza.Value.ToString());
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string idcobranza = base.Request.QueryString["Codigo"].ToString();
                this.hiddidCobranza.Value = idcobranza.ToString();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
                this.CargaGrilla(idcobranza);
                CabezaPrejudicialDTO ldto = new CabezaPrejudicialDTO();
                ldto = (CabezaPrejudicialDTO) this.Session["CabezeraActividadesPrejudicial"];
                if (ldto != null)
                {
                    this.txtDeudor.Text = ldto.Nom_Deudor.ToString();
                    this.txtrutdeudor.Text = ldto.Rut_Deudor.ToString();
                    this.txtcliente.Text = ldto.Nom_Cli.ToString();
                    this.txtNrooperacion.Text = ldto.NroOperacion.ToString();
                }
            }
        }
    }
}

