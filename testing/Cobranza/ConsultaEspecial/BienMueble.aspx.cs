using ALC_FW20.ALCLOCAL;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    public partial class BienMueble : System.Web.UI.Page
    {
        private string rut;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["Usuario"] == null || this.Session["Usuario"].ToString() == "")
            {
                base.Response.Write("<script>alert('Por seguridad expiro la página');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!this.Page.IsPostBack)
            {
                this.rut = base.Request.QueryString["rutdeudor"].ToString();
                this.CargaBienes(this.rut);
            }

            if (ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "cerrar").Equals(1))
                btnCerrar.OnClientClick = "window.close();";
        }
        public void CargaBienes(string rut)
        {
            DataTable bien_Mueble = Consulta.getBien_Mueble(rut);
            if (bien_Mueble.Rows.Count > 0)
            {
                this.Session["BI_MUEBLES"] = bien_Mueble;
                this.Grilla.DataSource = bien_Mueble;
                this.Grilla.DataBind();
            }
        }
    }
}