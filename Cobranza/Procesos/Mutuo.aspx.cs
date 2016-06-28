namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using CobranzaALC.Dto;
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Drawing;
    using System.IO;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;
    using ALCSA.Negocio.Documentos.Fisicos;

    public partial class Mutuo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack) return;

            int intIdCobranza = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_cob");
            if (intIdCobranza < 1) return;
            hdfIdEsCobranzaNueva.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "es_nueva").ToString();
            btnGuardar.Text = hdfIdEsCobranzaNueva.Value.Equals("1") ? "GUARDAR" : "GUARDAR Y GENERAR";

            ALCSA.Negocio.Cobranzas.Cobranza objCobranza = new ALCSA.Negocio.Cobranzas.Cobranza(intIdCobranza);
            ALCSA.FWK.Web.Control.AsignarValor(hdfIdCobranza, objCobranza.ID);

            txtNumeroOperacion.Text = objCobranza.Nrooperacion;
            txtRutCliente.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objCobranza.RutCli);
            txtRutDeudor.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objCobranza.RutDeudor);
            txtNombreCliente.Text = objCobranza.NombreCliente;
            txtNombreDeudor.Text = objCobranza.NombreDeudor;

            CambiarColorControlesSoloLectura();

            ALCSA.Negocio.Cobranzas.Mutuo objMutuo = new ALCSA.Negocio.Cobranzas.Mutuo();
            if (objMutuo.CargarPorCobranza(objCobranza.ID))
            {
                // CARGAR DATOS MUTUO
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdMutuo, objMutuo.ID);

                ALCSA.FWK.Web.Control.AsignarValor(hdfIdDomicilioInmueble, objMutuo.IdBienRaiz);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdDomicilioInmuebleActual, objMutuo.IdBienRaiz);

                ALCSA.FWK.Web.Control.SeleccionarValor(moneda, objMutuo.IdMoneda);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdSubProducto, objMutuo.Subproducto);

                txtNroDocum.Text = objMutuo.Nrodocumento;
                txtSerieLetraCred.Text = objMutuo.SerieLetCred;

                ALCSA.FWK.Web.Control.AsignarValor(txtMontoCred1esc, objMutuo.MontoCred1Esc);
                ALCSA.FWK.Web.Control.AsignarValor(txtMontoCred2esc, objMutuo.MontoCred2Esc);
                ALCSA.FWK.Web.Control.AsignarValor(txtPlazoMutuoMeses, objMutuo.PlazoMutuoMes);
                ALCSA.FWK.Web.Control.AsignarValor(txtNumero1Divimpago, objMutuo.N1DivImpago);
                ALCSA.FWK.Web.Control.AsignarValor(txtNumeroUltDivImpago, objMutuo.NUltDivImpago);
                ALCSA.FWK.Web.Control.AsignarValor(txtMontoDivAdeudadoPESO, objMutuo.MontoDivAdeudadoPs);
                ALCSA.FWK.Web.Control.AsignarValor(txtTotalAdeudado, objMutuo.TotalAdeudado);

                ALCSA.FWK.Web.Control.AsignarValor(txtTasaInt1Esc, objMutuo.TazaInt1Esc, 2);
                ALCSA.FWK.Web.Control.AsignarValor(txtTasaInt2Esc, objMutuo.TazaInt2Esc, 2);
                ALCSA.FWK.Web.Control.AsignarValor(txtMontoDivAdeudadoUF, objMutuo.MontoDivAdeudadoUf, 2);
                ALCSA.FWK.Web.Control.AsignarValor(txtSaldoTotalDeudaUF, objMutuo.SaldoTotalDeudaUf, 2);

                ALCSA.FWK.Web.Control.AsignarValor(txtFechaPrescripcion, objMutuo.FechaPrescripcion);
                ALCSA.FWK.Web.Control.AsignarValor(txtFecha1Vcto, objMutuo.Fecha1Venc);
                ALCSA.FWK.Web.Control.AsignarValor(txtFechaLiquidacion, objMutuo.FechaLiquidacion);
                ALCSA.FWK.Web.Control.AsignarValor(txtFechaMora, objMutuo.FechaMora);

                IList<ALCSA.Entidades.Documentos.Fisicos.Documento> arrDocumentosFisicos = new ALCSA.Negocio.Documentos.Fisicos.Documento().Listar(
                    objMutuo.IdCobranza.ToString(),
                    ALCSA.Negocio.Documentos.Fisicos.TipoIdentificador.TIPO_IDENTIFICADOR_COBRANZA);

                if (arrDocumentosFisicos != null && arrDocumentosFisicos.Count > 0)
                {
                    gvDocumentosFisicos.DataSource = arrDocumentosFisicos;
                    gvDocumentosFisicos.DataBind();
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ALCSA.Negocio.Cobranzas.Mutuo objMutuo = new ALCSA.Negocio.Cobranzas.Mutuo();

            objMutuo.ID = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdMutuo);
            objMutuo.IdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza);

            objMutuo.IdBienRaiz = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdDomicilioInmueble);
            objMutuo.IdMoneda = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(moneda);
            objMutuo.Subproducto = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdSubProducto);

            objMutuo.Nrodocumento = txtNroDocum.Text;
            objMutuo.SerieLetCred = txtSerieLetraCred.Text;

            objMutuo.MontoCred1Esc = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtMontoCred1esc);
            objMutuo.MontoCred2Esc = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtMontoCred2esc);
            objMutuo.PlazoMutuoMes = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtPlazoMutuoMeses);
            objMutuo.N1DivImpago = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtNumero1Divimpago);
            objMutuo.NUltDivImpago = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtNumeroUltDivImpago);
            objMutuo.MontoDivAdeudadoPs = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtMontoDivAdeudadoPESO);
            objMutuo.TotalAdeudado = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtTotalAdeudado);

            objMutuo.TazaInt1Esc = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtTasaInt1Esc);
            objMutuo.TazaInt2Esc = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtTasaInt2Esc);
            objMutuo.MontoDivAdeudadoUf = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtMontoDivAdeudadoUF);
            objMutuo.SaldoTotalDeudaUf = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtSaldoTotalDeudaUF);

            objMutuo.FechaPrescripcion = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaPrescripcion);
            objMutuo.Fecha1Venc = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFecha1Vcto);
            objMutuo.FechaLiquidacion = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaLiquidacion);
            objMutuo.FechaMora = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaMora);

            objMutuo.Guardar();

            int intIdDocumento = 0;
            if (filesubir.HasFile)
            {
                // string nomArchivo = string.Format("DocMutuo{0}{1}", objMutuo.ID, Path.GetExtension(this.filesubir.PostedFile.FileName));
                // string str8 = UTIL.SubirArchivo(filesubir, Server.MapPath(@"~\DOCUMENTOS"), nomArchivo);

                ALCSA.Negocio.Documentos.Fisicos.Documento objDocumentoFisico = new ALCSA.Negocio.Documentos.Fisicos.Documento()
                {
                    Nombre = this.filesubir.PostedFile.FileName,
                    Descripcion = string.Empty,
                    CodigoTipoDocumento = TipoDocumento.TIPO_DOCUMENTO_MUTUO,
                    FechaIngreso = DateTime.Now,
                    IdTipoDocumento = 0,
                    Peso = this.filesubir.PostedFile.ContentLength,
                    Archivo = this.filesubir.FileBytes
                };
                objDocumentoFisico.Insertar(new List<ALCSA.Entidades.Documentos.Fisicos.Identificador>() { 
                    new ALCSA.Negocio.Documentos.Fisicos.Identificador()
                    {
                        CodigoTipoIdentificador = TipoIdentificador.TIPO_IDENTIFICADOR_COBRANZA,
                        Valor = objMutuo.IdCobranza.ToString()
                    },
                    new ALCSA.Negocio.Documentos.Fisicos.Identificador()
                    {
                        CodigoTipoIdentificador = TipoIdentificador.TIPO_IDENTIFICADOR_MUTUO,
                        Valor = objMutuo.ID.ToString()
                    }
                });

                intIdDocumento = objDocumentoFisico.ID;
            }

            // GENERAR ARCHIVO
            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdEsCobranzaNueva) == 1)
                Response.Redirect(string.Format("Cobranza.aspx?mensaje=1&id_doc={0}", intIdDocumento), true);
            else
                Response.Redirect(string.Format("../Demandas/DatosCobranza.aspx?gen_doc=1&id_cob={0}&tipo={1}&id_doc={2}", objMutuo.IdCobranza, ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_MUTUO, intIdDocumento), true);
        }

        private void CambiarColorControlesSoloLectura()
        {
            txtNumeroOperacion.BackColor = Color.LightYellow;
            txtRutDeudor.BackColor = Color.LightYellow;
            txtRutCliente.BackColor = Color.LightYellow;
            txtNombreDeudor.BackColor = Color.LightYellow;
            txtNombreCliente.BackColor = Color.LightYellow;

            txtFechaEscritura.BackColor = Color.LightYellow;
            txtNotario.BackColor = Color.LightYellow;
            txtFojaInsc.BackColor = Color.LightYellow;
            txtNroInsc.BackColor = Color.LightYellow;
            txtAnioInsc.BackColor = Color.LightYellow;
            txtComunaConservador.BackColor = Color.LightYellow;
            txtFojahip.BackColor = Color.LightYellow;
            txtNrohip.BackColor = Color.LightYellow;
            txtaniohip.BackColor = Color.LightYellow;
        }

/*
        private void CargarDomicilios(string rut_deudor)
        {
            this.direinmuhip.DataTextField = "domicilio";
            this.direinmuhip.DataValueField = "id_bien_raiz";
            this.direinmuhip.DataSource = Consulta.BienRaizPorDomicilio(rut_deudor);
            this.direinmuhip.DataBind();
            this.direinmuhip.Items.Insert(0, "Seleccione");
        }

        protected void direinmuhip_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table = null;
            table = Consulta.BienRaizPorDomicilioTodos(this.direinmuhip.SelectedValue);
            if (table != null)
            {
                string str = string.Empty;
                if (table.Rows[0]["fescritura"].ToString() != "01/01/1900")
                    str = table.Rows[0]["fescritura"].ToString();

                this.txtFechaEscritura.Text = str;
                this.txtNotario.Text = table.Rows[0]["id_notaria"].ToString();
                this.txtFojaInsc.Text = table.Rows[0]["fojas_insc"].ToString();
                this.txtNroInsc.Text = table.Rows[0]["n_insc"].ToString();
                this.txtAnioInsc.Text = table.Rows[0]["anio_insc"].ToString();
                this.txtComunaConservador.Text = table.Rows[0]["descripcion"].ToString();
                this.txtFojahip.Text = table.Rows[0]["fojas1_hip"].ToString();
                this.txtNrohip.Text = table.Rows[0]["n1_hip"].ToString();
                this.txtaniohip.Text = table.Rows[0]["anio1_hip"].ToString();
            }
            else
            {
                this.txtFechaEscritura.Text = "";
                this.txtNotario.Text = "";
                this.txtFojaInsc.Text = "";
                this.txtNroInsc.Text = "";
                this.txtAnioInsc.Text = "";
                this.txtComunaConservador.Text = "";
                this.txtFojahip.Text = "";
                this.txtNrohip.Text = "";
                this.txtaniohip.Text = "";
            }
        }
         */
    }
}

