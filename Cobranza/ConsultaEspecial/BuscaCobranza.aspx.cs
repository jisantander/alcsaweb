using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using ALCLOCAL;
using System.Data;

namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    public partial class BuscaCobranza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.txtRut.Focus();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
                CargarClientes();
                CargarTribunal();
            }
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }
        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla();
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }
        private void CargaGrilla()
        {
            DataTable table = ConsultasEspecificas.ConsultaGeneralBieneMuebles(this.txtRut.Text, this.txtNroOperacion.Text, this.ddlCliente.SelectedValue, this.ddlTribunal.SelectedValue);
            if (table.Rows.Count > 0)
            {
                lab_Total_Registros.Text = table.Rows.Count.ToString();
                this.Grilla.DataSource = table;
                this.Grilla.DataBind();
                this.Session["ReporteExcelConsultaGeneralBieneMuebles"] = Grilla.DataSource;
            }
            else
            { this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No hay registros por los datos consultados');</script>"); }

            //this.Grilla.DataSource = ALC_FW20.ALCLOCAL.Consulta.ConsultaCobranzaConsulta(this.txtRut.Text, this.txtNroOperacion.Text);
            //this.Grilla.DataBind();
        }
        //Jbaez: se incorpora nueva lista de clientes 19-03-2014
        private void CargarClientes()
        {
            this.ddlCliente.DataTextField = "rsocial";
            this.ddlCliente.DataValueField = "rut_cli";
            this.ddlCliente.DataSource = ALCLOCAL.Consulta.ComboCliente();
            this.ddlCliente.DataBind();
            this.ddlCliente.Items.Insert(0, "Seleccione");
        }
        //Jbaez: se incorpora nueva lista de Tribunal 19-03-2014
        private void CargarTribunal()
        {
            this.ddlTribunal.DataTextField = "descripcion";
            this.ddlTribunal.DataValueField = "id_tribunal";
            this.ddlTribunal.DataSource = ALCLOCAL.Consulta.ComboTribunales();
            this.ddlTribunal.DataBind();
            this.ddlTribunal.Items.Insert(0, "Seleccione");
        }
    }
}