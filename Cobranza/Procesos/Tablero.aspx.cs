namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class Tablero : Page
    {


        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
        }

        private void CargaGrilla()
        {
            DataTable table = null;
            table = ConsultasEspecificas.ConsultaTablero(this.txtCliente.Text.Replace(".", ""), this.txtRut.Text.Replace(".", ""), this.tribunal.SelectedValue, this.estadocobranza.SelectedValue, this.producto.SelectedValue, this.tipocobranza.SelectedValue, this.txtProcurador.Text.Replace(".", ""), this.txtNroOperacion.Text, this.abogado.SelectedValue);
            this.Session["Excel"] = table;
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();
        }

        private void ComboAbogados()
        {
            this.abogado.DataTextField = "nombres";
            this.abogado.DataValueField = "rut";
            this.abogado.DataSource = Consulta.ComboAbogados();
            this.abogado.DataBind();
            this.abogado.Items.Insert(0, "Seleccione");
        }

        private void ComboProducto()
        {
            this.producto.DataTextField = "descripcion";
            this.producto.DataValueField = "id_producto";
            this.producto.DataSource = Consulta.ComboProductoLimitado();
            this.producto.DataBind();
        }

        private void ComboTribunal()
        {
            this.tribunal.DataTextField = "descripcion";
            this.tribunal.DataValueField = "id_tribunal";
            this.tribunal.DataSource = Consulta.ComboTribunales();
            this.tribunal.DataBind();
            this.tribunal.Items.Insert(0, "Seleccione");
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla();
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        public void habilitar()
        {
            this.txtRut.BackColor = Color.LightYellow;
            this.txtNroOperacion.BackColor = Color.LightYellow;
            this.txtCliente.BackColor = Color.LightYellow;
            this.txtProcurador.BackColor = Color.LightYellow;
            this.tribunal.BackColor = Color.LightYellow;
            this.producto.BackColor = Color.LightYellow;
            this.tipocobranza.BackColor = Color.LightYellow;
            this.estadocobranza.BackColor = Color.LightYellow;
            this.abogado.BackColor = Color.LightYellow;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.ComboProducto();
                this.ComboTribunal();
                this.ComboAbogados();
                this.txtRut.Focus();
                this.habilitar();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
            }
        }
    }
}

