namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MostrarDomicilios : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                string str = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "deudor");
                this.txtnomDeudor.Text = Session["snomdeudor"].ToString();

                if (Session["snoperacion"] == null)
                    txtNrooperacion.Text = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "estado");
                else txtNrooperacion.Text = Session["snoperacion"].ToString();

                this.txtRutDeudor.Text = Session["srutdeudor"].ToString();

                DataTable table = ConsultasEspecificas.ConMostrarDomicilios(str);
                Session["Excel_domi_cilios"] = table;
                Grilla.DataSource = table;
                Grilla.DataBind();

                if (ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "cerrar").Equals(1))
                    btnCerrar.OnClientClick = "window.close();";
            }
        }
    }
}

