namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class BuscaGeneral2 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack) return;

            txtRut.Focus();
            txtRut.BackColor = Color.LightYellow;
            txtNroOperacion.BackColor = Color.LightYellow;

            Grilla.PagerSettings.Mode = PagerButtons.Numeric;

            ddlCliente.DataSource = Consulta.ComboCliente();
            ddlCliente.DataBind();
            ddlCliente.Items.Insert(0, new ListItem("Seleccione un Cliente", string.Empty));
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaGrilla(0);
        }

        private void CargaGrilla(int indice)
        {
            DataTable table = ConsultasEspecificas.ConsultaDatosGrillaDomicilios(
                txtRut.Text, 
                txtNroOperacion.Text,
                ddlCliente.SelectedValue
            );

            if (table != null && table.Rows.Count > 0)
            {
                Session["snomdeudor"] = table.Rows[0]["nomdeudor"].ToString();
                Session["srutdeudor"] = table.Rows[0]["rut_deudor"].ToString();
            }

            Grilla.PageIndex = indice;
            Grilla.DataSource = table;
            Grilla.DataBind();
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargaGrilla(e.NewPageIndex);
        }
    }
}

