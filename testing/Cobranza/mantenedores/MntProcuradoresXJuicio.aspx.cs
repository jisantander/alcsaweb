namespace CobranzaALC.Cobranza.mantenedores
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MntProcuradoresXJuicio : Page
    {

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.txtNroOperacion.Text))
            {
                DataTable table = null;
                table = Consulta.ProcuradorXJuicio(this.txtNroOperacion.Text);
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.txtRol.Text = table.Rows[0]["rol"].ToString();
                    this.CargarProcuradores();
                    this.cbxProcurador.SelectedValue = table.Rows[0]["rut_Procurador"].ToString();
                    this.hddIdJuicios.Value = table.Rows[0]["id_juicios"].ToString();
                    this.btnBuscar.Visible = false;
                    this.btnGuardar.Visible = true;
                    this.btnCancelar.Visible = true;
                    this.txtNroOperacion.ReadOnly = true;
                }
                else
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No existe informaci\x00f3n solicitada');</script>");
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.txtNroOperacion.Text = "";
            this.txtRol.Text = "";
            this.cbxProcurador.Items.Clear();
            this.btnBuscar.Visible = true;
            this.btnGuardar.Visible = false;
            this.btnCancelar.Visible = false;
            this.txtNroOperacion.ReadOnly = false;
            this.txtNroOperacion.Focus();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Transaccion.UpdateProcuradorXJuicio(this.hddIdJuicios.Value.ToString(), this.cbxProcurador.SelectedValue.ToString());
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Proceso realizado correctamente');</script>");
            base.Response.Redirect("MntProcuradoresXJuicio.aspx", false);
        }

        private void CargarProcuradores()
        {
            this.cbxProcurador.DataTextField = "nombres";
            this.cbxProcurador.DataValueField = "rut";
            this.cbxProcurador.DataSource = Consulta.ComboProcurador();
            this.cbxProcurador.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!base.IsPostBack)
            {
                this.txtNroOperacion.Focus();
            }
        }
    }
}

