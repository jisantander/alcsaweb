using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Documentos
{
    public partial class Listado : System.Web.UI.Page
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

            // CargarGrilla(0);
        }

        protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlFiltroExhorto.Visible = !ddlTipo.SelectedValue.Equals("J");
            pnlFiltroConJuicio.Visible = !ddlTipo.SelectedValue.Equals("P");
        }

        protected void gvCobranzas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrilla(e.NewPageIndex);
        }

        private void CargarGrilla(int indice)
        {
            gvCobranzas.Columns[6].Visible = !ddlTipo.SelectedValue.Equals("J");
            gvCobranzas.PageIndex = indice;
            gvCobranzas.DataSource = new ALCSA.Negocio.Documentos.Listado().Listar(
                ddlTipo.SelectedValue,
                ddlClientes.SelectedValue,
                txtRutDeudor.Text.Trim(),
                Convert.ToInt32(ddlTribunales.SelectedValue),
                txtRolJuicio.Text,
                pnlFiltroExhorto.Visible ? txtRolExhorto.Text : string.Empty
            );
            gvCobranzas.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarGrilla(0);
        }
    }

}