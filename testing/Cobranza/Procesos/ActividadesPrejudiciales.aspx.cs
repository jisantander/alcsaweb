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

    public partial class ActividadesPrejudiciales : Page
    {
      
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            if (this.HiddConsulta.Value.ToString() == "Consulta")
            {
                string str = this.hiddidCobranza.Value;
                string str2 = this.HiddConsulta.Value.ToString();
                base.Response.Redirect("../ConsultaEspecial/ConsultaPrejudicial.aspx?Volver=" + str2 + "&Codigo=" + str.ToString());
            }
            else
            {
                base.Response.Redirect("BuscaCobranzaPrejudicial.aspx");
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string str2;
            string str = this.HiddConsulta.Value.ToString();
            Transaccion.InsertaActividadPrejudicial(this.hiddidCobranza.Value.ToString(), this.tramite.SelectedValue.ToString(), this.txtFechatramite.Text, this.proxima.SelectedValue.ToString(), this.txtFechaproxgestion.Text, this.observacion.Text);
            if (this.HiddConsulta.Value.ToString() == "Consulta")
            {
                str2 = "ActividadesPrejudiciales.aspx?Volver=" + str + "&Codigo=" + this.hiddidCobranza.Value.ToString();
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Operaci\x00f3n realizada correctamente');location.href='" + str2.ToString() + "';</script>");
            }
            else
            {
                str2 = "ActividadesPrejudiciales.aspx?Codigo=" + this.hiddidCobranza.Value.ToString();
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Operaci\x00f3n realizada correctamente');location.href='" + str2.ToString() + "';</script>");
            }
        }

        private void ComboActividad()
        {
            this.tramite.DataTextField = "descripcion";
            this.tramite.DataValueField = "id_act_prejudicial";
            this.tramite.DataSource = Consulta.ComboActividadPrejudicial();
            this.tramite.DataBind();
            this.tramite.Items.Insert(0, "Seleccione");
        }

        private void ComboProxima()
        {
            this.proxima.DataTextField = "descripcion";
            this.proxima.DataValueField = "id_proxactprejudi";
            this.proxima.DataSource = Consulta.ComboProximadPrejudicial();
            this.proxima.DataBind();
            this.proxima.Items.Insert(0, "Seleccione");
        }

        public void habilitar()
        {
            this.tramite.BackColor = Color.LightYellow;
            this.proxima.BackColor = Color.LightYellow;
            this.txtFechatramite.BackColor = Color.LightYellow;
            this.txtFechaproxgestion.BackColor = Color.LightYellow;
            this.observacion.BackColor = Color.LightYellow;
        }

        private void MostrarDatosActividadCobranza(string id_cobranza)
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDatosActividadCobranza(id_cobranza);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtCliente.Text = table.Rows[0]["cliente"].ToString();
                this.txtRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                this.txtNomDeudor.Text = table.Rows[0]["deudor"].ToString();
                CabezaPrejudicialDTO ldto = new CabezaPrejudicialDTO {
                    NroOperacion = table.Rows[0]["nrooperacion"].ToString(),
                    Nom_Cli = table.Rows[0]["cliente"].ToString(),
                    Rut_Deudor = table.Rows[0]["rut_deudor"].ToString(),
                    Nom_Deudor = table.Rows[0]["deudor"].ToString()
                };
                this.Session["CabezeraActividadesPrejudicial"] = ldto;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string str = base.Request.QueryString["Codigo"].ToString();
                if (string.IsNullOrEmpty(base.Request.QueryString["Volver"]))
                {
                    this.HiddConsulta.Value = "";
                }
                else
                {
                    this.HiddConsulta.Value = "Consulta";
                }
                this.habilitar();
                this.MostrarDatosActividadCobranza(str);
                this.txtFechatramite.Text = DateTime.Now.ToString("dd-MM-yyyy");
                this.txtFechatramite.Focus();
                this.ComboActividad();
                this.ComboProxima();
                this.hiddidCobranza.Value = str;
            }
        }
    }
}

