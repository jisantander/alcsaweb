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
    public partial class InformeBienRaiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String strbien = null;
            String strIdBien = null;
            strbien = Request.QueryString["ID_BIEN_RAIZ"].ToString();

            string[] arrParametros = strbien.Split(',');
            strIdBien = arrParametros[0].ToString();
            lb_Direccion.Text = arrParametros[1].ToString();
            lb_ConservadorBR.Text = arrParametros[2].ToString();
            lb_Fojas.Text = arrParametros[3].ToString();
            lb_Numero.Text = arrParametros[4].ToString();
            lb_Ano.Text = arrParametros[5].ToString();
            lb_RutDeudor.Text = arrParametros[6].ToString();
            lb_ComunaDeudor.Text = arrParametros[7].ToString();
            lb_fecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
            CargaBienes(strIdBien);

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

        public void CargaBienes(string Id)
        {
            if (!string.IsNullOrEmpty(lb_RutDeudor.Text))
            {
                DataTable tabla = Consulta.InformeBienesRaicesDeudor(Id, null);
                if (tabla.Rows.Count > 0)
                {
                    lb_NombreDeudor.Text = tabla.Rows[0]["NOMBRE_DEUDOR"].ToString();
                    lb_Cliente.Text = tabla.Rows[0]["NombreCliente"].ToString();
                }
                else this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No dispone bienes raices el DEUDOR');</script>");
            }
            else this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe indicar Rut del Deudor');</script>");
        }
    }
}