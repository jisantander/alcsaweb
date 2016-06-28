using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Procesos.CallCenter
{
    public partial class ListadoComentarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gvComentariosCallCenter.DataSource = new ALCSA.Negocio.CallCenter.Comentario().Listar(
                ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_cob"),
                ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_cam"));
            gvComentariosCallCenter.DataBind();
        }
    }
}