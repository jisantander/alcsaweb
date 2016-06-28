using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Procesos.Correo
{
    public partial class FormatoAvisoSuspencionAcciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.EnableViewState = false;
            int intIdJuicio = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_juicio");

            lblFecha.Text = string.Format("{0:dd} de {1} de {0:yyyy}",
                DateTime.Now,
                ALCSA.FWK.Tiempo.MESES[DateTime.Now.Month - 1]);

            ALCSA.Negocio.Documentos.DatosFormatos.Juicio objJuicio = new ALCSA.Negocio.Documentos.DatosFormatos.Juicio(intIdJuicio, 0);
            lblCliente.Text = objJuicio.Cliente;
            lblDeudor.Text = objJuicio.Deudor;
            lblTribunalJuicio.Text = objJuicio.Tribunal;
            lblRolJuicio.Text = objJuicio.Rol;

            if (objJuicio.IdExhorto < 1) return;
            ALCSA.Negocio.Documentos.DatosFormatos.Juicio objExhorto = new ALCSA.Negocio.Documentos.DatosFormatos.Juicio(0, objJuicio.IdExhorto);
            if (string.IsNullOrEmpty(objExhorto.Cliente)) return;

            lblTituloExhorto.Visible = true;
            lblTextoExhorto.Text = string.Format("{0} con {1}, ROL: {2}, TRIBUNAL: {3}", new Object[] {
                objExhorto.Cliente, 
                objExhorto.Deudor, 
                objExhorto.Rol, 
                objExhorto.Tribunal
            });
        }
    }
}