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
    public partial class InformeBienMuebles_Negativa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String strbien = null;
            String strIdBien = null;
            strbien = Request.QueryString["Parametros_DeudorMueble"].ToString();

            string[] arrParametros = strbien.Split(',');
            strIdBien = arrParametros[2].ToString();
            lb_Cliente.Text = arrParametros[0].ToString();
            lb_NombreDeudor.Text = arrParametros[1].ToString();
            lb_RutDeudor.Text = arrParametros[2].ToString();
            lb_NOperacion.Text = arrParametros[3].ToString();

            lb_fecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
            // CargaBienes(strIdBien);      
        }
        public void CargaBienes(string Id)
        {
            if (!string.IsNullOrEmpty(lb_RutDeudor.Text))
            {
                DataTable tabla = new DataTable();
                tabla = Consulta.InformeBienesRaicesDeudor(Id, null);
                if (tabla.Rows.Count > 0)
                {
                    lb_NombreDeudor.Text = tabla.Rows[0]["NOMBRE_DEUDOR"].ToString();
                    lb_Cliente.Text = tabla.Rows[0]["NombreCliente"].ToString();
                }
                else
                { this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No dispone bienes raices el DEUDOR');</script>"); }
            }
            else
            { this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe indicar Rut del Deudor');</script>"); }

        }
    }
}