namespace CobranzaALC.Cobranza.Abonos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ComprobanteParcial : Page
    {
        
        protected string Evaluar(object monto)
        {
            return string.Format("{0:N0}", monto).Replace(",", ".");
        }

        private void MostrarComprobante(string id_abonoparcial)
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarAbonoParcialCabezera(id_abonoparcial);
            if ((table.Rows.Count > 0) && (table != null))
            {
                if (table.Rows[0]["tipo"].ToString() == "E")
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Los excedentes no se imprimen, ya que se incluyen en la letra siguiente a pagar');window.close();</script>");
                }
                else
                {
                    this.nroabono.Text = table.Rows[0]["id_abonoparcial"].ToString().PadLeft(8, '0');
                    this.cliente.Text = table.Rows[0]["cliente"].ToString();
                    this.deudor.Text = table.Rows[0]["deudor"].ToString();
                    this.rutdeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                    this.operacion.Text = table.Rows[0]["nrooperacion"].ToString();
                    this.idasociado.Text = table.Rows[0]["id_abono_comprobante"].ToString();
                    this.fecha.Text = table.Rows[0]["fabonoparcial"].ToString();
                    this.montoabono.Text = this.Evaluar(table.Rows[0]["montoparcial"]);
                    this.TipoMoneda.Text = "Efectivo";
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            else if (!string.IsNullOrEmpty(base.Request.QueryString["id_abono_parcial"]))
            {
                string str = base.Request.QueryString["id_abono_parcial"].ToString();
                this.MostrarComprobante(str);
                this.usuario.Text = this.Session["Usuario"].ToString();
                this.hora.Text = DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString();
            }
        }
    }
}

