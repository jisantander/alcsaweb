namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    using ALCLOCAL;
    using CobranzaALC.Dto;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ConsultaPrejudicial : Page
    {
        

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("BuscaPrejudicial.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string str = this.hiddCobranza.Value.ToString();
            base.Response.Redirect("../procesos/ActividadesPrejudiciales.aspx?Volver=Consulta&Codigo=" + str.ToString());
        }

        private void ComboDetalleDocCuotaColegio(string id_cobranza)
        {
            this.Grilla.DataSource = Consulta.ComboDocCuotacolegio(id_cobranza);
            this.Grilla.DataBind();
        }

        protected string Evaluar(object monto)
        {
            if (string.IsNullOrEmpty(monto.ToString()))
            {
                monto = 0;
            }
            string str = string.Format("{0:N0}", monto);
            return ("$" + str).Replace(",", ".");
        }

        protected string LetraPagadaicon(object Letra)
        {
            if (Letra.ToString() == "S")
            {
                return "~/images/green.gif";
            }
            return "~/images/red.gif";
        }

        protected string LetraPagadatool(object Letra)
        {
            if (Letra.ToString() == "S")
            {
                return "Letra Cancelada";
            }
            return "Letra NO Cancelada";
        }

        private void MostrarDatosCobranzaAbonos(string id_cobranza)
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDatosCobranzaPrejuducialAbonos(id_cobranza);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.lblabonos.Text = this.Evaluar(table.Rows[0]["abono"]);
            }
            else
            {
                this.lblabonos.Text = "$0";
            }
        }

        private void MostrarDatosCobranzaPrejudicial(string id_cobranza)
        {
            string str = "";
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDatosCobranzaPrejudicial(id_cobranza);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.lblCliente.Text = table.Rows[0]["cliente"].ToString();
                this.lblDeudor.Text = table.Rows[0]["deudor"].ToString();
                this.lblRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                str = table.Rows[0]["rut_deudor"].ToString();
                this.lblnrooperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.lblfechaingresocob.Text = table.Rows[0]["fproceso"].ToString();
                this.lbltipodoc.Text = table.Rows[0]["producto"].ToString();
                this.lblcantidad.Text = table.Rows[0]["contador"].ToString();
                this.lblnumero.Text = table.Rows[0]["codigo"].ToString();
                DataTable table2 = null;
                table2 = ConsultasEspecificas.MostrarTelefonoDeudor(str);
                if ((table2.Rows.Count > 0) && (table2 != null))
                {
                    this.lbltelefono1.Text = table2.Rows[0]["telefono1"].ToString();
                    this.lbltelefono2.Text = table2.Rows[0]["telefono2"].ToString();
                    this.lblcelular.Text = table2.Rows[0]["celular1"].ToString();
                }
                CabezaPrejudicialDTO ldto = new CabezaPrejudicialDTO {
                    NroOperacion = table.Rows[0]["nrooperacion"].ToString(),
                    Nom_Cli = table.Rows[0]["cliente"].ToString(),
                    Rut_Deudor = table.Rows[0]["rut_deudor"].ToString(),
                    Nom_Deudor = table.Rows[0]["deudor"].ToString()
                };
                this.Session["CabezeraActividadesPrejudicial"] = ldto;
                string str2 = string.Format("{0:N0}", table.Rows[0]["montocapital"]);
                this.lblMontoCapital.Text = str2.Replace(",", ".");
                str2 = "";
                this.lblSaldoDeuda.Text = string.Format("{0:N0}", table.Rows[0]["saldodeuda"]).Replace(",", ".");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string str = base.Request.QueryString["Codigo"].ToString();
                this.hiddCobranza.Value = str;
                this.ComboDetalleDocCuotaColegio(str);
                this.MostrarDatosCobranzaPrejudicial(str);
                this.MostrarDatosCobranzaAbonos(str);
            }
        }
    }
}

