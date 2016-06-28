namespace CobranzaALC.Cobranza.Reconstitucion
{
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MenuReporte : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.hddOT.Value = base.Request.QueryString["OT"].ToString();
            }
        }
    }
}

