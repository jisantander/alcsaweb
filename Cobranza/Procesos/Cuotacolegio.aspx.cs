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

namespace CobranzaALC.Cobranza.Procesos
{
    public partial class Cuotacolegio : System.Web.UI.Page
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

            ALCSA.Negocio.Cobranzas.CuotaColegio objDocumento = new ALCSA.Negocio.Cobranzas.CuotaColegio();
            if (objDocumento.CargarPorCobranza(objCobranza.ID))
            {
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdCuotaColegio, objDocumento.ID);

                txtRutRepresentante1.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objDocumento.Representante1);
                txtRutRepresentante2.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objDocumento.Representante2);

                ALCSA.FWK.Web.Control.AsignarValor(txtnrodocumento, objDocumento.Nrodocumento);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdTipoDocumento, objDocumento.IdTipoDocu);
                ALCSA.FWK.Web.Control.AsignarValor(txtcodigo, objDocumento.Codigo);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdBanco, objDocumento.IdBanco);
                ALCSA.FWK.Web.Control.AsignarValor(txtserie, objDocumento.Serie);
                ALCSA.FWK.Web.Control.AsignarValor(txtnrocuota, objDocumento.Nrocuota);
                ALCSA.FWK.Web.Control.AsignarValor(txtfechamora, objDocumento.Fechamora);
                ALCSA.FWK.Web.Control.AsignarValor(txtfechaingresocobranza, objDocumento.Fechaingresocobranza);
                ALCSA.FWK.Web.Control.AsignarValor(txtfechavcto, objDocumento.Fechavencimiento);
                ALCSA.FWK.Web.Control.AsignarValor(txtfechaprescripcion, objDocumento.Fprescripcion);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdMes, objDocumento.Mesmora);
                ALCSA.FWK.Web.Control.AsignarValor(txtaniomora, objDocumento.Aniomora);
                ALCSA.FWK.Web.Control.AsignarValor(txtmontocapital, objDocumento.Montocapital, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtabonos, objDocumento.Abonos, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtmontointeres, objDocumento.Montointeres, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtsaldodeuda, objDocumento.Saldodeuda, 0);
                ALCSA.FWK.Web.Control.AsignarValor(txtobservacion, objDocumento.Observacion);

                txtNombreRepresentante1.Text = objDocumento.NombreRepresentanteUno;
                txtNombreRepresentante2.Text = objDocumento.NombreRepresentanteDos;
                txtTipoDocumento.Text = objDocumento.NombreTipoDocumento;
                txtBanco.Text = objDocumento.NombreBanco;
                txtMeses.Text = objDocumento.Mesmora > 0 ? ALCSA.FWK.Tiempo.MESES[objDocumento.Mesmora - 1] : string.Empty;

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
            ALCSA.Negocio.Cobranzas.CuotaColegio objDocumento = new ALCSA.Negocio.Cobranzas.CuotaColegio();
            objDocumento.ID = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCuotaColegio);
            objDocumento.IdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza);

            objDocumento.Representante1 = ALCSA.FWK.Web.Control.ExtraerValor(txtRutRepresentante1).Replace(".", string.Empty);
            objDocumento.Representante2 = ALCSA.FWK.Web.Control.ExtraerValor(txtRutRepresentante2).Replace(".", string.Empty);

            objDocumento.Nrodocumento = ALCSA.FWK.Web.Control.ExtraerValor(txtnrodocumento);
            objDocumento.IdTipoDocu = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdTipoDocumento);
            objDocumento.Codigo = ALCSA.FWK.Web.Control.ExtraerValor(txtcodigo);
            objDocumento.IdBanco = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdBanco);
            objDocumento.Serie = ALCSA.FWK.Web.Control.ExtraerValor(txtserie);
            objDocumento.Nrocuota = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtnrocuota);
            objDocumento.Fechamora = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtfechamora);
            objDocumento.Fechaingresocobranza = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtfechaingresocobranza);
            objDocumento.Fechavencimiento = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtfechavcto);
            objDocumento.Fprescripcion = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtfechaprescripcion);
            objDocumento.Mesmora = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdMes);
            objDocumento.Aniomora = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtaniomora);
            objDocumento.Montocapital = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtmontocapital);
            objDocumento.Abonos = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtabonos);
            objDocumento.Montointeres = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtmontointeres);
            objDocumento.Saldodeuda = ALCSA.FWK.Web.Control.ExtraerValorComoFloat(txtsaldodeuda);
            objDocumento.Observacion = ALCSA.FWK.Web.Control.ExtraerValor(txtobservacion);

            objDocumento.Guardar();

            int intIdDocumento = 0;

            if (filesubir.HasFile)
            {
                // string nomArchivo = string.Format("CuotaColegio{0}{1}", objDocumento.ID, Path.GetExtension(this.filesubir.PostedFile.FileName));
                // string str8 = UTIL.SubirArchivo(filesubir, Server.MapPath(@"~\DOCUMENTOS"), nomArchivo);

                ALCSA.Negocio.Documentos.Fisicos.Documento objDocumentoFisico = new ALCSA.Negocio.Documentos.Fisicos.Documento()
                {
                    Nombre = this.filesubir.PostedFile.FileName,
                    Descripcion = string.Empty,
                    CodigoTipoDocumento = TipoDocumento.TIPO_DOCUMENTO_CUOTA_COLEGIO,
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
                        CodigoTipoIdentificador = TipoIdentificador.TIPO_IDENTIFICADOR_CUOTA_COLEGIO,
                        Valor = objDocumento.ID.ToString()
                    }
                });

                intIdDocumento = objDocumentoFisico.ID;
            }

            // GENERAR ARCHIVO
            /*
                string text2 = dataTable3.Rows[0][0].ToString();
                string path = base.Server.MapPath("~\\DOCUMENTOS");
                string text3 = "DocCuotaColegio" + text2.ToString();
                text3 += Path.GetExtension(this.filesubir.PostedFile.FileName);
                string text4 = UTIL.SubirArchivo(this.filesubir, path, text3);
                Transaccion.UpdateDocumentoCuotaColegio(text2, text3);
             */

            // GENERAR ARCHIVO
            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdEsCobranzaNueva) == 1)
                Response.Redirect(string.Format("Cobranza.aspx?mensaje=1&id_doc={0}", intIdDocumento), true);
            else
                Response.Redirect(string.Format("../Demandas/DatosCobranza.aspx?gen_doc=1&id_cob={0}&tipo={1}&id_doc={2}", objDocumento.IdCobranza, ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_CUOTA_COLEGIO, intIdDocumento), true);
        }

        private void AsignarTitulo(int idMateria)
        {
            int[] arrIds = new int[] { 1, 2, 3, 5, 6, 7 };
            string[] arrTitulos = new string[] { "PAGARE", "CHEQUE", "CUOTA", "LETRA", "FACTURA", "OTROS" };

            for (int intIndice = 0; intIndice < arrIds.Length; intIndice++)
                if (arrIds[intIndice].Equals(idMateria))
                {
                    lblTitulo.Text = arrTitulos[intIndice];
                    break;
                }
        }

        private void CambiarColorControlesSoloLectura()
        {
            txtNumeroOperacion.BackColor = Color.LightYellow;
            txtRutDeudor.BackColor = Color.LightYellow;
            txtRutCliente.BackColor = Color.LightYellow;
            txtNombreDeudor.BackColor = Color.LightYellow;
            txtNombreCliente.BackColor = Color.LightYellow;
        }

        /*
        protected void txtmontocapital_TextChanged(object sender, EventArgs e)
        {
            decimal d;
            if (string.IsNullOrEmpty(this.txtmontocapital.Text))
            {
                d = 0m;
            }
            else
            {
                d = Convert.ToDecimal(this.txtmontocapital.Text);
            }
            decimal d2;
            if (string.IsNullOrEmpty(this.txtabonos.Text))
            {
                d2 = 0m;
            }
            else
            {
                d2 = Convert.ToDecimal(this.txtabonos.Text);
            }
            decimal num = d - d2;
            this.txtsaldodeuda.Text = num.ToString();
        }

        protected void txtabonos_TextChanged(object sender, EventArgs e)
        {
            decimal d;
            if (string.IsNullOrEmpty(this.txtmontocapital.Text))
            {
                d = 0m;
            }
            else
            {
                d = Convert.ToDecimal(this.txtmontocapital.Text);
            }
            decimal d2;
            if (string.IsNullOrEmpty(this.txtabonos.Text))
            {
                d2 = 0m;
            }
            else
            {
                d2 = Convert.ToDecimal(this.txtabonos.Text);
            }
            decimal num = d - d2;
            this.txtsaldodeuda.Text = num.ToString();
        }
         */
    }
}