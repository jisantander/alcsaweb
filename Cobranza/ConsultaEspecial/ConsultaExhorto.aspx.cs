//using ALC_FW20.ALCLOCAL;
using ALCLOCAL;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    public partial class ConsultaExhorto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["Usuario"] == null || this.Session["Usuario"].ToString() == "")
            {
                base.Response.Write("<script>alert('Por seguridad expiro la página');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            this.Session["Perfil"] = Session["Perfil"];
            if (!this.Page.IsPostBack)
            {
                this.txtRol.Focus();
                this.ComboTribunal();
                this.LlenarComboComunas();
                this.ComboClientes();
                this.ComboResponsables();
                this.ComboActividadExhorto();
                this.ComboEstadoExhorto();
               
                 if (!String.IsNullOrEmpty(Request.QueryString["id_tribunal"]))
                {
                    //jbaez:se incorporan las comunas destino 08122013
                     this.txtRol.Text=Session["txtRol"].ToString()  ;
                     this.dtribunal.SelectedValue = Session["dtribunal"].ToString();
                     this.txtRutDeudor.Text = Session["txtRutDeudor"].ToString();
                     this.ddlClientes.SelectedValue = this.Session["ddlClientes"].ToString();
                     this.ddlComunas.SelectedValue = this.Session["ddlComunas"].ToString();
                     this.ddlResponsable.SelectedValue = this.Session["ddlResponsable"].ToString();
                     this.ddlUltimaActividadExhorto.SelectedItem.Text = this.Session["ddlUltimaActividadExhorto"].ToString();
                     this.ddlEstadoExhorto.SelectedValue = this.Session["ddlEstadoExhorto"].ToString();
                     btnBuscar_Click(sender, e);                     
                }
                

            }                      
        }
        
        #region Llenado de campos de listas
        public void limpia_campos ()
        {
            this.lab_Id_Tribunales.Text="";
            this.txtRutDeudor.Text = "";
            lab_Total_Registros.Text = "";
        }

        public void LlenarComboComunas()
        {
            this.ddlComunas.DataTextField = "descripcion";
            this.ddlComunas.DataValueField = "id_comuna";
            this.ddlComunas.DataSource = Consulta.ComboComunaGeneral();
            this.ddlComunas.DataBind();
            this.ddlComunas.Items.Insert(0, "Seleccione");
        }
        //Jbaez: se incluye los estado de los exhorto 07-01-2014
        public void ComboEstadoExhorto()
        {
            this.ddlEstadoExhorto.DataTextField = "descripcion";
            this.ddlComunas.DataValueField = "codigo";
            this.ddlEstadoExhorto.DataSource = Consulta.ComboEstadoExhorto();
            this.ddlEstadoExhorto.DataBind();
            this.ddlEstadoExhorto.Items.Insert(0, "Seleccione");
        }

        public void ComboActividadExhorto()
        {
            this.ddlUltimaActividadExhorto.DataTextField = "descripcion";
            this.ddlUltimaActividadExhorto.DataValueField = "id_tramite_exh";
            this.ddlUltimaActividadExhorto.DataSource = Consulta.ComboTramiteExhorto();
            this.ddlUltimaActividadExhorto.DataBind();
            this.ddlUltimaActividadExhorto.Items.Insert(0, "Seleccione");
        }

        public void ComboClientes()
        {
            this.ddlClientes.DataTextField = "rsocial";
            this.ddlClientes.DataValueField = "rut_cli";
            this.ddlClientes.DataSource = Consulta.ComboCliente();
            this.ddlClientes.DataBind();
            this.ddlClientes.Items.Insert(0,"Seleccione");
        }
        
        public void ComboResponsables()
        {
            this.ddlResponsable.DataTextField = "nombres";
            this.ddlResponsable.DataValueField = "rut";
            this.ddlResponsable.DataSource = Consulta.ComboProcurador();
            this.ddlResponsable.DataBind();
            this.ddlResponsable.Items.Insert(0,"Seleccione");
        }

        private void ComboTribunal()
        {
            this.dtribunal.DataTextField = "descripcion";
            this.dtribunal.DataValueField = "id_tribunal";
            this.dtribunal.DataSource = Consulta.ComboTribunales();
            this.dtribunal.DataBind();
            this.dtribunal.Items.Insert(0, "Seleccione");
        }

        protected void dtribunal_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.lab_Id_Tribunales.Text = this.dtribunal.SelectedValue.ToString();
        }
        #endregion

        #region buscar registro
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            //jbaez:se incorporan las comunas destino 08122013
            this.Session["txtRol"] = this.txtRol.Text;
            this.Session["dtribunal"] = this.dtribunal.SelectedValue;
            this.Session["txtRutDeudor"] = this.txtRutDeudor.Text;
            this.Session["ddlClientes"] = this.ddlClientes.SelectedValue;
            this.Session["ddlComunas"] = this.ddlComunas.SelectedValue;
            this.Session["ddlResponsable"] = this.ddlResponsable.SelectedValue;
            this.Session["ddlUltimaActividadExhorto"] = this.ddlUltimaActividadExhorto.SelectedItem.Text;
            this.Session["ddlEstadoExhorto"] = this.ddlEstadoExhorto.SelectedValue;

            DataTable dataTable = this.ConsultaEspAbonos(
                this.txtRol.Text,
                this.dtribunal.SelectedValue,
                this.txtRutDeudor.Text,
                this.ddlClientes.SelectedValue,
                this.ddlComunas.SelectedValue,
                this.ddlResponsable.SelectedValue,
                this.ddlUltimaActividadExhorto.SelectedItem.Text,
                this.ddlEstadoExhorto.SelectedValue
            );

            if (dataTable.Rows.Count > 0)
            {
                this.Session["ExcelExhorto"] = dataTable;
                this.Grilla.DataSource = dataTable;
                //Jbaez: Indica El total de registros encontrados 29-12-2013
                lab_Total_Registros.Text = dataTable.Rows.Count.ToString();
                this.Grilla.DataBind();
            }
            else
            {
                this.Grilla.DataSource = null;
                this.Grilla.DataBind();
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No existe registro para el filtro ingresado');</script>");
            }
        }
        
        public DataTable ConsultaEspAbonos(string Rol, string tribunal, string deudor, string cliente, string ComunaDestino,string Responsable,string ActividadExhorto,string EstadoExhorto)
        {
            if (string.IsNullOrEmpty(Rol)) Rol = null;

            int? num;
            if (tribunal == "Seleccione") num = null;
            else
            {
                if (string.IsNullOrEmpty(tribunal)) num = null;
                else num = new int?(Convert.ToInt32(tribunal));
            }

            if (string.IsNullOrEmpty(deudor)) deudor = null;
            if (cliente == "Seleccione") cliente = null;
            if (ComunaDestino == "Seleccione") ComunaDestino = null;
            if (Responsable == "Seleccione") Responsable = null;
            if (ActividadExhorto == "Seleccione") ActividadExhorto = null;
            if (EstadoExhorto == "Seleccione") EstadoExhorto = null;

            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("spALC_ConsultaExhorto", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@rol_Exhorto", SqlDbType.VarChar).Value = Rol;
            sqlCommand.Parameters.Add("@id_tribunal", SqlDbType.Int).Value = num;
            sqlCommand.Parameters.Add("@rut_deudor", SqlDbType.VarChar).Value = deudor;
            sqlCommand.Parameters.Add("@rut_cli", SqlDbType.VarChar).Value = cliente; 
           // sqlCommand.Parameters.Add("@cliente", SqlDbType.VarChar).Value = cliente;
            sqlCommand.Parameters.Add("@ComunaDestino", SqlDbType.VarChar).Value = ComunaDestino;
            sqlCommand.Parameters.Add("@Responsable", SqlDbType.VarChar).Value = Responsable;
            sqlCommand.Parameters.Add("@ActividadExhorto", SqlDbType.VarChar).Value = ActividadExhorto;
            sqlCommand.Parameters.Add("@EstadoExhorto", SqlDbType.VarChar).Value = EstadoExhorto;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        #endregion
    }
}