namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ReconstitucionGastos : Page
    {
        
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string str;
            if (this.Session["Perfil"].ToString() == "1")
            {
                Transaccion.InsertaGastoReconstituciones(this.hddOT.Value.ToString(), this.cbxTipoGastos.SelectedValue.ToString(), this.cbxFormaPago.SelectedValue.ToString(), this.txtNroDocumento.Text.ToString(), this.txtMontoGasto.Text.ToString(), this.txtobservacion.Text.ToString(), this.Session["Usuario"].ToString(), this.cbxEstadoGasto.SelectedValue.ToString());
                str = "ReconstitucionGastos.aspx?OT=" + this.hddOT.Value.ToString() + "&rut=" + this.txtRut.Text.ToString() + "&nrooperacion=" + this.txtnrooperacion.Text.ToString() + "&nombre=" + this.txtnombre.Text.ToString() + "&responsable=" + this.txtResponsable.Text.ToString();
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');location.href='" + str.ToString() + "';</script>");
            }
            else if (!Consulta.ValidaIngreGastoRecon(this.hddOT.Value.ToString(), this.cbxTipoGastos.SelectedValue.ToString()))
            {
                Transaccion.InsertaGastoReconstituciones(this.hddOT.Value.ToString(), this.cbxTipoGastos.SelectedValue.ToString(), this.cbxFormaPago.SelectedValue.ToString(), this.txtNroDocumento.Text.ToString(), this.txtMontoGasto.Text.ToString(), this.txtobservacion.Text.ToString(), this.Session["Usuario"].ToString(), this.cbxEstadoGasto.SelectedValue.ToString());
                str = "ReconstitucionGastos.aspx?OT=" + this.hddOT.Value.ToString() + "&rut=" + this.txtRut.Text.ToString() + "&nrooperacion=" + this.txtnrooperacion.Text.ToString() + "&nombre=" + this.txtnombre.Text.ToString() + "&responsable=" + this.txtResponsable.Text.ToString();
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');location.href='" + str.ToString() + "';</script>");
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Ya se ingreso un gasto para est\x00e1 OT y este Tipo de Gasto');</script>");
            }
        }

        private void ComboEstados()
        {
            this.cbxTipoGastos.DataTextField = "descripcion";
            this.cbxTipoGastos.DataValueField = "id";
            this.cbxTipoGastos.DataSource = Consulta.CombotiposEstadosReconstitucion();
            this.cbxTipoGastos.DataBind();
            this.cbxTipoGastos.Items.Insert(0, "Seleccione");
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
                string str = base.Request.QueryString["OT"].ToString();
                this.hddOT.Value = str;
                this.txtOT.Text = str;
                this.ComboEstados();
                this.txtRut.Text = base.Request.QueryString["rut"].ToString();
                this.txtnrooperacion.Text = base.Request.QueryString["nrooperacion"].ToString();
                this.txtnombre.Text = base.Request.QueryString["nombre"].ToString();
                this.txtResponsable.Text = base.Request.QueryString["responsable"].ToString();
                this.txtFechaGasto.Text = DateTime.Now.ToString("dd-MM-yyyy");
            }
        }
    }
}

