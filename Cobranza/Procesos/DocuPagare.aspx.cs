namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using ALCSA.Negocio.Documentos.Fisicos;
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

    public partial class DocuPagare : Page
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

            AsignarTitulo(objCobranza.IdMateria);

            txtNumeroOperacion.Text = objCobranza.Nrooperacion;
            txtRutCliente.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objCobranza.RutCli);
            txtRutDeudor.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objCobranza.RutDeudor);
            txtNombreCliente.Text = objCobranza.NombreCliente;
            txtNombreDeudor.Text = objCobranza.NombreDeudor;

            CambiarColorControlesSoloLectura();

            ALCSA.Negocio.Cobranzas.DocumentoPagare objDocumento = new ALCSA.Negocio.Cobranzas.DocumentoPagare();
            if (objDocumento.CargarPorCobranza(intIdCobranza))
            {
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdDocuPagare, objDocumento.ID);
                txtNroPagare.Text = objDocumento.Nropagare;

                ALCSA.FWK.Web.Control.AsignarValor(hdfIdDireccionPagare, objDocumento.IdDomicilio);

                txtRutAval1.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objDocumento.RutRepresentante1);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdDireccionAval1, objDocumento.IdDomiRepre1);

                txtRutAval2.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objDocumento.RutRepresentante2);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdDireccionAval2, objDocumento.IdDomiRepre2);

                ALCSA.FWK.Web.Control.AsignarValor(txtMontoDemanda, objDocumento.Montodemanda, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtMontoTotalDeuda, objDocumento.Montotaldeuda, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtFechaSuscripcion, objDocumento.Fsuscripcion);
                ALCSA.FWK.Web.Control.AsignarValor(txtSumaInicialSuscripcion, objDocumento.Sumainisuscripcion, 0);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdTipoMoneda, objDocumento.IdMoneda);
                ALCSA.FWK.Web.Control.AsignarValor(txtNroCuotas, objDocumento.Nrocuotas);
                ALCSA.FWK.Web.Control.AsignarValor(txtTasaInteres, objDocumento.Tasainteres, 2);
                ALCSA.FWK.Web.Control.AsignarValor(txtVcto1cuota, objDocumento.Vcto1cuota);
                ALCSA.FWK.Web.Control.AsignarValor(txtVstoSgteCuotas, objDocumento.Vctosiguientescuotas);
                ALCSA.FWK.Web.Control.AsignarValor(txtMonto1cuota, objDocumento.Monto1cuotas, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtMontoUltCuota, objDocumento.Montoultimacuota, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtfechamora, objDocumento.Fmora);
                ALCSA.FWK.Web.Control.AsignarValor(txtfechaprescripcion, objDocumento.Fprescripcion);
                ALCSA.FWK.Web.Control.AsignarValor(txtFechaLiquidacion, objDocumento.Fliquidacion);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdComunaExhorto, objDocumento.IdComunaExhorto);
                ALCSA.FWK.Web.Control.AsignarValor(txtFechaAutoriFirma, objDocumento.Fautorizacionfirma);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdNotario, objDocumento.IdNotaria);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdLocalidadNotario, objDocumento.IdComunaNotaria);
                txtObservacion.Text = objDocumento.Observacion;

                txtTipoMoneda.Text = objDocumento.NombreTipoMoneda;
                txtComunaExhorto.Text = objDocumento.NombreComunaExhorto;
                txtNotario.Text = objDocumento.NombreNotario;

                txtNombreAval1.Text = objDocumento.NombreRepresentanteUno;
                txtNombreAval2.Text = objDocumento.NombreRepresentanteDos;

                txtLocalidadNotario.Text = objDocumento.NombreComunaNotario;
                txtDireccionAval1.Text = objDocumento.DireccionRepresentanteUno;
                txtDireccionAval2.Text = objDocumento.DireccionRepresentanteDos;
                txtDireccionPagare.Text = objDocumento.DireccionPagare;

                IList<ALCSA.Entidades.Documentos.Fisicos.Documento> arrDocumentosFisicos = new ALCSA.Negocio.Documentos.Fisicos.Documento().Listar(
                    objDocumento.IdCobranza.ToString(),
                    ALCSA.Negocio.Documentos.Fisicos.TipoIdentificador.TIPO_IDENTIFICADOR_COBRANZA);

                if (arrDocumentosFisicos != null && arrDocumentosFisicos.Count > 0)
                {
                    gvDocumentosFisicos.DataSource = arrDocumentosFisicos;
                    gvDocumentosFisicos.DataBind();
                }
            }
            txtNumeroOperacion.Focus();
        }

        private void AsignarTitulo(int idMateria)
        {
            int[] arrIds = new int[] { 2, 5, 25 };
            string[] arrTitulos = new string[] { "COBRO PAGAR\x00c9", "CUMPLIMIENTO OBLIGATORIO DE DAR", "CUMPLIMIENTO OBLIGATORIO DE HACER" };

            for (int intIndice = 0; intIndice < arrIds.Length; intIndice++)
                if (arrIds[intIndice].Equals(idMateria))
                {
                    lblTitulo.Text = arrTitulos[intIndice];
                    break;
                }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ALCSA.Negocio.Cobranzas.DocumentoPagare objDocumento = new ALCSA.Negocio.Cobranzas.DocumentoPagare();
            objDocumento.ID = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdDocuPagare);
            objDocumento.IdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza);

            objDocumento.Nropagare = txtNroPagare.Text;
            objDocumento.IdDomicilio = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdDireccionPagare);

            objDocumento.RutRepresentante1 = txtRutAval1.Text.Replace(".", string.Empty).Trim();
            objDocumento.IdDomiRepre1 = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdDireccionAval1);

            objDocumento.RutRepresentante2 = txtRutAval2.Text.Replace(".", string.Empty).Trim();
            objDocumento.IdDomiRepre2 = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdDireccionAval1);

            objDocumento.Montodemanda = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtMontoDemanda);
            objDocumento.Montotaldeuda = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtMontoTotalDeuda);
            objDocumento.Fsuscripcion = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaSuscripcion);
            objDocumento.Sumainisuscripcion = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtSumaInicialSuscripcion);
            objDocumento.IdMoneda = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdTipoMoneda);
            objDocumento.Nrocuotas = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtNroCuotas);
            objDocumento.Tasainteres = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtTasaInteres);
            objDocumento.Vcto1cuota = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtVcto1cuota);
            objDocumento.Vctosiguientescuotas = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtVstoSgteCuotas);
            objDocumento.Monto1cuotas = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtMonto1cuota);
            objDocumento.Montoultimacuota = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtMontoUltCuota);
            objDocumento.Fmora = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtfechamora);
            objDocumento.Fprescripcion = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtfechaprescripcion);
            objDocumento.Fliquidacion = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaLiquidacion);
            objDocumento.IdComunaExhorto = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdComunaExhorto);
            objDocumento.Fautorizacionfirma = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaAutoriFirma);
            objDocumento.IdNotaria = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdNotario);
            objDocumento.IdComunaNotaria = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdLocalidadNotario);
            objDocumento.Observacion = txtObservacion.Text.Trim();

            objDocumento.Guardar();

            int intIdDocumento = 0;

            if (filesubir.HasFile)
            {
                // string nomArchivo = string.Format("DocPagare{0}{1}", objDocumento.ID, Path.GetExtension(this.filesubir.PostedFile.FileName));
                // string str8 = UTIL.SubirArchivo(filesubir, Server.MapPath(@"~\DOCUMENTOS"), nomArchivo);
                
                // GUARDAR ARCHIVO EN BASE DE DATOS
                ALCSA.Negocio.Documentos.Fisicos.Documento objDocumentoFisico = new ALCSA.Negocio.Documentos.Fisicos.Documento()
                {
                    Nombre = this.filesubir.PostedFile.FileName,
                    Descripcion = string.Empty,
                    CodigoTipoDocumento = TipoDocumento.TIPO_DOCUMENTO_PAGARE,
                    FechaIngreso = DateTime.Now,
                    IdTipoDocumento = 0,
                    Peso = this.filesubir.PostedFile.ContentLength,
                    Archivo = this.filesubir.FileBytes
                };
                objDocumentoFisico.Insertar(new List<ALCSA.Entidades.Documentos.Fisicos.Identificador>() { 
                    new ALCSA.Negocio.Documentos.Fisicos.Identificador()
                    {
                        CodigoTipoIdentificador = TipoIdentificador.TIPO_IDENTIFICADOR_COBRANZA,
                        Valor = objDocumento.IdCobranza.ToString()
                    },
                    new ALCSA.Negocio.Documentos.Fisicos.Identificador()
                    {
                        CodigoTipoIdentificador = TipoIdentificador.TIPO_IDENTIFICADOR_DOCUMENTO_PAGARE,
                        Valor = objDocumento.ID.ToString()
                    }
                });

                intIdDocumento = objDocumentoFisico.ID;
            }

            // GENERAR ARCHIVO
            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdEsCobranzaNueva) == 1)
                Response.Redirect(string.Format("Cobranza.aspx?mensaje=1&id_doc={0}", intIdDocumento), true);
            else
                Response.Redirect(string.Format("../Demandas/DatosCobranza.aspx?gen_doc=1&id_cob={0}&tipo={1}&id_doc={2}", objDocumento.IdCobranza, ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_PAGARE, intIdDocumento), true);
        }

        private void CambiarColorControlesSoloLectura()
        {
            txtNumeroOperacion.BackColor = Color.LightYellow;
            txtRutDeudor.BackColor = Color.LightYellow;
            txtRutCliente.BackColor = Color.LightYellow;
            txtNombreDeudor.BackColor = Color.LightYellow;
            txtNombreCliente.BackColor = Color.LightYellow;
        }
    }
}
