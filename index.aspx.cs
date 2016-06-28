using AjaxControlToolkit;
using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string a = "";
            if (!string.IsNullOrEmpty(base.Request.QueryString["p"]))
            {
                a = base.Request.QueryString["p"].ToString();
            }
            if (a == "uno")
            {
                this.panel1.Visible = true;
                this.HyperLink3.CssClass = "current";
            }
            if (a == "dos")
            {
                this.panel2.Visible = true;
                this.HyperLink6.CssClass = "current";
            }
            if (a == "tres")
            {
                this.panel3.Visible = true;
                this.HyperLink5.CssClass = "current";
            }
            if (a == "cuatro")
            {
                this.panel4.Visible = true;
            }
            if (a == "cinco")
            {
                this.panel5.Visible = true;
            }
            if (a == "seis")
            {
                this.panel6.Visible = true;
            }
            if (a == "")
            {
                this.HyperLink9.CssClass = "current";
                this.panel7.Visible = true;
            }
        }
    }
}