using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC.masters
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Home_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/principal/Menu.aspx");
        }
        protected void Quienes_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/principal/QuienesSomos.aspx");
        }
        protected void Servicios_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/principal/Servicios.aspx");
        }
        protected void Clientes_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/principal/Clientes.aspx");
        }
        protected void Contacto_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/principal/Contacto.aspx");
        }
    }
}