namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using CobranzaALC.Dto;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MostrarDocuJuicio : Page
    {


        private void CargaGrilla(string idcobranza)
        {
            this.Grilla.DataSource = ConsultasEspecificas.MostrarDocuJuicio(idcobranza);
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
                    if (adto.Id_Materia.ToString() == "1")
                    {
                        this.Label1.Text = "COBRO CHEQUE";
                    }
                    if (adto.Id_Materia.ToString() == "4")
                    {
                        this.Label1.Text = "COBRO LETRA DE CAMBIO";
                    }
                    if (adto.Id_Materia.ToString() == "7")
                    {
                        this.Label1.Text = "NOTIFICACION PROTESTO CHEQUE";
                    }
                    if (adto.Id_Materia.ToString() == "8")
                    {
                        this.Label1.Text = "NOTIFICACION PROTESTO LETRA";
                    }
                    if (adto.Id_Materia.ToString() == "10")
                    {
                        this.Label1.Text = "CITACI\x00d3N A CONFESAR DEUDA";
                    }
                    if (adto.Id_Materia.ToString() == "11")
                    {
                        this.Label1.Text = "CITACI\x00d3N A CONFESAR DEUDA, RECONOCIMIENTO FIRMA";
                    }
                    if (adto.Id_Materia.ToString() == "26")
                    {
                        this.Label1.Text = "COBRO FACTURA";
                    }
                    if (adto.Id_Materia.ToString() == "28")
                    {
                        this.Label1.Text = "NOTIFICACI\x00d3N FACTURA";
                    }
                }
            }
        }
    }
}

