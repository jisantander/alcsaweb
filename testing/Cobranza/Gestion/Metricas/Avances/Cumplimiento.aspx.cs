using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Gestion.Metricas.Avances
{
    public partial class Cumplimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            ddlClientes.DataSource = ALCLOCAL.Consulta.ComboCliente();
            ddlClientes.DataBind();
            ddlClientes.Items.Insert(0, new ListItem("Todos", string.Empty));

            ddlProcuradores.DataSource = ALCLOCAL.Consulta.ComboProcurador();
            ddlProcuradores.DataBind();
            ddlProcuradores.Items.Insert(0, new ListItem("Todos", string.Empty));

            ALCSA.FWK.Web.Control.AsignarValor(txtFechaDesde, DateTime.Now.Date.AddMonths(-1));
            ALCSA.FWK.Web.Control.AsignarValor(txtFechaHasta, DateTime.Now.Date);

            CargarGrilla(false);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarGrilla(false);
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            CargarGrilla(true);
        }

        private void CargarGrilla(bool exportarExcel)
        {
            IList<ALCSA.Entidades.Parametros.Salidas.Metricas.Cumplimiento> arrCumplimientoEtapa = new ALCSA.Negocio.Gestion.Metricas.Avance().ListarCumplimientoPorEtapa(
                    ALCSA.FWK.Web.Control.ExtraerValor(ddlClientes),
                    ALCSA.FWK.Web.Control.ExtraerValor(ddlProcuradores),
                    ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaDesde),
                    ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaHasta));

            int intEnPlazo = 0, intPorVencer = 0, intVencidos = 0;

            foreach (ALCSA.Entidades.Parametros.Salidas.Metricas.Cumplimiento objDato in arrCumplimientoEtapa)
            {
                intEnPlazo += objDato.CasosEnPlazo;
                intPorVencer += objDato.CasosPorVencer;
                intVencidos += objDato.CasosVencido;
            }

            lblNumeroEnPlazo.Text = intEnPlazo.ToString("N0");
            lblNumeroPorVencer.Text = intPorVencer.ToString("N0");
            lblNumeroVencidos.Text = intVencidos.ToString("N0");

            gvDetalleEtapa.DataSource = arrCumplimientoEtapa;
            gvDetalleEtapa.DataBind();

            IList<ALCSA.Entidades.Parametros.Salidas.Metricas.Cumplimiento> arrCumplimientoTramite = new ALCSA.Negocio.Gestion.Metricas.Avance().ListarCumplimientoPorTramite(
                    ALCSA.FWK.Web.Control.ExtraerValor(ddlClientes),
                    ALCSA.FWK.Web.Control.ExtraerValor(ddlProcuradores),
                    ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaDesde),
                    ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaHasta));

            gvDetalleTramite.DataSource = arrCumplimientoTramite;
            gvDetalleTramite.DataBind();

            if (!exportarExcel) return;

            string strNombreArchivo = string.Format("Cumplimiento_{0:ddMMyyyy_hhmmss_fff}.xls", DateTime.Now);

            using (System.IO.MemoryStream objArchivoMemoria = new ALCSA.Negocio.Documentos.GeneradorExcel().ExportarListaDtoAExcel
                <ALCSA.Entidades.Parametros.Salidas.Metricas.Cumplimiento, ALCSA.Entidades.Parametros.Salidas.Metricas.Cumplimiento>(
                arrCumplimientoEtapa,
                arrCumplimientoTramite,
                "Etapas",
                "Tramites",
                new string[] {
                    "Etapa",
                    "NumeroCasos",
                    "CasosEnPlazo",
                    "CasosPorVencer",
                    "CasosVencido"
                },
                new string[] {
                    "Etapa",
                    "Tramite",
                    "NumeroCasos",
                    "CasosEnPlazo",
                    "CasosPorVencer",
                    "CasosVencido"
                }))
            {
                new ALCSA.FWK.Web.Sitio().DescargarArchivo(Response, objArchivoMemoria, strNombreArchivo);
            }
        }
    }
}