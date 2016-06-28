namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ConsultaGastos : Page
    {
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.txtRut.Text = "";
            this.txtNrooperacion.Text = "";
            this.txtfechafin.Text = "";
            this.txtFechainicio.Text = "";
            this.txtRemesa.Text = "";
            this.txtNombreCliente.Text = "";
            this.cbxTipoGastos.SelectedIndex = 0;
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
            this.cbxRemesaAll.SelectedIndex = 0;
        }

        private void CargaGrilla()
        {
            DataTable table = null;
            table = ConsultasEspecificas.ConsultaReconstitucionGastos(this.cbxTipoGastos.SelectedValue.ToString(), this.txtRut.Text.ToString(), this.txtNrooperacion.Text.ToString(), this.txtFechainicio.Text.ToString(), this.txtfechafin.Text.ToString(), this.txtRemesa.Text.ToString(), this.txtNombreCliente.Text.ToString());
            this.Session["Excel_GastosReconstituciones"] = table;
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();
        }

        protected void cbxEstados_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
        }

        protected void cbxRemesaAll_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.txtRemesa.Text = this.cbxRemesaAll.SelectedValue.ToString();
        }

        private void ComboEstados()
        {
            this.cbxTipoGastos.DataTextField = "descripcion";
            this.cbxTipoGastos.DataValueField = "id";
            this.cbxTipoGastos.DataSource = Consulta.CombotiposEstadosReconstitucion();
            this.cbxTipoGastos.DataBind();
            this.cbxTipoGastos.Items.Insert(0, "Seleccione");
        }

        private void ComboRemesa()
        {
            this.cbxRemesaAll.DataTextField = "remesa";
            this.cbxRemesaAll.DataValueField = "remesa";
            this.cbxRemesaAll.DataSource = Consulta.ComboRemesaAll();
            this.cbxRemesaAll.DataBind();
            this.cbxRemesaAll.Items.Insert(0, "");
        }

        public void Editar(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla();
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        public void habilitar()
        {
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
                this.ComboEstados();
                this.habilitar();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
                this.ComboEstados();
                this.ComboRemesa();
            }
        }
    }
}

