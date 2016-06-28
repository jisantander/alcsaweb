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
    using System.Collections.Generic;
    using ALCSA.Negocio.Documentos.Fisicos;

    public partial class DocEstandard_2 : Page
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

            ALCSA.Negocio.Cobranzas.DocumentoEstandard2 objDocumento = new ALCSA.Negocio.Cobranzas.DocumentoEstandard2();
            if (objDocumento.CargarPorCobranza(intIdCobranza))
            {
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdDocumento2, objDocumento.ID);
                ALCSA.FWK.Web.Control.AsignarValor(txtCaratulaJuicio, objDocumento.Txtcaratulajuicio);
                ALCSA.FWK.Web.Control.AsignarValor(txtJuzgado, objDocumento.Txtjuzgado);
                ALCSA.FWK.Web.Control.AsignarValor(txtRol, objDocumento.Txtrol);
                ALCSA.FWK.Web.Control.AsignarValor(txtTipoJuicio, objDocumento.Txttipojuicio);
                ALCSA.FWK.Web.Control.AsignarValor(txtMateria, objDocumento.Txtmateria);
                ALCSA.FWK.Web.Control.AsignarValor(txtDemandante, objDocumento.Txtdemandante);
                ALCSA.FWK.Web.Control.AsignarValor(txtDomicilioDemandante, objDocumento.Txtdomiciliodemandante);
                ALCSA.FWK.Web.Control.AsignarValor(txtRutDemandante, objDocumento.Txtrutdemandante);
                ALCSA.FWK.Web.Control.AsignarValor(txtAbogado, objDocumento.Txtabogado);
                ALCSA.FWK.Web.Control.AsignarValor(txtDomicilioabogado, objDocumento.Txtdomicilioabogado);
                ALCSA.FWK.Web.Control.AsignarValor(txtRutAbogado, objDocumento.Txtrutabogado);
                ALCSA.FWK.Web.Control.AsignarValor(txtDemandado, objDocumento.Txtdemandado);
                ALCSA.FWK.Web.Control.AsignarValor(txtRutDemandado, objDocumento.Txtrutdemandado);
                ALCSA.FWK.Web.Control.AsignarValor(txtRepresentante2, objDocumento.Txtrepresentante2);
                ALCSA.FWK.Web.Control.AsignarValor(txtActividad, objDocumento.Txtactividad);
                ALCSA.FWK.Web.Control.AsignarValor(txtActividad2, objDocumento.Txtactividad2);
                ALCSA.FWK.Web.Control.AsignarValor(txtDomicilio, objDocumento.Txtdomicilio);
                ALCSA.FWK.Web.Control.AsignarValor(txtmontoDemandado, objDocumento.Txtmontodemandado, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtTituloFunda, objDocumento.Txttitulofunda);
                ALCSA.FWK.Web.Control.AsignarValor(txtNroTitulo, objDocumento.Txtnrotitulo);
                ALCSA.FWK.Web.Control.AsignarValor(txtTipoNotificacion, objDocumento.Txttiponotificacion);
                ALCSA.FWK.Web.Control.AsignarValor(txtFechasubasta, objDocumento.Txtfechasubasta);
                ALCSA.FWK.Web.Control.AsignarValor(txtMinimosubasta, objDocumento.Txtminimosubasta);
                ALCSA.FWK.Web.Control.AsignarValor(txtDocumentosfundantes, objDocumento.Txtdocumentosfundantes);
                ALCSA.FWK.Web.Control.AsignarValor(txtObservacion, objDocumento.Txtobservacion);

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
            ALCSA.Negocio.Cobranzas.DocumentoEstandard2 objDocumento = new ALCSA.Negocio.Cobranzas.DocumentoEstandard2();
            objDocumento.ID = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdDocumento2);
            objDocumento.IdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza);

            objDocumento.Txtcaratulajuicio = ALCSA.FWK.Web.Control.ExtraerValor(txtCaratulaJuicio);
            objDocumento.Txtjuzgado = ALCSA.FWK.Web.Control.ExtraerValor(txtJuzgado);
            objDocumento.Txtrol = ALCSA.FWK.Web.Control.ExtraerValor(txtRol);
            objDocumento.Txttipojuicio = ALCSA.FWK.Web.Control.ExtraerValor(txtTipoJuicio);
            objDocumento.Txtmateria = ALCSA.FWK.Web.Control.ExtraerValor(txtMateria);
            objDocumento.Txtdemandante = ALCSA.FWK.Web.Control.ExtraerValor(txtDemandante);
            objDocumento.Txtdomiciliodemandante = ALCSA.FWK.Web.Control.ExtraerValor(txtDomicilioDemandante);
            objDocumento.Txtrutdemandante = ALCSA.FWK.Web.Control.ExtraerValor(txtRutDemandante);
            objDocumento.Txtrepresentante = string.Empty;
            objDocumento.Txtabogado = ALCSA.FWK.Web.Control.ExtraerValor(txtAbogado);
            objDocumento.Txtdomicilioabogado = ALCSA.FWK.Web.Control.ExtraerValor(txtDomicilioabogado);
            objDocumento.Txtrutabogado = ALCSA.FWK.Web.Control.ExtraerValor(txtRutAbogado);
            objDocumento.Txtdemandado = ALCSA.FWK.Web.Control.ExtraerValor(txtDemandado);
            objDocumento.Txtrutdemandado = ALCSA.FWK.Web.Control.ExtraerValor(txtRutDemandado);
            objDocumento.Txtrepresentante2 = ALCSA.FWK.Web.Control.ExtraerValor(txtRepresentante2);
            objDocumento.Txtactividad = ALCSA.FWK.Web.Control.ExtraerValor(txtActividad);
            objDocumento.Txtactividad2 = ALCSA.FWK.Web.Control.ExtraerValor(txtActividad2);
            objDocumento.Txtdomicilio = ALCSA.FWK.Web.Control.ExtraerValor(txtDomicilio);
            objDocumento.Txtmontodemandado = ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(txtmontoDemandado);
            objDocumento.Txttitulofunda = ALCSA.FWK.Web.Control.ExtraerValor(txtNroTitulo);
            objDocumento.Txtnrotitulo = ALCSA.FWK.Web.Control.ExtraerValor(txtNroTitulo);
            objDocumento.Txttiponotificacion = ALCSA.FWK.Web.Control.ExtraerValor(txtTipoNotificacion);
            objDocumento.Txtfechasubasta = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechasubasta);
            objDocumento.Txtminimosubasta = ALCSA.FWK.Web.Control.ExtraerValor(txtMinimosubasta);
            objDocumento.Txtdocumentosfundantes = ALCSA.FWK.Web.Control.ExtraerValor(txtDocumentosfundantes);
            objDocumento.Txtobservacion = ALCSA.FWK.Web.Control.ExtraerValor(txtObservacion);

            objDocumento.Guardar();

            int intIdDocumento = 0;

            if (filesubir.HasFile)
            {
                // string nomArchivo = string.Format("DocEstandar2{0}{1}", objDocumento.ID, Path.GetExtension(filesubir.PostedFile.FileName));
                // string str8 = UTIL.SubirArchivo(filesubir, Server.MapPath(@"~\DOCUMENTOS"), nomArchivo);

                ALCSA.Negocio.Documentos.Fisicos.Documento objDocumentoFisico = new ALCSA.Negocio.Documentos.Fisicos.Documento()
                {
                    Nombre = this.filesubir.PostedFile.FileName,
                    Descripcion = string.Empty,
                    CodigoTipoDocumento = TipoDocumento.TIPO_DOCUMENTO_ESTANDAR_2,
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
                        CodigoTipoIdentificador = TipoIdentificador.TIPO_IDENTIFICADOR_DOCUMENTO_ESTANDAR_2,
                        Valor = objDocumento.ID.ToString()
                    }
                });

                intIdDocumento = objDocumentoFisico.ID;
            }

            // GENERAR ARCHIVO
            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdEsCobranzaNueva) == 1)
                Response.Redirect(string.Format("Cobranza.aspx?mensaje=1&id_doc={0}", intIdDocumento), true);
            else
                Response.Redirect(string.Format("../Demandas/DatosCobranza.aspx?gen_doc=1&id_cob={0}&tipo={1}&id_doc={2}", objDocumento.IdCobranza, ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_ESTANDAR_DOS, intIdDocumento), true);
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

