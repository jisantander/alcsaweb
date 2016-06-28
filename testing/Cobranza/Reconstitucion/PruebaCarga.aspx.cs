namespace CobranzaALC.Cobranza.Reconstitucion
{
    using System;
    using System.Data;
    using System.Data.OleDb;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;

    public partial class PruebaCarga : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string str = @"C:\Users\Public\Libro1.xls";
            OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + str.ToString() + ";Extended Properties=Excel 8.0");
            OleDbDataAdapter adapter = new OleDbDataAdapter();
            DataTable dataTable = new DataTable();
            adapter.SelectCommand = new OleDbCommand("SELECT * FROM [carga$]", connection);
            adapter.SelectCommand.Connection = connection;
            connection.Open();
            adapter.Fill(dataTable);
            connection.Close();
        }
    }
}

