namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using CobranzaALC.Dto;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MostrarDocuPagare : Page
    {
   

        private void CargaGrilla(string idcobranza)
        {
            this.Grilla.DataSource = ConsultasEspecificas.MostrarDocuPagare(idcobranza);
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
            if (!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string idcobranza = base.Request.QueryString["Codigo"].ToString();
                this.hiddidjuicio.Value = idcobranza.ToString();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
                this.CargaGrilla(idcobranza);
                CabezaCuotaColegio colegio = new CabezaCuotaColegio();
                colegio = (CabezaCuotaColegio) this.Session["Cuotacolegio"];
                if (colegio != null)
                {
                    this.txtCliente.Text = colegio.Cli;
                    this.txtdeudor.Text = colegio.Deudor;
                    this.txtNoperacion.Text = colegio.Nro_Operacion;
                    this.txtproducto.Text = colegio.Producto;
                    CobranzaDTO adto = new CobranzaDTO();
                    adto = (CobranzaDTO) this.Session["Cobranza"];
                    if (adto.Id_Materia.ToString() == "2")
                    {
                        this.Label1.Text = "COBRO PAGAR\x00c9";
                    }
                    if (adto.Id_Materia.ToString() == "5")
                    {
                        this.Label1.Text = "CUMPLIMIENTO OBLIGATORIO DE DAR";
                    }
                    if (adto.Id_Materia.ToString() == "25")
                    {
                        this.Label1.Text = "CUMPLIMIENTO OBLIGATORIO DE HACER";
                    }
                }
            }
        }
    }
}

