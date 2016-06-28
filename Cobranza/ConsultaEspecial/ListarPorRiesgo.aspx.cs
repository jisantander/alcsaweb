using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ALCLOCAL;


namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    public partial class ListarPorRiesgo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            CargarRiesgos();
            CargarActividadExhorto();
            CargarClientes();
            CargarProcurador();
            CargarTribunal();
           // CargarGrilla(0,null,null,null,null);
        }
        
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarGrilla(0, null,null, null, null);
        }
       
        protected void gvJuicios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrilla(e.NewPageIndex, null, null, null, null);
        }

        private void CargarRiesgos()
        {
            ddlRiesgo.DataSource = new ALCSA.Negocio.Juicios.Riesgo().Listar();
            ddlRiesgo.DataBind();
            ddlRiesgo.Items.Insert(0, "Seleccione");
        }
        //Jbaez: se incorpora nueva lista de actividad exhorto 29-01-2014
        private void CargarActividadExhorto()
        {
            ddlUltimaActividadExhorto.DataTextField = "DESCRIPCION";
            ddlUltimaActividadExhorto.DataValueField = "ID_TRAMITE_EXH";
            ddlUltimaActividadExhorto.DataSource = new ALCSA.Negocio.Cobranzas.ActividadExhorto().Listar(); 
            ddlUltimaActividadExhorto.DataBind();
            ddlUltimaActividadExhorto.Items.Insert(0, "Seleccione");
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
        //Jbaez: se incorpora nueva lista de Procurador 19-03-2014
        private void CargarProcurador()
        {
            this.ddlProcurador.DataTextField = "nombres";
            this.ddlProcurador.DataValueField = "rut";
            this.ddlProcurador.DataSource = Consulta.ComboProcurador();
            this.ddlProcurador.DataBind();
            this.ddlProcurador.Items.Insert(0, "Seleccione");
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
        
        private void CargarGrilla(int indice, string ActividadExhorto,string Cliente, string Procurador,string Tribunal)
        {
            Int32 intIndRiesgo = 0; 
            gvJuicios.PageIndex = indice;
            if (ddlRiesgo.SelectedValue != "Seleccione")
                intIndRiesgo = Convert.ToInt32(ddlRiesgo.SelectedValue);

            System.Data.DataTable objDatos = new ALCSA.Negocio.Juicios.Listado().ListarPorRiesgo(
                intIndRiesgo, 
                ddlUltimaActividadExhorto.SelectedItem.Text, 
                ddlCliente.SelectedValue, 
                ddlProcurador.SelectedValue, 
                ddlTribunal.SelectedValue);

            gvJuicios.DataSource = objDatos;
            gvJuicios.DataBind();

            this.Session["ReporteListarPorRiesgo"] = gvJuicios.DataSource;

            lab_Total_Registros.Text = objDatos.Rows.Count.ToString();
            Label lblFechaRiesgo;
            foreach (GridViewRow objFila in gvJuicios.Rows)
            {
                lblFechaRiesgo = (Label)objFila.FindControl("lblFechaRiesgo");
                if (lblFechaRiesgo.Text.Replace("-", string.Empty).Replace("/", string.Empty) == "01011900")
                    lblFechaRiesgo.Text = "Sin Fecha";
                //Jbaez: Indica El total de registros encontrados 19-03-2014
                  
            }
        }

    }
}