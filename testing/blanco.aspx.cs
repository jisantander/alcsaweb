using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC
{
    public partial class blanco : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            if (Session["RUTA_CODIGO_BARRA_QR"] != null)
            {
                string strRuta = Session["RUTA_CODIGO_BARRA_QR"].ToString();
                Session.Remove("RUTA_CODIGO_BARRA_QR");
                Response.Redirect(strRuta, true);

                return;
            }

            if (Session["Perfil"] != null && Session["Perfil"].ToString() == "2")
                Response.Redirect("Cobranza/Metas/Listado.aspx", true);
        }
    }
}