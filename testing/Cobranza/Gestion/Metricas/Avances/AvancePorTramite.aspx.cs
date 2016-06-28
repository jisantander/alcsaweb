using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Gestion.Metricas.Avances
{
    public partial class AvancePorTramite : System.Web.UI.Page
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

            CargarGrilla();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarGrilla();
        }

        private void CargarGrilla()
        {
            IList<ALCSA.Entidades.Parametros.Salidas.Metricas.AvanceTramite> arrAvances =
                new ALCSA.Negocio.Gestion.Metricas.Avance().ListarAvancePorTramite(
                    ALCSA.FWK.Web.Control.ExtraerValor(ddlClientes),
                    ALCSA.FWK.Web.Control.ExtraerValor(ddlProcuradores),
                    ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaDesde),
                    ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaHasta));

            gvDetalle.DataSource = arrAvances;
            gvDetalle.DataBind();

            CargarGrafico(arrAvances);
        }

        private void CargarGrafico(IList<ALCSA.Entidades.Parametros.Salidas.Metricas.AvanceTramite> datos)
        {
            // ltrInformacionGrafico
            StringBuilder strbTexto = new StringBuilder();
            foreach (ALCSA.Entidades.Parametros.Salidas.Metricas.AvanceTramite objEtapa in datos)
                strbTexto.AppendFormat("['{0}', {1}],", objEtapa.Tramite.Trim(), objEtapa.PorcentajeAvance.ToString().Replace(",", "."));

            if (strbTexto.Length > 0) strbTexto = strbTexto.Remove(strbTexto.Length - 1, 1);
            ltrInformacionGrafico.Text = string.Format("<script type=\"text/javascript\">var datosGrafico=[{0}];</script>", strbTexto.ToString());
        }
    }
}