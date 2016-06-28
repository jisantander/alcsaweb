using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.mantenedores.Riesgo
{
    public partial class Mantenedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            int intId = 0;

            if (int.TryParse(Request.QueryString["id"], out intId) && intId > 0)
            {
                ALCSA.Negocio.Juicios.Riesgo objRiesgo = new ALCSA.Negocio.Juicios.Riesgo(intId);
                if (objRiesgo != null && objRiesgo.ID > 0)
                {
                    lblIdRiesgo.Text = objRiesgo.ID.ToString();
                    txtNombreRiesgo.Text = objRiesgo.Nombre.Trim();
                }
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Listar.aspx", true);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNombreRiesgo.Text))
            {
                lblMensaje.Text = "Ingrese el nombre del riesgo.";
                return;
            }

            ALCSA.Negocio.Juicios.Riesgo objRiesgo = new ALCSA.Negocio.Juicios.Riesgo();
            objRiesgo.ID = Convert.ToInt32(lblIdRiesgo.Text);
            objRiesgo.Nombre = txtNombreRiesgo.Text.Trim();
            objRiesgo.Guardar();
            Response.Redirect("Listar.aspx?mensaje=1", true);
        }
    }
}