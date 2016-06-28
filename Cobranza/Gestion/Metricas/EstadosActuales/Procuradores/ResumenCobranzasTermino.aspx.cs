using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Gestion.Metricas.EstadosActuales.Procuradores
{
    public partial class ResumenCobranzasTermino : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ALCSA.FWK.BD.Servicio objServicio = new ALCSA.FWK.BD.Servicio() { Conexion = "CONN", Comando = "dbo.SPALCSA_MetricasDetalleCobranzaListar" };
            objServicio.Parametros = new List<ALCSA.FWK.BD.Parametro>();
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { 
                Nombre = "@VC_IdsCobranza", 
                Valor = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "ids").Trim(), 
                Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada
            });

            gvDetalle.DataSource = objServicio.EjecutarDataTable();
            gvDetalle.DataBind();
        }
    }
}