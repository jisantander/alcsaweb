using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.mantenedores.Remesas
{
    public partial class Listar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            string strMensaje = Request.QueryString["mensaje"];
            lblMensaje.Text = !string.IsNullOrEmpty(strMensaje) ? "REMESA Guardada correctamente" : string.Empty;

            CargarClientes();
            CargarGrilla(0);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarGrilla(0);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mantenedor.aspx?id=0", true);
        }

        protected void btnModificar_Click(object sender, ImageClickEventArgs e)
        {
            string strId = ((ImageButton)sender).CommandArgument;
            Response.Redirect(string.Format("Mantenedor.aspx?id={0}", strId), true);
        }

        protected void btnEliminar_Click(object sender, ImageClickEventArgs e)
        {
            string strId = ((ImageButton)sender).CommandArgument;
            ALCSA.Negocio.Cobranzas.Remesa objRemesa = new ALCSA.Negocio.Cobranzas.Remesa();
            objRemesa.ID = Convert.ToInt32(strId);
            objRemesa.Eliminar();
            CargarGrilla(gvRemesas.PageIndex);
            lblMensaje.Text = "REMESA Eliminada correctamente.";
        }

        protected void gvRemesas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrilla(e.NewPageIndex);
        }

        private void CargarGrilla(int indice)
        {
            gvRemesas.PageIndex = indice;
            gvRemesas.DataSource = new ALCSA.Negocio.Cobranzas.Remesa().Listar(ddlClientes.SelectedValue);
            gvRemesas.DataBind();
        }

        private void CargarClientes()
        {
            ddlClientes.DataSource = ALCLOCAL.Consulta.ComboCliente();
            ddlClientes.DataBind();
            ddlClientes.Items.Insert(0, new ListItem("Todos", "*"));
        }
    }
}