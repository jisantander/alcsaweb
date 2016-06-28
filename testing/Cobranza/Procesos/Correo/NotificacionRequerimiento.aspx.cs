using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Procesos.Correo
{
    public partial class NotificacionRequerimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.EnableViewState = false;

            int intId = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_req");
            int intCreacion = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "creacion");

            ALCSA.Negocio.Requerimientos.Requerimiento objRequerimiento = new ALCSA.Negocio.Requerimientos.Requerimiento(intId);
            if (objRequerimiento.ID < 1) return;

            ALCSA.FWK.Web.Control.AsignarValor(lblFecha, objRequerimiento.FechaIngreso, true);
            ALCSA.FWK.Web.Control.AsignarValor(lblEstado, objRequerimiento.NombreEstado);
            ALCSA.FWK.Web.Control.AsignarValor(lblSolicitante, objRequerimiento.UsuarioSolicitante);
            ALCSA.FWK.Web.Control.AsignarValor(lblDescripcion, objRequerimiento.Descripcion); 
        }
    }
}