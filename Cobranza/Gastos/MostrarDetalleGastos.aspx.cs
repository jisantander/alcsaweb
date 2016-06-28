namespace CobranzaALC.Cobranza.Gastos
{
    using ALCLOCAL;
    using CobranzaALC.Dto;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MostrarDetalleGastos : Page
    {

        private void CargaGrilla(string idJuico)
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDetalleGastos(idJuico);
            this.Session["Excel_gas_tos"] = table;
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();
        }

        protected string Evaluar(object FechaSubTramite)
        {
            if (FechaSubTramite.ToString() == "01/01/1900")
            {
                return "";
            }
            return FechaSubTramite.ToString();
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla(this.hiddidjuicio.Value.ToString());
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string idJuico = base.Request.QueryString["Codigo"].ToString();
                this.hiddidjuicio.Value = idJuico.ToString();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
                this.CargaGrilla(idJuico);
                CabezeraGastosDTO sdto = new CabezeraGastosDTO();
                sdto = (CabezeraGastosDTO) this.Session["CabezeraGastos"];
                if (sdto != null)
                {
                    this.txtDeudor.Text = sdto.Deudor.ToString();
                    this.txtNoperacion.Text = sdto.Noperacion.ToString();
                    this.txtRol.Text = sdto.Rol.ToString();
                    this.txtTribunal.Text = sdto.Tribunal.ToString();
                }
            }
        }
    }
}

