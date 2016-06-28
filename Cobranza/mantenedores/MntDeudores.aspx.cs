namespace CobranzaALC.Cobranza.mantenedores
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MntDeudores : Page
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
            Transaccion.ActualizarDeudor(this.txtRut.Text.Replace(".", ""), this.txtRazonSocial.Text, this.txtFnacimiento.Text, this.profesion.SelectedValue, this.txtTelefono1.Text, this.txtCelular1.Text, this.txtTelefono2.Text, this.txtMail.Text, this.Banco.SelectedValue, this.txtCtaCte.Text, this.Session["usuario"].ToString(), this.ecivil.SelectedValue, this.txtNombres.Text, this.txtAPaterno.Text, this.txtAMaterno.Text, tipopersona);
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
            Transaccion.EliminarDeudor(this.txtRut.Text.Replace(".", ""));
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Deudor eliminado correctamente');</script>");
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
            Transaccion.InsertaDeudor(this.txtRut.Text.Replace(".", ""), this.txtRazonSocial.Text, this.txtFnacimiento.Text, this.profesion.SelectedValue, this.txtTelefono1.Text, this.txtCelular1.Text, this.txtTelefono2.Text, this.txtMail.Text, this.Banco.SelectedValue, this.txtCtaCte.Text, this.Session["usuario"].ToString(), this.ecivil.SelectedValue, this.txtNombres.Text, this.txtAPaterno.Text, this.txtAMaterno.Text, tipopersona);
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");
            this.Cancela();
        }

        public void Cancela()
        {
            this.txtRut.Text = "";
            this.txtRazonSocial.Text = "";
            this.txtFnacimiento.Text = "";
            this.txtMail.Text = "";
            this.txtTelefono1.Text = "";
            this.txtCelular1.Text = "";
            this.txtTelefono2.Text = "";
            this.txtCtaCte.Text = "";
            this.txtNombres.Text = "";
            this.txtAPaterno.Text = "";
            this.txtAMaterno.Text = "";
            this.RadioButton1.Checked = true;
            this.RadioButton2.Checked = false;
            this.PanelPnatural.Visible = false;
            this.PanelRazon.Visible = true;
            this.Banco.SelectedIndex = 0;
            this.profesion.SelectedIndex = 0;
            this.ecivil.SelectedIndex = 0;
            this.btnActualizar.Visible = false;
            this.btnEliminar.Visible = false;
            this.btnGuardar.Visible = false;
            this.btnBuscar.Visible = true;
            this.btnCancelar.Visible = false;
            this.txtRut.ReadOnly = false;
            this.Deshabilitar();
            this.txtRut.BackColor = Color.LightYellow;
            this.txtRut.Focus();
        }

        public void Deshabilitar()
        {
            this.txtRazonSocial.ReadOnly = true;
            this.txtFnacimiento.ReadOnly = true;
            this.txtMail.ReadOnly = true;
            this.txtTelefono1.ReadOnly = true;
            this.txtCelular1.ReadOnly = true;
            this.txtTelefono2.ReadOnly = true;
            this.txtCtaCte.ReadOnly = true;
            this.txtNombres.ReadOnly = true;
            this.txtAPaterno.ReadOnly = true;
            this.txtAMaterno.ReadOnly = true;
            this.RadioButton1.Enabled = false;
            this.RadioButton2.Enabled = false;
            this.Banco.Enabled = false;
            this.profesion.Enabled = false;
            this.ecivil.Enabled = false;
            this.txtRazonSocial.BackColor = Color.White;
            this.txtFnacimiento.BackColor = Color.White;
            this.txtMail.BackColor = Color.White;
            this.txtTelefono1.BackColor = Color.White;
            this.txtCelular1.BackColor = Color.White;
            this.txtTelefono2.BackColor = Color.White;
            this.txtCtaCte.BackColor = Color.White;
            this.txtNombres.BackColor = Color.White;
            this.txtAPaterno.BackColor = Color.White;
            this.txtAMaterno.BackColor = Color.White;
            this.Banco.BackColor = Color.White;
            this.profesion.BackColor = Color.White;
            this.ecivil.BackColor = Color.White;
        }

        public void habilitar()
        {
            this.txtRazonSocial.ReadOnly = false;
            this.txtFnacimiento.ReadOnly = false;
            this.txtMail.ReadOnly = false;
            this.txtTelefono1.ReadOnly = false;
            this.txtCelular1.ReadOnly = false;
            this.txtTelefono2.ReadOnly = false;
            this.txtCtaCte.ReadOnly = false;
            this.txtNombres.ReadOnly = false;
            this.txtAPaterno.ReadOnly = false;
            this.txtAMaterno.ReadOnly = false;
            this.Banco.Enabled = true;
            this.profesion.Enabled = true;
            this.ecivil.Enabled = true;
            this.RadioButton1.Enabled = true;
            this.RadioButton2.Enabled = true;
            this.txtRazonSocial.BackColor = Color.LightYellow;
            this.txtFnacimiento.BackColor = Color.LightYellow;
            this.txtMail.BackColor = Color.LightYellow;
            this.txtTelefono1.BackColor = Color.LightYellow;
            this.txtCelular1.BackColor = Color.LightYellow;
            this.txtTelefono2.BackColor = Color.LightYellow;
            this.txtCtaCte.BackColor = Color.LightYellow;
            this.txtNombres.BackColor = Color.LightYellow;
            this.txtAPaterno.BackColor = Color.LightYellow;
            this.txtAMaterno.BackColor = Color.LightYellow;
            this.Banco.BackColor = Color.LightYellow;
            this.profesion.BackColor = Color.LightYellow;
            this.ecivil.BackColor = Color.LightYellow;
        }

        private void LlenarFormulario()
        {
            string str = "";
            if (!string.IsNullOrEmpty(this.txtRut.Text))
            {
                str = this.txtRut.Text.ToString();
            }
            DataTable table = Consulta.BuscarDeudor(str.Replace(".", ""));
            if (table.Rows.Count > 0)
            {
                if (table.Rows[0]["status"].ToString().Trim() == "N")
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Este deudor esta eliminado anteriormente. Consulte al Administrador');</script>");
                    this.Cancela();
                }
                else
                {
                    string str2 = "";
                    if (table.Rows[0]["fnacimiento"].ToString() == "01/01/1900")
                    {
                        str2 = "";
                    }
                    else
                    {
                        str2 = table.Rows[0]["fnacimiento"].ToString();
                    }
                    this.txtRazonSocial.Text = table.Rows[0]["rsocial"].ToString();
                    this.txtFnacimiento.Text = str2;
                    this.profesion.SelectedValue = table.Rows[0]["id_profesion"].ToString();
                    this.txtMail.Text = table.Rows[0]["email"].ToString();
                    this.txtTelefono1.Text = table.Rows[0]["telefono1"].ToString();
                    this.txtCelular1.Text = table.Rows[0]["celular1"].ToString();
                    this.txtTelefono2.Text = table.Rows[0]["telefono2"].ToString();
                    this.txtCtaCte.Text = table.Rows[0]["ctacte"].ToString();
                    this.Banco.SelectedValue = table.Rows[0]["id_banco"].ToString();
                    this.ecivil.SelectedValue = table.Rows[0]["ecivil"].ToString();
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
                    this.CodDeudor.Value = table.Rows[0]["rut_deudor"].ToString();
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
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Deudor no existe, debe ingresarlo');</script>");
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
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!this.Page.IsPostBack)
            {
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
    }
}

