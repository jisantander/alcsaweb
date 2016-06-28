using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Gestion
{
    public partial class ControlJuiciosPorPlazos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            ddlClientes.DataSource = ALCLOCAL.Consulta.ComboCliente();
            ddlClientes.DataBind();
            ddlClientes.Items.Insert(0, new ListItem("Todos", string.Empty));

            ddlTribunales.DataSource = ALCLOCAL.Consulta.ComboTribunales();
            ddlTribunales.DataBind();
            ddlTribunales.Items.Insert(0, new ListItem("Todos", "0"));

            ddlProcuradores.DataSource = ALCLOCAL.Consulta.ComboProcurador();
            ddlProcuradores.DataBind();
            ddlProcuradores.Items.Insert(0, new ListItem("Todos", string.Empty));
        }

        protected void btnExportarExcel_Click(object sender, EventArgs e)
        {
            CargarGrilla(gvDatos.PageIndex, true);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarGrilla(0, false);
        }

        protected void gvDatos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrilla(e.NewPageIndex, false);
        }

        private void CargarGrilla(int indice, bool exportarExcel)
        {
            IList<ALCSA.Entidades.Gestion.ControlRiesgo> arrDatos = new ALCSA.Negocio.Gestion.ControlRiesgo().Listar(
                (ddlTipo.SelectedValue == "E"),
                txtRutDeudor.Text.Replace(".", string.Empty),
                txtNumeroOperacion.Text.Trim(),
                ddlClientes.SelectedValue,
                ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlTribunales),
                ddlEstadosJuicios.SelectedValue,
                ddlProcuradores.SelectedValue,
                string.IsNullOrEmpty(txtDiasSinMovimiento.Text) ? -1 : ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtDiasSinMovimiento)
            );

            gvDatos.Columns[5].Visible = (ddlTipo.SelectedValue == "E");

            gvDatos.PageIndex = indice;
            gvDatos.DataSource = arrDatos;
            gvDatos.DataBind();

            btnExportarExcel.Visible = (arrDatos.Count > 0);
            lblNumero.Text = arrDatos.Count > 0 ? string.Format("N° Registros: {0:N0}", arrDatos.Count) : string.Empty;

            if (!exportarExcel) return;

            ALCSA.Negocio.Documentos.GeneradorExcel objExcel = new ALCSA.Negocio.Documentos.GeneradorExcel();
            string strNombreArchivo = string.Format("ControlRiesgo_{0}_{1:ddMMyyyy_hhmmss_fff}.xls", ddlTipo.SelectedValue == "E" ? "Exhortos" : "Juicios", DateTime.Now);
            string[] arrColumnas = ddlTipo.SelectedValue == "E"
                ? new string[] { "NumeroOperacion", "RutDeudor", "NombreDeudor", "NombreTribunal", "Rol", "RolExhorto", "NombreTramite", "FechaTramite", "NombreSubTramite", "FechaSubTramite", "NombreProcurador", "EstadoJuicio", "NombreCliente", "EstadoExhorto", "TramiteExhorto", "DiasSinMovimientos" }
                : new string[] { "NumeroOperacion", "RutDeudor", "NombreDeudor", "NombreTribunal", "Rol", "NombreTramite", "FechaTramite", "NombreSubTramite", "FechaSubTramite", "NombreProcurador", "EstadoJuicio", "NombreCliente", "EstadoExhorto", "TramiteExhorto", "DiasSinMovimientos" };

            using (System.IO.MemoryStream objArchivoMemoria = objExcel.ExportarListaDtoAExcel<ALCSA.Entidades.Gestion.ControlRiesgo>(arrDatos, ddlTipo.SelectedValue == "E" ? "Exhortos" : "Juicios", arrColumnas))
            {
                new ALCSA.FWK.Web.Sitio().DescargarArchivo(Response, objArchivoMemoria, strNombreArchivo);
            }
        }
    }
}