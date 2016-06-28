using ALC_FW20.ALCLOCAL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    public partial class popBienes : System.Web.UI.Page
    {
        private string rut;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.rut = base.Request.QueryString["Codigo"].ToString();
                this.CargaBienes(this.rut);
            }
        }
        public void CargaBienes(string rut)
        {
            DataTable bien_Mueble = Consulta.getBien_Mueble(rut);
            if (bien_Mueble.Rows.Count > 0)
            {
                this.Grilla.DataSource = bien_Mueble;
                this.Grilla.DataBind();
            }
            DataTable bien_Raiz = Consulta.getBien_Raiz(rut);
            if (bien_Raiz.Rows.Count > 0)
            {
                this.Grilla2.DataSource = bien_Raiz;
                this.Grilla2.DataBind();
            }
        }
    }
}