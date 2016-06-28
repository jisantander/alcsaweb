using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Requerimientos
{
    public partial class Listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            if (Session["Usuario"] == null)
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }

            ALCSA.FWK.Web.Control.AsignarValor(hdfUsuario, Session["Usuario"].ToString());

            CargarGrilla();
        }

        private void CargarGrilla()
        {
            string strUsuarioRevision = ConfigurationManager.AppSettings["USUARIO_REVISION"];
            string strUsuarioActual = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuario);

            gvRequerimientos.DataSource = new ALCSA.Negocio.Requerimientos.Requerimiento().Listar(strUsuarioRevision != strUsuarioActual ? strUsuarioActual : string.Empty);
            gvRequerimientos.DataBind();
        }
    }
}