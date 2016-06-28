using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Documentos.Formatos.DocumentosSeis
{
    public partial class TransaccionPutBbva : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.EnableViewState = false;
            int intIdJuicio = 0, intIdExhorto = 0;
            int.TryParse(Request.QueryString["id_jui"], out intIdJuicio);
            int.TryParse(Request.QueryString["id_exh"], out intIdExhorto);

            ALCSA.Negocio.Documentos.DatosFormatos.Juicio objJuicio = new ALCSA.Negocio.Documentos.DatosFormatos.Juicio(intIdJuicio, intIdExhorto);

            ALCSA.FWK.Web.Control.AsignarValor(lblFecha, DateTime.Now, true);

            lblRut.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objJuicio.RutDeudor);
            lblRut1.Text = lblRut.Text;

            lblDeudor.Text = objJuicio.Deudor;
            lblDeudor1.Text = objJuicio.Deudor;

            lblDomicilio.Text = !string.IsNullOrWhiteSpace(objJuicio.DomicilioDeudor) ? objJuicio.DomicilioDeudor.Trim() : "________________________________";
            lblComuna.Text = !string.IsNullOrWhiteSpace(objJuicio.ComunaDomicilioDeudor) ? objJuicio.ComunaDomicilioDeudor.Trim() : "________________________________";

            // lblRol.Text = objJuicio.Rol;
        }
    }
}