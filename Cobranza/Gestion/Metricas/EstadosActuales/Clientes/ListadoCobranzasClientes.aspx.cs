using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Gestion.Metricas.EstadosActuales.Clientes
{
    public partial class ListadoCobranzasClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            hdfRutCliente.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "rut_cli");
            hdfEstadoAvance.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "est").ToLower().Replace("_", " ");

            ddlTramites.DataSource = new ALCSA.Negocio.Tramites.Tramite().Listar(ALCSA.Negocio.Enumeradores.Estado.Basico.Vigente);
            ddlTramites.DataBind();
            ddlTramites.Items.Insert(0, new ListItem("Todos", string.Empty));

            ddlEtapas.DataSource = new ALCSA.Negocio.Tramites.Tramite().ListarEtapas();
            ddlEtapas.DataBind();
            ddlEtapas.Items.Insert(0, new ListItem("Todos", string.Empty));

            CargarDetalle(0, false);
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            CargarDetalle(gvDetalle.PageIndex, true);
        }

        protected void gvDetalle_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarDetalle(e.NewPageIndex, false);
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            CargarDetalle(0, false);
        }

        private void CargarDetalle(int pagina, bool exportarExcel)
        {
            IList<ALCSA.Entidades.Parametros.Salidas.Metricas.EstadoClienteCobranza> arrCobranzas = new ALCSA.Negocio.Gestion.Metricas.Cliente().ListarCobranzas(hdfRutCliente.Value);
            if (arrCobranzas.Count > 0)
                lblNombreCliente.Text = arrCobranzas[0].NombreCliente;

            int intIndice = 0;
            string strEtapa = ddlEtapas.SelectedValue, strTramite = ddlTramites.SelectedValue;
            while (intIndice < arrCobranzas.Count)
                if (arrCobranzas[intIndice].EstadoAvance.ToLower() != hdfEstadoAvance.Value
                    || (!string.IsNullOrEmpty(strEtapa) && strEtapa != arrCobranzas[intIndice].Etapa)
                    || (!string.IsNullOrEmpty(strTramite) && strTramite != arrCobranzas[intIndice].Tramite))
                    arrCobranzas.RemoveAt(intIndice);
                else intIndice++;

            gvDetalle.PageIndex = pagina;
            gvDetalle.DataSource = arrCobranzas;
            gvDetalle.DataBind();

            if (!exportarExcel) return;

            for (intIndice = 0; intIndice < arrCobranzas.Count; intIndice++)
                arrCobranzas[intIndice].NumeroOperacion = string.Format("'{0}", arrCobranzas[intIndice].NumeroOperacion);

            string strNombreArchivo = string.Format("GestionClientesCobrazas_{0:ddMMyyyy_hhmmss_fff}.xls", DateTime.Now);

            using (System.IO.MemoryStream objArchivoMemoria = new ALCSA.Negocio.Documentos.GeneradorExcel().ExportarListaDtoAExcel
                <ALCSA.Entidades.Parametros.Salidas.Metricas.EstadoClienteCobranza>(
                arrCobranzas,
                "Gestión",
                new string[] {
                    "NumeroOperacion",
                    "RutDeudor",
                    "NombreDeudor",
                    "NombreProcurador",
                    "FechaIngreso",
                    "PlazoDias",
                    "DiasDesdeIngresoCobranza",
                    "DiasRestantes",
                    "DiasAtraso",
                    "FechaLimite",
                    "FechaTermino",
                    "Rol",
                    "Estado",
                    "EstadoAvance",
                    "Etapa",
                    "Tramite",
                    "SubTramite"
                }))
            {
                new ALCSA.FWK.Web.Sitio().DescargarArchivo(Response, objArchivoMemoria, strNombreArchivo);
            }
        }
    }
}