namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using CobranzaALC.Dto;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class Cobranza : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }

            this.Page.RegisterHiddenField("USUARIO", this.Session["Usuario"].ToString());

            if (this.Page.IsPostBack) return;

            hdfMostrarMensaje.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "mensaje").ToString();
            hdfIdDocumento.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_doc").ToString();

            this.ComboClientes();
            this.ComboProcedimiento();
            this.txtRut.BackColor = Color.LightYellow;
            this.txtRut.Focus();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable table = null;
            table = Consulta.BuscarDeudor(this.txtRut.Text.Replace(".", ""));
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txtRut.ReadOnly = true;
                this.txtRut.BackColor = Color.White;
                this.txtNombre.Text = table.Rows[0]["rsocial"].ToString();
                this.habilitar();
                this.btnBuscar.Visible = false;
                this.btnGuardar.Visible = true;
                this.txtNoperacion.Focus();
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Deudor no registrado');</script>");
                this.txtRut.Focus();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Deshabilitar();
            this.Cancela();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // ----------------------------------------------------------------------------------
            ALCSA.Negocio.Cobranzas.Cobranza objCobranza = new ALCSA.Negocio.Cobranzas.Cobranza(this.txtNoperacion.Text, this.cliente.SelectedValue);
            if (objCobranza.ID > 0)
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('N\x00b0 de operaci\x00f3n ya se encuentra registrado para ese cliente');</script>");
                this.txtNoperacion.Focus();
                return;
            }

            objCobranza.Nrooperacion = this.txtNoperacion.Text.Trim();
            objCobranza.RutCli = ALCSA.FWK.IdentificacionTributaria.FormatearRut(this.cliente.SelectedValue).Replace(".", string.Empty);
            objCobranza.RutDeudor = ALCSA.FWK.IdentificacionTributaria.FormatearRut(this.txtRut.Text).Replace(".", string.Empty);
            objCobranza.Codigo = this.txtNumero.Text.Trim();
            objCobranza.IdRemesa = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlRemesas);
            objCobranza.IdProcedimiento = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(tipoprocedimiento);
            objCobranza.IdMateria = Convert.ToInt32(this.materia.SelectedValue.Split(new char[] { '|' })[0]);
            objCobranza.IdProducto = Convert.ToInt32(this.producto.SelectedValue);
            objCobranza.Tipocobranza = this.tipocobranza.SelectedValue;
            objCobranza.Usuario = this.Session["Usuario"] != null ? this.Session["Usuario"].ToString() : string.Empty;

            objCobranza.Guardar();
            // ----------------------------------------------------------------------------------
            string strTipo = objCobranza.BuscarTipoActividad();
            string strRuta = string.Empty;

            if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_JUICIO)
                strRuta = "DocuJuicio.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_PAGARE)
                strRuta = "DocuPagare.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_MUTUO)
                strRuta = "Mutuo.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_ESTANDAR_UNO)
                strRuta = "DocEstandard_1.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_ESTANDAR_DOS)
                strRuta = "DocEstandard_2.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_ESTANDAR_TRES)
                strRuta = "DocEstandard_3.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_ESTANDAR_CUATRO)
                strRuta = "DocEstandard_4.aspx";
            else if (strTipo == ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_CUOTA_COLEGIO)
                strRuta = "cuotacolegio.aspx";
            // ----------------------------------------------------------------------------------
            if (!string.IsNullOrEmpty(strRuta))
                Response.Redirect(string.Format("{0}?id_cob={1}&es_nueva=1", strRuta, objCobranza.ID), true);
            else
            {
                // ------------------------------------------------------------------------------
                // PASAR A MODO LECTURA
                this.txtRut.ReadOnly = false;
                this.txtNoperacion.Text = string.Empty;
                this.txtRut.Text = string.Empty;
                this.txtNombre.Text = string.Empty;
                this.txtNumero.Text = string.Empty;
                this.tipocobranza.SelectedIndex = 0;
                this.tipoprocedimiento.Items.Clear();
                this.materia.Items.Clear();
                this.producto.Items.Clear();
                this.ComboClientes();
                this.ComboProcedimiento();
                this.Deshabilitar();
                this.btnBuscar.Visible = true;
                this.btnGuardar.Visible = false;
                // ------------------------------------------------------------------------------
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('La cobranza se guardo correctamente.');</script>");
                // ------------------------------------------------------------------------------
            }
            // ----------------------------------------------------------------------------------
        }

        public void Cancela()
        {
            this.txtRut.Text = "";
            this.txtNoperacion.Text = "";
            this.txtNumero.Text = "";
            this.txtRut.ReadOnly = false;
            this.cliente.SelectedIndex = 0;
            this.tipoprocedimiento.SelectedIndex = 0;
            this.materia.Items.Clear();
            this.producto.Items.Clear();
            this.btnGuardar.Visible = false;
            this.btnBuscar.Visible = true;
            this.txtRut.BackColor = Color.LightYellow;
            this.txtRut.Focus();
        }

        private void ComboClientes()
        {
            this.cliente.DataTextField = "rsocial";
            this.cliente.DataValueField = "rut_cli";
            this.cliente.DataSource = Consulta.ComboCliente();
            this.cliente.DataBind();
            this.cliente.Items.Insert(0, new ListItem("Seleccione un Cliente", "Seleccione"));
            CargarRemesas();
        }

        private void ComboMateria(string id_procedimiento)
        {
            DataTable table = null;
            table = Consulta.ComboMateria(id_procedimiento);
            if ((table != null) && (table.Rows.Count > 0))
            {
                this.materia.DataTextField = "descripcion";
                this.materia.DataValueField = "id_materia";
                this.materia.DataSource = table;
                this.materia.DataBind();
                this.materia.Items.Insert(0, "Seleccione");
            }
        }

        private void ComboMateriaPRE(string id_procedimiento)
        {
            DataTable table = null;
            table = Consulta.ComboMateriaPRE(id_procedimiento);
            if ((table != null) && (table.Rows.Count > 0))
            {
                this.materia.DataTextField = "descripcion";
                this.materia.DataValueField = "id_materia";
                this.materia.DataSource = table;
                this.materia.DataBind();
                this.materia.Items.Insert(0, "Seleccione");
            }
        }

        private void ComboMateriaPRENDAS(string id_procedimiento)
        {
            DataTable table = null;
            table = Consulta.ComboMateriaPRENDAS(id_procedimiento);
            if ((table != null) && (table.Rows.Count > 0))
            {
                this.materia.DataTextField = "descripcion";
                this.materia.DataValueField = "id_materia";
                this.materia.DataSource = table;
                this.materia.DataBind();
                this.materia.Items.Insert(0, "Seleccione");
            }
        }

        private void ComboProcedimiento()
        {
            this.tipoprocedimiento.DataTextField = "descripcion";
            this.tipoprocedimiento.DataValueField = "id_procedimiento";
            this.tipoprocedimiento.DataSource = Consulta.ComboProcedimiento();
            this.tipoprocedimiento.DataBind();
            this.tipoprocedimiento.Items.Insert(0, "Seleccione");
        }

        private void ComboProcedimientoPRE()
        {
            this.tipoprocedimiento.DataTextField = "descripcion";
            this.tipoprocedimiento.DataValueField = "id_procedimiento";
            this.tipoprocedimiento.DataSource = Consulta.ComboProcedimientoPRE();
            this.tipoprocedimiento.DataBind();
            this.tipoprocedimiento.Items.Insert(0, "Seleccione");
        }

        private void ComboProcedimientoPRENDAS()
        {
            this.tipoprocedimiento.DataTextField = "descripcion";
            this.tipoprocedimiento.DataValueField = "id_procedimiento";
            this.tipoprocedimiento.DataSource = Consulta.ComboProcedimientoPRENDAS();
            this.tipoprocedimiento.DataBind();
            this.tipoprocedimiento.Items.Insert(0, "Seleccione");
        }

        private void ComboProducto(string id_producto)
        {
            string str = "";
            str = id_producto.Split(new char[] { '|' })[1].ToString();
            DataTable table = null;
            table = Consulta.ComboProducto(str);
            if ((table != null) && (table.Rows.Count > 0))
            {
                this.producto.DataTextField = "descripcion";
                this.producto.DataValueField = "id_producto";
                this.producto.DataSource = table;
                this.producto.DataBind();
            }
        }

        private void ComboProductoPRE(string id_producto)
        {
            string str = "";
            str = id_producto.Split(new char[] { '|' })[1].ToString();
            DataTable table = null;
            table = Consulta.ComboProductoPRE(str);
            if ((table != null) && (table.Rows.Count > 0))
            {
                this.producto.DataTextField = "descripcion";
                this.producto.DataValueField = "id_producto";
                this.producto.DataSource = table;
                this.producto.DataBind();
            }
        }

        private void ComboProductoPRENDAS(string id_producto)
        {
            string str = "";
            str = id_producto.Split(new char[] { '|' })[1].ToString();
            DataTable table = null;
            table = Consulta.ComboProductoPRENDAS(str);
            if ((table != null) && (table.Rows.Count > 0))
            {
                this.producto.DataTextField = "descripcion";
                this.producto.DataValueField = "id_producto";
                this.producto.DataSource = table;
                this.producto.DataBind();
            }
        }

        public void Deshabilitar()
        {
            this.txtNoperacion.ReadOnly = true;
            this.txtNumero.ReadOnly = true;
            this.cliente.Enabled = false;
            this.ddlRemesas.Enabled = false;
            this.tipoprocedimiento.Enabled = false;
            this.materia.Enabled = false;
            this.producto.Enabled = false;
            this.tipocobranza.Enabled = false;
            this.txtNoperacion.BackColor = Color.White;
            this.txtNumero.BackColor = Color.White;
            this.cliente.BackColor = Color.White;
            this.tipoprocedimiento.BackColor = Color.White;
            this.materia.BackColor = Color.White;
            this.producto.BackColor = Color.White;
            this.tipocobranza.BackColor = Color.White;
        }

        public void habilitar()
        {
            this.txtNoperacion.ReadOnly = false;
            this.txtNumero.ReadOnly = false;
            this.cliente.Enabled = true;
            this.ddlRemesas.Enabled = true;
            this.tipoprocedimiento.Enabled = true;
            this.materia.Enabled = true;
            this.producto.Enabled = true;
            this.tipocobranza.Enabled = true;
            this.txtNoperacion.BackColor = Color.LightYellow;
            this.txtNumero.BackColor = Color.LightYellow;
            this.cliente.BackColor = Color.LightYellow;
            this.tipoprocedimiento.BackColor = Color.LightYellow;
            this.materia.BackColor = Color.LightYellow;
            this.producto.BackColor = Color.LightYellow;
            this.tipocobranza.BackColor = Color.LightYellow;
        }

        protected void materia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.tipocobranza.SelectedValue.ToString() == "J")
            {
                this.producto.Items.Clear();
                this.ComboProducto(this.materia.SelectedValue.ToString());
            }
            else if (this.tipocobranza.SelectedValue.ToString() == "P")
            {
                this.producto.Items.Clear();
                this.ComboProductoPRE(this.materia.SelectedValue.ToString());
            }
            else
            {
                this.producto.Items.Clear();
                this.ComboProductoPRENDAS(this.materia.SelectedValue.ToString());
            }
        }

        protected void tipocobranza_SelectedIndexChanged(object sender, EventArgs e)
        {
            string str = this.tipocobranza.SelectedValue;
            if (this.tipocobranza.SelectedValue.ToString() == "J")
                this.ComboProcedimiento();
            else if (this.tipocobranza.SelectedValue.ToString() == "P")
                this.ComboProcedimientoPRE();
            else this.ComboProcedimientoPRENDAS();

            this.materia.Items.Clear();
            this.producto.Items.Clear();
        }

        protected void tipoprocedimiento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.tipocobranza.SelectedValue.ToString() == "J")
            {
                this.materia.Items.Clear();
                this.producto.Items.Clear();
                this.ComboMateria(this.tipoprocedimiento.SelectedValue.ToString());
            }
            else if (this.tipocobranza.SelectedValue.ToString() == "P")
            {
                this.materia.Items.Clear();
                this.producto.Items.Clear();
                this.ComboMateriaPRE(this.tipoprocedimiento.SelectedValue.ToString());
            }
            else
            {
                this.materia.Items.Clear();
                this.producto.Items.Clear();
                this.ComboMateriaPRENDAS(this.tipoprocedimiento.SelectedValue.ToString());
            }
        }

        protected void cliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarRemesas();
        }

        private void CargarRemesas()
        {
            ddlRemesas.DataSource = new ALCSA.Negocio.Cobranzas.Remesa().Listar(cliente.SelectedValue);
            ddlRemesas.DataBind();
            ddlRemesas.Items.Insert(0, new ListItem("Seleccione", "0"));
        }
    }
}

