using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Gestion.Metricas.EstadosActuales.Procuradores
{
    public partial class Resumen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            hdfRutProcurador.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "rut_pro");
            lblNombreProcurador.Text = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "nombre");

            DateTime datFechaDesde = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            DateTime datFechaHasta = datFechaDesde.AddMonths(1).AddDays(-1);

            lblFecha.Text = string.Format("{0} de {1:yyyy}", ALCSA.FWK.Tiempo.MESES[datFechaDesde.Month - 1], datFechaDesde);

            CargarDatos(datFechaDesde, datFechaHasta);
        }

        private void CargarDatos(DateTime fechaDesde, DateTime fechaHasta)
        {
            IList<ALCSA.Entidades.Parametros.Salidas.Metricas.ResumenProcurador> arrResumenes =
                 new ALCSA.Negocio.Gestion.Metricas.Procurador().ListarResumenPorCliente(hdfRutProcurador.Value, fechaDesde, fechaHasta);

            if (arrResumenes.Count > 0)
            {
                ALCSA.FWK.Web.Control.AsignarValor(lblVelocidadTramitacion, arrResumenes[0].VelocidadPromedioTramitacion, 2);
                ALCSA.FWK.Web.Control.AsignarValor(lblVelocidadTermino, arrResumenes[0].VelocidadPromedioTermino, 2);
                ALCSA.FWK.Web.Control.AsignarValor(lblEfectividad, arrResumenes[0].Efectividad, 2);
            }

            gvResumenesPorClientes.DataSource = arrResumenes;
            gvResumenesPorClientes.DataBind();

            CargarDatosTramites(fechaDesde, fechaHasta);
        }

        private void CargarDatosTramites(DateTime fechaDesde, DateTime fechaHasta)
        {
            // ------------------------------------------------------------------------
            IList<ALCSA.Entidades.Parametros.Salidas.Metricas.TramiteCobranzaTerminada> arrTramites =
                new ALCSA.Negocio.Gestion.Metricas.Procurador().ListarTramitesCobranzasTerminadas(hdfRutProcurador.Value, fechaDesde, fechaHasta);
            // ------------------------------------------------------------------------
            var arrColumnas = (from x in arrTramites
                               // where x.EsTramiteTermino
                               orderby x.Tramite
                               select x.Tramite).Distinct<string>();

            var arrClientes = (from x in arrTramites
                               orderby x.NombreCliente
                               select x.NombreCliente).Distinct<string>();
            // ------------------------------------------------------------------------
            DataTable objTabla = new DataTable();
            List<List<string>> arrIdentificadores = new List<List<string>>();
            int intIndice = 0, intIndiceUno = 0;
            // ------------------------------------------------------------------------
            // COLUMNAS
            objTabla.Columns.Add(new DataColumn("Nombre Cliente", typeof(string)));
            foreach (var objColumna in arrColumnas)
                objTabla.Columns.Add(new DataColumn(objColumna, typeof(int)));
            // ------------------------------------------------------------------------
            // FILAS
            foreach (var strCliente in arrClientes)
            {
                DataRow objFila = objTabla.NewRow();
                List<string> arrDatosFila = new List<string>();
                intIndice = 0;
                objFila[intIndice] = strCliente;
                foreach (var objColumna in arrColumnas)
                {
                    intIndice++;
                    int[] arrIdsCobranzas = (from x in arrTramites
                                             where x.NombreCliente == strCliente
                                                   && x.Tramite == objColumna
                                             select x.IdCobranza).ToArray<int>();

                    objFila[intIndice] = arrIdsCobranzas.Length;
                    arrDatosFila.Add(string.Join(",", arrIdsCobranzas));
                }
                objTabla.Rows.Add(objFila);
                arrIdentificadores.Add(arrDatosFila);
            }
            // ------------------------------------------------------------------------
            // ULTIMA FILA (TOTAL)
            if (objTabla.Rows.Count > 0)
            {
                DataRow objFilaTotal = objTabla.NewRow();
                List<string> arrDatosFila = new List<string>();
                intIndice = 0;
                objFilaTotal[intIndice] = "Total";
                foreach (var objColumna in arrColumnas)
                {
                    intIndice++;
                    int[] arrIdsCobranzas = (from x in arrTramites
                                             where x.Tramite == objColumna
                                             select x.IdCobranza).ToArray<int>();

                    objFilaTotal[intIndice] = arrIdsCobranzas.Length;
                    arrDatosFila.Add(string.Join(",", arrIdsCobranzas));
                }
                objTabla.Rows.Add(objFilaTotal);
                arrIdentificadores.Add(arrDatosFila);
            }
            // ------------------------------------------------------------------------
            gvResumenesTramites.DataSource = objTabla;
            gvResumenesTramites.DataBind();
            // ------------------------------------------------------------------------
            intIndice = 0;
            foreach (GridViewRow objFila in gvResumenesTramites.Rows)
            {
                intIndiceUno = 1;
                foreach (var objColumna in arrColumnas)
                {
                    if (arrIdentificadores[intIndice][intIndiceUno - 1].Length > 0)
                        objFila.Cells[intIndiceUno].CssClass += string.Format(" detalle-cobranzas-termino {0}", arrIdentificadores[intIndice][intIndiceUno - 1]);
                    intIndiceUno++;
                }
                intIndice++;
            }
            // ------------------------------------------------------------------------
        }
    }
}