using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Gestion.Metricas.EstadosActuales.Procuradores
{
    public partial class ListadoProcuradores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            ddlProcurador.DataSource = ALCLOCAL.Consulta.ComboProcurador();
            ddlProcurador.DataBind();
            ddlProcurador.Items.Insert(0, new ListItem("Todos", string.Empty));

            CargarDetalle(false);
        }

        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDetalle(false);
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            CargarDetalle(true);
        }

        private void CargarDetalle(bool exportarExcel)
        {
            IList<ALCSA.Entidades.Parametros.Salidas.Metricas.EstadoProcurador> arrProcuradores = new ALCSA.Negocio.Gestion.Metricas.Procurador().Listar(ddlProcurador.SelectedValue);
            int intTotal = 0;
            foreach (ALCSA.Entidades.Parametros.Salidas.Metricas.EstadoProcurador objDato in arrProcuradores)
                intTotal += objDato.NumeroTotalCobranzas;

            gvDetalle.DataSource = arrProcuradores;
            gvDetalle.DataBind();

            if (!exportarExcel) return;

            string strNombreArchivo = string.Format("GestionProcurador_{0:ddMMyyyy_hhmmss_fff}.xls", DateTime.Now);

            using (System.IO.MemoryStream objArchivoMemoria = new ALCSA.Negocio.Documentos.GeneradorExcel().ExportarListaDtoAExcel
                <ALCSA.Entidades.Parametros.Salidas.Metricas.EstadoProcurador>(
                arrProcuradores,
                "Gestión",
                new string[] {
                    "NombreProcurador",
                    "NumeroTotalCobranzas",
                    "NumeroCobranzasVencidas",
                    "NumeroCobranzasPorVencer",
                    "NumeroCobranzasEnPlazo",
                    "NumeroCobranzasTerminadas",
                    "PorcentajeAsignado",
                    "PorcentajeVencidas",
                    "PorcentajePorVencer",
                    "PorcentajeEnPlazo",
                    "PorcentajeTerminado"
                }))
            {
                new ALCSA.FWK.Web.Sitio().DescargarArchivo(Response, objArchivoMemoria, strNombreArchivo);
            }
        }
    }
}