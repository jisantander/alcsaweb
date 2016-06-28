namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class CargaManual : Page
    {
       

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (this.cbxRemesas.SelectedValue.ToString() == "Seleccione")
            {
                this.txtTotalRemesa.Text = "0";
            }
            else
            {
                decimal remesa = Convert.ToDecimal(this.txtTotalRemesa.Text) + 1;
                Transaccion.InsertaRemesaManual(this.txtSubProducto.Text.ToString(), this.txtProducto.Text.ToString(), this.txtNroOperacion.Text.ToString(), this.txtRut.Text.ToString(), this.txtDv.Text.ToString(), this.txtDeudor.Text.ToString(), this.txtDireccion.Text.ToString(), this.txtComuna.Text.ToString(), this.cbxRemesas.SelectedValue.ToString(), this.cbxRemesas.SelectedValue.ToString(), this.hddFechaEntrega.Value.ToString(), remesa, this.Session["Usuario"].ToString(), Convert.ToDateTime(this.txtfechacontabilizacion.Text));
                Transaccion.ActualizaRemesaManual(this.cbxRemesas.SelectedValue.ToString(), remesa);
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");
                this.Limpiar();
            }
        }

        protected void cbxRemesas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.cbxRemesas.SelectedValue.ToString() == "Seleccione")
            {
                this.txtTotalRemesa.Text = "0";
            }
            else
            {
                DataTable table = null;
                table = Consulta.ComboRemesa(this.cbxRemesas.SelectedValue.ToString());
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.txtTotalRemesa.Text = table.Rows[0]["Total"].ToString();
                    this.hddFechaEntrega.Value = table.Rows[0]["FechaEntrega"].ToString();
                }
                this.txtSubProducto.Focus();
            }
        }

        private void ComboRemesas()
        {
            this.cbxRemesas.DataTextField = "fecharemesa";
            this.cbxRemesas.DataValueField = "fecharemesa";
            this.cbxRemesas.DataSource = Consulta.ComboFechaRemesa();
            this.cbxRemesas.DataBind();
            this.cbxRemesas.Items.Insert(0, "Seleccione");
        }

        private void Limpiar()
        {
            this.cbxRemesas.SelectedIndex = 0;
            this.txtSubProducto.Text = "";
            this.txtProducto.Text = "";
            this.txtNroOperacion.Text = "";
            this.txtRut.Text = "";
            this.txtDv.Text = "";
            this.txtDeudor.Text = "";
            this.txtDireccion.Text = "";
            this.txtComuna.Text = "";
            this.txtTotalRemesa.Text = "0";
            this.hddFechaEntrega.Value = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!this.Page.IsPostBack)
            {
                this.txtTotalRemesa.Text = "0";
                this.ComboRemesas();
            }
        }
    }
}

