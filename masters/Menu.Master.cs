using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.masters
{
    public partial class Menu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnQuienes_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/principal/QuienesSomos.aspx");
        }
        protected void btnClientes_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/principal/Clientes.aspx");
        }
        protected void btnServicio_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/principal/Servicios.aspx");
        }
        protected void btnEquipo_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/principal/Equipo.aspx");
        }
        protected void btnCobertura_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/principal/cobertura.aspx");
        }
        protected void btnContacto_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/principal/contacto.aspx");
        }
        protected void btnDocumentos_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/principal/SolicitudDocuemntos.aspx");
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