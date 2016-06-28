namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class BitacoraEstados : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!base.IsPostBack)
            {
                string ot = base.Request.QueryString["ot"].ToString();
                DataTable table = null;
                table = Consulta.BitacoraEstados(ot);
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.ImageButton1.Enabled = true;
                    this.Session["ExcelBitacoraEstados"] = table;                    
                    this.Grilla.DataSource = table;
                    this.Grilla.DataBind();
                    this.Lab_RutCliente.Text = table.Rows[0]["RutCliente"].ToString();
                    this.Lab_NombreCliente.Text = table.Rows[0]["NombreCliente"].ToString();
                    this.Lab_NOperacion.Text = table.Rows[0]["Nrooperacion"].ToString();
                }
                else
                {
                    this.ImageButton1.Enabled = false;
                }
            }
        }
    }
}

