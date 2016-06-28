using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Metas
{
    public partial class Listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            bool blnEsAdministrador = Session["Perfil"] != null && Session["Perfil"].ToString() == "1";
            string strRutUsuario = Session["RutUsuario"] != null ? Session["RutUsuario"].ToString() : string.Empty;
            
            // CARGAR LISTADO DE PROCURADORES
            List<ALCSA.Entidades.Procuradores.Procurador> arrProcuradores = 
                (List<ALCSA.Entidades.Procuradores.Procurador>) new ALCSA.Negocio.Procuradores.Procurador().Listar();

            ddlProcuradores.DataSource = blnEsAdministrador ? arrProcuradores : arrProcuradores.FindAll(x => x.Rut == strRutUsuario);
            ddlProcuradores.DataBind();

            CargarDatosMesActual(DateTime.Now.Date);

            if (!blnEsAdministrador) return;

            pnlDefiniciones.Visible = true;
            gvMetas.DataSource = new ALCSA.Negocio.Procuradores.Metas.Meta().Listar();
            gvMetas.DataBind();
        }

        protected void btnVer_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(string.Format("Mantenedor.aspx?id={0}", (sender as ImageButton).CommandArgument), true);
        }

        protected void btnNuevaMeta_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mantenedor.aspx", true);
        }

        protected void ddlProcuradores_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDatosMesActual();
        }

        private DataTable CargarDatosMesActual()
        {
            return CargarDatosMesActual(ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(hdfFechaSeleccion));
        }

        private DataTable CargarDatosMesActual(DateTime fecha)
        {
            // BUSCAR DATOS POR RUT
            ltrGrafico.Text = string.Empty;

            ALCSA.FWK.Web.Control.AsignarValor(hdfFechaSeleccion, fecha);
            lblMes.Text = string.Format("{0} {1:yyyy}", ALCSA.FWK.Tiempo.MESES[fecha.Month - 1], fecha);

            string strRut = ALCSA.FWK.Web.Control.ExtraerValor(ddlProcuradores);

            DataTable objTabla = new ALCSA.Negocio.Procuradores.Metas.Meta().ListarResumenMetas(strRut, fecha);
            DataTable objTablaDos = new ALCSA.Negocio.Procuradores.Metas.Meta().ListarDetalleCobranzasMetas(strRut, fecha);

            gvMetasMesActual.DataSource = objTabla;
            gvMetasMesActual.DataBind();

            gvDetalleCobranzas.DataSource = objTablaDos;
            gvDetalleCobranzas.DataBind();

            btnExportarExcel.Visible = false;

            if (objTabla.Rows.Count.Equals(0)) return null;

            btnExportarExcel.Visible = true;

            StringBuilder strbTexto = new StringBuilder();

            strbTexto.Append("<script type=\"text/javascript\"> $(document).ready(function () {");
            strbTexto.Append("Morris.Bar({ element: 'divGraficoBarras', data: [");

            foreach (DataRow objFila in objTabla.Rows)
                strbTexto.Append("{").AppendFormat(" y: '{0}', a: {1}, b: {2} ", objFila["Etapa"], objFila["Numero"], objFila["NumeroActual"]).Append("},");

            strbTexto.Remove(strbTexto.Length - 1, 1);
            strbTexto.Append("], xkey: 'y', ykeys: ['a', 'b'], labels: ['Meta', 'Avance Mes'] });");
            strbTexto.Append(" }); </script>");

            ltrGrafico.Text = strbTexto.ToString();

            return objTablaDos;
        }

        protected void btnExportarExcel_Click(object sender, EventArgs e)
        {
            string strRut = ALCSA.FWK.Web.Control.ExtraerValor(ddlProcuradores);
            string strNombreArchivo = string.Format("Metas_{0:ddMMyyyy_hhmmss_fff}.xls", DateTime.Now);

            using (System.IO.MemoryStream objArchivoMemoria = new ALCSA.Negocio.Documentos.GeneradorExcel().ExportarDataTableAExcel(
                CargarDatosMesActual(),
                strRut,
                new string[] { "Etapa", "RutCliente", "RutDeudor", "Nombre", "EstadoCobranza", "Rol", "Tribunal", "Tramite", "FechaTramite" },
                new string[] { "Etapa", "Rut Cliente", "Rut Deudor", "Nombre Deudor", "Estado Cobranza", "Rol", "Tribunal", "Tramite", "Fecha Tramite" }))
            {
                new ALCSA.FWK.Web.Sitio().DescargarArchivo(Response, objArchivoMemoria, strNombreArchivo);
            }
        }

        protected void btnVolverUnMes_Click(object sender, EventArgs e)
        {
            CargarDatosMesActual(ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(hdfFechaSeleccion).AddMonths(-1));
        }

        protected void btnAdelantarUnMes_Click(object sender, EventArgs e)
        {
            CargarDatosMesActual(ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(hdfFechaSeleccion).AddMonths(1));
        }
    }
}