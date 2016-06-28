namespace CobranzaALC.Cobranza.Abonos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class PagoAbonoSub : Page
    {
        public GridViewRow gridViewRow = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string str = base.Request.QueryString["Codigo"].ToString();
                this.hiddidcobranza.Value = str;
                string str2 = this.MostrarDatosJuicio(str);
                this.txtFecha.Text = DateTime.Now.ToString("dd-MM-yyyy");
                this.CargaGrilla(this.hiddidcobranza.Value.ToString());
                this.CargaGrillaAbonoMCH(this.hiddidcobranza.Value.ToString());
                this.CargaGrillaCheques(this.hiddidcobranza.Value.ToString());
                this.txtNroComprobante.Focus();
            }
        }

        protected void Borrar(object sender, GridViewCommandEventArgs e)
        {
            string str;
            string str4;
            this.gridViewRow = ((Control) e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Estado") == 0)
            {
                string str3 = "N";
                str = e.CommandName.ToString();
                string text = ((Label) this.gridViewRow.FindControl("lblnrodoc444")).Text;

                if ((this.gridViewRow.FindControl("lblHonorarios3") as Label).Text == "N")
                    str3 = "S";

                Transaccion.CambiaEstadoChequeMCH(text, str3);
                str4 = "pagoAbonoSub.aspx?Codigo=" + this.hiddidcobranza.Value.ToString();
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('cheque cambiado de estado correctamente');location.href='" + str4.ToString() + "';</script>");
            }

            if (e.CommandName.CompareTo("Borrar") == 0)
            {
                str = e.CommandName.ToString();
                string str5 = ((Label) this.gridViewRow.FindControl("lblnrodoc444")).Text;
                DataTable table = Consulta.VALIDAREliminarChequeMCH(str5);
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('documento est\x00e1 Liberado y Rendido, no se puede eliminar');</script>");
                }
                else
                {
                    Transaccion.EliminarChequeMCH(str5);
                    str4 = "pagoAbonoSub.aspx?Codigo=" + this.hiddidcobranza.Value.ToString();
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('cheque eliminado correctamente');location.href='" + str4.ToString() + "';</script>");
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int num = 0;
            long num2 = 0L;
            int num3 = 0;
            string str = "";
            str = this.txtNroComprobante.Text.ToString();
            DataTable table = Consulta.DatosAbonos(str, this.hiddidcobranza.Value.ToString());
            if ((table.Rows.Count > 0) && (table != null))
            {
                num = Convert.ToInt32(table.Rows[0]["docuno"].ToString());
                num2 = Convert.ToInt64(table.Rows[0]["montoabono"].ToString());
                DateTime time = Convert.ToDateTime(table.Rows[0]["fpago"].ToString());
                string str2 = this.txtFechaPago.Text.ToString().Substring(0, 2);
                string str3 = this.txtFechaPago.Text.ToString().Substring(3, 2);
                string str4 = this.txtFechaPago.Text.ToString().Substring(6, 4);
                if (Convert.ToDateTime(string.Concat(new object[] { str3, '-', str2, '-', str4 })) > time)
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Fecha ingresada no puede ser mayor a la fecha pago \x00faltimo cheque, ingrese fecha v\x00e1lida');</script>");
                }
                else
                {
                    DataTable table2 = Consulta.DatosMCH(str, this.hiddidcobranza.Value.ToString());
                    if (table2 != null && table2.Rows.Count > 0)
                    {
                        long num5 = 0L;
                        long num6 = Convert.ToInt64(this.txtMontoAbono.Text.ToString());
                        num3 = Convert.ToInt32(table2.Rows[0]["nroch"].ToString());
                        num5 = Convert.ToInt64(table2.Rows[0]["sumaabono"].ToString()) + num6;
                        if (num5 > num2)
                        {
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Monto ingresado sumado es mayor al monto a pagar');</script>");
                        }
                        else if ((num == 1) && (num5 < num2))
                        {
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Monto ingresado no puede ser menor al monto a pagar para un cheque');</script>");
                        }
                        else if ((num3 > num) && (num5 < num2))
                        {
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Acaba de ingresar m\x00e1s cheques del total de : " + num.ToString() + " que corresponde');</script>");
                        }
                        else if ((num3 >= num) && (num5 < num2))
                        {
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Ya ingreso el total de cheques : " + num.ToString() + " que corresponde, pero falta abono para completar el total a pagar');</script>");
                        }
                        else if ((num3 == num) && (num5 < num2))
                        {
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Ya ingreso el total de cheques : " + num.ToString() + " que corresponde, pero falta abono para completar el total a pagar');</script>");
                        }
                        else
                        {
                            if (num5 == num2)
                            {
                                num3++;
                                if ((num3 < num) && (num3 != 0))
                                {
                                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Se ingresaron menos cheques a la cantidad total de " + num.ToString() + " cheques a ingresar');</script>");
                                    return;
                                }
                            }
                            if (num5 < num2)
                            {
                                num3++;
                                if (num3 == num)
                                {
                                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Monto ingresado es menor, por lo tanto no cuadra con monto a pagar y este es el \x00faltimo cheque a ingresar');</script>");
                                    return;
                                }
                            }
                            Transaccion.InsertaAbonoMCH(this.hiddidcobranza.Value.ToString(), this.txtNroComprobante.Text, this.txtFechaPago.Text, this.txtNroCheque.Text, this.txtSerie.Text, this.txtMontoAbono.Text, this.Session["Usuario"].ToString());
                            string str6 = "pagoAbonoSub.aspx?Codigo=" + this.hiddidcobranza.Value.ToString();
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');location.href='" + str6.ToString() + "';</script>");
                        }
                    }
                }
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Comprobante no v\x00e1lido, ingrese uno v\x00e1lido');</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string url = "PagoAbono.aspx?Codigo=" + this.hiddidcobranza.Value.ToString().ToString();
            base.Response.Redirect(url);
        }

        private void CargaGrilla(string id_cobranza)
        {
            this.grillapagletras.DataSource = Consulta.MostrarMCHLetras(id_cobranza);
            this.grillapagletras.DataBind();
        }

        private void CargaGrillaAbonoMCH(string id_cobranza)
        {
            this.grillaabono.DataSource = Consulta.MostrarAbonosMCH(id_cobranza);
            this.grillaabono.DataBind();
        }

        private void CargaGrillaCheques(string id_cobranza)
        {
            this.grillacheques.DataSource = Consulta.MostrarGrillaCheques(id_cobranza);
            this.grillacheques.DataBind();
        }

        protected void Deshabilitar(object sender, GridViewCommandEventArgs e)
        {
            this.gridViewRow = ((Control) e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Deshabilitar") == 0)
            {
                string str = e.CommandName.ToString();
                Transaccion.LiberarMCHLetra(((Label) this.gridViewRow.FindControl("lblidcuota")).Text);
                string str3 = "pagoAbonoSub.aspx?Codigo=" + this.hiddidcobranza.Value.ToString();
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Letra Liberada correctamente');location.href='" + str3.ToString() + "';</script>");
            }
        }

        private string MostrarDatosJuicio(string id_cobranza)
        {
            string str = "";
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDatosCabezeraAbonos(id_cobranza);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtCliente.Text = table.Rows[0]["nomcliente"].ToString();
                this.txtNomDeudor.Text = table.Rows[0]["nomdeudor"].ToString();
                this.txtRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                str = table.Rows[0]["tipocobranza"].ToString();
            }
            return str;
        }
    }
}

