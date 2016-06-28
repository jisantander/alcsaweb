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

    public partial class Actividades : Page
    {
      
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("BuscaJuicio.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string str = "";
            if ((((this.subtramite.SelectedValue.ToString() == "28") || (this.subtramite.SelectedValue.ToString() == "21")) || (this.subtramite.SelectedValue.ToString() == "22")) || (this.subtramite.SelectedValue.ToString() == "29"))
            {
                Transaccion.UpdateCobranza(this.hiddidCobranza.Value.ToString());
                str = "T";
            }
            else
            {
                string str2 = "";
                string str3 = "";
                string fsubtramite = "";
                string str5 = "";
                str5 = this.hiddtramite.Value.ToString();
                if (str5 == "NO")
                {
                    str5 = "";
                }
                str2 = this.hiddidjuicio.Value.ToString();
                if (this.subtramite.SelectedValue.ToString() == "Seleccione")
                {
                    str3 = "";
                }
                else
                {
                    str3 = this.subtramite.SelectedValue.ToString();
                }
                fsubtramite = this.txtFechaSubTramite.Text.ToString();
                string str6 = "SI";
                if (ConsultasEspecificas.BuscarSubTramiteRegistrado(str2, str3, fsubtramite, str5) != null)
                {
                    str6 = "NO";
                }
                if ((str6 == "NO") && (this.tramite.SelectedValue.ToString() == this.hiddtramite.Value.ToString()))
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Para guardar debe avanzar el tr\x00e1mite , cambiar el sub tr\x00e1mite o la fecha de sub tr\x00e1mite');</script>");
                    return;
                }
                this.hiddtramite.Value = this.tramite.SelectedValue.ToString();
            }
            Transaccion.InsertaActividad(this.hiddidjuicio.Value.ToString(), this.tramite.SelectedValue, this.subtramite.SelectedValue, this.txtFechatramite.Text, this.txtFechaSubTramite.Text, this.txtFechaproxgestion.Text, this.proximagestion.SelectedValue, this.observacion.Text);
            this.hiddGuardar.Value = "";
            string str7 = "Actividades.aspx?Codigo=" + this.hiddidjuicio.Value.ToString() + "&idCobranza=" + this.hiddidCobranza.Value.ToString() + "&status=" + str.ToString();
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Operaci\x00f3n realizada correctamente');location.href='" + str7.ToString() + "';</script>");
        }

        private DataTable BuscarActividad(string id_juicio)
        {
            DataTable table = null;
            table = ConsultasEspecificas.BuscarActividad(id_juicio);
            if ((table.Rows.Count > 0) && (table != null))
            {
                return table;
            }
            return null;
        }

        private DataTable BuscarSubTramite(string id_Actividad)
        {
            DataTable table = null;
            table = ConsultasEspecificas.BuscarSubTramite(id_Actividad);
            if ((table.Rows.Count > 0) && (table != null))
            {
                return table;
            }
            return null;
        }

        private void ComboSubTramite()
        {
            this.subtramite.DataTextField = "descripcion";
            this.subtramite.DataValueField = "id_sub_tramite";
            this.subtramite.DataSource = Consulta.ComboSubTramite();
            this.subtramite.DataBind();
            this.subtramite.Items.Insert(0, "Seleccione");
        }

        private void ComboTramite(string indice)
        {
            DataTable table = null;
            table = Consulta.ComboTramite(indice);
            this.tramite.DataTextField = "tramite";
            this.tramite.DataValueField = "id_tramite";
            this.tramite.DataSource = table;
            this.tramite.DataBind();
            if (indice == "4")
            {
                this.tramite.SelectedIndex = 0;
            }
            if (indice == "5")
            {
                this.tramite.SelectedIndex = 1;
            }
            if (indice == "6")
            {
                this.tramite.SelectedIndex = 2;
            }
            this.proximagestion.DataTextField = "subtramite";
            this.proximagestion.DataValueField = "indiceprox";
            this.proximagestion.DataSource = table;
            this.proximagestion.DataBind();
            this.proximagestion.SelectedIndex = 0;
        }

        public void habilitar()
        {
            this.tramite.BackColor = Color.LightYellow;
            this.txtFechatramite.BackColor = Color.LightYellow;
            this.subtramite.BackColor = Color.LightYellow;
            this.observacion.BackColor = Color.LightYellow;
            this.txtFechaSubTramite.BackColor = Color.LightYellow;
        }

        private void MostrarDatosJuicioActividad(string id_juicio)
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDatosJuicioActividad(id_juicio);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtCliente.Text = table.Rows[0]["nomcliente"].ToString();
                this.txtRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                this.txtNomDeudor.Text = table.Rows[0]["nomdeudor"].ToString();
                this.txtRol.Text = table.Rows[0]["rol"].ToString();
                this.txtTribunal.Text = table.Rows[0]["tribunal"].ToString();
                this.txtFechaIngCorte.Text = table.Rows[0]["fingcorte"].ToString();
                CabezeraActividadesDTO sdto = new CabezeraActividadesDTO {
                    Deudor = table.Rows[0]["nomdeudor"].ToString(),
                    Noperacion = table.Rows[0]["nrooperacion"].ToString(),
                    Rol = table.Rows[0]["rol"].ToString(),
                    Tribunal = table.Rows[0]["tribunal"].ToString()
                };
                this.Session["CabezeraActividades"] = sdto;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"])) && !string.IsNullOrEmpty(base.Request.QueryString["idCobranza"]))
            {
                string str = base.Request.QueryString["Codigo"].ToString();
                string str2 = base.Request.QueryString["idCobranza"].ToString();
                this.hiddidCobranza.Value = str2;
                this.MostrarDatosJuicioActividad(str);
                this.hiddidjuicio.Value = str;
                this.txtFechaproxgestion.Text = DateTime.Now.ToString("dd-MM-yyyy");
                this.txtFechatramite.Text = DateTime.Now.ToString("dd-MM-yyyy");
                this.habilitar();
                string indice = "";
                string str4 = "";
                DataTable table = this.BuscarActividad(str);
                if (string.IsNullOrEmpty(table.Rows[0]["id_tramite"].ToString()))
                {
                    indice = "1";
                    this.hiddtramite.Value = "NO";
                    this.ComboTramite(indice);
                }
                else
                {
                    indice = table.Rows[0]["id_tramite"].ToString();
                    str4 = table.Rows[0]["id_actividad"].ToString();
                    this.hiddtramite.Value = indice.ToString();
                    this.ComboTramite(indice);
                }
                if (str4 == "")
                {
                    this.ComboSubTramite();
                }
                else
                {
                    this.ComboSubTramite();
                    DataTable table2 = null;
                    table2 = this.BuscarSubTramite(str4);
                    if (table2 != null)
                    {
                        this.subtramite.SelectedValue = table2.Rows[0]["id_sub_tramite"].ToString();
                        this.Hiddsubtramite.Value = table2.Rows[0]["id_sub_tramite"].ToString();
                        this.HiddFechatramite.Value = table2.Rows[0]["fsubtramite"].ToString();
                    }
                }
                if (!string.IsNullOrEmpty(base.Request.QueryString["status"]) && (base.Request.QueryString["status"].ToString() == "T"))
                {
                    this.hiddtramite.Value = "T";
                    this.tramite.Enabled = false;
                    this.observacion.Enabled = false;
                    this.subtramite.Enabled = false;
                    this.txtFechatramite.ReadOnly = true;
                    this.txtFechaSubTramite.ReadOnly = true;
                    this.tramite.BackColor = Color.White;
                    this.observacion.BackColor = Color.White;
                    this.subtramite.BackColor = Color.White;
                    this.txtFechatramite.BackColor = Color.White;
                    this.txtFechaSubTramite.BackColor = Color.White;
                }
            }
        }

        protected void tramite_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.hiddtramite.Value.ToString() == "NO")
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No existe ninguna actividad registrada, por lo tanto no se puede avanzar');</script>");
                this.tramite.SelectedIndex = 0;
            }
            else if (this.hiddGuardar.Value.ToString() == "GUARDAR")
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe guardar antes de avanzar etapa');</script>");
                if (((this.tramite.SelectedValue.ToString() == "4") || (this.tramite.SelectedValue.ToString() == "5")) || (this.tramite.SelectedValue.ToString() == "6"))
                {
                    if (this.hiddtramite.Value.ToString() == "2")
                    {
                        this.tramite.SelectedIndex = 0;
                    }
                    else
                    {
                        this.tramite.SelectedValue = this.tramite.SelectedValue.ToString();
                    }
                }
                else
                {
                    this.tramite.SelectedIndex = 0;
                }
            }
            else if ((((this.hiddtramite.Value.ToString() == "4") || (this.hiddtramite.Value.ToString() == "5")) || (this.hiddtramite.Value.ToString() == "6")) && (((this.tramite.SelectedValue.ToString() == "4") || (this.tramite.SelectedValue.ToString() == "5")) || (this.tramite.SelectedValue.ToString() == "6")))
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe avanzar a la etapa 5');</script>");
                this.tramite.SelectedValue = this.hiddtramite.Value.ToString();
            }
            else
            {
                this.hiddGuardar.Value = "GUARDAR";
                this.subtramite.SelectedIndex = 0;
                this.ComboTramite(this.tramite.SelectedValue);
            }
        }
    }
}

