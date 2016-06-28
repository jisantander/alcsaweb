using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ALCLOCAL;

namespace CobranzaALC.Cobranza.Documentos.Formatos.Bienes
{
    public partial class InformeBienMuebles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String strbien = Request.QueryString["id_bien_mueble"].ToString();

            string[] arrParametros = strbien.Split(',');

            // string strIdBien = arrParametros[0].ToString();

            lb_TipoVehiculo.Text = arrParametros[1].ToString();
            lb_Marca.Text = arrParametros[2].ToString();
            lb_Modelo.Text = arrParametros[3].ToString();
            lb_Patente.Text = arrParametros[4].ToString();
            lb_Ano.Text = arrParametros[5].ToString();
            lb_Cliente.Text = arrParametros[6].ToString();
            lb_NombreDeudor.Text = arrParametros[7].ToString();
            lb_RutDeudor.Text = arrParametros[8].ToString();
            lb_fecha.Text = DateTime.Now.ToString("dd/MM/yyyy");

            if (string.IsNullOrWhiteSpace(lb_RutDeudor.Text)) return;

            IList<ALCSA.Entidades.Parametros.Salidas.Cobranzas.ListadoDemanda> arrCobranzas = new ALCSA.Negocio.Cobranzas.Cobranza().Listar(
                new ALCSA.Entidades.Parametros.Entradas.Cobranzas.ListadoDemanda()
                {
                    IdRemesa = 0,
                    NroOperacion = string.Empty,
                    RutCliente = string.Empty,
                    RutDeudor = lb_RutDeudor.Text.Replace(".", string.Empty).Trim()
                });

            if (arrCobranzas.Count.Equals(0)) return;

            lblNumeroOperacion.Text = arrCobranzas[0].NumeroOperacion;
            lblSucursal.Text = arrCobranzas[0].Codigo;
        }
    }
}