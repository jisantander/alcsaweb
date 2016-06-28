using System;
using ALCLOCAL;
using ALCGLOBAL;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Requerimientos
{
    public partial class ReqAlc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }
        private void CargaGrilla()
        {
            this.Grilla.DataSource = Consulta.RequerimientosALC();
            this.Grilla.DataBind();
        }
    }
}