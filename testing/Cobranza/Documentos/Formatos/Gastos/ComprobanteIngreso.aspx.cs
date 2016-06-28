using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Documentos.Formatos.Gastos
{
    public partial class ComprobanteIngreso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int intIdGasto = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id");
            ALCSA.Negocio.Gastos.Gasto objGasto = new ALCSA.Negocio.Gastos.Gasto(intIdGasto);
            ALCSA.Negocio.Cobranzas.Cobranza objCobranza = new ALCSA.Negocio.Cobranzas.Cobranza(objGasto.IdCobranza);
            ALCSA.Negocio.Juicios.Juicio objJuicio = new ALCSA.Negocio.Juicios.Juicio();
            objJuicio.CargarPorCobranza(objGasto.IdCobranza);

            ALCSA.FWK.Web.Control.AsignarValor(lblCliente, objCobranza.NombreCliente);
            ALCSA.FWK.Web.Control.AsignarValor(lblFecha, objCobranza.FechaIngreso);
            ALCSA.FWK.Web.Control.AsignarValor(ldlProcurador, objCobranza.UsuarioProceso);
            ALCSA.FWK.Web.Control.AsignarValor(lblRutDeudor, ALCSA.FWK.IdentificacionTributaria.FormatearRut(objCobranza.RutDeudor));
            ALCSA.FWK.Web.Control.AsignarValor(lblNombreDeudor, objCobranza.NombreDeudor);
            ALCSA.FWK.Web.Control.AsignarValor(lblNumeroOperacion, objCobranza.Nrooperacion);

            ALCSA.FWK.Web.Control.AsignarValor(lblNumeroBoleta, objGasto.Nroboleta);
            ALCSA.FWK.Web.Control.AsignarValor(lblNumeroNomina, objGasto.Nomina);
            ALCSA.FWK.Web.Control.AsignarValor(lblFechaNomina, objGasto.Fnomina, true);
            ALCSA.FWK.Web.Control.AsignarValor(lblProveedor, objGasto.NomResponsable);
            ALCSA.FWK.Web.Control.AsignarValor(lblTipoGasto, string.Format("{0} - {1}", objGasto.Gasto, objGasto.Desgasto));

            ALCSA.FWK.Web.Control.AsignarValor(lblObservacion, objGasto.Observacion);

            ALCSA.FWK.Web.Control.AsignarValor(lblMonto, Convert.ToDecimal(
                objGasto.IdGastoAdmin > 0
                ? objGasto.Montogastoadmin
                : objGasto.IdGastoJudicial > 0
                ? objGasto.Montogastojudi
                : objGasto.Montogastopre), 0);

            if (objJuicio.ID.Equals(0)) return;
            ALCSA.FWK.Web.Control.AsignarValor(lblRol, objJuicio.Rol);
            ALCSA.FWK.Web.Control.AsignarValor(lblTribunal, objJuicio.NombreTribunal);
        }
    }
}