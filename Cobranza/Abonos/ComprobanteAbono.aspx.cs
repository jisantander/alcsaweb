namespace CobranzaALC.Cobranza.Abonos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ComprobanteAbono : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null || Session["Usuario"].ToString() == "")
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
                return;
            }

            string strIdAbono = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "id_abono");

            MostrarComprobante(strIdAbono);
            MostrarMCH(strIdAbono);

            DataTable table = Consulta.CompruebaParcialesAsociados(strIdAbono);

            if (table != null && table.Rows.Count > 0)
                lblAsociados.Text = "Nota : Este comprobante tiene abonos parciales asociados, los cuales se han utilizado en este pago";

            usuario.Text = Session["Usuario"].ToString();
            hora.Text = string.Format("{0:HH:mm}", DateTime.Now);
        }

        protected string Evaluar(object monto)
        {
            return string.Format("{0:N0}", monto).Replace(",", ".");
        }

        private void MostrarComprobante(string id_abono)
        {
            DataTable table = ConsultasEspecificas.MostrarComprobanteAbonos(id_abono);
            if (table != null && table.Rows.Count > 0)
            {
                nroabono.Text = table.Rows[0]["id_abono"].ToString().PadLeft(8, '0');
                cliente.Text = table.Rows[0]["cliente"].ToString();
                deudor.Text = table.Rows[0]["deudor"].ToString();
                rutdeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                operacion.Text = table.Rows[0]["nrooperacion"].ToString();
                montoabono.Text = Evaluar(table.Rows[0]["montoabono"]);
                banco.Text = table.Rows[0]["banco"].ToString();
                RutGirador.Text = table.Rows[0]["rutgirador"].ToString();
                NombreGirador.Text = table.Rows[0]["nomgirador"].ToString();
                TipoMoneda.Text = table.Rows[0]["moneda"].ToString();
                BoletaHonorarios.Text = table.Rows[0]["boleta"].ToString();

                DateTime datFecha = Convert.ToDateTime(table.Rows[0]["fechaabono"]);
                if (datFecha.Year < 1950) datFecha = DateTime.Now;
                fecha.Text = string.Format("{0:dd/MM/yyyy}", datFecha);

                datFecha = Convert.ToDateTime(table.Rows[0]["fechapago"]);
                if (datFecha.Year < 1950) datFecha = DateTime.Now;
                ultfechapago.Text = string.Format("{0:dd/MM/yyyy}", datFecha);
            }
        }

        private void MostrarMCH(string id_abono)
        {
            DataTable table = ConsultasEspecificas.MostrarMCH(id_abono);
            if (table != null && table.Rows.Count > 0)
            {
                GridView1.DataSource = table;
                GridView1.DataBind();
            }
        }
    }
}

