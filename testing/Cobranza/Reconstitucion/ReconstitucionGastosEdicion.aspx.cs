namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ReconstitucionGastosEdicion : Page
    {
        public GridViewRow gridViewRow = null;

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
        }

        protected void btnnuevoEstado_Click(object sender, EventArgs e)
        {
            Transaccion.EditarGastoReconst(this.cbxEstadoGasto.SelectedValue.ToString(), this.txtObservacion.Text.ToString(), this.hddidGasto.Value.ToString(), this.txtNrodocumento.Text.ToString(), this.cbxTipoGastos.SelectedValue.ToString(), this.cbxFormaPago.SelectedValue.ToString());
            Transaccion.InsertaBitacoraGastosRecons(this.hddEstadoGasto.Value.ToString(), this.hddobservacion.Value.ToString(), this.Session["Usuario"].ToString(), this.hddidGasto.Value.ToString(), this.hddNroDocumento.Value.ToString(), this.hddTipoGasto.Value.ToString());
            ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Error", "alert('Gasto editado satisfactoriamente');window.location.href='ReconstitucionGastosEdicion.aspx" + ("?OT=" + this.hddOT.Value.ToString() + "&rut=" + this.txtRut.Text.ToString() + "&nrooperacion=" + this.txtnrooperacion.Text.ToString() + "&nombre=" + this.txtnombre.Text.ToString()) + "';", true);
        }

        private void ComboEstados()
        {
            this.cbxTipoGastos.DataTextField = "descripcion";
            this.cbxTipoGastos.DataValueField = "id";
            this.cbxTipoGastos.DataSource = Consulta.CombotiposEstadosReconstitucion();
            this.cbxTipoGastos.DataBind();
            this.cbxTipoGastos.Items.Insert(0, "Seleccione");
        }

        public void Editar(object sender, GridViewCommandEventArgs e)
        {
            Label label;
            Label label3;
            this.gridViewRow = ((Control) e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Editar") == 0)
            {
                label = (Label) this.gridViewRow.FindControl("lblIDGASTO");
                label3 = (Label) this.gridViewRow.FindControl("lblEstadogasto");
                if (label3.Text.ToString() == "RECEPCION_BOLETA")
                {
                    ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "", "alert('Estado Recepci\x00f3n Boleta no puede ser eliminado');", true);
                }
                else
                {
                    Transaccion.EliminarGastoReconst(label.Text.ToString());
                    ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Error", "alert('Gasto eliminado satisfactoriamente');window.location.href='ReconstitucionGastosEdicion.aspx" + ("?OT=" + this.hddOT.Value.ToString() + "&rut=" + this.txtRut.Text.ToString() + "&nrooperacion=" + this.txtnrooperacion.Text.ToString() + "&nombre=" + this.txtnombre.Text.ToString()) + "';", true);
                }
            }
            if (e.CommandName.CompareTo("EditaGasto") == 0)
            {
                label = (Label) this.gridViewRow.FindControl("lblIDGASTO");
                Label label2 = (Label) this.gridViewRow.FindControl("lblOBSERVACION");
                label3 = (Label) this.gridViewRow.FindControl("lblEstadogasto");
                Label label4 = (Label) this.gridViewRow.FindControl("lblNroDocumento");
                Label label5 = (Label) this.gridViewRow.FindControl("lblIdTipoGastoss");
                Label label6 = (Label) this.gridViewRow.FindControl("lblforPAGO");
                if (label3.Text.ToString() == "RECEPCION_BOLETA")
                {
                    ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "", "alert('Estado Recepci\x00f3n Boleta no puede ser editado');", true);
                }
                else
                {
                    this.lblestado.Visible = true;
                    this.cbxEstadoGasto.Visible = true;
                    this.cbxTipoGastos.Visible = true;
                    this.lblObservacion.Visible = true;
                    this.lblNroDoc.Visible = true;
                    this.lblTipodeGasto.Visible = true;
                    this.txtObservacion.Visible = true;
                    this.txtNrodocumento.Visible = true;
                    this.btnnuevoEstado.Visible = true;
                    this.lblFormaPago.Visible = true;
                    this.cbxFormaPago.Visible = true;
                    if (label6.Text.ToUpper() == "EFECTIVO")
                    {
                        this.cbxFormaPago.SelectedValue = "1";
                    }
                    if (label6.Text.ToUpper() == "CHEQUE")
                    {
                        this.cbxFormaPago.SelectedValue = "2";
                    }
                    if (label6.Text.ToUpper() == "TRANSFERENCIA ELECTRONICA")
                    {
                        this.cbxFormaPago.SelectedValue = "3";
                    }
                    this.ComboEstados();
                    this.cbxTipoGastos.SelectedValue = label5.Text.ToString();
                    this.cbxEstadoGasto.SelectedValue = label3.Text.ToString();
                    this.txtNrodocumento.Text = label4.Text.ToString();
                    this.hddNroDocumento.Value = label4.Text.ToString();
                    this.hddidGasto.Value = label.Text.ToString();
                    this.hddobservacion.Value = label2.Text.ToString();
                    this.hddEstadoGasto.Value = label3.Text.ToString();
                    this.hddTipoGasto.Value = label5.Text.ToString();
                }
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
                this.lblestado.Visible = false;
                this.cbxEstadoGasto.Visible = false;
                this.cbxTipoGastos.Visible = false;
                this.lblObservacion.Visible = false;
                this.lblNroDoc.Visible = false;
                this.lblTipodeGasto.Visible = false;
                this.txtObservacion.Visible = false;
                this.txtNrodocumento.Visible = false;
                this.btnnuevoEstado.Visible = false;
                this.lblFormaPago.Visible = false;
                this.cbxFormaPago.Visible = false;
                string oT = base.Request.QueryString["OT"].ToString();
                this.hddOT.Value = oT;
                this.txtOT.Text = oT;
                this.ComboEstados();
                this.txtRut.Text = base.Request.QueryString["rut"].ToString();
                this.txtnrooperacion.Text = base.Request.QueryString["nrooperacion"].ToString();
                this.txtnombre.Text = base.Request.QueryString["nombre"].ToString();
                DataTable table = null;
                table = ConsultasEspecificas.MuestraEdicionGasto(oT);
                this.grilla.DataSource = table;
                this.grilla.DataBind();
            }
        }
    }
}

