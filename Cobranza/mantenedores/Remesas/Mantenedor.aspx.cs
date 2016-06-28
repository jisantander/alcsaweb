using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.mantenedores.Remesas
{
    public partial class Mantenedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            CargarClientes();
            int intId = 0;

            if (int.TryParse(Request.QueryString["id"], out intId) && intId > 0)
            {
                ALCSA.Negocio.Cobranzas.Remesa objRemesa = new ALCSA.Negocio.Cobranzas.Remesa(intId);
                if (objRemesa != null && objRemesa.ID > 0)
                {
                    lblIdRemesa.Text = objRemesa.ID.ToString();
                    txtNombreRemesa.Text = objRemesa.Nombre.Trim();

                    ListItem objItem = null;
                    if ((objItem = ddlClientes.Items.FindByValue(objRemesa.RutCliente)) != null)
                    {
                        ddlClientes.SelectedIndex = -1;
                        objItem.Selected = true;
                    }
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlClientes.SelectedValue))
            {
                lblMensaje.Text = "Seleccione un cliente.";
                return;
            }
            if (string.IsNullOrEmpty(txtNombreRemesa.Text))
            {
                lblMensaje.Text = "Ingrese el nombre de la REMESA.";
                return;
            }

            ALCSA.Negocio.Cobranzas.Remesa objRemesa = new ALCSA.Negocio.Cobranzas.Remesa();
            objRemesa.ID = Convert.ToInt32(lblIdRemesa.Text);
            objRemesa.RutCliente = ddlClientes.SelectedValue;
            objRemesa.Nombre = txtNombreRemesa.Text.Trim();
            objRemesa.Guardar();
            Response.Redirect("Listar.aspx?mensaje=1", true);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Listar.aspx", true);
        }

        private void CargarClientes()
        {
            ddlClientes.DataSource = ALCLOCAL.Consulta.ComboCliente();
            ddlClientes.DataBind();
            ddlClientes.Items.Insert(0, new ListItem("Seleccione un Cliente", string.Empty));
        }
    }
}