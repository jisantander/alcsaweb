namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class BuscaReasignacion : Page
    {
        public GridViewRow gridViewRow = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (this.Page.IsPostBack) return;

            this.txtRut.Focus();
            this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla(0);
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
            this.txtNroOperacion.Text = "";
            this.txtRut.Text = "";
            this.txtFechaRemesa.Text = "";
            this.txtRut.Focus();
        }

        private void CargaGrilla(int indice)
        {
            DataTable table = null;
            table = ConsultasEspecificas.ConsultaReconstitucionEnProceso(
                this.txtRut.Text.Trim(),
                this.txtNroOperacion.Text.Trim(),
                this.txtFechaRemesa.Text.Trim()
            );

            this.Grilla.PageIndex = indice;
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();
        }

        protected void cbxEstados_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
        }

        public void Editar(object sender, GridViewCommandEventArgs e)
        {
            this.gridViewRow = ((Control)e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Editar") == 0)
            {
                Label label = (Label)this.gridViewRow.FindControl("lblOT");
                Label label2 = (Label)this.gridViewRow.FindControl("lblNombre7766");
                ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Error", "VentanaModalEdit('" + label.Text.ToString() + "','" + label2.Text.ToString() + "');", true);
            }
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla(e.NewPageIndex);
        }
    }
}

