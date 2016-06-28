using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Gestion.Metricas.EstadosActuales.Clientes
{
    public partial class ListadoClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            ddlClientes.DataSource = ALCLOCAL.Consulta.ComboCliente();
            ddlClientes.DataBind();
            ddlClientes.Items.Insert(0, new ListItem("Todos", string.Empty));

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
            IList<ALCSA.Entidades.Parametros.Salidas.Metricas.EstadoCliente> arrClientes = new ALCSA.Negocio.Gestion.Metricas.Cliente().Listar(ddlClientes.SelectedValue);
            gvDetalle.DataSource = arrClientes;
            gvDetalle.DataBind();

            if (!exportarExcel) return;

            string strNombreArchivo = string.Format("GestionClientes_{0:ddMMyyyy_hhmmss_fff}.xls", DateTime.Now);

            using (System.IO.MemoryStream objArchivoMemoria = new ALCSA.Negocio.Documentos.GeneradorExcel().ExportarListaDtoAExcel
                <ALCSA.Entidades.Parametros.Salidas.Metricas.EstadoCliente>(
                arrClientes,
                "Gestión",
                new string[] {
                    "NombreCliente",
                    "NumeroCobranzasVencidas",
                    "NumeroCobranzasPorVencer",
                    "NumeroCobranzasEnPlazo",
                    "NumeroCobranzasTerminadas"
                }))
            {
                new ALCSA.FWK.Web.Sitio().DescargarArchivo(Response, objArchivoMemoria, strNombreArchivo);
            }
        }
    }
}