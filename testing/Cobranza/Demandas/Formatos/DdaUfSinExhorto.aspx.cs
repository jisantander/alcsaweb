using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Demandas.Formatos
{
    public partial class DdaUfSinExhorto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int intIdCobranza = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_cob");
            if (intIdCobranza < 1) return;

            ALCSA.Negocio.Cobranzas.Cobranza objCobranza = new ALCSA.Negocio.Cobranzas.Cobranza(intIdCobranza);
            AsignarValorEtiqueta(lblRutCliente, ALCSA.FWK.IdentificacionTributaria.FormatearRut(objCobranza.RutCli));
            AsignarValorEtiqueta(lblRutDeudor, ALCSA.FWK.IdentificacionTributaria.FormatearRut(objCobranza.RutDeudor));
            AsignarValorEtiqueta(lblNombreCliente, objCobranza.NombreCliente);

            AsignarValorEtiqueta(lblNombreDeudor, objCobranza.NombreDeudor);
            AsignarValorEtiqueta(lblNombreDeudor0, objCobranza.NombreDeudor);
            AsignarValorEtiqueta(lblNombreDeudor1, objCobranza.NombreDeudor);
            // AsignarValorEtiqueta(lblNombreDeudor2, objCobranza.NombreDeudor);

            ALCSA.Negocio.Cobranzas.DocumentoPagare objDocumento = new ALCSA.Negocio.Cobranzas.DocumentoPagare();
            if (objDocumento.CargarPorCobranza(intIdCobranza))
            {
                AsignarValorEtiqueta(lblTasaInteres, objDocumento.Tasainteres);
                AsignarValorEtiqueta(lblTasaInteres, objDocumento.Fliquidacion);
                // AsignarValorEtiqueta(lblNombreComunaExhorto, objDocumento.NombreComunaExhorto);
                AsignarValorEtiqueta(lblTasaInteres, objDocumento.Fmora);

                AsignarValorEtiqueta(lblNumeroPagare, objDocumento.Nropagare);
                // AsignarValorEtiqueta(lblNumeroPagare0, objDocumento.Nropagare);

                // AsignarValorEtiqueta(lblFechaSuscripcion, objDocumento.Fsuscripcion);
                AsignarValorEtiqueta(lblNumeroCuotaMora, string.Empty);

                AsignarValorEtiqueta(lblDomicilio, objDocumento.DireccionPagare);
                // AsignarValorEtiqueta(lblDomicilio0, objDocumento.DireccionPagare);

                AsignarValorEtiqueta(lblNumeroTotalCuotas, objDocumento.Nrocuotas);
                AsignarValorEtiqueta(lblMontoUltimaCuota, objDocumento.Montoultimacuota, 2);
                AsignarValorEtiqueta(lblNumeroPrimerasCuotas, string.Empty);
                AsignarValorEtiqueta(lblNumeroPrimerasCuotas, objDocumento.Monto1cuotas, 2);
                AsignarValorEtiqueta(lblFechaPrimerVencimiento, objDocumento.Vcto1cuota);
            }
        }

        private void AsignarValorEtiqueta(Label etiqueta, string valor)
        {
            if (string.IsNullOrEmpty(valor)) valor = new string(' ', 15);
            etiqueta.Text = valor.Trim();
        }

        private void AsignarValorEtiqueta(Label etiqueta, float valor)
        {
            AsignarValorEtiqueta(etiqueta, valor, 0);
        }

        private void AsignarValorEtiqueta(Label etiqueta, float valor, int numeroDecimales)
        {
            if (valor < 0.00f) AsignarValorEtiqueta(etiqueta, string.Empty);
            etiqueta.Text = valor.ToString(string.Format("N{0}", numeroDecimales));
        }

        private void AsignarValorEtiqueta(Label etiqueta, DateTime valor)
        {
            if (valor.Year < 1900) AsignarValorEtiqueta(etiqueta, string.Empty);
            etiqueta.Text = string.Format("{0:dd} de {1} de {0:yyyy}", valor, ALCSA.FWK.Tiempo.MESES[valor.Month - 1]);
        }
    }
}