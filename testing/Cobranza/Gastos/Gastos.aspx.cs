namespace CobranzaALC.Cobranza.Gastos
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

    public partial class Gastos : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["Usuario"] == null || this.Session["Usuario"].ToString() == "")
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }

            hdfGenerarDocumento.Value = "0";

            if (this.Page.IsPostBack) return;

            this.tipogastoadmin.Attributes.Add("onchange", "ValidaAdmin();");
            this.tipogastojudi.Attributes.Add("onchange", "ValidaJudi();");
            this.tipogastopre.Attributes.Add("onchange", "ValidaPre();");
            this.txtMontoadmin.Attributes.Add("onfocus", "Montoadmin();");
            this.txtMontojudi.Attributes.Add("onfocus", "Montojudi();");
            this.txtMontopre.Attributes.Add("onfocus", "gastopre();");

            int intIdCobranza = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "Codigo");
            int intIdGasto = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_gasto");
            hdfGenerarDocumento.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "gasto_ok").ToString();

            ALCSA.Negocio.Gastos.Gasto objGasto = new ALCSA.Negocio.Gastos.Gasto(intIdGasto);
            if (objGasto.ID > 0) intIdCobranza = objGasto.IdCobranza;


            if (intIdCobranza > 0)
            {
                hdfRedireccionActividadJudicial.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "pag_act").ToString();

                this.hdfIdCobranza.Value = intIdCobranza.ToString();
                this.MostrarDatosJuicioActividad(intIdCobranza);

                ALCSA.FWK.Web.Control.AsignarValor(txtFecha, DateTime.Now);
                ALCSA.FWK.Web.Control.AsignarValor(txtfechaestadogasto, DateTime.Now);
                
                this.ComboTipoGastoAdmin();
                this.ComboActividadesPrejudiciales();
                this.ComboTramite();
                this.ComboProveedores();
                this.habilitar();
                this.txtFecha.Focus();
            }

            if (objGasto.ID > 0)
            {
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdGasto, objGasto.ID);
                ALCSA.FWK.Web.Control.AsignarValor(txtFecha, objGasto.Fproceso);
                ALCSA.FWK.Web.Control.AsignarValor(txtBoleta, objGasto.Nroboleta);
                ALCSA.FWK.Web.Control.AsignarValor(txtNomina, objGasto.Nomina);
                ALCSA.FWK.Web.Control.AsignarValor(txtFechaNomina, objGasto.Fnomina);
                ALCSA.FWK.Web.Control.SeleccionarValor(Proveedor, objGasto.RutResponsable);
                ALCSA.FWK.Web.Control.AsignarValor(txtfechaestadogasto, objGasto.Fechaestadogasto);
                ALCSA.FWK.Web.Control.SeleccionarValor(tipogastoadmin, objGasto.IdGastoAdmin);
                ALCSA.FWK.Web.Control.SeleccionarValor(tipogastopre, objGasto.IdActPrejudicial);
                ALCSA.FWK.Web.Control.SeleccionarValor(tipogastojudi, objGasto.IdGastoJudicial);
                ALCSA.FWK.Web.Control.AsignarValor(txtMontoadmin, objGasto.Montogastoadmin, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtMontopre, objGasto.Montogastopre, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtMontojudi, objGasto.Montogastojudi, 0);

                if (Session["Perfil"].ToString() == "1")
                    estadogasto.Enabled = true;
                else btnGuardar.Visible = false;
            }

            txtBoleta.Focus();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfRedireccionActividadJudicial) == 1)
            {
                ALCSA.Negocio.Juicios.Juicio objJuicio = new ALCSA.Negocio.Juicios.Juicio();
                objJuicio.CargarPorCobranza(ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza));
                Response.Redirect(string.Format("../Procesos/ActividadCobranza.aspx?Codigo={0}", objJuicio.ID), true);
            }
            else Response.Redirect("BuscaCobranzaGastos.aspx", true);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ALCSA.Negocio.Gastos.Gasto objGasto = new ALCSA.Negocio.Gastos.Gasto()
            {
                ID = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdGasto),
                IdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza),
                Fechagasto = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFecha),
                Fproceso = DateTime.Now,
                // Gasto = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFecha),
                // Desgasto = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFecha),
                Nroboleta = ALCSA.FWK.Web.Control.ExtraerValor(txtBoleta),

                RutResponsable = ALCSA.FWK.Web.Control.ExtraerValor(Proveedor),
                NomResponsable = ALCSA.FWK.Web.Control.ExtraerTexto(Proveedor),
                TipoResponsable = "p",

                Estadogasto = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(estadogasto),
                Fechaestadogasto = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtfechaestadogasto),

                Nomina = ALCSA.FWK.Web.Control.ExtraerValor(txtNomina),
                Fnomina = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaNomina),

                IdGastoAdmin = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(tipogastoadmin),
                IdActPrejudicial = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(tipogastopre),
                IdGastoJudicial = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(tipogastojudi),
                Tipogastujudi = ALCSA.FWK.Web.Control.ExtraerTexto(tipogastojudi),

                Montogastoadmin = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtMontoadmin),
                Montogastojudi = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtMontojudi),
                Montogastopre = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtMontopre),

                Username = this.Session["Usuario"].ToString(),

                Observacion = ALCSA.FWK.Web.Control.ExtraerValor(txtObservacion)
            };

            if (objGasto.IdGastoAdmin > 0)
            {
                objGasto.Gasto = "Administrativo";
                objGasto.Desgasto = ALCSA.FWK.Web.Control.ExtraerTexto(tipogastoadmin);
            }
            else if (objGasto.IdGastoJudicial > 0)
            {
                objGasto.Gasto = "Judicial";
                objGasto.Desgasto = ALCSA.FWK.Web.Control.ExtraerTexto(tipogastojudi);
            }
            else if (objGasto.IdActPrejudicial > 0)
            {
                objGasto.Gasto = "PreJudicial";
                objGasto.Desgasto = ALCSA.FWK.Web.Control.ExtraerTexto(tipogastopre);
            }

            objGasto.Guardar();

            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfRedireccionActividadJudicial) == 1)
            {
                ALCSA.Negocio.Juicios.Juicio objJuicio = new ALCSA.Negocio.Juicios.Juicio();
                objJuicio.CargarPorCobranza(objGasto.IdCobranza);
                Response.Redirect(string.Format("../Procesos/ActividadCobranza.aspx?Codigo={0}&gasto_ok=1&id_gasto={1}", objJuicio.ID, objGasto.ID), true);
            }
            else
            {
                string strRuta = string.Format("Gastos.aspx?Codigo={0}&gasto_ok=1&id_gasto={1}", this.hdfIdCobranza.Value, objGasto.ID);
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');location.href='" + strRuta + "';</script>");
            }
        }

        private void ComboActividadesPrejudiciales()
        {
            this.tipogastopre.DataTextField = "descripcion";
            this.tipogastopre.DataValueField = "id_act_prejudicial";
            this.tipogastopre.DataSource = Consulta.ComboActividadesPrejudiciales();
            this.tipogastopre.DataBind();
            this.tipogastopre.Items.Insert(0, "Seleccione");
        }

        private void ComboTipoGastoAdmin()
        {
            this.tipogastoadmin.DataTextField = "descripcion";
            this.tipogastoadmin.DataValueField = "id_gasto_admin";
            this.tipogastoadmin.DataSource = Consulta.ComboTipoGastoAdmin();
            this.tipogastoadmin.DataBind();
            this.tipogastoadmin.Items.Insert(0, "Seleccione");
        }

        private void ComboTramite()
        {
            this.tipogastojudi.DataTextField = "descripcion";
            this.tipogastojudi.DataValueField = "id_tipo_gasto_judi";
            this.tipogastojudi.DataSource = Consulta.ComboGastoJudicial();
            this.tipogastojudi.DataBind();
            this.tipogastojudi.Items.Insert(0, "Seleccione");
        }

        private void ComboProveedores()
        {
            this.Proveedor.DataTextField = "nombre";
            this.Proveedor.DataValueField = "rut_proveedor";
            this.Proveedor.DataSource = Consulta.ComboProveedores();
            this.Proveedor.DataBind();
            this.Proveedor.Items.Insert(0, "Seleccione");
        }

        public void habilitar()
        {
            this.txtBoleta.BackColor = Color.LightYellow;
            this.estadogasto.BackColor = Color.LightYellow;
            this.tipogastoadmin.BackColor = Color.LightYellow;
            this.txtMontoadmin.BackColor = Color.LightYellow;
            this.tipogastojudi.BackColor = Color.LightYellow;
            this.txtMontojudi.BackColor = Color.LightYellow;
            this.txtFecha.BackColor = Color.LightYellow;
            this.tipogastopre.BackColor = Color.LightYellow;
            this.txtMontopre.BackColor = Color.LightYellow;
            this.txtfechaestadogasto.BackColor = Color.LightYellow;
            this.txtNomina.BackColor = Color.LightYellow;
            this.txtFechaNomina.BackColor = Color.LightYellow;
            this.Proveedor.BackColor = Color.LightYellow;
        }

        private void MostrarDatosJuicioActividad(int idCobranza)
        {
            DataTable table = ConsultasEspecificas.MostrarDatosCabezeraGastos(idCobranza.ToString());
            if (table != null && table.Rows.Count > 0)
            {
                this.txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtCliente.Text = table.Rows[0]["nomcliente"].ToString();
                this.txtRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                this.txtNomDeudor.Text = table.Rows[0]["nomdeudor"].ToString();
                this.txtRol.Text = table.Rows[0]["rol"].ToString();
                this.txtTribunal.Text = table.Rows[0]["tribunal"].ToString();
                CabezeraGastosDTO sdto = new CabezeraGastosDTO {
                    Deudor = table.Rows[0]["nomdeudor"].ToString(),
                    Noperacion = table.Rows[0]["nrooperacion"].ToString(),
                    Rol = table.Rows[0]["rol"].ToString(),
                    Tribunal = table.Rows[0]["tribunal"].ToString()
                };
                this.Session["CabezeraGastos"] = sdto;
            }
        }
    }
}

