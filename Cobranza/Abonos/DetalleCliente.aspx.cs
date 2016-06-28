namespace CobranzaALC.Cobranza.Abonos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.IO;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class DetalleCliente : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack) return;

            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }

            dllClientes.DataSource = Consulta.ComboCliente();
            dllClientes.DataBind();
            dllClientes.Items.Insert(0, new ListItem("Seleccione un Cliente", string.Empty));

            this.txtRutCli.Focus();
            this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla(0, false);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            this.txtFechaInicio.Text = "";
            this.txtFechaFin.Text = "";
            this.txtRutCli.Text = "";
            this.txtRutCli.Focus();
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
        }

        protected void exp_excel_Click(object sender, ImageClickEventArgs e)
        {
            this.CargaGrilla(Grilla.PageIndex, true);
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla(e.NewPageIndex, false);
        }

        private void CargaGrilla(int indice, bool exportarExcel)
        {
            string strRut = !string.IsNullOrEmpty(txtRutCli.Text) ? txtRutCli.Text : dllClientes.SelectedValue;
            strRut = strRut.Replace(".", string.Empty);

            DataTable datTabla = ConsultasEspecificas.DetalleResumenCliente(
                strRut,
                ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaInicio),
                ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaFin));

            this.Grilla.PageIndex = indice;
            this.Grilla.DataSource = datTabla;
            this.Grilla.DataBind();

            if (!exportarExcel) return;

            string strNombreArchivo = string.Format("Rendiciones_{0:ddMMyyyy_hhmmss_fff}.xls", DateTime.Now);

            using (System.IO.MemoryStream objArchivoMemoria = new ALCSA.Negocio.Documentos.GeneradorExcel().ExportarDataTableAExcel(
                datTabla,
                "Rendiciones",
                new string[] {
                    "nrooperacion", "rut_deudor", "nomdeudor", "nrocomprobante", "fechaabono", "montoabono", "concepto", "moneda"
                },
                new string[] {
                    "N° Operacion", "Rut Deudor", "Nombre Deudor", "N° Comprobante", "Fecha Abono", "Monto Abono", "Concepto", "Moneda"
                }))
            {
                new ALCSA.FWK.Web.Sitio().DescargarArchivo(Response, objArchivoMemoria, strNombreArchivo);
            }
        }
    }
}

