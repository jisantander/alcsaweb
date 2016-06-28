namespace CobranzaALC.Cobranza.listados
{
    using ALCLOCAL;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class Master : Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            if ((this.TextBox1.Text == "9123") && !string.IsNullOrEmpty(this.txtSQL.Text))
            {
                this.Grilla.DataSource = Consulta.Master(this.txtSQL.Text);
                this.Grilla.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.txtSQL.Text = "SELECT name from sysobjects where xtype = 'U' order by name";
                this.txtSQL.Focus();
            }
        }
    }
}

