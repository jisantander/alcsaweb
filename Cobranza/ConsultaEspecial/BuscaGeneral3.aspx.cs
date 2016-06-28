namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class BuscaGeneral3 : Page
    {

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        private void CargaGrilla()
        {
            DataTable table = ConsultasEspecificas.ConsultaGeneralBieneRaices(this.txtRut.Text, this.txtNroOperacion.Text, this.ddlCliente.SelectedValue, this.ddlTribunal.SelectedValue);
            if (table.Rows.Count > 0)
            {
                this.Session["snomdeudor"] = table.Rows[0]["nomdeudor"].ToString();
                this.Session["srutdeudor"] = table.Rows[0]["rut_deudor"].ToString();
                lab_Total_Registros.Text = table.Rows.Count.ToString();
                this.Grilla.DataSource = table;
                this.Grilla.DataBind();
                this.Session["ReporteExcelConsultaGeneralBieneRaices"] = Grilla.DataSource;
            }
            else
            { this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No hay registros por los datos consultados');</script>"); }
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
        }
        //Jbaez: se incorpora nueva lista de clientes 19-03-2014
        private void CargarClientes()
        {
            this.ddlCliente.DataTextField = "rsocial";
            this.ddlCliente.DataValueField = "rut_cli";
            this.ddlCliente.DataSource = Consulta.ComboCliente();
            this.ddlCliente.DataBind();
            this.ddlCliente.Items.Insert(0, "Seleccione");
        }      
        //Jbaez: se incorpora nueva lista de Tribunal 19-03-2014
        private void CargarTribunal()
        {
            this.ddlTribunal.DataTextField = "descripcion";
            this.ddlTribunal.DataValueField = "id_tribunal";
            this.ddlTribunal.DataSource = Consulta.ComboTribunales();
            this.ddlTribunal.DataBind();
            this.ddlTribunal.Items.Insert(0, "Seleccione");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.txtRut.Focus();
                this.habilitar();
                CargarClientes();                
                CargarTribunal();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
            }
        }

        protected void btnAccion_Click(object sender, ImageClickEventArgs e)
        {        
            string strId = ((ImageButton)sender).CommandArgument;
            Response.Redirect(string.Format("/Cobranza/procesos/MostrarBienRaiz.aspx?Datos={0}", strId), true);       
        }
    }
}

