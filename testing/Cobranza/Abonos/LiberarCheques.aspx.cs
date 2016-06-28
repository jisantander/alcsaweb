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

    public partial class LiberarCheques : Page
    {
        public GridViewRow gridViewRow = null;

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.pnlMCH.Visible = false;
            this.panel.Visible = false;
            this.btnGuardarMCH.Visible = false;
            this.btnGuardar.Visible = false;
            this.CargaGrilla();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.txtNro.Text))
            {
                string str = this.txtNro.Text.ToString();
                Transaccion.UPDATE_Abono_CHEQUE(this.lblNroCOM.Text.ToString(), this.txtFechaDeposito.Text.ToString(), this.txtCuentaDeposito.Text.ToString(), this.txtNroComprobante.Text.ToString(), this.txtFexhaLiberacionCheque.Text.ToString(), this.cbxEstado.SelectedValue.ToString(), this.Session["Usuario"].ToString());
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos actualizados correctamente');</script>");
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe ingresar N\x00b0 de Operaci\x00f3n');</script>");
            }
        }

        protected void btnGuardarMCH_Click(object sender, EventArgs e)
        {
            Transaccion.UPDATE_AbonoMCH_CHEQUE(this.hddIdAbonoMCH.Value.ToString(), this.txtFechaDeposito.Text.ToString(), this.txtCuentaDeposito.Text.ToString(), this.txtNroComprobante.Text.ToString(), this.txtFexhaLiberacionCheque.Text.ToString(), this.cbxEstado.SelectedValue.ToString(), this.Session["Usuario"].ToString());
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos actualizados correctamente');</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
        }

        private void CargaGrilla()
        {
            DataTable table = null;
            table = ConsultasEspecificas.DetalleResumenCliente(this.txtNro.Text.ToString());
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.pnlCheque.Visible = true;
                this.txtNro.Enabled = false;
            }
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();
        }

        private void ComboBancos()
        {
        }

        public void Editar(object sender, GridViewCommandEventArgs e)
        {
            this.gridViewRow = ((Control) e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Editar") == 0)
            {
                Label label = (Label) this.gridViewRow.FindControl("lblidAbono");
                Label label2 = (Label) this.gridViewRow.FindControl("lblmch");
                Label label3 = (Label) this.gridViewRow.FindControl("lblRendido");
                if (label3.Text == "S")
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No se pueden liberar documentos rendidos');</script>");
                }
                else
                {
                    string str = label.Text.ToString();
                    if (label2.Text.ToString() == "S")
                    {
                        this.panel.Visible = false;
                        this.btnGuardar.Visible = false;
                        this.btnGuardarMCH.Visible = false;
                        this.pnlMCH.Visible = true;
                        DataTable table = null;
                        table = Consulta.DetalleAbonoMCH(str);
                        if ((table.Rows.Count > 0) && (table != null))
                        {
                            this.grillaMCH.DataSource = table;
                            this.grillaMCH.DataBind();
                        }
                        else
                        {
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Atenci\x00f3n! No se ha ingresado ning\x00fan multicheque (MCH) para procesar');</script>");
                        }
                    }
                    else
                    {
                        this.panel.Visible = true;
                        this.btnGuardar.Visible = true;
                        this.btnGuardarMCH.Visible = false;
                        this.pnlMCH.Visible = false;
                        DataTable table2 = null;
                        table2 = ConsultasEspecificas.VERDepositoAbono(str.ToString());
                        if ((table2.Rows.Count > 0) && (table2 != null))
                        {
                            this.txtFechaDeposito.Text = table2.Rows[0]["fechadeposito"].ToString();
                            this.txtCuentaDeposito.Text = table2.Rows[0]["cuentadeposito"].ToString();
                            this.txtNroComprobante.Text = table2.Rows[0]["nrocomprobantedeposito"].ToString();
                            this.txtFexhaLiberacionCheque.Text = table2.Rows[0]["fechaliberacion"].ToString();
                            this.cbxEstado.SelectedValue = table2.Rows[0]["estado"].ToString();
                        }
                        else
                        {
                            this.txtFechaDeposito.Text = "";
                            this.txtCuentaDeposito.Text = "";
                            this.txtNroComprobante.Text = "";
                            this.txtFexhaLiberacionCheque.Text = "";
                            this.cbxEstado.SelectedValue = "N";
                        }
                    }
                    this.lblTitulo.Text = "DETALLE COMPROBANTE N\x00b0:";
                    this.lblNroCOM.Text = str.ToString();
                }
            }
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla();
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        public void habilitar()
        {
            this.txtNro.BackColor = Color.LightYellow;
        }

        public void Muestra(object sender, GridViewCommandEventArgs e)
        {
            this.gridViewRow = ((Control) e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Muestra") == 0)
            {
                Label label = (Label) this.gridViewRow.FindControl("lblidAbono");
                Label label2 = (Label) this.gridViewRow.FindControl("lblnrocheque");
                this.hddIdAbonoMCH.Value = label.Text.ToString();
                this.panel.Visible = true;
                this.btnGuardarMCH.Visible = true;
                DataTable table = null;
                table = ConsultasEspecificas.VERDepositoAbonoMCH(this.hddIdAbonoMCH.Value.ToString());
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.txtFechaDeposito.Text = table.Rows[0]["fechadeposito"].ToString();
                    this.txtCuentaDeposito.Text = table.Rows[0]["cuentadeposito"].ToString();
                    this.txtNroComprobante.Text = table.Rows[0]["nrocomprobantedeposito"].ToString();
                    this.txtFexhaLiberacionCheque.Text = table.Rows[0]["fechaliberacion"].ToString();
                    this.cbxEstado.SelectedValue = table.Rows[0]["estado"].ToString();
                }
                else
                {
                    this.txtFechaDeposito.Text = "";
                    this.txtCuentaDeposito.Text = "";
                    this.txtNroComprobante.Text = "";
                    this.txtFexhaLiberacionCheque.Text = "";
                    this.cbxEstado.SelectedValue = "N";
                }
                this.lblTitulo.Text = "DETALLE CHEQUE N\x00b0:";
                this.lblNroCOM.Text = label2.Text.ToString();
                this.btnGuardarMCH.Focus();
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
                this.btnGuardar.Visible = false;
                this.btnGuardarMCH.Visible = false;
                this.panel.Visible = false;
                this.ComboBancos();
                this.txtNro.Focus();
                this.txtNro.Enabled = true;
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
            }
        }

        public void VerRendicion(string idrendicion)
        {
            DataTable table = Consulta.ValidaDocRendicion(idrendicion);
            if ((table.Rows.Count > 0) && (table != null))
            {
            }
        }
    }
}

