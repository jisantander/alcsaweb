using System;
using System.Web.UI;

namespace CobranzaALC.principal
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Home_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("Menu.aspx");
        }
    }
}