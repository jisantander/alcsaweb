namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;
    using System.Text;

    public partial class TABLERO2 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack) return;

            this.ComboProcurador();
            this.ComboClientes();
            this.ComboTribunal();
            this.ComboProducto();
            this.ComboAbogados();
            this.ComboTramite();
            this.txtNroOperacion.Focus();
            CargarRemesas(string.Empty);
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.txtRutCliente.Text = "";
            this.txtRutDeudor.Text = "";
            this.txtNroOperacion.Text = "";
            this.cbxbogado.SelectedIndex = 0;
            this.cbxCliente.SelectedIndex = 0;
            this.cbxEstadoJuicio.SelectedIndex = 0;
            this.cbxProcurador.SelectedIndex = 0;
            this.cbxProducto.SelectedIndex = 0;
            this.cbxTribunal.SelectedIndex = 0;
            this.cbxTramite.SelectedIndex = 0;
            this.cbxRemesas.SelectedIndex = 0;
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
            this.lab_Total_Registros.Text = "";
            this.txtNroOperacion.Focus();
        }

        protected void cbxCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarRemesas(cbxCliente.SelectedValue);
        }

        protected void txtRutCliente_TextChanged(object sender, EventArgs e)
        {
            CargarRemesas(txtRutCliente.Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.CargaGrilla(0);
        }

        protected void Grilla_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla(e.NewPageIndex);
        }

        private void CargaGrilla(int indice)
        {
            DataTable table =  ConsultasEspecificas.ConsultaTableroDOS(
                !string.IsNullOrEmpty(this.txtRutCliente.Text) ? this.txtRutCliente.Text.Replace(".", string.Empty).Trim() : this.cbxCliente.SelectedValue,
                this.txtRutDeudor.Text.Replace(".", string.Empty).Trim(),
                this.txtNroOperacion.Text,
                this.cbxProducto.SelectedValue, 
                this.cbxbogado.SelectedValue,
                this.cbxProcurador.SelectedValue,
                this.cbxTribunal.SelectedValue,
                this.cbxEstadoJuicio.SelectedValue, 
                this.cbxTramite.SelectedValue,
                ALCSA.FWK.Web.Control.ExtraerValorComoEntero(cbxRemesas),
                cbxCobranzaConJuicio.SelectedValue.Equals("1") ? true : false,
                ALCSA.FWK.Web.Control.ExtraerValorComoEntero(cbxActividadGestion)
            );

            //Jbaez: Indica El total de registros encontrados 29-12-2013
            lab_Total_Registros.Text =  table.Rows.Count.ToString();

            this.Grilla.PageIndex = indice;
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();

            ConcatenarDatosFiltro();
        }

        private void ConcatenarDatosFiltro()
        {
            StringBuilder strbTexto = new StringBuilder();
            strbTexto.AppendFormat("par1={0}&", !string.IsNullOrEmpty(this.txtRutCliente.Text) ? this.txtRutCliente.Text.Replace(".", string.Empty).Trim() : this.cbxCliente.SelectedValue);
            strbTexto.AppendFormat("par2={0}&", this.txtRutDeudor.Text.Replace(".", string.Empty).Trim());
            strbTexto.AppendFormat("par3={0}&", this.txtNroOperacion.Text);
            strbTexto.AppendFormat("par4={0}&", this.cbxProducto.SelectedValue);
            strbTexto.AppendFormat("par5={0}&", this.cbxbogado.SelectedValue);
            strbTexto.AppendFormat("par6={0}&", this.cbxProcurador.SelectedValue);
            strbTexto.AppendFormat("par7={0}&", this.cbxTribunal.SelectedValue);
            strbTexto.AppendFormat("par8={0}&", this.cbxEstadoJuicio.SelectedValue);
            strbTexto.AppendFormat("par9={0}&", this.cbxTramite.SelectedValue);
            strbTexto.AppendFormat("par10={0}&", ALCSA.FWK.Web.Control.ExtraerValorComoEntero(cbxRemesas));
            strbTexto.AppendFormat("par11={0}&", ALCSA.FWK.Web.Control.ExtraerValorComoEntero(cbxCobranzaConJuicio));
            strbTexto.AppendFormat("par12={0}", ALCSA.FWK.Web.Control.ExtraerValorComoEntero(cbxActividadGestion));
            hdfFiltro.Value = strbTexto.ToString();
        }

        private void ComboAbogados()
        {
            this.cbxbogado.DataSource = Consulta.ComboAbogados();
            this.cbxbogado.DataBind();
            this.cbxbogado.Items.Insert(0, "Seleccione");
        }

        private void ComboClientes()
        {
            this.cbxCliente.DataSource = Consulta.ComboCliente();
            this.cbxCliente.DataBind();
            this.cbxCliente.Items.Insert(0, "Seleccione");
        }

        private void ComboProcurador()
        {
            this.cbxProcurador.DataSource = Consulta.ComboProcurador();
            this.cbxProcurador.DataBind();
            this.cbxProcurador.Items.Insert(0, "Seleccione");
        }

        private void ComboProducto()
        {
            this.cbxProducto.DataSource = Consulta.ComboProductoNew();
            this.cbxProducto.DataBind();
            this.cbxProducto.Items.Insert(0, "Seleccione");
        }

        private void ComboTramite()
        {
            this.cbxTramite.DataSource = Consulta.ComboTramiteAll();
            this.cbxTramite.DataBind();
            this.cbxTramite.Items.Insert(0, "Seleccione");
        }

        private void ComboTribunal()
        {
            this.cbxTribunal.DataSource = Consulta.ComboTribunales();
            this.cbxTribunal.DataBind();
            this.cbxTribunal.Items.Insert(0, "Seleccione");
        }

        private void CargarRemesas(string rutCliente)
        {
            cbxRemesas.DataSource = new ALCSA.Negocio.Cobranzas.Remesa().Listar(rutCliente);
            cbxRemesas.DataBind();
            cbxRemesas.Items.Insert(0, new ListItem("Seleccione", "0"));
        }
    }
}

