namespace CobranzaALC.Cobranza.Abonos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class DetalleRendicion : Page
    {
       
        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            long num = 0L;
            if (this.chkMonto.Checked)
            {
                num += Convert.ToInt64(this.lblMonto.Text);
            }
            if (this.chkIntereses.Checked)
            {
                num += Convert.ToInt64(this.lblIntereses.Text);
            }
            if (this.chkGastos.Checked)
            {
                num += Convert.ToInt64(this.lblGastos.Text);
            }
            if (this.chkInteresAdicional.Checked)
            {
                num += Convert.ToInt64(this.lblInteresAdicional.Text);
            }
            if (this.chkHonorarios.Checked)
            {
                num += Convert.ToInt64(this.lblHonorarios.Text);
            }
            if (this.chkDescHonorarios.Checked)
            {
                num -= Convert.ToInt64(this.lblDescHonorarios.Text);
            }
            if (this.chkOtrosDescuentos.Checked)
            {
                num -= Convert.ToInt64(this.lblOtrosDescuentos.Text);
            }
            if (this.chkDescInteres.Checked)
            {
                num -= Convert.ToInt64(this.lblDescInteres.Text);
            }
            this.lblMontoaRendir.Text = num.ToString();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (this.lblMontoaRendir.Text == "0")
            {
                ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Error", "alert('Monto a rendir est\x00e1 en cero');", true);
            }
            else
            {
                DataTable table = null;
                table = ConsultasEspecificas.VALIDADOCLIBERADOS(this.hiddCobranza.Value.ToString(), this.lblnrocomprobante.Text.ToString());
                if (((table.Rows.Count > 0) && (table != null)) && (table.Rows[0]["id_moneda"].ToString() == "5"))
                {
                    long num = Convert.ToInt64(this.lblnrocomprobante.Text.ToString());
                    decimal num2 = 0M;
                    num2 = Convert.ToDecimal(table.Rows[0]["montoabono"].ToString());
                    DataTable table2 = ConsultasEspecificas.TOTALESABONOS(this.hiddCobranza.Value.ToString(), num.ToString());
                    if ((table2.Rows.Count > 0) && (table2 != null))
                    {
                        decimal num3 = 0M;
                        if (string.IsNullOrEmpty(table2.Rows[0]["Montomch"].ToString()))
                        {
                            ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Error", "alert('Falta ingresar documentos en Multicheque (MCH)');", true);
                            return;
                        }
                        num3 = Convert.ToDecimal(table2.Rows[0]["Montomch"].ToString());
                        if (num2 != num3)
                        {
                            ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Error", "alert('Falta ingresar documentos en Multicheque (MCH)');", true);
                            return;
                        }
                    }
                    if ((table.Rows[0]["MCH"].ToString() != "S") && (table.Rows[0]["estado"].ToString() != "L"))
                    {
                        ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Error", "alert('Debe liberar documentos antes de rendir');", true);
                        return;
                    }
                    if (table.Rows[0]["MCH"].ToString() == "S")
                    {
                        DataTable table3 = null;
                        table3 = ConsultasEspecificas.VALIDADOCLIBERADOSMCH(this.hiddCobranza.Value.ToString());
                        if ((table3.Rows.Count > 0) && (table3 != null))
                        {
                            ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Error", "alert('Debe liberar documentos antes de rendir');", true);
                            return;
                        }
                    }
                }
                if (this.lblMontoaRendir.Text == "0")
                {
                    ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Error", "alert('Monto a rendir est\x00e1 en cero');", true);
                }
                else
                {
                    int num4 = 0;
                    string swmonto = null;
                    string swInteres = null;
                    string swGastos = null;
                    string str4 = null;
                    string swhonorarios = null;
                    string str6 = null;
                    string str7 = null;
                    string str8 = null;
                    if ((this.chkMonto.Checked || (this.lblMonto.Text == "0")) || (this.chkMonto.Text == "Rendido"))
                    {
                        swmonto = "S";
                        num4++;
                    }
                    if ((this.chkIntereses.Checked || (this.lblIntereses.Text == "0")) || (this.chkIntereses.Text == "Rendido"))
                    {
                        swInteres = "S";
                        num4++;
                    }
                    if ((this.chkGastos.Checked || (this.lblGastos.Text == "0")) || (this.chkGastos.Text == "Rendido"))
                    {
                        swGastos = "S";
                        num4++;
                    }
                    if ((this.chkInteresAdicional.Checked || (this.lblInteresAdicional.Text == "0")) || (this.chkInteresAdicional.Text == "Rendido"))
                    {
                        str4 = "S";
                        num4++;
                    }
                    if ((this.chkHonorarios.Checked || (this.lblHonorarios.Text == "0")) || (this.chkHonorarios.Text == "Rendido"))
                    {
                        swhonorarios = "S";
                        num4++;
                    }
                    if ((this.chkDescHonorarios.Checked || (this.lblDescHonorarios.Text == "0")) || (this.chkDescHonorarios.Text == "Rendido"))
                    {
                        str6 = "S";
                        num4++;
                    }
                    if ((this.chkOtrosDescuentos.Checked || (this.lblOtrosDescuentos.Text == "0")) || (this.chkOtrosDescuentos.Text == "Rendido"))
                    {
                        str7 = "S";
                        num4++;
                    }
                    if ((this.chkDescInteres.Checked || (this.lblDescInteres.Text == "0")) || (this.chkDescInteres.Text == "Rendido"))
                    {
                        str8 = "S";
                        num4++;
                    }
                    Transaccion.ActualizarRendicionAbonos(this.hddIdAbono.Value.ToString(), this.hiddCobranza.Value.ToString(), swmonto, swInteres, swGastos, str4, swhonorarios, str6, str8, str7, (long) num4);
                    DataTable table4 = null;
                    table4 = Transaccion.InsRendicion(this.hddIdAbono.Value.ToString(), this.hiddCobranza.Value.ToString(), this.lblMontoaRendir.Text.ToString(), this.Session["Usuario"].ToString());
                    string str10 = "";
                    if ((table4.Rows.Count > 0) && (table4 != null))
                    {
                        str10 = "ComprobanteRendicion.aspx?id_Rendicion=" + table4.Rows[0][0].ToString().ToString();
                    }
                    this.CargaGrilla(this.hiddCobranza.Value.ToString());
                    string str11 = "DetalleRendicion.aspx?id_abono=" + this.hddIdAbono.Value.ToString() + "&id_cobranza=" + this.hiddCobranza.Value.ToString() + "&nrooperacion=" + this.hddnrooperacion.Value.ToString() + "&rutdeudor=" + this.hddrutdeudor.Value.ToString() + "&nomdeudor=" + this.hddnomdeudor.Value.ToString() + "&nrocomprobante=" + this.hddnrocomprobante.Value.ToString() + "&nomcliente=" + this.hddnomcliente.Value.ToString() + "&montoabono=" + this.hddmontoabono.Value.ToString();
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');location.href='" + str11.ToString() + "';</script>");
                }
            }
        }

        private void CargaGrilla(string id_cobranza)
        {
            this.Grilla.DataSource = ConsultasEspecificas.VerRendicion(id_cobranza, this.lblnrocomprobante.Text.ToString());
            this.Grilla.DataBind();
        }

        protected void chkDescHonorarios_CheckedChanged(object sender, EventArgs e)
        {
            this.lblMontoaRendir.Text = "0";
        }

        protected void chkDescInteres_CheckedChanged(object sender, EventArgs e)
        {
            this.lblMontoaRendir.Text = "0";
        }

        protected void chkGastos_CheckedChanged(object sender, EventArgs e)
        {
            this.lblMontoaRendir.Text = "0";
        }

        protected void chkHonorarios_CheckedChanged(object sender, EventArgs e)
        {
            this.lblMontoaRendir.Text = "0";
        }

        protected void chkInteresAdicional_CheckedChanged(object sender, EventArgs e)
        {
            this.lblMontoaRendir.Text = "0";
        }

        protected void chkIntereses_CheckedChanged(object sender, EventArgs e)
        {
            this.lblMontoaRendir.Text = "0";
        }

        protected void chkMonto_CheckedChanged(object sender, EventArgs e)
        {
            this.lblMontoaRendir.Text = "0";
        }

        protected void chkOtrosDescuentos_CheckedChanged(object sender, EventArgs e)
        {
            this.lblMontoaRendir.Text = "0";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!this.Page.IsPostBack)
            {
                this.lblMontoaRendir.Text = "0";
                string str = base.Request.QueryString["nrooperacion"].ToString();
                string str2 = base.Request.QueryString["rutdeudor"].ToString();
                string str3 = base.Request.QueryString["nomdeudor"].ToString().ToUpper();
                string str4 = base.Request.QueryString["nrocomprobante"].ToString();
                string str5 = base.Request.QueryString["nomcliente"].ToString().ToUpper();
                string str6 = base.Request.QueryString["montoabono"].ToString().ToUpper();
                this.hddnrooperacion.Value = str.ToString();
                this.hddrutdeudor.Value = str2.ToString();
                this.hddnomdeudor.Value = str3.ToString();
                this.hddnrocomprobante.Value = str4.ToString();
                this.hddnomcliente.Value = str5.ToString();
                this.hddmontoabono.Value = str6.ToString();
                string str7 = base.Request.QueryString["id_abono"].ToString().ToUpper();
                string str8 = base.Request.QueryString["id_cobranza"].ToString().ToUpper();
                this.hddIdAbono.Value = str7.ToString();
                this.hiddCobranza.Value = str8.ToString();
                this.lblNrooperacion.Text = str;
                this.lblRutDeudor.Text = str2;
                this.lblDeudor.Text = str3;
                this.lblnrocomprobante.Text = str4;
                this.lblCliente.Text = str5;
                this.lblTotalTodo.Text = str6;
                DataTable table = null;
                table = ConsultasEspecificas.RendicionDesglose(this.hddIdAbono.Value.ToString());
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.lblIntereses.Text = table.Rows[0]["intereses"].ToString();
                    this.lblInteresAdicional.Text = table.Rows[0]["int_adic"].ToString();
                    this.lblHonorarios.Text = table.Rows[0]["honorarios"].ToString();
                    this.lblDescHonorarios.Text = table.Rows[0]["desc_honorarios"].ToString();
                    this.lblOtrosDescuentos.Text = table.Rows[0]["otros_desc"].ToString();
                    this.lblDescInteres.Text = table.Rows[0]["desc_interes"].ToString();
                    this.lblMonto.Text = table.Rows[0]["monto"].ToString();
                    this.lblGastos.Text = table.Rows[0]["gastos"].ToString();
                }
                else
                {
                    this.lblIntereses.Text = "0";
                    this.lblInteresAdicional.Text = "0";
                    this.lblHonorarios.Text = "0";
                    this.lblDescHonorarios.Text = "0";
                    this.lblOtrosDescuentos.Text = "0";
                    this.lblDescInteres.Text = "0";
                    this.lblGastos.Text = "0";
                }
                DataTable table2 = null;
                table2 = ConsultasEspecificas.MostrarYaRendidas(this.hddIdAbono.Value.ToString(), this.hiddCobranza.Value.ToString());
                if ((table2.Rows.Count > 0) && (table2 != null))
                {
                    if (table2.Rows[0]["swInteres"].ToString() == "S")
                    {
                        this.chkIntereses.Text = "Rendido";
                        this.chkIntereses.Enabled = false;
                    }
                    if (table2.Rows[0]["swint_adic"].ToString() == "S")
                    {
                        this.chkInteresAdicional.Enabled = false;
                        this.chkInteresAdicional.Text = "Rendido";
                    }
                    if (table2.Rows[0]["swhonorarios"].ToString() == "S")
                    {
                        this.chkHonorarios.Enabled = false;
                        this.chkHonorarios.Text = "Rendido";
                    }
                    if (table2.Rows[0]["swdesc_honorarios"].ToString() == "S")
                    {
                        this.chkDescHonorarios.Enabled = false;
                        this.chkDescHonorarios.Text = "Rendido";
                    }
                    if (table2.Rows[0]["swdesc_interes"].ToString() == "S")
                    {
                        this.chkDescInteres.Enabled = false;
                        this.chkDescInteres.Text = "Rendido";
                    }
                    if (table2.Rows[0]["swOtros_desc"].ToString() == "S")
                    {
                        this.chkOtrosDescuentos.Enabled = false;
                        this.chkOtrosDescuentos.Text = "Rendido";
                    }
                    if (table2.Rows[0]["swmonto"].ToString() == "S")
                    {
                        this.chkMonto.Enabled = false;
                        this.chkMonto.Text = "Rendido";
                    }
                    if (table2.Rows[0]["swgasto"].ToString() == "S")
                    {
                        this.chkGastos.Enabled = false;
                        this.chkGastos.Text = "Rendido";
                    }
                }
                this.CargaGrilla(this.hiddCobranza.Value.ToString());
                DataTable table3 = null;
                table3 = ConsultasEspecificas.MostrarDesglose(this.hddIdAbono.Value.ToString());
                if ((table3.Rows.Count <= 0) || (table3 == null))
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Atenci\x00f3n! No existe desglose para est\x00e1 operaci\x00f3n, ya que fue realizada antes del paso a producci\x00f3n');</script>");
                }
            }
        }
    }
}

