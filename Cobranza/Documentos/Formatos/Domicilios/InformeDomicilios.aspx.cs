using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ALCLOCAL;

namespace CobranzaALC.Cobranza.Documentos.Formatos.Domicilios
{
    public partial class InformeDomicilios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String strParametros = null;
            strParametros = Request.QueryString["Parametros_Domicilio"].ToString();

            string[] arrParametros = strParametros.Split(',');
            lb_Cliente.Text = arrParametros[0].ToString().Replace(',', ' ');
            lb_NombreDeudor.Text = arrParametros[1].ToString().Replace(',', ' ');
            lb_RutDeudor.Text = arrParametros[2].ToString().Replace(',', ' ');
            lb_Calle.Text = arrParametros[3].ToString().Replace(',', ' ');
            lb_Numero.Text = arrParametros[4].ToString().Replace(',', ' ');
            lb_Block.Text = arrParametros[5].ToString().Replace(',', ' ');
            lb_NDpto.Text = arrParametros[6].ToString().Replace(',', ' ');
            lb_Villa.Text = arrParametros[7].ToString().Replace(',', ' ');
            lb_Comuna.Text = arrParametros[8].ToString().Replace(',', ' ');
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