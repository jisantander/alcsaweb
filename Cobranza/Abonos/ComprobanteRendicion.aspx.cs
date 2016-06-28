namespace CobranzaALC.Cobranza.Abonos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ComprobanteRendicion : Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            else if (string.IsNullOrEmpty(base.Request.QueryString["id_Rendicion"]))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            else
            {
                string str = base.Request.QueryString["id_Rendicion"].ToString();
                DataTable table = ConsultasEspecificas.DOCRENDICIONESVALIDA(str);
                if ((table.Rows.Count <= 0) || (table == null))
                {
                    base.Response.Redirect("muestrarendicion.aspx?RENDICION=" + str);
                }
                this.txtFormaPago.Text = "Cheque";
                this.nroRendicion.Text = str;
                this.usuario.Text = this.Session["Usuario"].ToString();
                this.hora.Text = DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString();
                DataTable table2 = null;
                table2 = ConsultasEspecificas.ListaRendiciones(str.ToString());
                if ((table2.Rows.Count > 0) && (table2 != null))
                {
                    this.txtcliente.Text = table2.Rows[0]["cliente"].ToString();
                    this.txtRutCliente.Text = table2.Rows[0]["rut_cli"].ToString();
                    this.txtNroOperacion.Text = table2.Rows[0]["nrooperacion"].ToString();
                    this.txtFechaComprobante.Text = table2.Rows[0]["fecha"].ToString();
                    this.txtMontoRendido.Text = table2.Rows[0]["monto"].ToString();
                }
                DataTable table3 = null;
                table3 = ConsultasEspecificas.ListaDOCRendiciones(str.ToString());
                if ((table3.Rows.Count > 0) && (table3 != null))
                {
                    this.txtBanco.Text = table3.Rows[0]["banco"].ToString();
                    this.txtNroCheque.Text = table3.Rows[0]["nrocheque"].ToString();
                    this.txtSerie.Text = table3.Rows[0]["serie"].ToString();
                    this.txtFechaCheque.Text = table3.Rows[0]["fcheque"].ToString();
                    this.txtCtaCte.Text = table3.Rows[0]["nroctacte"].ToString();
                    Transaccion.UPDImpreso(this.nroRendicion.Text.ToString());
                }
            }
        }
    }
}

