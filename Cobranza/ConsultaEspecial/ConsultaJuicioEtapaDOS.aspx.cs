using ALC_FW20.ALCLOCAL;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using ALCLOCAL;

namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    public partial class ConsultaJuicioEtapaDOS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.Tramite();
                CargarClientes();
                CargarTribunal();
                this.casos.Text = "0";
            }
        }
        //Jbaez: se incorpora nueva lista de Cliente 08-04-2014
        private void CargarClientes()
        {
            this.ddlCliente.DataTextField = "rsocial";
            this.ddlCliente.DataValueField = "rut_cli";
            this.ddlCliente.DataSource = ALCLOCAL.Consulta.ComboCliente();
            this.ddlCliente.DataBind();
            this.ddlCliente.Items.Insert(0, "Seleccione");
        }
        //Jbaez: se incorpora nueva lista de Tribunal 08-04-2014
        private void CargarTribunal()
        {
            this.ddlTribunal.DataTextField = "descripcion";
            this.ddlTribunal.DataValueField = "id_tribunal";
            this.ddlTribunal.DataSource = ALCLOCAL.Consulta.ComboTribunales();
            this.ddlTribunal.DataBind();
            this.ddlTribunal.Items.Insert(0, "Seleccione");
        }

        private void Tramite()
        {
            this.tramite.DataTextField = "etapa";
            this.tramite.DataValueField = "etapa";
            this.tramite.DataSource = ALC_FW20.ALCLOCAL.Consulta.TramiteGeneral();
            this.tramite.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        }

        public static DataTable ConsultaEtapas(string stretapa,string strCliente,string strTribunal,string strEstadoJuicio)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("SPALC_JUICIO_ETAPA_DOS", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@ETAPA", SqlDbType.VarChar).Value = stretapa;
            sqlCommand.Parameters.Add("@CLIENTE", SqlDbType.VarChar).Value = strCliente;
            sqlCommand.Parameters.Add("@TRIBUNAL", SqlDbType.VarChar).Value = strTribunal;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            string etapa = this.tramite.SelectedValue.ToString();
            DataTable dataTable = ConsultaJuicioEtapaDOS.ConsultaEtapas(etapa, this.ddlCliente.SelectedValue, this.ddlTribunal.SelectedValue, string.Empty);
            this.casos.Text = dataTable.Rows.Count.ToString();
            this.Grilla.DataSource = dataTable;
            this.Grilla.DataBind();

            this.Session["ReporteExcelJuicioEtapa"] = Grilla.DataSource;
            this.Session["srutdeudor"] = "1"; 
            this.Session["snomdeudor"] = "2"; 
        }
        protected void tramite_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
            this.casos.Text = "0";
        }

        protected void Grilla_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            this.Session["srutdeudor"] = Grilla.SelectedRow.Cells[1].Text; 
            this.Session["snomdeudor"] = Grilla.SelectedRow.Cells[2].Text; 
        }
    }
}