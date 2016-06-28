using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Procesos.CallCenter
{
    public partial class ListadoEntradasVicidial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            CargarGrilla();
        }

        protected void btnNuevaCampana_Click(object sender, EventArgs e)
        {
            Response.Redirect("EntradaVicidial.aspx", true);
        }

        protected void btnVer_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(string.Format("EntradaVicidial.aspx?id_cam={0}", (sender as ImageButton).CommandArgument), true);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int intIdCampana = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCampanaEliminacion);
            new ALCSA.Negocio.CallCenter.Campana() { ID = intIdCampana }.Eliminar();
            ALCSA.FWK.Web.Control.AsignarValor(hdfIdCampanaEliminacion, "-1");
            CargarGrilla();
        }

        private void CargarGrilla()
        {
            IList<ALCSA.Entidades.CallCenter.Campana> arrCampanas = new ALCSA.Negocio.CallCenter.Campana().Listar();
            for (int intIndice = 0; intIndice < arrCampanas.Count; intIndice++)
                arrCampanas[intIndice].Nombre = arrCampanas[intIndice].EsTemporal ? "Campaña Temporal" : "Campaña Ingresada";

            gvCampanas.DataSource = arrCampanas;
            gvCampanas.DataBind();

            if (gvCampanas.Rows.Count.Equals(0))
                Response.Redirect("EntradaVicidial.aspx", true);
        }
    }
}