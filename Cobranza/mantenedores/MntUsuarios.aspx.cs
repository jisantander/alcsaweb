namespace CobranzaALC.Cobranza.mantenedores
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MntUsuarios : Page
    {
       
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Transaccion.ActualizarUsuario(this.CodUsuario.Value, this.txtUsuario.Text, this.txtContrasena.Text, this.txtMail.Text, this.perfil.SelectedValue, this.region.SelectedValue, this.comuna.SelectedValue, this.txtDireccion.Text, this.txtNumero.Text, this.txtTelefono.Text, this.txtCelular.Text, this.Cargo.SelectedValue, this.txtNombres.Text, this.txtAPaterno.Text, this.txtAMaterno.Text, this.dropcliente.SelectedValue.ToString());
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
            Transaccion.EliminarUsuario(this.CodUsuario.Value.Replace(".", ""));
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Cliente eliminado correctamente');</script>");
            this.Cancela();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Consulta.BuscarUsername(this.txtUsuario.Text) == null)
            {
                Transaccion.InsertaUsuario(this.txtUsuario.Text, this.txtContrasena.Text, this.txtMail.Text, this.perfil.SelectedValue, this.txtRut.Text.Replace(".", ""), this.region.SelectedValue, this.comuna.SelectedValue, this.txtDireccion.Text, this.txtNumero.Text, this.txtTelefono.Text, this.txtCelular.Text, this.Cargo.SelectedValue, this.txtNombres.Text, this.txtAPaterno.Text, this.txtAMaterno.Text, this.dropcliente.SelectedValue.ToString());
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");
                this.Cancela();
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Usuario ya existe, cambiar por otro');</script>");
                this.txtUsuario.Focus();
            }
        }

        public void Cancela()
        {
            this.txtRut.Text = "";
            this.txtUsuario.Text = "";
            this.txtContrasena.Text = "";
            this.txtNombres.Text = "";
            this.txtAPaterno.Text = "";
            this.txtAMaterno.Text = "";
            this.txtMail.Text = "";
            this.txtDireccion.Text = "";
            this.txtNumero.Text = "";
            this.txtTelefono.Text = "";
            this.txtCelular.Text = "";
            this.btnActualizar.Visible = false;
            this.btnEliminar.Visible = false;
            this.btnGuardar.Visible = false;
            this.txtUsuario.ReadOnly = false;
            this.btnBuscar.Visible = true;
            this.btnCancelar.Visible = false;
            this.perfil.SelectedIndex = 0;
            this.txtRut.ReadOnly = false;
            this.Cargo.SelectedIndex = 0;
            this.dropcliente.SelectedValue = "76448790-7";
            this.Deshabilitar();
            this.txtRut.BackColor = Color.LightYellow;
            this.txtRut.Focus();
        }

        private void CargarCargos()
        {
            this.Cargo.DataTextField = "descripcion";
            this.Cargo.DataValueField = "id_cargo";
            this.Cargo.DataSource = Consulta.ComboCargo();
            this.Cargo.DataBind();
        }

        private void CargarClientes()
        {
            this.dropcliente.DataTextField = "rsocial";
            this.dropcliente.DataValueField = "rut_cli";
            this.dropcliente.DataSource = Consulta.ComboCliente();
            this.dropcliente.DataBind();
        }

        private void CargarComunas(string idRegion)
        {
            this.comuna.DataTextField = "descripcion";
            this.comuna.DataValueField = "id_comuna";
            this.comuna.DataSource = Consulta.BuscaComunas(idRegion);
            this.comuna.DataBind();
        }

        private void CargarPerfiles()
        {
            this.perfil.DataTextField = "nombre";
            this.perfil.DataValueField = "id_perfil";
            this.perfil.DataSource = Consulta.Perfiles();
            this.perfil.DataBind();
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
            this.txtUsuario.ReadOnly = true;
            this.txtContrasena.ReadOnly = true;
            this.txtNombres.ReadOnly = true;
            this.txtAPaterno.ReadOnly = true;
            this.txtAMaterno.ReadOnly = true;
            this.txtMail.ReadOnly = true;
            this.txtDireccion.ReadOnly = true;
            this.txtNumero.ReadOnly = true;
            this.txtTelefono.ReadOnly = true;
            this.txtCelular.ReadOnly = true;
            this.perfil.Enabled = false;
            this.region.Enabled = false;
            this.comuna.Enabled = false;
            this.Cargo.Enabled = false;
            this.dropcliente.Enabled = false;
            this.txtUsuario.BackColor = Color.White;
            this.txtContrasena.BackColor = Color.White;
            this.txtNombres.BackColor = Color.White;
            this.txtAPaterno.BackColor = Color.White;
            this.txtAMaterno.BackColor = Color.White;
            this.txtMail.BackColor = Color.White;
            this.txtDireccion.BackColor = Color.White;
            this.txtNumero.BackColor = Color.White;
            this.txtTelefono.BackColor = Color.White;
            this.txtCelular.BackColor = Color.White;
            this.perfil.BackColor = Color.White;
            this.region.BackColor = Color.White;
            this.comuna.BackColor = Color.White;
            this.Cargo.BackColor = Color.White;
            this.dropcliente.BackColor = Color.White;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.CargarComunas(this.region.SelectedValue);
        }

        public void habilitar()
        {
            this.txtUsuario.ReadOnly = false;
            this.txtContrasena.ReadOnly = false;
            this.txtNombres.ReadOnly = false;
            this.txtAPaterno.ReadOnly = false;
            this.txtAMaterno.ReadOnly = false;
            this.txtMail.ReadOnly = false;
            this.txtDireccion.ReadOnly = false;
            this.txtNumero.ReadOnly = false;
            this.txtTelefono.ReadOnly = false;
            this.txtCelular.ReadOnly = false;
            this.perfil.Enabled = true;
            this.region.Enabled = true;
            this.comuna.Enabled = true;
            this.Cargo.Enabled = true;
            this.dropcliente.Enabled = true;
            this.txtUsuario.BackColor = Color.LightYellow;
            this.txtContrasena.BackColor = Color.LightYellow;
            this.txtNombres.BackColor = Color.LightYellow;
            this.txtAPaterno.BackColor = Color.LightYellow;
            this.txtAMaterno.BackColor = Color.LightYellow;
            this.txtMail.BackColor = Color.LightYellow;
            this.txtDireccion.BackColor = Color.LightYellow;
            this.txtNumero.BackColor = Color.LightYellow;
            this.txtTelefono.BackColor = Color.LightYellow;
            this.txtCelular.BackColor = Color.LightYellow;
            this.perfil.BackColor = Color.LightYellow;
            this.region.BackColor = Color.LightYellow;
            this.comuna.BackColor = Color.LightYellow;
            this.Cargo.BackColor = Color.LightYellow;
            this.dropcliente.BackColor = Color.LightYellow;
        }

        private void LlenarFormulario()
        {
            DataTable table = null;
            string str = "";
            if (!string.IsNullOrEmpty(this.txtRut.Text))
            {
                str = this.txtRut.Text.ToString();
            }
            table = Consulta.BuscarUsuario(str.Replace(".", ""));
            if (table.Rows.Count > 0)
            {
                if (table.Rows[0]["status"].ToString().Trim() == "N")
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Este usuario esta eliminado anteriormente. Consulte al Administrador');</script>");
                    this.Cancela();
                }
                else
                {
                    this.txtUsuario.Text = table.Rows[0]["username"].ToString();
                    this.txtContrasena.Text = table.Rows[0]["password"].ToString();
                    this.txtNombres.Text = table.Rows[0]["nombres"].ToString();
                    this.txtAPaterno.Text = table.Rows[0]["apaterno"].ToString();
                    this.txtAMaterno.Text = table.Rows[0]["amaterno"].ToString();
                    this.txtMail.Text = table.Rows[0]["mail"].ToString();
                    this.perfil.SelectedValue = table.Rows[0]["id_perfil"].ToString();
                    this.region.SelectedValue = table.Rows[0]["id_region"].ToString();
                    this.CargarComunas(this.region.SelectedValue);
                    this.comuna.SelectedValue = table.Rows[0]["id_comuna"].ToString();
                    this.txtDireccion.Text = table.Rows[0]["direccion"].ToString();
                    this.txtNumero.Text = table.Rows[0]["numero"].ToString();
                    this.txtTelefono.Text = table.Rows[0]["telefono"].ToString();
                    this.txtCelular.Text = table.Rows[0]["celular"].ToString();
                    this.Cargo.SelectedValue = table.Rows[0]["id_cargo"].ToString();
                    this.dropcliente.SelectedValue = table.Rows[0]["rut_cli"].ToString();
                    this.CodUsuario.Value = table.Rows[0]["rut_usu"].ToString().Replace(".", "");
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
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Usuario no existe, debe ingresarlo');</script>");
                this.txtRut.ReadOnly = true;
                this.txtRut.BackColor = Color.White;
                this.habilitar();
                this.btnBuscar.Visible = false;
                this.btnGuardar.Visible = true;
                this.btnCancelar.Visible = true;
                this.txtNombres.Focus();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.CargarPerfiles();
                this.CargarRegiones();
                this.CargarClientes();
                this.CargarCargos();
                this.dropcliente.SelectedValue = "76448790-7";
                this.txtRut.BackColor = Color.LightYellow;
                this.txtRut.Focus();
            }
        }
    }
}

