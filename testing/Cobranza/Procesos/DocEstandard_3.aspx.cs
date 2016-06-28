namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Drawing;
    using System.Configuration;
    using System.Data;
    using System.IO;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;
    using ALCSA.Negocio.Documentos.Fisicos;
    using System.Collections.Generic;

    public partial class DocEstandard_3 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

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

            ALCSA.Negocio.Cobranzas.DocumentoEstandard3 objDocumento = new ALCSA.Negocio.Cobranzas.DocumentoEstandard3();
            if (objDocumento.CargarPorCobranza(objCobranza.ID))
            {
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdDocumento3, objDocumento.ID);

                txtRutDeudor2.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objDocumento.RutDemandado2);

                ALCSA.FWK.Web.Control.AsignarValor(hdfIdDomicilioDeudor, objDocumento.IdDomicilioDemandado);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdDomicilioDeudor2, objDocumento.IdDomicilioDemandado2);

                txtrutrepre1.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objDocumento.RutRepresLegal);
                ALCSA.FWK.Web.Control.AsignarValor(txtrepresentante1, objDocumento.NomRepresLegal);
                ALCSA.FWK.Web.Control.AsignarValor(txtDireccionrepresentante, objDocumento.DireRepresLegal);
                ALCSA.FWK.Web.Control.AsignarValor(txtprofesionuoficio, objDocumento.ProfesionRepresLegal);
                ALCSA.FWK.Web.Control.AsignarValor(txtcuantia, objDocumento.Cuantia, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtRelaciondeloshechos, objDocumento.RelacionHechos);
                ALCSA.FWK.Web.Control.AsignarValor(txtPetitorio, objDocumento.Petitorio);
                ALCSA.FWK.Web.Control.AsignarValor(txtdocumentosfundantes, objDocumento.DocFundantes);
                ALCSA.FWK.Web.Control.AsignarValor(txtObservacion, objDocumento.Observacion);
                ALCSA.FWK.Web.Control.AsignarValor(txtFechaTerminoRelacionLaboral, objDocumento.Txtfechaterminorelacionlaboral);
                ALCSA.FWK.Web.Control.AsignarValor(txtMontoRemuneracion, objDocumento.Txtmontoremuneracion, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtFechaInicioRelacionLaboral, objDocumento.Txtfechainiciorelacionlaboral);
                ALCSA.FWK.Web.Control.AsignarValor(txtCargo, objDocumento.Txtcargo);

                txtDomicilioDeudor.Text = objDocumento.DireccionDemandado;
                txtDomicilioDeudor2.Text = objDocumento.DireccionDemandadoDos;
                txtNombreDeudor2.Text = objDocumento.NombreDemandadoDos;

                IList<ALCSA.Entidades.Documentos.Fisicos.Documento> arrDocumentosFisicos = new ALCSA.Negocio.Documentos.Fisicos.Documento().Listar(
                    objDocumento.IdCobranza.ToString(),
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
            ALCSA.Negocio.Cobranzas.DocumentoEstandard3 objDocumento = new ALCSA.Negocio.Cobranzas.DocumentoEstandard3();
            objDocumento.ID = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdDocumento3);
            objDocumento.IdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza);

            objDocumento.RutDemandado2 = ALCSA.FWK.Web.Control.ExtraerValor(txtRutDeudor2).Replace(".", string.Empty);
            objDocumento.IdDomicilioDemandado = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdDomicilioDeudor);
            objDocumento.IdDomicilioDemandado2 = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdDomicilioDeudor2);
            objDocumento.RutRepresLegal = ALCSA.FWK.Web.Control.ExtraerValor(txtrutrepre1).Replace(".", string.Empty);
            objDocumento.NomRepresLegal = ALCSA.FWK.Web.Control.ExtraerValor(txtrepresentante1);
            objDocumento.DireRepresLegal = ALCSA.FWK.Web.Control.ExtraerValor(txtDireccionrepresentante);
            objDocumento.ProfesionRepresLegal = ALCSA.FWK.Web.Control.ExtraerValor(txtprofesionuoficio);
            objDocumento.Cuantia = ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(txtcuantia);
            objDocumento.RelacionHechos = ALCSA.FWK.Web.Control.ExtraerValor(txtRelaciondeloshechos);
            objDocumento.Petitorio = ALCSA.FWK.Web.Control.ExtraerValor(txtPetitorio);
            objDocumento.DocFundantes = ALCSA.FWK.Web.Control.ExtraerValor(txtdocumentosfundantes);
            objDocumento.Observacion = ALCSA.FWK.Web.Control.ExtraerValor(txtObservacion);
            objDocumento.Txtfechaterminorelacionlaboral = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaTerminoRelacionLaboral);
            objDocumento.Txtmontoremuneracion = ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(txtMontoRemuneracion);
            objDocumento.Txtfechainiciorelacionlaboral = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaInicioRelacionLaboral);
            objDocumento.Txtcargo = ALCSA.FWK.Web.Control.ExtraerValor(txtCargo);

            objDocumento.Guardar();

            int intIdDocumento = 0;

            if (filesubir.HasFile)
            {
                // string nomArchivo = string.Format("DocEstandar3{0}{1}", objDocumento.ID, Path.GetExtension(filesubir.PostedFile.FileName));
                // string str8 = UTIL.SubirArchivo(filesubir, Server.MapPath(@"~\DOCUMENTOS"), nomArchivo);

                ALCSA.Negocio.Documentos.Fisicos.Documento objDocumentoFisico = new ALCSA.Negocio.Documentos.Fisicos.Documento()
                {
                    Nombre = this.filesubir.PostedFile.FileName,
                    Descripcion = string.Empty,
                    CodigoTipoDocumento = TipoDocumento.TIPO_DOCUMENTO_ESTANDAR_3,
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
                        CodigoTipoIdentificador = TipoIdentificador.TIPO_IDENTIFICADOR_DOCUMENTO_ESTANDAR_3,
                        Valor = objDocumento.ID.ToString()
                    }
                });

                intIdDocumento = objDocumentoFisico.ID;
            }

            // GENERAR ARCHIVO
            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdEsCobranzaNueva) == 1)
                Response.Redirect(string.Format("Cobranza.aspx?mensaje=1&id_doc={0}", intIdDocumento), true);
            else
                Response.Redirect(string.Format("../Demandas/DatosCobranza.aspx?gen_doc=1&id_cob={0}&tipo={1}&id_doc={2}", objDocumento.IdCobranza, ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_ESTANDAR_TRES, intIdDocumento), true);

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

