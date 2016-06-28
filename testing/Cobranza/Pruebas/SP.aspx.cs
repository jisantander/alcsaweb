namespace CobranzaALC.Cobranza.Pruebas
{
    using System;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class SP : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand selectCommand = new SqlCommand("datos", connection) {
                CommandType = CommandType.StoredProcedure
            };
            selectCommand.Parameters.Add("@id", SqlDbType.VarChar).Value = "1";
            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            this.GridView1.DataSource = dataTable;
            this.GridView1.DataBind();
            connection.Close();
            connection = null;
        }
    }
}

