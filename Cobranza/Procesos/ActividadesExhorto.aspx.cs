namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using CobranzaALC.Dto;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ActividadesExhorto : Page
    {
       
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("BuscaExhorto.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string str = "";
            DataTable table = null;
            table = ConsultasEspecificas.BuscarActividadExhorto(this.hiddidExhorto.Value.ToString(), this.tramite.SelectedValue.ToString(), this.txtFechatramite.Text);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Exhorto ya tiene actividad asociada');</script>");
                this.tramite.Focus();
            }
            else
            {
                Transaccion.InsertaActividadExhorto(this.hiddidExhorto.Value.ToString(), this.tramite.SelectedValue.ToString(), this.txtFechatramite.Text, this.observacion.Text);
                if ((((this.tramite.SelectedValue.ToString() == "9") || (this.tramite.SelectedValue.ToString() == "10")) || (this.tramite.SelectedValue.ToString() == "11")) || (this.tramite.SelectedValue.ToString() == "12"))
                {
                    Transaccion.UpdateExhorto(this.hiddidExhorto.Value.ToString());
                    str = "T";
                }
                string str2 = "ActividadesExhorto.aspx?Codigo=" + this.hiddidExhorto.Value.ToString() + "&status=" + str.ToString();
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Operaci\x00f3n realizada correctamente');location.href='" + str2.ToString() + "';</script>");
            }
        }

        private void ComboActividadExhorto()
        {
            this.tramite.DataTextField = "descripcion";
            this.tramite.DataValueField = "id_tramite_exh";
            this.tramite.DataSource = Consulta.ComboTramiteExhorto();
            this.tramite.DataBind();
        }

        public void habilitar()
        {
            this.tramite.BackColor = Color.LightYellow;
            this.txtFechatramite.BackColor = Color.LightYellow;
            this.observacion.BackColor = Color.LightYellow;
        }

        private void MostrarDatosActividadExhorto(string id_exhorto)
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDatosActividadExhorto(id_exhorto);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtCliente.Text = table.Rows[0]["nomcliente"].ToString();
                this.txtRolExhorto.Text = table.Rows[0]["rol_exhorto"].ToString();
                this.txtTribunalExhorto.Text = table.Rows[0]["tribunalexh"].ToString();
                this.txtRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                this.txtNomDeudor.Text = table.Rows[0]["nomdeudor"].ToString();
                this.txtRoljuicio.Text = table.Rows[0]["rol"].ToString();
                this.txtTribunaljuicio.Text = table.Rows[0]["tribunal"].ToString();
                this.txtTipoExhorto.Text = table.Rows[0]["tipoexh"].ToString();
                this.txtReceptor.Text = table.Rows[0]["receptor"].ToString();
                CabezeraActividadesExhortoDTO odto = new CabezeraActividadesExhortoDTO {
                    Deudor = table.Rows[0]["nomdeudor"].ToString(),
                    Noperacion = table.Rows[0]["nrooperacion"].ToString(),
                    Rol = table.Rows[0]["rol_exhorto"].ToString(),
                    Tribunal = table.Rows[0]["tribunalexh"].ToString(),
                    Roljuicio = table.Rows[0]["rol"].ToString(),
                    Tribunaljuicio = table.Rows[0]["tribunal"].ToString()
                };
                this.Session["CabezeraActividadesExhorto"] = odto;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string str = base.Request.QueryString["Codigo"].ToString();
                this.hiddidExhorto.Value = str;
                this.MostrarDatosActividadExhorto(str);
                this.ComboActividadExhorto();
                this.txtFechatramite.Text = DateTime.Now.ToString("dd-MM-yyyy");
                this.habilitar();
                this.tramite.Focus();
                if (!string.IsNullOrEmpty(base.Request.QueryString["status"]) && (base.Request.QueryString["status"].ToString() == "T"))
                {
                    this.hiddtramite.Value = "T";
                    this.tramite.Enabled = false;
                    this.txtFechatramite.Enabled = false;
                    this.observacion.Enabled = false;
                    this.tramite.BackColor = Color.White;
                    this.txtFechatramite.BackColor = Color.White;
                    this.observacion.BackColor = Color.White;
                }
            }
        }
    }
}

