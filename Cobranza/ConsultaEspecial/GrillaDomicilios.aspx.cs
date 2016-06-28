namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    using ALCLOCAL;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class GrillaDomicilios : Page
    {
        private void CargaGrilla(string RutDeudor)
        {
            this.Grilla.DataSource = Consulta.ComboDomicilios(RutDeudor);
            this.Grilla.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                string str = base.Request.QueryString["rut"].ToString();
                if (!string.IsNullOrEmpty(str))
                {
                    this.CargaGrilla(str);
                }
            }
        }
    }
}

