using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["Usuario"] == null || this.Session["Usuario"].ToString() == "")
            {
                base.Response.Write("<script>alert('Por seguridad expiro la página');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            this.Page.RegisterHiddenField("USUARIO", this.Session["Usuario"].ToString());
           
        }
    }
}