using ALCLOCAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.CallCenter
{
    public partial class VistaDeudor : System.Web.UI.Page
    {
        private string NOMBRE_PARAMETRO_RUT = "vendor_id";

        protected void Page_Load(object sender, EventArgs e)
        {
            // ----------------------------------------------------------------------------------------------------
            string strRutDeudor = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, NOMBRE_PARAMETRO_RUT);
            if (!string.IsNullOrEmpty(strRutDeudor))
            {
                Session[NOMBRE_PARAMETRO_RUT] = strRutDeudor;
                Response.Redirect("~/Cobranza/CallCenter/VistaDeudor.aspx", true);
                return;
            };
            // ----------------------------------------------------------------------------------------------------
            strRutDeudor = Session[NOMBRE_PARAMETRO_RUT] != null ? Session[NOMBRE_PARAMETRO_RUT].ToString() : string.Empty;
            if (string.IsNullOrEmpty(strRutDeudor)) return;
            Session.Remove(NOMBRE_PARAMETRO_RUT);
            // ----------------------------------------------------------------------------------------------------
            strRutDeudor = ALCSA.FWK.IdentificacionTributaria.FormatearRut(strRutDeudor).Replace(".", string.Empty);
            // ----------------------------------------------------------------------------------------------------
            ALCSA.Negocio.Deudor objDeudor = new ALCSA.Negocio.Deudor(strRutDeudor);
            if (string.IsNullOrEmpty(objDeudor.RutDeudor)) return;
            // ----------------------------------------------------------------------------------------------------
            ALCSA.FWK.Web.Control.AsignarValor(lblRutDeudor, ALCSA.FWK.IdentificacionTributaria.FormatearRut(objDeudor.RutDeudor));
            ALCSA.FWK.Web.Control.AsignarValor(lblNombreDeudor, objDeudor.Rsocial);
            ALCSA.FWK.Web.Control.AsignarValor(lblTelefono, !string.IsNullOrEmpty(objDeudor.Telefono1) ? objDeudor.Telefono1 : "...");
            ALCSA.FWK.Web.Control.AsignarValor(lblCelular, !string.IsNullOrEmpty(objDeudor.Celular1) ? objDeudor.Celular1 : "...");
            // ----------------------------------------------------------------------------------------------------
            gvDomicilios.DataSource = ConsultasEspecificas.ConMostrarDomicilios(strRutDeudor); 
            gvDomicilios.DataBind();
            // ----------------------------------------------------------------------------------------------------
            IList<ALCSA.Entidades.Parametros.Salidas.Cobranzas.ListadoDemanda> arrDatos = new ALCSA.Negocio.Cobranzas.Cobranza().Listar(new ALCSA.Entidades.Parametros.Entradas.Cobranzas.ListadoDemanda()
            {
                RutDeudor = strRutDeudor,
                IdRemesa = 0,
                NroOperacion = string.Empty,
                RutCliente = string.Empty
            });

            for (int intIndice = 0; intIndice < arrDatos.Count; intIndice++)
                arrDatos[intIndice].RutCliente = ALCSA.FWK.IdentificacionTributaria.FormatearRut(arrDatos[intIndice].RutCliente);

            gvCobranzas.DataSource = arrDatos;
            gvCobranzas.DataBind();
            // ----------------------------------------------------------------------------------------------------
        }
    }
}