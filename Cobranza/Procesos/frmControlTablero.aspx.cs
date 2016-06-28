using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Procesos
{
    public partial class frmControlTablero : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["Usuario"] == null || this.Session["Usuario"].ToString() == "")
            {
                base.Response.Write("<script>alert('Por seguridad expiro la página');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }

            Label1.Text = this.Session["perfil"].ToString();
            if (!this.Page.IsPostBack)
            {
                //Jbaez: se modifica por solicitud de jose ignacion requerimiento llamado "Perfil Procurador" 
                //fecha: 15-11-2013
                if (this.Session["perfil"].ToString() == "2" || this.Session["perfil"].ToString() == "1")//"cvillarroel" || this.Session["Usuario"].ToString() == "jsantander" || this.Session["Usuario"].ToString() == "mnarvaez" || this.Session["Usuario"].ToString() == "jisantander")
                {
                    base.Response.Redirect("Tablero2.aspx");
                }
                else
                {
                    // base.Response.Write("<center><b><h1>USTED NO ESTA AUTORIZADO PARA ESTA OPCION!!</h1></b></center>");
                }
            }
        }
    }
}