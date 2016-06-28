using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Demandas
{
    public partial class Listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            ddlClientes.DataSource = ALCLOCAL.Consulta.ComboCliente();
            ddlClientes.DataBind();
            ddlClientes.Items.Insert(0, new ListItem("Todos", string.Empty));

            CargarRemesas(string.Empty);
        }

        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarRemesas(ddlClientes.SelectedValue);
        }

        protected void gvCobranzas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrilla(e.NewPageIndex);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarGrilla(0);
        }

        private void CargarGrilla(int indice)
        {
            gvCobranzas.PageIndex = indice;
            gvCobranzas.DataSource = new ALCSA.Negocio.Cobranzas.Cobranza().Listar(new ALCSA.Entidades.Parametros.Entradas.Cobranzas.ListadoDemanda()
            {
                RutDeudor = ALCSA.FWK.Web.Control.ExtraerValor(txtRutDeudor),
                RutCliente = ALCSA.FWK.Web.Control.ExtraerValor(ddlClientes),
                NroOperacion = ALCSA.FWK.Web.Control.ExtraerValor(txtNumeroOperacion),
                IdRemesa = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlRemesas)
            });
            gvCobranzas.DataBind();
        }

        private void CargarRemesas(string rutCliente)
        {
            ddlRemesas.DataSource = new ALCSA.Negocio.Cobranzas.Remesa().Listar(rutCliente);
            ddlRemesas.DataBind();
            ddlRemesas.Items.Insert(0, new ListItem("Todas", "0"));
        }
    }
}