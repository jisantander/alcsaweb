namespace CobranzaALC.Cobranza.mantenedores
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MntTelefonos : Page
    {

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Transaccion.ActualizarTelefono(this.CodCliente.Value, this.vigencia.SelectedValue, this.txttelefono.Text, this.txtcelular.Text, this.txtFax.Text, this.TipoTelefono.SelectedValue);
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos actualizados correctamente');</script>");
            this.Cancela();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.LlenarFormulario();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Cancela();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Transaccion.EliminarTelefono(this.CodCliente.Value);
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Tel\x00e9fono eliminado correctamente');</script>");
            this.Cancela();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Transaccion.InsertaTelefono(this.txtRut.Text.Replace(".", ""), this.vigencia.SelectedValue, this.txttelefono.Text, this.txtcelular.Text, this.txtFax.Text, this.TipoTelefono.SelectedValue);
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");
            this.Cancela();
        }

        public void Cancela()
        {
            this.txtRut.Text = "";
            this.txttelefono.Text = "";
            this.txtcelular.Text = "";
            this.txtFax.Text = "";
            this.vigencia.SelectedIndex = 0;
            this.TipoTelefono.SelectedIndex = 0;
            this.btnActualizar.Visible = false;
            this.btnEliminar.Visible = false;
            this.btnGuardar.Visible = false;
            this.txtRut.ReadOnly = false;
            this.btnBuscar.Visible = true;
            this.btnCancelar.Visible = false;
            this.Deshabilitar();
            this.txtRut.BackColor = Color.LightYellow;
            this.txtRut.Focus();
        }

        private void CargarTipoTelefono()
        {
            this.TipoTelefono.DataTextField = "descripcion";
            this.TipoTelefono.DataValueField = "id_tipo_telefono";
            this.TipoTelefono.DataSource = Consulta.ComboTipoTelefono();
            this.TipoTelefono.DataBind();
        }

        public void Deshabilitar()
        {
            this.txttelefono.ReadOnly = true;
            this.txtcelular.ReadOnly = true;
            this.txtFax.ReadOnly = true;
            this.vigencia.Enabled = false;
            this.TipoTelefono.Enabled = false;
            this.txttelefono.BackColor = Color.White;
            this.txtcelular.BackColor = Color.White;
            this.txtFax.BackColor = Color.White;
            this.vigencia.BackColor = Color.White;
            this.TipoTelefono.BackColor = Color.White;
        }

        public void habilitar()
        {
            this.txttelefono.ReadOnly = false;
            this.txtcelular.ReadOnly = false;
            this.txtFax.ReadOnly = false;
            this.vigencia.Enabled = true;
            this.TipoTelefono.Enabled = true;
            this.txttelefono.BackColor = Color.LightYellow;
            this.txtcelular.BackColor = Color.LightYellow;
            this.txtFax.BackColor = Color.LightYellow;
            this.vigencia.BackColor = Color.LightYellow;
            this.TipoTelefono.BackColor = Color.LightYellow;
        }

        private void LlenarFormulario()
        {
            DataTable table = null;
            string str = "";
            if (!string.IsNullOrEmpty(this.txtRut.Text))
            {
                str = this.txtRut.Text.ToString();
            }
            table = Consulta.BuscarTelefono(str.Replace(".", ""));
            if (table.Rows.Count > 0)
            {
                if (table.Rows[0]["status"].ToString().Trim() == "N")
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Este tel\x00e9fono esta eliminado anteriormente. Consulte al Administrador');</script>");
                    this.Cancela();
                }
                else
                {
                    this.txttelefono.Text = table.Rows[0]["telefono1"].ToString();
                    this.txtcelular.Text = table.Rows[0]["celular1"].ToString();
                    this.txtFax.Text = table.Rows[0]["fax"].ToString();
                    this.vigencia.SelectedValue = table.Rows[0]["vigencia"].ToString();
                    this.TipoTelefono.SelectedValue = table.Rows[0]["id_tipo_telefono"].ToString();
                    this.CodCliente.Value = table.Rows[0]["rut_dueno"].ToString();
                    this.txtRut.ReadOnly = true;
                    this.txtRut.BackColor = Color.White;
                    this.habilitar();
                    this.btnActualizar.Visible = true;
                    this.btnEliminar.Visible = true;
                    this.btnCancelar.Visible = true;
                    this.btnBuscar.Visible = false;
                }
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Rut no tiene tel\x00e9fonos , debe ingresarlo');</script>");
                this.txtRut.ReadOnly = true;
                this.txtRut.BackColor = Color.White;
                this.habilitar();
                this.btnBuscar.Visible = false;
                this.btnGuardar.Visible = true;
                this.btnCancelar.Visible = true;
                this.txttelefono.Focus();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.CargarTipoTelefono();
                this.txtRut.BackColor = Color.LightYellow;
                this.txtRut.Focus();
            }
        }
    }
}

