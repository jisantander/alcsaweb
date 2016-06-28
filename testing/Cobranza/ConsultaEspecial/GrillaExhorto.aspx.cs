namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    using ALCLOCAL;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class GrillaExhorto : Page
    {
        private void CargaGrilla(string idjuicio)
        {
            this.Grilla.DataSource = Consulta.ComboExhorto(idjuicio);
            this.Grilla.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                string str = base.Request.QueryString["idjuicio"].ToString();
                if (!string.IsNullOrEmpty(str))
                {
                    this.CargaGrilla(str);
                }
            }
        }
    }
}

