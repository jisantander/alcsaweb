namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;

    public partial class LimpiaTablas : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                Transaccion.LimpiaTablas();
            }
        }
    }
}

