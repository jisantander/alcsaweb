namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;
    using System.Globalization;

    public partial class juicioestado : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["Usuario"] == null || this.Session["Usuario"].ToString() == "")
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }

            if (Page.IsPostBack) return;
           
            cbxClientes.DataSource = Consulta.Clientes();
            cbxClientes.DataBind();
            CargarRiesgos();

            if (!string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string str = base.Request.QueryString["Codigo"].ToString();
                this.hiddidcobranza.Value = str;
                this.ComboJurisdiccion();
                this.MostrarDatosJuicio(str);
            }

            // SE ELIMINA EL ESTADO "EN PROCESO DE TERMINO" DE LA LISTA PARA NO PASAR A ESE ESTADO DE FORMA MANUAL
            if (cbxEstado.SelectedValue != "P")
                cbxEstado.Items.Remove(cbxEstado.Items.FindByValue("P"));
        }

        protected void cbxListaJurisdiccion_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ComboTribunal();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("buscacobranzaestado.aspx");
        }

        protected void btnGuardar_Click1(object sender, EventArgs e)
        {
            if (cbxJuzgados.Items.Count.Equals(0) || string.IsNullOrEmpty(cbxJuzgados.SelectedValue))
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Seleccione un juzgado.');</script>");
                return;
            }

            if (string.IsNullOrEmpty(txtObservacion.Text))
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Ingrese una observación');</script>");
                return;
            }

            new ALCSA.Negocio.Juicios.Juicio().Actualizar(new ALCSA.Entidades.Parametros.Entradas.Juicios.JuicioEstado()
            {
                IdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hiddidcobranza),
                IdJuicios = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdJuicio),
                IdRiesgo = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlRiesgo),
                IdTribunal = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(cbxJuzgados),
                Observacion = ALCSA.FWK.Web.Control.ExtraerValor(txtObservacion),
                Rol = ALCSA.FWK.Web.Control.ExtraerValor(txtRol),
                Usuario = Session["Usuario"] != null ? Session["Usuario"].ToString() : "Desconocido",
                EstadoCobranza = ALCSA.FWK.Web.Control.ExtraerValor(cbxEstado),
                FechaMotivoRiesgo = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaRiesgo)
            });

            if (ALCSA.FWK.Web.Control.ExtraerValor(cbxEstado) == "N")
            {
                new ALCSA.Negocio.Cobranzas.Cobranza().ActualizarEstado(
                    ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hiddidcobranza),
                    ALCSA.Negocio.Cobranzas.Cobranza.ESTADO_COBRANZA_TERMINADO);
            }

            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Estado cambiado correctamente');</script>");
        }

        private void ComboJurisdiccion()
        {
            this.cbxListaJurisdiccion.DataTextField = "descripcion";
            this.cbxListaJurisdiccion.DataValueField = "id_jurisdiccion";
            this.cbxListaJurisdiccion.DataSource = Consulta.ComboJurisdiccion();
            this.cbxListaJurisdiccion.DataBind();
            this.ComboTribunal();
        }

        private void CargarRiesgos()
        {
            ddlRiesgo.DataSource = new ALCSA.Negocio.Juicios.Riesgo().Listar();
            ddlRiesgo.DataBind();
            ddlRiesgo.Items.Insert(0, new ListItem("Sin Riesgo", "0"));
        }

        private void ComboTribunal()
        {
            this.cbxJuzgados.DataTextField = "descripcion";
            this.cbxJuzgados.DataValueField = "id_tribunal";
            this.cbxJuzgados.DataSource = Consulta.ComboTribunales(cbxListaJurisdiccion.SelectedValue);
            this.cbxJuzgados.DataBind();
        }

        private void MostrarDatosJuicio(string id_cobranza)
        {
            DataTable table = ConsultasEspecificas.MostrarDatosJuicio(id_cobranza);
            if (table.Rows.Count > 0)
            {
                this.txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtNomDeudor.Text = table.Rows[0]["deudor"].ToString();
                this.txtRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                this.txtProcedimiento.Text = table.Rows[0]["procedimiento"].ToString().ToUpper();
                this.txtMateria.Text = table.Rows[0]["materia"].ToString().ToUpper();
                this.txtProducto.Text = table.Rows[0]["producto"].ToString().ToUpper();
                this.cbxEstado.SelectedValue = table.Rows[0]["tipo"].ToString().ToUpper().Trim();
                this.hdfEstadoActual.Value = table.Rows[0]["tipo"].ToString().ToUpper().Trim();

                ALCSA.FWK.Web.Control.SeleccionarValor(cbxClientes, table.Rows[0]["rut_cli"].ToString());
            }

            DataTable table2 = ConsultasEspecificas.MostrarDatJuicios(id_cobranza);
            if ((table2.Rows.Count > 0) && (table2 != null))
            {
                this.txtRol.Text = table2.Rows[0]["rol"].ToString();

                ListItem objItem = null;
                if ((objItem = cbxListaJurisdiccion.Items.FindByValue(table2.Rows[0]["id_jurisdiccion"].ToString())) != null)
                {
                    cbxListaJurisdiccion.SelectedIndex = -1;
                    objItem.Selected = true;
                    ComboTribunal();
                    if ((objItem = cbxJuzgados.Items.FindByValue(table2.Rows[0]["id_tribunal"].ToString())) != null)
                    {
                        cbxJuzgados.SelectedIndex = -1;
                        objItem.Selected = true;
                    }
                }

                if (table2.Rows[0]["id_riesgo"] != null && (objItem = ddlRiesgo.Items.FindByValue(table2.Rows[0]["id_riesgo"].ToString())) != null)
                {
                    ddlRiesgo.SelectedIndex = -1;
                    objItem.Selected = true;
                }

                if (table2.Rows[0]["fecha_motivo_riesgo"] != null)
                {
                    DateTime datFecha = Convert.ToDateTime(table2.Rows[0]["fecha_motivo_riesgo"]);
                    ALCSA.FWK.Web.Control.AsignarValor(txtFechaRiesgo, datFecha);
                }

                this.hdfIdJuicio.Value = table2.Rows[0]["ID"].ToString();

                gvObservaciones.DataSource = new ALCSA.Negocio.Cobranzas.Bitacora().Listar(Convert.ToInt32(id_cobranza));
                gvObservaciones.DataBind();
            }
            else
            {
                this.txtRol.Enabled = false;
                this.cbxJuzgados.Enabled = false;
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Aviso! No se ha ingresado juicio a este caso');</script>");
            }
        }
    }
}

