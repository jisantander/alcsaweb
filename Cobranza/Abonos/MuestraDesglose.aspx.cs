namespace CobranzaALC.Cobranza.Abonos
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MuestraDesglose : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            int intIdCobranza = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "Codigo");
            int intIdAbono = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_abono");

            ALCSA.FWK.Web.Control.AsignarValor(hdfIdCobranza, intIdCobranza);
            ALCSA.FWK.Web.Control.AsignarValor(hdfIdAbono, intIdAbono);

            CargarGrilla(false);
        }

        protected void btnExportarExcel_Click(object sender, EventArgs e)
        {
            CargarGrilla(true);
        }

        private void CargarGrilla(bool exportarExcel)
        {
            DataTable datTabla = new ALCSA.Negocio.Abonos.Lista().ListarDesglose(
                ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdAbono),
                ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza));

            gvDesglose.DataSource = datTabla;
            gvDesglose.DataBind();

            if (!exportarExcel) return;

            string strNombreArchivo = string.Format("Desglose_{0:ddMMyyyy_hhmmss_fff}.xls", DateTime.Now);

            using (System.IO.MemoryStream objArchivoMemoria = new ALCSA.Negocio.Documentos.GeneradorExcel().ExportarDataTableAExcel(
                datTabla,
                "Desglose",
                new string[] {
                    "tipo_doc", "nro_doc", "monto", "Fvto", "dias", "intereses", "int_adic", "honorarios", 
                    "desc_honorarios", "desc_interes", "Otros_desc"
                },
                new string[] {
                    "Tipo Documento", "N° Documento", "Monto", "Fecha Vencimiento", "Días",
                    "Intereses", "Interes Adicional", "Honorarios", "Desc. Honorarios", "Desc. Intereses",
                    "Otros Descuentos"
                }))
            {
                new ALCSA.FWK.Web.Sitio().DescargarArchivo(Response, objArchivoMemoria, strNombreArchivo);
            }
        }
    }
}

