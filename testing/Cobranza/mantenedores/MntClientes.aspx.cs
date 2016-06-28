namespace CobranzaALC.Cobranza.mantenedores
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MntClientes : Page
    {
       

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string tipopersona = "";
            if (this.RadioButton1.Checked)
            {
                tipopersona = "J";
            }
            else
            {
                tipopersona = "N";
            }
            Transaccion.ActualizarCliente(this.CodCliente.Value, this.txtRazonSocial.Text, this.txtDireccion.Text, this.txtTelefono.Text, this.txtFax.Text, this.txtMail.Text, this.txtRutRepLegal.Text, this.txtRepLegal.Text, this.txtNumero.Text, this.region.SelectedValue, this.comuna.SelectedValue, this.txtNombres.Text, this.txtAPaterno.Text, this.txtAMaterno.Text, tipopersona);
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
            Transaccion.EliminarCliente(this.CodCliente.Value);
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Cliente eliminado correctamente');</script>");
            this.Cancela();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string tipopersona = "";
            if (this.RadioButton1.Checked)
            {
                tipopersona = "J";
            }
            else
            {
                tipopersona = "N";
            }
            Transaccion.InsertaCliente(this.txtRut.Text.Replace(".", ""), this.txtRazonSocial.Text, this.txtDireccion.Text, this.txtTelefono.Text, this.txtFax.Text, this.txtMail.Text, this.txtRutRepLegal.Text, this.txtRepLegal.Text, this.comuna.SelectedValue, this.region.SelectedValue, this.txtNumero.Text, this.txtNombres.Text, this.txtAPaterno.Text, this.txtAMaterno.Text, tipopersona);
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");
            this.Cancela();
        }

        public void Cancela()
        {
            this.txtRut.Text = "";
            this.txtRazonSocial.Text = "";
            this.txtDireccion.Text = "";
            this.txtTelefono.Text = "";
            this.txtFax.Text = "";
            this.txtMail.Text = "";
            this.txtRutRepLegal.Text = "";
            this.txtRepLegal.Text = "";
            this.txtNumero.Text = "";
            this.txtNombres.Text = "";
            this.txtAPaterno.Text = "";
            this.txtAMaterno.Text = "";
            this.RadioButton1.Checked = true;
            this.RadioButton2.Checked = false;
            this.PanelPnatural.Visible = false;
            this.PanelRazon.Visible = true;
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

        private void CargarComunas(string idRegion)
        {
            this.comuna.DataTextField = "descripcion";
            this.comuna.DataValueField = "id_comuna";
            this.comuna.DataSource = Consulta.BuscaComunas(idRegion);
            this.comuna.DataBind();
        }

        private void CargarRegiones()
        {
            this.region.DataTextField = "descripcion";
            this.region.DataValueField = "id_regiones";
            this.region.DataSource = Consulta.BuscaRegiones();
            this.region.DataBind();
        }

        public void Deshabilitar()
        {
            this.txtRazonSocial.ReadOnly = true;
            this.txtDireccion.ReadOnly = true;
            this.txtTelefono.ReadOnly = true;
            this.txtFax.ReadOnly = true;
            this.txtMail.ReadOnly = true;
            this.txtRutRepLegal.ReadOnly = true;
            this.txtRepLegal.ReadOnly = true;
            this.txtNumero.ReadOnly = true;
            this.txtNombres.ReadOnly = true;
            this.txtAPaterno.ReadOnly = true;
            this.txtAMaterno.ReadOnly = true;
            this.RadioButton1.Enabled = false;
            this.RadioButton2.Enabled = false;
            this.region.Enabled = false;
            this.comuna.Enabled = false;
            this.txtRazonSocial.BackColor = Color.White;
            this.txtDireccion.BackColor = Color.White;
            this.txtTelefono.BackColor = Color.White;
            this.txtFax.BackColor = Color.White;
            this.txtMail.BackColor = Color.White;
            this.txtRutRepLegal.BackColor = Color.White;
            this.txtRepLegal.BackColor = Color.White;
            this.txtNumero.BackColor = Color.White;
            this.txtNombres.BackColor = Color.White;
            this.txtAPaterno.BackColor = Color.White;
            this.txtAMaterno.BackColor = Color.White;
            this.region.BackColor = Color.White;
            this.comuna.BackColor = Color.White;
        }

        public void habilitar()
        {
            this.txtRazonSocial.ReadOnly = false;
            this.txtDireccion.ReadOnly = false;
            this.txtTelefono.ReadOnly = false;
            this.txtFax.ReadOnly = false;
            this.txtMail.ReadOnly = false;
            this.txtRutRepLegal.ReadOnly = false;
            this.txtRepLegal.ReadOnly = false;
            this.txtNumero.ReadOnly = false;
            this.txtNombres.ReadOnly = false;
            this.txtAPaterno.ReadOnly = false;
            this.txtAMaterno.ReadOnly = false;
            this.region.Enabled = true;
            this.comuna.Enabled = true;
            this.RadioButton1.Enabled = true;
            this.RadioButton2.Enabled = true;
            this.txtRazonSocial.BackColor = Color.LightYellow;
            this.txtDireccion.BackColor = Color.LightYellow;
            this.txtTelefono.BackColor = Color.LightYellow;
            this.txtFax.BackColor = Color.LightYellow;
            this.txtMail.BackColor = Color.LightYellow;
            this.txtRutRepLegal.BackColor = Color.LightYellow;
            this.txtRepLegal.BackColor = Color.LightYellow;
            this.txtNumero.BackColor = Color.LightYellow;
            this.txtNombres.BackColor = Color.LightYellow;
            this.txtAPaterno.BackColor = Color.LightYellow;
            this.txtAMaterno.BackColor = Color.LightYellow;
            this.region.BackColor = Color.LightYellow;
            this.comuna.BackColor = Color.LightYellow;
        }

        private void LlenarFormulario()
        {
            DataTable table = null;
            string str = "";
            if (!string.IsNullOrEmpty(this.txtRut.Text))
            {
                str = this.txtRut.Text.ToString();
            }
            table = Consulta.BuscarCliente(str.Replace(".", ""));
            if (table.Rows.Count > 0)
            {
                if (table.Rows[0]["status"].ToString().Trim() == "N")
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Este cliente esta eliminado anteriormente. Consulte al Administrador');</script>");
                    this.Cancela();
                }
                else
                {
                    this.txtRazonSocial.Text = table.Rows[0]["rsocial"].ToString().Trim();
                    this.txtDireccion.Text = table.Rows[0]["domicilio"].ToString().Trim();
                    this.txtTelefono.Text = table.Rows[0]["telefono"].ToString();
                    this.txtFax.Text = table.Rows[0]["fax"].ToString();
                    this.txtMail.Text = table.Rows[0]["email"].ToString();
                    this.txtRutRepLegal.Text = table.Rows[0]["representante_rut"].ToString().Trim();
                    this.txtRepLegal.Text = table.Rows[0]["representante"].ToString().Trim();
                    this.txtNumero.Text = table.Rows[0]["numero"].ToString();
                    this.txtNombres.Text = table.Rows[0]["nombres"].ToString().Trim();
                    this.txtAPaterno.Text = table.Rows[0]["apaterno"].ToString().Trim();
                    this.txtAMaterno.Text = table.Rows[0]["amaterno"].ToString().Trim();
                    if (table.Rows[0]["tipopersona"].ToString() == "J")
                    {
                        this.RadioButton1.Checked = true;
                        this.RadioButton2.Checked = false;
                        this.PanelRazon.Visible = true;
                        this.PanelPnatural.Visible = false;
                    }
                    else
                    {
                        this.RadioButton1.Checked = false;
                        this.RadioButton2.Checked = true;
                        this.PanelRazon.Visible = false;
                        this.PanelPnatural.Visible = true;
                    }
                    this.region.SelectedValue = table.Rows[0]["id_region"].ToString();
                    this.CargarComunas(this.region.SelectedValue);
                    try
                    {
                        this.comuna.SelectedValue = table.Rows[0]["id_comuna"].ToString();
                    }
                    catch
                    {
                    }
                    this.CodCliente.Value = table.Rows[0]["rut_cli"].ToString();
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
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Cliente no existe, debe ingresarlo');</script>");
                this.txtRut.ReadOnly = true;
                this.txtRut.BackColor = Color.White;
                this.habilitar();
                this.btnBuscar.Visible = false;
                this.btnGuardar.Visible = true;
                this.btnCancelar.Visible = true;
                this.txtRazonSocial.Focus();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.CargarRegiones();
                this.txtRut.BackColor = Color.LightYellow;
                this.txtRut.Focus();
            }
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (this.RadioButton1.Checked)
            {
                this.PanelPnatural.Visible = false;
                this.PanelRazon.Visible = true;
            }
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (this.RadioButton2.Checked)
            {
                this.PanelPnatural.Visible = true;
                this.PanelRazon.Visible = false;
            }
        }

        protected void region_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.CargarComunas(this.region.SelectedValue);
        }
    }
}

