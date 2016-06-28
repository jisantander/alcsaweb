namespace CobranzaALC.Cobranza.Abonos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class Abonos : Page
    {
        public GridViewRow gridViewRow = null;

        protected void banco_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.hiddBanco.Value = this.banco.SelectedItem.ToString();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("buscaCobranzaAbonos.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Transaccion.InsertaAbono(this.hiddidcobranza.Value.ToString(), this.txtFecha.Text, this.txtMontoAbono.Text, this.ConceptoAbono.SelectedValue.ToString(), this.tipomoneda.SelectedValue, this.banco.SelectedValue, this.txtFechaPago.Text, this.txtNroCheque.Text, this.txtObservacion.Text, this.txtGirador.Text, this.txtBoletaHonorarios.Text, this.txtSerie.Text, this.docuno.SelectedValue, this.docdos.SelectedValue, this.Session["Usuario"].ToString(), this.TipoComprobante.SelectedValue, "", "", txtnomgirador.Text);
            Transaccion.UpdateGastos(this.hiddidcobranza.Value.ToString());
            string str = "Abonos.aspx?Codigo=" + this.hiddidcobranza.Value.ToString();
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');location.href='" + str.ToString() + "';</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.btnGuardar.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            this.pnlLetras.Visible = true;
            this.lbltasa.Visible = true;
            this.tipotasa.Visible = true;
            this.Button3.Visible = true;
            this.Button2.Visible = false;
            this.txtMontoAbono.ReadOnly = true;
            this.txtMontoAbono.Text = "0";
            this.hiddSwPAgo.Value = "L";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            this.pnlLetras.Visible = false;
            this.lbltasa.Visible = false;
            this.tipotasa.Visible = false;
            this.Button2.Visible = true;
            this.Button3.Visible = false;
            this.txtMontoAbono.ReadOnly = false;
            this.txtMontoAbono.Text = "";
            this.hiddSwPAgo.Value = "A";
            this.txtMontoAbono.Focus();
        }

        private void CargaGrilla(string id_cobranza)
        {
            this.Grilla.DataSource = Consulta.MostrarAbono(id_cobranza);
            this.Grilla.DataBind();
        }

        protected void chkHonorarios_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chkHonorarios.Checked)
            {
                if (this.txtvercapital.Text != "0")
                {
                    double num = 0.0;
                    DataTable table = null;
                    table = Consulta.TraeHonorarios();
                    if ((table != null) && (table.Rows.Count > 0))
                    {
                        num = Convert.ToDouble(table.Rows[0][0].ToString());
                    }
                    this.txtverhonorarios.Text = Convert.ToString((double) (Convert.ToInt64(this.txtvercapital.Text) * num));
                }
            }
            else
            {
                this.txtverhonorarios.Text = "0";
            }
        }

        private void ComboBancos()
        {
            this.banco.DataTextField = "descripcion";
            this.banco.DataValueField = "id_banco";
            this.banco.DataSource = Consulta.ComboBancos();
            this.banco.DataBind();
            this.banco.Items.Insert(0, "Seleccione");
        }

        private void ComboConceptoAbono()
        {
            this.ConceptoAbono.DataTextField = "descripcion";
            this.ConceptoAbono.DataValueField = "id_concepto";
            this.ConceptoAbono.DataSource = Consulta.ComboConceptoAbono();
            this.ConceptoAbono.DataBind();
            this.ConceptoAbono.Items.Insert(0, "Seleccione");
        }

        private void ComboMoneda()
        {
            this.tipomoneda.DataTextField = "descripcion";
            this.tipomoneda.DataValueField = "id_moneda";
            this.tipomoneda.DataSource = Consulta.ComboTipoMoneda();
            this.tipomoneda.DataBind();
        }

        protected void ConceptoAbono_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.hiddConcepto.Value = this.ConceptoAbono.SelectedItem.ToString();
        }

        protected string Evaluar(object monto)
        {
            string str = string.Format("{0:N0}", monto);
            return ("$" + str).Replace(",", ".");
        }

        private string getDeudor(string rut)
        {
            string str = "";
            DataTable table = null;
            rut = rut.Replace(".", "");
            table = Consulta.BuscarDeudor(rut);
            if ((table != null) && (table.Rows.Count > 0))
            {
                str = table.Rows[0]["rsocial"].ToString();
            }
            return str;
        }

        private void getDocumentosPagar(string idcobranza)
        {
            DataTable table = null;
            table = ConsultasEspecificas.ConsultaDocumentosPorTipo(idcobranza, this.tipotasa.SelectedValue.ToString(), this.tipomoneda.SelectedValue.ToString(), this.txtFechaPago.Text.ToString());
            if ((table != null) && (table.Rows.Count > 0))
            {
                this.grillapagletras.DataSource = table;
                this.grillapagletras.DataBind();
            }
            else
            {
                this.grillapagletras.DataSource = null;
                this.grillapagletras.DataBind();
            }
        }

        private void habil()
        {
            this.banco.Enabled = true;
            this.txtNroCheque.Enabled = true;
            this.txtGirador.Enabled = true;
            this.txtFechaPago.Enabled = true;
            this.ImageButton1.Visible = true;
            this.txtSerie.Enabled = true;
            this.banco.BackColor = Color.LightYellow;
            this.txtNroCheque.BackColor = Color.LightYellow;
            this.txtGirador.BackColor = Color.LightYellow;
            this.txtFechaPago.BackColor = Color.LightYellow;
            this.txtSerie.BackColor = Color.LightYellow;
        }

        private void habilitar()
        {
            this.txtFecha.BackColor = Color.LightYellow;
            this.txtMontoAbono.BackColor = Color.LightYellow;
            this.ConceptoAbono.BackColor = Color.LightYellow;
            this.tipomoneda.BackColor = Color.LightYellow;
            this.txtObservacion.BackColor = Color.LightYellow;
            this.docuno.BackColor = Color.LightYellow;
            this.docdos.BackColor = Color.LightYellow;
            this.TipoComprobante.BackColor = Color.LightYellow;
        }

        protected void Habilitar(object sender, GridViewCommandEventArgs e)
        {
            this.gridViewRow = ((Control) e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Habilitar") == 0)
            {
                string str = e.CommandName.ToString();
                string text = ((Label) this.gridViewRow.FindControl("lblCodigo")).Text;
                if (!string.IsNullOrEmpty(text))
                {
                    string[] strArray = text.Split(new char[] { '|' });
                    string str3 = strArray[0].ToString();
                    string str4 = strArray[1].ToString();
                    string str5 = strArray[2].ToString();
                    switch (str4)
                    {
                        case "P":
                            ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Mensaje", "alert('Letra Cancelada');", true);
                            this.getDocumentosPagar(this.hiddidcobranza.Value.ToString());
                            break;

                        case "J":
                            if (str5 == "3")
                            {
                                Transaccion.ActualizaPagoDocuJuicio(str3);
                                ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Mensaje", "alert('Letra Cancelada');", true);
                                this.getDocumentosPagar(this.hiddidcobranza.Value.ToString());
                            }
                            if (str5 == "2")
                            {
                                Transaccion.ActualizaPagoDocuPagare(str3);
                                ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Mensaje", "alert('Letra Cancelada');", true);
                                this.getDocumentosPagar(this.hiddidcobranza.Value.ToString());
                            }
                            if (str5 == "1")
                            {
                                Transaccion.ActualizaPagoDocuMutuo(str3);
                                ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Mensaje", "alert('Letra Cancelada');", true);
                                this.getDocumentosPagar(this.hiddidcobranza.Value.ToString());
                            }
                            break;
                    }
                }
            }
            string str6 = "Abonos.aspx?Codigo=" + this.hiddidcobranza.Value.ToString();
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>location.href='" + str6.ToString() + "';</script>");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtGirador.Text))
            {
                this.txtGirador.Text = "";
            }
            else
            {
                string str = this.getDeudor(this.txtGirador.Text.ToString());
                if (string.IsNullOrEmpty(str))
                {
                    this.txtGirador.Text = "";
                    this.txtGirador.Focus();
                }
                else
                {
                    this.txtnomgirador.Text = str;
                }
            }
        }

        private string MostrarDatosJuicio(string id_cobranza)
        {
            string str = "";
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDatosCabezeraAbonos(id_cobranza);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtCliente.Text = table.Rows[0]["nomcliente"].ToString();
                this.txtNomDeudor.Text = table.Rows[0]["nomdeudor"].ToString();
                this.txtRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                str = table.Rows[0]["tipocobranza"].ToString();
            }
            return str;
        }

        private void MostrarSaldoAbonos(string id_cobranza)
        {
        }

        private void MostrarSaldoCobranza(string id_cobranza)
        {
        }

        private void Nohabil()
        {
            this.ImageButton1.Visible = false;
            this.banco.Enabled = false;
            this.txtNroCheque.Enabled = false;
            this.txtGirador.Enabled = false;
            this.txtFechaPago.Enabled = false;
            this.txtSerie.Enabled = false;
            this.banco.BackColor = Color.White;
            this.txtNroCheque.BackColor = Color.White;
            this.txtGirador.BackColor = Color.White;
            this.txtFechaPago.BackColor = Color.White;
            this.txtSerie.BackColor = Color.White;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string str = base.Request.QueryString["Codigo"].ToString();
                this.hiddidcobranza.Value = str;
                string str2 = this.MostrarDatosJuicio(str);
                this.Nohabil();
                this.CargaGrilla(str);
                this.getDocumentosPagar(str);
                this.ComboMoneda();
                this.tipomoneda.SelectedValue = "2";
                this.hiddSwPAgo.Value = "A";
                DataTable table = null;
                table = ConsultasEspecificas.ConsultaProcesar(str, this.tipotasa.SelectedValue.ToString(), this.tipomoneda.SelectedValue.ToString(), this.txtFechaPago.Text.ToString());
                if ((table != null) && (table.Rows.Count > 0))
                {
                    this.txtvercapital.Text = table.Rows[0]["capital"].ToString();
                    this.txtvergastos.Text = table.Rows[0]["gastos"].ToString();
                }
                this.ComboBancos();
                this.habilitar();
                this.txtFecha.Text = DateTime.Now.ToString("dd-MM-yyyy");
                this.ComboConceptoAbono();
                this.txtMontoAbono.Focus();
            }
        }

        protected void tipomoneda_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.tipomoneda.SelectedValue.ToString() == "5")
            {
                this.txtMontoAbono.Text = "0";
                this.habil();
            }
            else
            {
                this.Nohabil();
            }
            this.hiddTipoMoneda.Value = this.tipomoneda.SelectedValue.ToString();
        }
    }
}

