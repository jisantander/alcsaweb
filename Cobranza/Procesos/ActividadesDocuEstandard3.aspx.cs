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

    public partial class ActividadesDocuEstandard3 : Page
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
            this.hiddestadoingreso.Value = "";
            string[] strArray = this.tramite.SelectedValue.ToString().Split(new char[] { '-' });
            string str = strArray[0].ToString();
            string indice = strArray[1].ToString();
            string str3 = "";
            string[] strArray2 = this.subtramite.SelectedValue.ToString().Split(new char[] { '-' });
            if (strArray2[0].ToString() == "Seleccione")
            {
                str3 = "Seleccione";
            }
            else
            {
                str3 = strArray2[0].ToString();
            }
            DataTable table = null;
            table = Consulta.GENValidaTramite(this.hiddidjuicio.Value.ToString(), str, this.txtFechaSubTramite.Text, str3);
            if ((table != null) && (table.Rows.Count > 0))
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Tr\x00e1mite ya se encuentra registrado');</script>");
            }
            else
            {
                Transaccion.GENInsertaActividad(this.hiddidjuicio.Value.ToString(), str, str3, this.txtFechatramite.Text, this.txtFechaSubTramite.Text, this.txtFechaproxgestion.Text, (Convert.ToInt16(indice) + 1).ToString(), this.observacion.Text, indice);
                string str4 = "N";
                if (this.hiddtermino.Value.ToString() == "S")
                {
                    Transaccion.UpdateCobranza(this.hiddidCobranza.Value.ToString());
                    str4 = "S";
                }
                if (this.hiddsubtramitegeneral.Value.ToString() == "S")
                {
                    Transaccion.UpdateCobranza(this.hiddidCobranza.Value.ToString());
                    str4 = "S";
                }
                string str5 = "ActividadesDocuEstandard3.aspx?Codigo=" + this.hiddidjuicio.Value.ToString() + "&idCobranza=" + this.hiddidCobranza.Value.ToString() + "&termino=" + str4;
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Operaci\x00f3n realizada correctamente');location.href='" + str5.ToString() + "';</script>");
            }
        }

        private void ComboSubTramite()
        {
            this.subtramite.DataTextField = "descripcion";
            this.subtramite.DataValueField = "id_sub_tramite";
            this.subtramite.DataSource = Consulta.ComboSubTramiteGENERAL("ESTANDARD1");
            this.subtramite.DataBind();
            this.subtramite.Items.Insert(0, "Seleccione");
        }

        private DataTable GENBuscarActividad(string id_juicio)
        {
            DataTable table = null;
            table = ConsultasEspecificas.GENBuscarActividad(id_juicio);
            if ((table.Rows.Count > 0) && (table != null))
            {
                return table;
            }
            return null;
        }

        private DataTable GENBuscarActividadMAX(string id_juicio)
        {
            DataTable table = null;
            table = ConsultasEspecificas.GENBuscarActividad(id_juicio, "");
            if ((table.Rows.Count > 0) && (table != null))
            {
                return table;
            }
            return null;
        }

        private void GENMostrarProximaGestion(string indice)
        {
            DataTable table = null;
            table = Consulta.GENMostrartramiteProximaGestion(indice, "ESTANDARD3");
            try
            {
                this.txtproxtramite.Text = table.Rows[0]["descripcion"].ToString();
            }
            catch
            {
                this.txtproxtramite.Text = "";
            }
        }

        private void GENtramite()
        {
            DataTable table = null;
            table = Consulta.GENtramite("ESTANDARD3");
            this.tramite.DataTextField = "descripcion";
            this.tramite.DataValueField = "id_tramite";
            this.tramite.DataSource = table;
            this.tramite.DataBind();
        }

        public void habilitar()
        {
            this.tramite.BackColor = Color.LightYellow;
            this.txtFechatramite.BackColor = Color.LightYellow;
            this.subtramite.BackColor = Color.LightYellow;
            this.txtFechaSubTramite.BackColor = Color.LightYellow;
            this.observacion.BackColor = Color.LightYellow;
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
                this.txtProcedimiento.Text = table.Rows[0]["procedimiento"].ToString();
                this.txtMateria.Text = table.Rows[0]["materia"].ToString();
                this.txtProducto.Text = table.Rows[0]["producto"].ToString();
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
            if (!this.Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(base.Request.QueryString["termino"]) && (base.Request.QueryString["termino"].ToString() == "S"))
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Juicio se encuentra t\x00e9rminado');location.href='BuscaJuicio.aspx';</script>");
                }
                if (!string.IsNullOrEmpty(base.Request.QueryString["Codigo"]) && !string.IsNullOrEmpty(base.Request.QueryString["idCobranza"]))
                {
                    string str = base.Request.QueryString["Codigo"].ToString();
                    string str2 = base.Request.QueryString["idCobranza"].ToString();
                    this.hiddidCobranza.Value = str2;
                    this.hiddidjuicio.Value = str;
                    this.MostrarDatosJuicioActividad(str);
                    this.ComboSubTramite();
                    this.txtFechaproxgestion.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    this.txtFechatramite.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    this.habilitar();
                    this.GENtramite();
                    if (this.GENBuscarActividad(str) == null)
                    {
                        this.hiddtramite.Value = "1";
                        this.hiddindice.Value = "1";
                        this.hiddproxima.Value = "2";
                        this.hiddestadoingreso.Value = "NULL";
                        this.GENMostrarProximaGestion("2");
                        this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No hay ning\x00fan tramite registrado, debe guardar.');</script>");
                    }
                    else
                    {
                        DataTable table2 = this.GENBuscarActividadMAX(str);
                        this.hiddindice.Value = table2.Rows[0]["indice"].ToString();
                        this.tramite.SelectedValue = (table2.Rows[0]["id_tramite"].ToString() + "-" + table2.Rows[0]["indice"].ToString()).ToString();
                        int num = Convert.ToInt32(this.hiddindice.Value.ToString()) + 1;
                        this.GENMostrarProximaGestion(num.ToString());
                        this.hiddtramite.Value = table2.Rows[0]["id_tramite"].ToString();
                        this.hiddproxima.Value = num.ToString();
                    }
                }
            }
        }

        protected void subtramite_SelectedIndexChanged(object sender, EventArgs e)
        {
            string[] strArray = this.subtramite.SelectedValue.ToString().Split(new char[] { '-' });
            if (strArray[0].ToString() == "Seleccione")
            {
                this.hiddsubtramitegeneral.Value = "";
            }
            else
            {
                this.hiddsubtramitegeneral.Value = strArray[1].ToString();
            }
        }

        protected void tramite_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.hiddestadoingreso.Value.ToString() == "NULL")
            {
                this.tramite.SelectedIndex = 0;
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe guardar el tr\x00e1mite antes de avanzar');</script>");
            }
            else
            {
                string[] strArray = this.tramite.SelectedValue.ToString().Split(new char[] { '-' });
                string str = strArray[0].ToString();
                if (strArray[1].ToString() != this.hiddproxima.Value)
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe Avanzar a la pr\x00f3xima gesti\x00f3n, seg\x00fan se indica.');</script>");
                    this.tramite.SelectedValue = this.hiddtramite.Value.ToString() + "-" + this.hiddindice.Value.ToString();
                    this.GENMostrarProximaGestion(this.hiddproxima.Value.ToString());
                }
                else
                {
                    this.GENMostrarProximaGestion((Convert.ToInt32(this.hiddproxima.Value.ToString()) + 1).ToString());
                    DataTable table = null;
                    table = Consulta.GENMostrarTramiteTermino(str);
                    if ((table != null) && (table.Rows.Count > 0))
                    {
                        this.hiddtermino.Value = table.Rows[0]["termino"].ToString();
                    }
                }
            }
        }
    }
}

