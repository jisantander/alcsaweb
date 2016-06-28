namespace CobranzaALC.Cobranza.CalculoLiquidacion
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class CalculoLiquidacion : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string str = base.Request.QueryString["Codigo"].ToString();
                this.hiddCobranza.Value = str;
                this.TOTAL.Text = "0";
                this.txtCapital.Text = "0";
                this.MostrarDatosCobranzaLiquidacionGastos(str);
                this.MostrarDatosCobranzaLiquidacionAbonos(str);
                this.MostrarDatosCobranzaLiquidacion(str);
                
                this.CargaGrilla(Convert.ToInt32(str));
                this.fechita.Text = DateTime.Now.ToString("dd-MM-yyyy");
            }
        }

        private void CargaGrilla(int idCobranza)
        {
            ALCSA.FWK.BD.Servicio objServicio = new ALCSA.FWK.BD.Servicio();
            objServicio.Conexion = "CONN";
            objServicio.Comando = "dbo.SPALC_LIQUIDACION_LISTAR";
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@INT_IdCobranza", Valor = idCobranza, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });

            this.Grilla.DataSource = objServicio.EjecutarDataTable();
            this.Grilla.DataBind();
        }

        protected string Evaluar(object monto)
        {
            return monto == null || string.IsNullOrEmpty(monto.ToString()) ? "0" : monto.ToString();
        }

        private void MostrarDatosCobranzaLiquidacion(string id_cobranza)
        {
            DataTable table = ConsultasEspecificas.MostrarDatosCobranzaLiquidacion(id_cobranza);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.lblCliente.Text = table.Rows[0]["cliente"].ToString();
                this.lblDeudor.Text = table.Rows[0]["deudor"].ToString();
                this.lblRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                this.lblnrooperacion.Text = table.Rows[0]["operacion"].ToString();
                this.lbltipo.Text = table.Rows[0]["TipoCobranzadet"].ToString();
                this.lbltribunal.Text = table.Rows[0]["tribunal"].ToString();
                this.lblRol.Text = table.Rows[0]["rol"].ToString();
                this.hddTipoCobranza.Value = table.Rows[0]["tipocobranza"].ToString();

                this.MostrarDatosPartametros(table.Rows[0]["rut_cli"].ToString());
            }
        }

        private void MostrarDatosCobranzaLiquidacionAbonos(string id_cobranza)
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDatosCobranzaLiquidacionAbonos(id_cobranza);
            if (table != null && table.Rows.Count > 0)
                this.lblabonos.Text = this.Evaluar(table.Rows[0]["abono"]);
            else this.lblabonos.Text = "0";
        }

        private void MostrarDatosCobranzaLiquidacionGastos(string id_cobranza)
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDatosCobranzaLiquidacionGastos(id_cobranza);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.lbladmin.Text = this.Evaluar(table.Rows[0]["admin"]);
                this.lbljudi.Text = this.Evaluar(table.Rows[0]["judi"]);
                this.lblpre.Text = this.Evaluar(table.Rows[0]["pre"]);
            }
            else
            {
                this.lbladmin.Text = "0";
                this.lbljudi.Text = "0";
                this.lblpre.Text = "0";
            }
        }

        private void MostrarDatosPartametros(string rutCliente)
        {
            DataTable table = Consulta.TraeParametros(rutCliente);
            if (table != null && table.Rows.Count > 0)
            {
                this.lblintereses.Text = table.Rows[0]["TasaInteres"].ToString().Replace(",", ".");
                this.lblhonorarios.Text = table.Rows[0]["Honorarios"].ToString().Replace(",", ".");
                this.lbldescuentointereses.Text = table.Rows[0]["DescIntereses"].ToString().Replace(",", ".");
                this.lbldescuentohonorarios.Text = table.Rows[0]["DescHonorarios"].ToString().Replace(",", ".");
                this.lblotrosdescuentos.Text = table.Rows[0]["OtrosDescuentos"].ToString().Replace(",", ".");
            }
        }
    }
}

