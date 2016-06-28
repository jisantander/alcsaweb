namespace CobranzaALC.Cobranza.Procesos
{
    using System;
    using System.Configuration;
    using System.Collections.Generic;
    using System.Drawing;
    using System.IO;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;
    using ALCSA.Negocio.Documentos.Fisicos;

    public partial class DocuJuicio : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ----------------------------------------------------------------------------------
            if (this.Page.IsPostBack) return;
            // ----------------------------------------------------------------------------------
            ALCSA.Negocio.ServiciosJson.ListadorConceptos objConcepto = new ALCSA.Negocio.ServiciosJson.ListadorConceptos();
            ddlNotarios.DataSource = objConcepto.Listar("NOTARIOS");
            ddlNotarios.DataBind();
            ddlNotarios.Items.Insert(0, new ListItem("...", "0"));

            ddlLocalidadesNotarios.DataSource = objConcepto.Listar("COMUNAS_NOTARIO");
            ddlLocalidadesNotarios.DataBind();
            ddlLocalidadesNotarios.Items.Insert(0, new ListItem("...", "0"));

            ddlBancos.DataSource = objConcepto.Listar("BANCOS");
            ddlBancos.DataBind();
            ddlBancos.Items.Insert(0, new ListItem("...", "0"));
            // ----------------------------------------------------------------------------------
            int intIdCobranza = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_cob");
            if (intIdCobranza < 1) return;
            hdfIdEsCobranzaNueva.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "es_nueva").ToString();
            btnGuardar.Text = hdfIdEsCobranzaNueva.Value.Equals("1") ? "GUARDAR" : "GUARDAR Y GENERAR";
            // ----------------------------------------------------------------------------------
            ALCSA.Negocio.Cobranzas.Cobranza objCobranza = new ALCSA.Negocio.Cobranzas.Cobranza(intIdCobranza);
            ALCSA.FWK.Web.Control.AsignarValor(hdfIdCobranza, objCobranza.ID);
            // ----------------------------------------------------------------------------------
            AsignarTitulo(objCobranza.IdMateria);
            // ----------------------------------------------------------------------------------
            txtNumeroOperacion.Text = objCobranza.Nrooperacion;
            txtRutCliente.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objCobranza.RutCli);
            txtRutDeudor.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objCobranza.RutDeudor);
            txtNombreCliente.Text = objCobranza.NombreCliente;
            txtNombreDeudor.Text = objCobranza.NombreDeudor;
            // ----------------------------------------------------------------------------------
            CambiarColorControlesSoloLectura();
            // ----------------------------------------------------------------------------------
            IList<ALCSA.Entidades.Cobranzas.DocumentoJuicio> arrDocumentos = new ALCSA.Negocio.Cobranzas.DocumentoJuicio().Listar(intIdCobranza);
            // ----------------------------------------------------------------------------------
            if (arrDocumentos.Count > 0)
            {
                ALCSA.Entidades.Cobranzas.DocumentoJuicio objDocumento = arrDocumentos[0];
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdDomicilioDeudor, objDocumento.IdDomicilio);

                txtRutRepresentanteUno.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objDocumento.Representante1);
                txtRutRepresentanteDos.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objDocumento.Representante2);
                txtRutEndosante.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objDocumento.RutDeudorEndosante);

                ALCSA.FWK.Web.Control.AsignarValor(hdfIdDomicilioEndosante, objDocumento.IdDomicilioEndosante);
                ALCSA.FWK.Web.Control.AsignarValor(txtFechaAceptacion, objDocumento.Faceptacion);
                ALCSA.FWK.Web.Control.SeleccionarValor(ddlNotarios, objDocumento.IdNotario);
                ALCSA.FWK.Web.Control.SeleccionarValor(ddlLocalidadesNotarios, objDocumento.IdComunaNotario);
                ALCSA.FWK.Web.Control.AsignarValor(txtFechaAutorizacionNotarial, objDocumento.Fautorizacionnotarial);
                
                txtTituloConstaDeuda.Text = objDocumento.Tituloconstadeuda;
                ALCSA.FWK.Web.Control.AsignarValor(txtFechaDeuda, objDocumento.Fdeuda);
                ALCSA.FWK.Web.Control.SeleccionarValor(ddlBancos, objDocumento.IdBanco);
                txtCtacte.Text = objDocumento.Ctacte;
                txtserie.Text = objDocumento.Numserie;
                
                ALCSA.FWK.Web.Control.AsignarValor(txtFechaGiroEmision, objDocumento.Fgiroemision);
                ALCSA.FWK.Web.Control.AsignarValor(txtfechaprescripcion, objDocumento.Fprescripcion);
                txtActaProtesto.Text = objDocumento.Actaprotesto;
                txtDireccionActa.Text = objDocumento.Direccionacta;
                txtObservacion.Text = objDocumento.Observacion;

                txtNombreRepresentanteUno.Text = objDocumento.NombreRepresentanteUno;
                txtNombreRepresentanteDos.Text = objDocumento.NombreRepresentanteDos;
                txtNombreEndosante.Text = objDocumento.NombreEndosante;

                txtDomicilioEndosante.Text = objDocumento.DireccionEndosante;
                txtDomicilioDeudor.Text = objDocumento.DireccionDeudor;

                IList<ALCSA.Entidades.Documentos.Fisicos.Documento> arrDocumentosFisicos = new ALCSA.Negocio.Documentos.Fisicos.Documento().Listar(
                    objDocumento.IdCobranza.ToString(),
                    ALCSA.Negocio.Documentos.Fisicos.TipoIdentificador.TIPO_IDENTIFICADOR_COBRANZA);

                if (arrDocumentosFisicos != null && arrDocumentosFisicos.Count > 0)
                {
                    gvDocumentosFisicos.DataSource = arrDocumentosFisicos;
                    gvDocumentosFisicos.DataBind();
                }
            }
            // ----------------------------------------------------------------------------------
            while (arrDocumentos.Count < 10)
                arrDocumentos.Add(new ALCSA.Entidades.Cobranzas.DocumentoJuicio() { ID = 0, Monto = 0, Nrodocumento = string.Empty, IdTipoDocumento = 0 });

            gvDocumentos.DataSource = arrDocumentos;
            gvDocumentos.DataBind();

            foreach (GridViewRow objFila in gvDocumentos.Rows)
            {
                TextBox txtFecha = objFila.FindControl("txtFechaVencimiento") as TextBox;
                txtFecha.Text = txtFecha.Text.Replace("-", "/");
                if (ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFecha).Year < 1950)
                    txtFecha.Text = string.Empty;
            }
            // ----------------------------------------------------------------------------------
            txtNumeroOperacion.Focus();
            // ----------------------------------------------------------------------------------
        }

        private void AsignarTitulo(int idMateria)
        {
            int[] arrIds = new int[] { 1, 4, 7, 8, 10, 11, 26, 28 };
            string[] arrTitulos = new string[] {"COBRO CHEQUE", "COBRO LETRA DE CAMBIO", "NOTIFICACION PROTESTO CHEQUE", "NOTIFICACION PROTESTO LETRA",
                "CITACI\x00d3N A CONFESAR DEUDA", "CITACI\x00d3N A CONFESAR DEUDA, RECONOCIMIENTO FIRMA","COBRO FACTURA","NOTIFICACI\x00d3N FACTURA" };

            for (int intIndice = 0; intIndice < arrIds.Length; intIndice++)
                if (arrIds[intIndice].Equals(idMateria))
                {
                    lblTitulo.Text = arrTitulos[intIndice];
                    break;
                }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // ----------------------------------------------------------------------------------
            int intPrimerId = 0;
            ALCSA.Negocio.Cobranzas.DocumentoJuicio objDocumento = null;
            // ----------------------------------------------------------------------------------
            foreach (GridViewRow objFila in gvDocumentos.Rows)
            {
                objDocumento = CrearObjetoDocuJuicio();

                objDocumento.Nrodocumento = ALCSA.FWK.Web.Control.ExtraerValor(objFila.FindControl("txtNroDocumento") as TextBox).Trim();
                objDocumento.Numcheque = objDocumento.Nrodocumento;
                objDocumento.Monto = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(objFila.FindControl("txtMonto") as TextBox);
                objDocumento.IdTipoDocumento = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(objFila.FindControl("ddlTiposDocumentos") as DropDownList);
                objDocumento.Fvencimiento = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(objFila.FindControl("txtFechaVencimiento") as TextBox);
                objDocumento.ID = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(objFila.FindControl("hdfIdDocumentoJuicio") as HiddenField);

                if (objDocumento.IdTipoDocumento > 0 && !string.IsNullOrEmpty(objDocumento.Nrodocumento))
                {
                    objDocumento.Guardar();
                    if (intPrimerId.Equals(0)) intPrimerId = objDocumento.ID;
                }
                else if (objDocumento.ID > 0) objDocumento.Eliminar();
            }
            // ----------------------------------------------------------------------------------
            // NO SE INGRESARON DOCUMENTOS
            if (intPrimerId.Equals(0))
            {
                objDocumento = CrearObjetoDocuJuicio();
                objDocumento.Guardar();
                intPrimerId = objDocumento.ID;
            }
            // ----------------------------------------------------------------------------------
            int intIdDocumento = 0;

            if (filesubir.HasFile)
            {
                // string nomArchivo = string.Format("DocJuicio{0}{1}", intPrimerId, Path.GetExtension(this.filesubir.PostedFile.FileName));
                // string str8 = ALCLOCAL.UTIL.SubirArchivo(filesubir, Server.MapPath(@"~\DOCUMENTOS"), nomArchivo);

                ALCSA.Negocio.Documentos.Fisicos.Documento objDocumentoFisico = new ALCSA.Negocio.Documentos.Fisicos.Documento()
                {
                    Nombre = this.filesubir.PostedFile.FileName,
                    Descripcion = string.Empty,
                    CodigoTipoDocumento = TipoDocumento.TIPO_DOCUMENTO_JUICIO,
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
                        CodigoTipoIdentificador = TipoIdentificador.TIPO_IDENTIFICADOR_DOCUMENTO_JUICIO,
                        Valor = objDocumento.ID.ToString()
                    }
                });

                intIdDocumento = objDocumentoFisico.ID;
            }
            // ----------------------------------------------------------------------------------
            // GENERAR ARCHIVO
            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdEsCobranzaNueva) == 1)
                Response.Redirect(string.Format("Cobranza.aspx?mensaje=1&id_doc={0}", intIdDocumento), true);
            else
                Response.Redirect(string.Format("../Demandas/DatosCobranza.aspx?gen_doc=1&id_cob={0}&tipo={1}&id_doc={2}", objDocumento.IdCobranza, ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_JUICIO, intIdDocumento), true);
            // ----------------------------------------------------------------------------------
        }

        private void CambiarColorControlesSoloLectura()
        {
            txtNumeroOperacion.BackColor = Color.LightYellow;
            txtRutDeudor.BackColor = Color.LightYellow;
            txtRutCliente.BackColor = Color.LightYellow;
            txtNombreDeudor.BackColor = Color.LightYellow;
            txtNombreCliente.BackColor = Color.LightYellow;
        }

        public IList<ALCSA.Entidades.Base> ListarTiposDocumentos()
        {
            IList<ALCSA.Entidades.Base> arrTipos = new ALCSA.Negocio.ServiciosJson.ListadorConceptos().Listar("TIPOS_DOCUMENTOS");
            arrTipos.Insert(0, new ALCSA.Entidades.Base() { ID = 0, Nombre = "..." });
            return arrTipos;
        }

        public ALCSA.Negocio.Cobranzas.DocumentoJuicio CrearObjetoDocuJuicio()
        {
            ALCSA.Negocio.Cobranzas.DocumentoJuicio objDocumento = new ALCSA.Negocio.Cobranzas.DocumentoJuicio();
            objDocumento.IdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza);
            objDocumento.IdDomicilio = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdDomicilioDeudor);
            objDocumento.Representante1 = txtRutRepresentanteUno.Text.Replace(".", string.Empty).Trim();
            objDocumento.Representante2 = txtRutRepresentanteDos.Text.Replace(".", string.Empty).Trim();
            objDocumento.RutDeudorEndosante = txtRutEndosante.Text.Replace(".", string.Empty).Trim();
            objDocumento.IdDomicilioEndosante = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdDomicilioEndosante);
            objDocumento.Faceptacion = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaAceptacion);
            objDocumento.IdNotario = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlNotarios);
            objDocumento.IdComunaNotario = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlLocalidadesNotarios);
            objDocumento.Fautorizacionnotarial = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaAutorizacionNotarial);
            objDocumento.Tituloconstadeuda = txtTituloConstaDeuda.Text.Trim();
            objDocumento.Fdeuda = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaDeuda);
            objDocumento.IdBanco = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlBancos);
            objDocumento.Ctacte = txtCtacte.Text.Trim();
            objDocumento.Numserie = txtserie.Text.Trim();

            objDocumento.Fgiroemision = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaGiroEmision);
            objDocumento.Fprescripcion = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtfechaprescripcion);
            objDocumento.Actaprotesto = txtActaProtesto.Text.Trim();
            objDocumento.Direccionacta = txtDireccionActa.Text.Trim();
            objDocumento.Observacion = txtObservacion.Text.Trim();

            objDocumento.Nrodocumento = string.Empty;
            objDocumento.Numcheque = string.Empty;
            objDocumento.Monto = 0;

            return objDocumento;
        }
    }
}

