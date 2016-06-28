namespace CobranzaALC.Cobranza.Abonos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Collections.Generic;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class PagoAbono : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }

            if (this.Page.IsPostBack) return;

            try
            {
                if (string.IsNullOrEmpty(base.Request.QueryString["Codigo"])) return;

                hiddidcobranza.Value = Request.QueryString["Codigo"];
                string strTipoCobranza = MostrarDatosJuicio();

                CargaAbonosRealizados();

                ComboBancos();
                ComboMoneda();

                ddlFormaPago.SelectedValue = "6";

                DataTable table = Consulta.ListaTotalParcial(hiddidcobranza.Value);
                if (table != null && table.Rows.Count > 0 && table.Rows[0]["total"].ToString() != "")
                    this.txtTotalParcial.Text = table.Rows[0]["total"].ToString();
                else this.txtTotalParcial.Text = "0";
                
                habilitar();
                ALCSA.FWK.Web.Control.AsignarValor(txtFecha, DateTime.Now);

                this.ComboConceptoAbono();
                switch (strTipoCobranza)
                {
                    case "P":
                        this.getDocumentosPagar(hiddidcobranza.Value);
                        break;

                    case "J":
                        this.getDocumentosPagarJuicio(hiddidcobranza.Value);
                        break;
                }

                if (grillapagletras.Rows.Count.Equals(0))
                {
                    btnGuardar.Visible = false;
                    btnAbonoParcial.Visible = false;
                }

                EvaluarVisibilidadDatosCheques();
            }
            catch (Exception)
            {
                string str3 = "Excepci\x00f3n! Inconsistencia de datos Id Cobranza : " + this.hiddidcobranza.Value.ToString();
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('" + str3 + "');</script>");
            }
        }

        protected void ddlNumeroCheques_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCheques(ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlNumeroCheques));
        }

        protected void imgBuscarGirador_Click(object sender, ImageClickEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtGirador.Text)) return;

            DataTable table = Consulta.BuscarDeudor(txtGirador.Text);
            if (table != null && table.Rows.Count > 0)
                txtnomgirador.Text = table.Rows[0]["rsocial"].ToString();
        }

        protected void ddlFormaPago_SelectedIndexChanged(object sender, EventArgs e)
        {
            EvaluarVisibilidadDatosCheques();
            CargarCheques(ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlNumeroCheques));
        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            CalcularPagoCuotasSeleccionadas();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("buscaCobranzaAbonos.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos()) return;

            string strIndicadorAbono = string.Empty;
            int intIdAbono = 0;
            decimal decMontoAbono = ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(txtMontoAbono);
            decimal decTotalParcial = ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(txtTotalParcial);
            decimal decSaldoAbono = Decimal.Zero;

            if (decTotalParcial > Decimal.Zero && decMontoAbono > Decimal.Zero)
            {
                strIndicadorAbono = "C";
                decSaldoAbono = decTotalParcial - decMontoAbono;
            }

            DateTime datFechaMinima = new DateTime(1900, 1, 1);
            DateTime datFechaUltimoPago = BuscarFechaUltimoCheque();

            DataTable objAbono = Transaccion.InsertaAbono(
                this.hiddidcobranza.Value,
                ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFecha, datFechaMinima).ToString("yyyyMMdd"),
                this.txtMontoAbono.Text,
                ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ConceptoAbono).ToString(),
                ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlFormaPago).ToString(),
                ALCSA.FWK.Web.Control.ExtraerValorComoEntero(banco).ToString(),
                datFechaUltimoPago.ToString("yyyyMMdd"),
                string.Empty,
                this.txtObservacion.Text,
                txtGirador.Enabled ? this.txtGirador.Text.Trim() : string.Empty,
                this.txtBoletaHonorarios.Text,
                string.Empty,
                ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlNumeroCheques).ToString(),
                "1",
                this.Session["Usuario"].ToString(),
                this.TipoComprobante.SelectedValue,
                ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlNumeroCheques) > 1 ? "S" : string.Empty,
                Consulta.Codigo_cuota_colegio(),
                txtGirador.Enabled ? txtnomgirador.Text.Trim() : string.Empty
            );

            if (objAbono != null && objAbono.Rows.Count > 0)
                intIdAbono = ALCSA.FWK.Texto.ConvertirTextoEnEntero(objAbono.Rows[0][0].ToString());

            if (strIndicadorAbono == "C")
                Transaccion.UpdateAbonoParcialEstado(hiddidcobranza.Value.ToString(), intIdAbono.ToString());

            if (decSaldoAbono > Decimal.Zero)
                Transaccion.InsertaAbonoParcial(
                    hiddidcobranza.Value,
                    "E",
                    decSaldoAbono,
                    Session["Usuario"].ToString()
                );

            DataTable objProductoJuicio = Consulta.ProductoJuicio(this.hiddidcobranza.Value.ToString());
            string str7 = "";
            string str8 = "";

            if (objProductoJuicio != null && objProductoJuicio.Rows.Count > 0)
            {
                str7 = objProductoJuicio.Rows[0]["id_producto"].ToString();
                str8 = objProductoJuicio.Rows[0]["tipocobranza"].ToString();
            }

            if (str8 == "P")
                this.marcarletrapagada();

            if (str8 == "J")
            {
                switch (str7)
                {
                    case "1":
                        this.marcarletrapagadamutuo();
                        break;

                    case "2":
                        this.marcarletrapagadadocupagare();
                        break;

                    case "3":
                        this.marcarletrapagadadocujuicio();
                        break;
                }
            }

            Transaccion.UpdateGastos(hiddidcobranza.Value);
            try
            {
                this.GuardarDesglose(
                    intIdAbono.ToString(),
                    hiddidcobranza.Value,
                    txtGastos.Text
                );
            }
            catch (Exception) { }

            GuardarCheques(intIdAbono);

            ClientScript.RegisterClientScriptBlock(
                typeof(Page),
                "alerta",
                string.Format("<script>alert('Datos guardados correctamente');location.href='pagoAbono.aspx?Codigo={0}';</script>", this.hiddidcobranza.Value));
        }

        protected void btnAbonoParcial_Click(object sender, EventArgs e)
        {
            string url = "AbonoParcial.aspx?Codigo=" + this.hiddidcobranza.Value.ToString().ToString();
            base.Response.Redirect(url);
        }

        protected void chkSeleccionaFila_CheckedChanged(object sender, EventArgs e)
        {
            this.LimpiaALL();
        }

        protected void chkSeleccionaTodos_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox box = (CheckBox)sender;
            foreach (GridViewRow row in this.grillapagletras.Rows)
                ((CheckBox)row.FindControl("chkSeleccionaFila")).Checked = box.Checked;
            this.LimpiaALL();
        }

        private void getDocumentosPagar(string id_cobranza)
        {
            grillapagletras.DataSource = ConsultasEspecificas.ConsultaDocumentosPorTipo(
                id_cobranza,
                this.tipotasa.SelectedValue,
                this.ddlFormaPago.SelectedValue,
                BuscarFechaUltimoCheque().ToString("yyyyMMdd"));
            grillapagletras.DataBind();
        }

        private void getDocumentosPagarJuicio(string id_cobranza)
        {
            grillapagletras.DataSource = ConsultasEspecificas.ConsultaDocumentosPorTipoJuicio(
                id_cobranza,
                this.tipotasa.SelectedValue,
                this.ddlFormaPago.SelectedValue,
                BuscarFechaUltimoCheque().ToString("yyyyMMdd"));
            grillapagletras.DataBind();
        }

        public void GuardarDesglose(string prIdAbono, string prIdcobranza, string prgastos)
        {
            if (string.IsNullOrEmpty(prgastos))
                prgastos = "0";

            foreach (GridViewRow objFila in this.grillapagletras.Rows)
                if (((CheckBox)objFila.FindControl("chkSeleccionaFila")).Checked)
                {
                    // intCuota = ALCSA.FWK.Texto.ConvertirTextoEnEntero(objFila.Cells[2].Text);

                    Transaccion.InsertaDesglose(
                        prIdAbono,
                        prIdcobranza,
                        ((Label)objFila.FindControl("lblCodigo")).Text,
                        objFila.Cells[1].Text,
                        ALCSA.FWK.Texto.ConvertirTextoEnDouble(objFila.Cells[2].Text),
                        objFila.Cells[3].Text,
                        ALCSA.FWK.Texto.ConvertirTextoEnDouble(objFila.Cells[4].Text),
                        ALCSA.FWK.Texto.ConvertirTextoEnDouble(objFila.Cells[5].Text),
                        ALCSA.FWK.Texto.ConvertirTextoEnDouble(objFila.Cells[6].Text),
                        ALCSA.FWK.Texto.ConvertirTextoEnDouble(objFila.Cells[7].Text),
                        ALCSA.FWK.Texto.ConvertirTextoEnDouble(objFila.Cells[8].Text),
                        ALCSA.FWK.Texto.ConvertirTextoEnDouble(objFila.Cells[9].Text),
                        ALCSA.FWK.Texto.ConvertirTextoEnDouble(objFila.Cells[10].Text),
                        ALCSA.FWK.Web.Control.ExtraerValorComoEntero((Label)objFila.FindControl("lblcuota")),
                        prgastos);
                }
        }

        private void habilitar()
        {
            this.ConceptoAbono.BackColor = Color.LightYellow;
            this.ddlFormaPago.BackColor = Color.LightYellow;
            this.txtObservacion.BackColor = Color.LightYellow;
            this.ddlNumeroCheques.BackColor = Color.LightYellow;
            this.TipoComprobante.BackColor = Color.LightYellow;
        }

        protected void Habilitar(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow objFila = ((Control)e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Habilitar") == 0) return;
            Button button = (Button) objFila.FindControl("btnPagar");
            button.Text = button.Text == "SI" ? "NO" : "SI";
        }

        private void LimpiaALL()
        {
            this.hddCorrAntiguo.Value = "";
            this.txtMonto.Text = "0";
            this.txtIntereses.Text = "0";
            this.txtGastos.Text = "0";
            this.txtIntAdicional.Text = "0";
            this.txthonorarios.Text = "0";
            this.txtdeschonorarios.Text = "0";
            this.txtotrosdescuentos.Text = "0";
            this.txtdescintereses.Text = "0";
            this.txttotal.Text = "0";
            this.txtMontoAbono.Text = "0";
            this.txtcuota.Text = "0";
        }

        private string MostrarDatosJuicio()
        {
            DataTable table = ConsultasEspecificas.MostrarDatosCabezeraAbonos(hiddidcobranza.Value);
            if (table != null && table.Rows.Count > 0)
            {
                txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                txtCliente.Text = table.Rows[0]["nomcliente"].ToString();
                txtNomDeudor.Text = table.Rows[0]["nomdeudor"].ToString();
                txtRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                txtGirador.Text = txtRutDeudor.Text;
                txtnomgirador.Text = txtNomDeudor.Text;
                return table.Rows[0]["tipocobranza"].ToString();
            }
            return string.Empty;
        }

        protected void btnEliminarCheque_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton objBoton = sender as ImageButton;
            foreach(GridViewRow objFila in gvChequesIngresados.Rows)
                if (objBoton.Equals(objFila.FindControl("btnEliminarCheque") as ImageButton))
                {
                    string strIdCheque = objBoton.CommandArgument;

                    DataTable table = Consulta.VALIDAREliminarChequeMCH(strIdCheque);
                    if (table != null && table.Rows.Count > 0)
                        MostrarMensaje("documento est\x00e1 Liberado y Rendido, no se puede eliminar");
                    else
                    {
                        Transaccion.EliminarChequeMCH(strIdCheque);
                        CargaAbonosRealizados();
                        MostrarMensaje("cheque eliminado correctamente");
                    }
                    break;
                }
        }


        #region Marcar Letras

        private void marcarletrapagada()
        {
            string[] strArray = this.txtcuota.Text.Split(new char[] { '|' });
            string mCH = "";
            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlNumeroCheques) > 1)
                mCH = "S";

            foreach (string str4 in strArray)
            {
                if (string.IsNullOrEmpty(str4)) break;
                Transaccion.ActualizaPagoCuotaColegio(str4, mCH);
            }
        }

        private void marcarletrapagadadocujuicio()
        {
            string[] strArray = this.txtcuota.Text.Split(new char[] { '|' });
            string mCH = "";

            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlNumeroCheques) > 1)
                mCH = "S";

            foreach (string str4 in strArray)
            {
                if (string.IsNullOrEmpty(str4)) break;
                Transaccion.ActualizaPagoDocuJuicio(str4, mCH);
            }
        }

        private void marcarletrapagadadocupagare()
        {
            string[] strArray = this.txtcuota.Text.Split(new char[] { '|' });
            string mCH = "";

            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlNumeroCheques) > 1)
                mCH = "S";

            foreach (string str4 in strArray)
            {
                if (string.IsNullOrEmpty(str4)) break;
                Transaccion.ActualizaPagoDocuPagare(str4, mCH);
            }
        }

        private void marcarletrapagadamutuo()
        {
            string[] strArray = this.txtcuota.Text.Split(new char[] { '|' });
            string mCH = "";

            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlNumeroCheques) > 1)
                mCH = "S";

            foreach (string str4 in strArray)
            {
                if (string.IsNullOrEmpty(str4)) break;
                Transaccion.ActualizaPagoMutuo(str4, mCH);
            }
        }

        #endregion

        #region Llenado DropDownList

        private void ComboBancos()
        {
            this.banco.DataTextField = "descripcion";
            this.banco.DataValueField = "id_banco";
            this.banco.DataSource = Consulta.ComboBancos();
            this.banco.DataBind();
            this.banco.Items.Insert(0, new ListItem("Seleccione un banco...", string.Empty));
        }

        private void ComboConceptoAbono()
        {
            this.ConceptoAbono.DataTextField = "descripcion";
            this.ConceptoAbono.DataValueField = "id_concepto";
            this.ConceptoAbono.DataSource = Consulta.ComboConceptoAbono();
            this.ConceptoAbono.DataBind();
            this.ConceptoAbono.Items.Insert(0, new ListItem("Seleccione un concepto...", string.Empty));
        }

        private void ComboMoneda()
        {
            this.ddlFormaPago.DataTextField = "descripcion";
            this.ddlFormaPago.DataValueField = "id_moneda";
            this.ddlFormaPago.DataSource = Consulta.ComboTipoMoneda();
            this.ddlFormaPago.DataBind();
        }

        #endregion

        #region Cheques

        private List<ALCSA.Entidades.Abonos.AbonoCheque> ExtraerCheques()
        {
            return ExtraerCheques(0);
        }

        private List<ALCSA.Entidades.Abonos.AbonoCheque> ExtraerCheques(int numeroChequesAExtraer)
        {
            List<ALCSA.Entidades.Abonos.AbonoCheque> arrCheques = new List<ALCSA.Entidades.Abonos.AbonoCheque>();
            TextBox txtNumeroCheque, txtFechaPago, txtMontoCheque, txtSerieCheque;
            int intCorrelativo = 1;

            foreach (GridViewRow objFila in gvDetalleCheques.Rows)
                if (numeroChequesAExtraer.Equals(0) || numeroChequesAExtraer >= intCorrelativo)
                {
                    txtNumeroCheque = objFila.FindControl("txtNumeroCheque") as TextBox;
                    txtFechaPago = objFila.FindControl("txtFechaPago") as TextBox;
                    txtMontoCheque = objFila.FindControl("txtMontoCheque") as TextBox;
                    txtSerieCheque = objFila.FindControl("txtSerieCheque") as TextBox;

                    arrCheques.Add(new ALCSA.Entidades.Abonos.AbonoCheque()
                    {
                        NumeroCorrelativo = intCorrelativo,
                        Nrocheque = ALCSA.FWK.Web.Control.ExtraerValor(txtNumeroCheque),
                        Fpago = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaPago),
                        Montoabono = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtMontoCheque),
                        Serie = ALCSA.FWK.Web.Control.ExtraerValor(txtSerieCheque)
                    });

                    intCorrelativo++;
                }

            return arrCheques;
        }

        private DateTime BuscarFechaUltimoCheque()
        {
            if (gvDetalleCheques.Rows.Count.Equals(0)) return DateTime.Now.Date;
            GridViewRow objFila = gvDetalleCheques.Rows[gvDetalleCheques.Rows.Count - 1];
            return ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(objFila.FindControl("txtFechaPago") as TextBox, new DateTime(1900, 1, 1));
        }

        private void CargarCheques(int numeroCheques)
        {
            List<ALCSA.Entidades.Abonos.AbonoCheque> arrCheques = ExtraerCheques(numeroCheques);

            if (!arrCheques.Count.Equals(numeroCheques))
            {
                DateTime datFecha = arrCheques.Count > 0
                    ? arrCheques[arrCheques.Count - 1].Fpago.AddMonths(1)
                    : DateTime.Now.AddMonths(1);

                while (arrCheques.Count < numeroCheques)
                {
                    arrCheques.Add(new ALCSA.Entidades.Abonos.AbonoCheque()
                    {
                        Fpago = datFecha,
                        Montoabono = 0
                    });

                    datFecha = datFecha.AddMonths(1);
                }
            }

            CargarCheques(arrCheques);
        }

        private void CargarCheques(List<ALCSA.Entidades.Abonos.AbonoCheque> cheques)
        {
            for (int intIndice = 0; intIndice < cheques.Count; intIndice++)
                cheques[intIndice].NumeroCorrelativo = intIndice + 1;

            gvDetalleCheques.DataSource = cheques;
            gvDetalleCheques.DataBind();

            TextBox txtFechaPago;

            foreach (GridViewRow objFila in gvDetalleCheques.Rows)
            {
                txtFechaPago = objFila.FindControl("txtFechaPago") as TextBox;
                txtFechaPago.Text = txtFechaPago.Text.Replace("-", "/");
            }
        }

        private void GuardarCheques(int idAbono)
        {
            if (!pnlDatosCheques.Visible) return;
            List<ALCSA.Entidades.Abonos.AbonoCheque> arrCheques = ExtraerCheques();
            ALCSA.Negocio.Abonos.AbonoCheque objAbonoCheque = null;
            int intIdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hiddidcobranza);
            string strUsuario = Session["Usuario"].ToString();

            foreach (ALCSA.Entidades.Abonos.AbonoCheque objCheque in arrCheques)
            {
                objAbonoCheque = new ALCSA.Negocio.Abonos.AbonoCheque();
                ALCSA.FWK.Reflexion.Mapeador.MapearDatos<ALCSA.Entidades.Abonos.AbonoCheque, ALCSA.Negocio.Abonos.AbonoCheque>(objCheque, objAbonoCheque);

                objAbonoCheque.IdAbonoComprobante = idAbono;
                objAbonoCheque.IdCobranza = intIdCobranza;
                objAbonoCheque.Username = strUsuario;

                objAbonoCheque.Guardar();
            }

            // Transaccion.InsertaAbonoMCH(this.hiddidcobranza.Value.ToString(), this.txtNroComprobante.Text, this.txtFechaPago.Text, this.txtNroCheque.Text, this.txtSerie.Text, this.txtMontoAbono.Text, this.Session["Usuario"].ToString());
        }

        private void EvaluarVisibilidadDatosCheques()
        {
            pnlDatosCheques.Visible = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlFormaPago).Equals(5);
        }

        #endregion

        #region Abonos Realizados

        private void CargaAbonosRealizados()
        {
            gvAbonosRealizados.DataSource = Consulta.MostrarAbono(hiddidcobranza.Value);
            gvAbonosRealizados.DataBind();

            foreach (GridViewRow objFila in gvAbonosRealizados.Rows)
            {
                if (objFila.Cells[2].Text.Replace("/", "-") == "01-01-1900")
                    objFila.Cells[2].Text = "...";

                if (objFila.Cells[4].Text.Replace("/", "-") == "01-01-1900")
                    objFila.Cells[4].Text = "...";
            }

            CargarChequesIngresados();
        }

        private void CargarChequesIngresados()
        {
            gvChequesIngresados.DataSource = Consulta.MostrarGrillaCheques(hiddidcobranza.Value);
            gvChequesIngresados.DataBind();
        }

        #endregion

        #region Calculos Pago

        private void CalcularPagoCuotasSeleccionadas()
        {
            try
            {
                decimal decMonto = decimal.Zero;
                decimal decInteres = decimal.Zero;
                decimal decInteresAdicional = decimal.Zero;
                decimal decHonorarios = decimal.Zero;
                decimal decDescHonorarios = decimal.Zero;
                decimal decDescInteres = decimal.Zero;
                decimal decOtrosDescuentos = decimal.Zero;
                int intCuota = 0;
                string strCuotasConcatenadas = string.Empty;

                foreach (GridViewRow objFila in this.grillapagletras.Rows)
                    if (((CheckBox)objFila.FindControl("chkSeleccionaFila")).Checked)
                    {
                        decMonto += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[2].Text);
                        decInteres += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[5].Text);
                        decInteresAdicional += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[6].Text);
                        decHonorarios += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[7].Text);
                        decDescHonorarios += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[8].Text);
                        decDescInteres += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[9].Text);
                        decOtrosDescuentos += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[10].Text);
                        intCuota = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(objFila.FindControl("lblcuota") as Label);

                        strCuotasConcatenadas = strCuotasConcatenadas + intCuota.ToString() + "|";
                    }

                this.hddCorrAntiguo.Value = strCuotasConcatenadas;
                Decimal decGastos = Decimal.Zero;
                DataTable table = ConsultasEspecificas.TraeGastos(this.hiddidcobranza.Value.ToString());

                if (table != null && table.Rows.Count > 0)
                    decGastos = Convert.ToDecimal(table.Rows[0]["gastos"]);

                Decimal decTotalFinal = (decMonto + decInteres + decInteresAdicional + decGastos + decHonorarios) - (decDescHonorarios + decDescInteres + decOtrosDescuentos);

                ALCSA.FWK.Web.Control.AsignarValor(txtMonto, decMonto, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtIntereses, decInteres, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtGastos, decGastos, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtIntAdicional, decInteresAdicional, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txthonorarios, decHonorarios, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtdeschonorarios, decDescHonorarios, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtotrosdescuentos, decOtrosDescuentos, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtdescintereses, decDescInteres, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txttotal, decTotalFinal, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtMontoAbono, decTotalFinal, 0);

                this.txtcuota.Text = strCuotasConcatenadas.ToString();
            }
            catch
            {
                ALCSA.FWK.Web.Control.AsignarValor(txtMonto, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtIntereses, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtGastos, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtIntAdicional, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txthonorarios, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtdeschonorarios, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtotrosdescuentos, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtdescintereses, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txttotal, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtMontoAbono, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtcuota, 0);
            }
        }

        #endregion

        #region Validaciones

        private bool ValidarCampos()
        {
            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtMonto) <= 0)
            {
                MostrarMensaje("'Seleccione cuota a pagar y posteriormente presione el botón CALCULAR");
                return false;
            }

            if (string.IsNullOrWhiteSpace(ALCSA.FWK.Web.Control.ExtraerValor(ConceptoAbono)))
            {
                MostrarMensaje("Debe seleccionar un concepto de abono");
                return false;
            }

            if (string.IsNullOrWhiteSpace(ALCSA.FWK.Web.Control.ExtraerValor(ddlFormaPago)))
            {
                MostrarMensaje("Debe seleccionar tipo de moneda");
                return false;
            }

            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlFormaPago).Equals(6)
                && string.IsNullOrWhiteSpace(ALCSA.FWK.Web.Control.ExtraerValor(txtBoletaHonorarios)))
            {
                MostrarMensaje("Debe ingresar boleta de honorarios");
                return false;
            }

            if (pnlDatosCheques.Visible)
            {
                if (string.IsNullOrWhiteSpace(ALCSA.FWK.Web.Control.ExtraerValor(banco)))
                {
                    MostrarMensaje("Debe seleccionar el banco");
                    return false;
                }

                if (string.IsNullOrWhiteSpace(ALCSA.FWK.Web.Control.ExtraerValor(txtGirador)))
                {
                    MostrarMensaje("Debe ingresar girador");
                    return false;
                }

                if (!ALCSA.FWK.IdentificacionTributaria.RutValido(ALCSA.FWK.Web.Control.ExtraerValor(txtGirador)))
                {
                    MostrarMensaje("Rut del girador no es válido");
                    return false;
                }

                if (string.IsNullOrWhiteSpace(ALCSA.FWK.Web.Control.ExtraerValor(txtnomgirador)))
                {
                    MostrarMensaje("Debe ingresar el nombre girador");
                    return false;
                }

                if (!ValidarCheques()) return false;
            }

            if (this.ddlFormaPago.SelectedValue.ToString() == "5" && this.txtTotalParcial.Text.ToString() != "0")
            {
                MostrarMensaje("El pago parcial es solo para forma de pago efectivo");
                return false;
            }

            int intNumeroCuotasSeleccionadas = 0;
            foreach (GridViewRow objFila in this.grillapagletras.Rows)
                if (((CheckBox)objFila.FindControl("chkSeleccionaFila")).Checked)
                    intNumeroCuotasSeleccionadas++;

            if (intNumeroCuotasSeleccionadas > 1 && ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtTotalParcial) > 0)
            {
                MostrarMensaje("Solo se puede pagar una letra con abono parcial");
                return false;
            }

            decimal decMontoAbono = ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(txtMontoAbono);
            decimal decTotalParcial = ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(txtTotalParcial);

            if (decTotalParcial > Decimal.Zero && decMontoAbono > Decimal.Zero && decTotalParcial < decMontoAbono)
            {
                MostrarMensaje("Total Parcial es menor a Monto Pago");
                return false;
            }

            return true;
        }

        private bool ValidarCheques()
        {
            if (!pnlDatosCheques.Visible) return true;
            List<ALCSA.Entidades.Abonos.AbonoCheque> arrCheques = ExtraerCheques();
            DateTime datFechaMinima = new DateTime(200, 1, 1);

            foreach (ALCSA.Entidades.Abonos.AbonoCheque objCheque in arrCheques)
            {
                if (string.IsNullOrWhiteSpace(objCheque.Nrocheque))
                {
                    MostrarMensaje(string.Format("Debe ingresar el numero para el cheque N°{0}", objCheque.NumeroCorrelativo));
                    return false;
                }
                if (objCheque.Fpago <= datFechaMinima)
                {
                    MostrarMensaje(string.Format("Debe ingresar una fecha de pago valida para el cheque N°{0}", objCheque.NumeroCorrelativo));
                    return false;
                }
                if (objCheque.Montoabono <= 0)
                {
                    MostrarMensaje(string.Format("Debe ingresar el monto del cheque N°{0}", objCheque.NumeroCorrelativo));
                    return false;
                }
                if (string.IsNullOrWhiteSpace(objCheque.Serie))
                {
                    MostrarMensaje(string.Format("Debe ingresar la serie para el cheque N°{0}", objCheque.NumeroCorrelativo));
                    return false;
                }
            }
            return true;
        }

        private void MostrarMensaje(string mensaje)
        {
            ClientScript.RegisterClientScriptBlock(typeof(Page), "alerta", string.Format("<script type=\"text/javascript\">alert('{0}');</script>", mensaje.Replace("'", string.Empty)));
        }

        #endregion
    }
}

