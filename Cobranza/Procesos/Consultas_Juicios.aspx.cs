using ALCLOCAL;
using CobranzaALC.Dto;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Procesos
{
    public partial class Consultas_Juicios : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // -----------------------------------------------------
            if (this.Page.IsPostBack) return;
            // -----------------------------------------------------
            int intIdCobranza = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "Codigo");
            int intIdJuicio = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_juicios");
            // -----------------------------------------------------
            string strRutDeudorCallCenter = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_RUT);
            string strUsuarioCallCenter = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_USUARIO);
            string strDisposicion = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_DISPOSICION);
            int intCampanaCallCenter = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_CAMPANA);
            // -----------------------------------------------------
            if (!string.IsNullOrWhiteSpace(strRutDeudorCallCenter))
            {
                new ALCSA.Negocio.CallCenter.Comentario()
                {
                    IdCobranza = 0,
                    IdDisposicion = 0,
                    IdCampana = 0,
                    UsuarioIngreso = "PRUEBA",
                    Descripcion = Request.Url.AbsoluteUri
                }.Insertar();

                if (!string.IsNullOrWhiteSpace(strDisposicion))
                {
                    Response.Redirect(string.Format("CallCenter/IngresoDisposicion.aspx?Codigo={0}&{1}={2}&{3}={4}&{5}={6}&{7}={8}",
                        new object[]{
                                    ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza),
                                    ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_RUT,
                                    strRutDeudorCallCenter,
                                    ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_USUARIO,
                                    strUsuarioCallCenter,
                                    ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_DISPOSICION,
                                    strDisposicion,
                                    ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_CAMPANA,
                                    intCampanaCallCenter
                                }), true);
                    return;
                }

                Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_RUT] = strRutDeudorCallCenter;
                Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_USUARIO] = strUsuarioCallCenter;
                Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_CAMPANA] = intCampanaCallCenter;

                Response.Redirect(string.Format("Consultas_Juicios.aspx?Codigo={0}&id_juicios={1}", intIdCobranza, intIdJuicio), true);
                return;
            }

            if (Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_RUT] != null)
            {
                strRutDeudorCallCenter = Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_RUT].ToString();
                strUsuarioCallCenter = Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_USUARIO].ToString();
                intCampanaCallCenter = Convert.ToInt32(Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_CAMPANA]);

                Session.Remove(ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_RUT);
                Session.Remove(ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_USUARIO);
                Session.Remove(ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_CAMPANA);

                strRutDeudorCallCenter = ALCSA.FWK.IdentificacionTributaria.FormatearRut(strRutDeudorCallCenter).Replace(".", string.Empty).ToUpper();

                if (intIdCobranza.Equals(0))
                {
                    IList<ALCSA.Entidades.CallCenter.CampanaCobranza> arrCobranzas = new ALCSA.Negocio.CallCenter.CampanaCobranza().Listar(intCampanaCallCenter);
                    foreach(ALCSA.Entidades.CallCenter.CampanaCobranza objCobranzaCampana in arrCobranzas)
                        if (objCobranzaCampana.RutDeudor.ToUpper() == strRutDeudorCallCenter)
                        {
                            intIdCobranza = objCobranzaCampana.IdCobranza;
                            break;
                        }

                    intIdJuicio = 0;
                }

                ALCSA.FWK.Web.Control.AsignarValor(hdfRutDeudorCallCenter, strRutDeudorCallCenter);
                ALCSA.FWK.Web.Control.AsignarValor(hdfUsuarioCallCenter, strUsuarioCallCenter);
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdCampanaCallCenter, intCampanaCallCenter);

                btnAgregarComentario.Visible = true;
            }
            // -----------------------------------------------------
            if (ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "Mensaje") == 1)
                lblMensaje.Text = "El comentario se guardó correctamente.";
            // -----------------------------------------------------
            if (intIdCobranza.Equals(0) && intIdJuicio > 0)
                intIdCobranza = new ALCSA.Negocio.Juicios.Juicio(intIdJuicio).IdCobranza;
            // -----------------------------------------------------
            hdfIdCobranza.Value = intIdCobranza.ToString();
            ConsultaJU(intIdCobranza.ToString());
            // -----------------------------------------------------
            CargarDomicilios();
            MostrarTelefonos();
            MostrarBienesRaices();
            MostrarBienesMuebles();
            MostrarDetalleDeuda();
            MostrarDetalleGastos();
            MostrarActividadesJudiciales();
            MostrarDetalleDatosCobranza();
            CargarComentariosCallCenter();
            // -----------------------------------------------------
        }

        protected void btnAgregarComentarioManual_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("CallCenter/IngresoDisposicion.aspx?Codigo={0}&Manual=1",
                ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza)), true);
        }

        protected void btnGuardarComentario_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtComentario.Text))
            {
                lblMensaje.Text = "Debe ingreso un comentario en la caja de texto.";
                return;
            }

            new ALCSA.Negocio.CallCenter.Comentario()
            {
                IdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza),
                IdDisposicion = 0,
                IdCampana = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCampanaCallCenter),
                UsuarioIngreso = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuarioCallCenter),
                Descripcion = ALCSA.FWK.Web.Control.ExtraerValor(txtComentario)
            }.Insertar();

            CargarComentariosCallCenter();
            ALCSA.FWK.Web.Control.AsignarValor(txtComentario, string.Empty);

            lblMensaje.Text = "El comentario se guardó correctamente.";
        }

        private void ConsultaJU(string id_cobranza)
        {
            DataTable table = ConsultasEspecificas.Consulta_Juicios_DOS(id_cobranza);
            if (table != null && table.Rows.Count > 0)
            {
                this.txtNombreCliente.Text = table.Rows[0]["cliente"].ToString();
                this.txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtDeudor.Text = table.Rows[0]["nomdeudor"].ToString();
                this.txtRutdeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                this.txttramite.Text = table.Rows[0]["tramite"].ToString();
                this.txtFechaTramite.Text = table.Rows[0]["ftramite"].ToString();
                this.txtJuzgado.Text = table.Rows[0]["tribunal"].ToString();
                this.txtRol.Text = table.Rows[0]["rol"].ToString();
                this.txtAbogado.Text = table.Rows[0]["abogado"].ToString();
                this.txtProcurador.Text = table.Rows[0]["procurador"].ToString();
                this.txtEstado.Text = table.Rows[0]["estadojuicio"].ToString();
                this.hdfIdJuicio.Value = table.Rows[0]["id_juicios"].ToString();
                // this.hddDocumento.Value = table.Rows[0]["urldocumento"].ToString();
                this.txtProcedimiento.Text = table.Rows[0]["Procedimiento"].ToString();
                this.txtMateria.Text = table.Rows[0]["Materia"].ToString();
                this.txtProducto.Text = table.Rows[0]["Producto"].ToString();
                this.txtEtapa.Text = table.Rows[0]["etapa"].ToString();
                this.hdfTipoCobranza.Value = table.Rows[0]["TipoCobranza"].ToString();

                string strIdProducto = table.Rows[0]["id_producto"].ToString();

                if (strIdProducto == "1")
                    this.hdfTipoDocumentoCobranza.Value = "MUTUO";

                else if (strIdProducto == "2")
                    this.hdfTipoDocumentoCobranza.Value = "DOCUPAGARE";

                else if (strIdProducto == "3")
                    this.hdfTipoDocumentoCobranza.Value = "DOCUJUICIO";

                else if (strIdProducto == "4")
                    this.hdfTipoDocumentoCobranza.Value = "DocuEstandardUNO";

                else if (strIdProducto == "5")
                    this.hdfTipoDocumentoCobranza.Value = "DocuEstandardDOS";

                else if (strIdProducto == "14")
                    this.hdfTipoDocumentoCobranza.Value = "DocuEstandardTRES";

                else if (strIdProducto == "12")
                    this.hdfTipoDocumentoCobranza.Value = "DocuEstandardCUATRO";

                ALCSA.FWK.BD.Servicio objServicio = new ALCSA.FWK.BD.Servicio();
                objServicio.Comando = string.Format("SELECT * FROM BitacoraEstadoJuicio WHERE id_cobranza = {0}", id_cobranza);
                objServicio.TipoComando = ALCSA.FWK.BD.Enumeradores.TiposComandos.Query;
                objServicio.Conexion = "CONN";

                gvObservaciones.DataSource = objServicio.EjecutarDataTable();
                gvObservaciones.DataBind();

                // if (gvObservaciones.Rows.Count.Equals(0)) pnlObservaciones.Height = new Unit(50, UnitType.Pixel);
            }
        }

        private void CargarDomicilios()
        {
            string strRut = ALCSA.FWK.IdentificacionTributaria.FormatearRut(txtRutdeudor.Text).Replace(".", string.Empty);
            gvDomicilios.DataSource = ConsultasEspecificas.ConMostrarDomicilios(strRut);
            gvDomicilios.DataBind();
        }

        private void MostrarTelefonos()
        {
            string strRut = ALCSA.FWK.IdentificacionTributaria.FormatearRut(txtRutdeudor.Text).Replace(".", string.Empty);
            gvTelefonos.DataSource = ConsultasEspecificas.MostrarFonoDeudor(strRut);
            gvTelefonos.DataBind();
        }

        private void MostrarBienesRaices()
        {
            string strRut = ALCSA.FWK.IdentificacionTributaria.FormatearRut(txtRutdeudor.Text).Replace(".", string.Empty);;
            gvBienesRaices.DataSource = ConsultasEspecificas.ConMostrarBienRaiz_Consulta_Generales(strRut);
            gvBienesRaices.DataBind();
        }

        private void MostrarBienesMuebles()
        {
            string strRut = ALCSA.FWK.IdentificacionTributaria.FormatearRut(txtRutdeudor.Text).Replace(".", string.Empty);;
            gvBienesMuebles.DataSource = ALC_FW20.ALCLOCAL.Consulta.getBien_Mueble(strRut);
            gvBienesMuebles.DataBind();
        }

        private void MostrarDetalleGastos()
        {
            gvDetalleGastos.DataSource = ConsultasEspecificas.MostrarDetalleGastos(hdfIdJuicio.Value);
            gvDetalleGastos.DataBind();
        }

        private void MostrarActividadesJudiciales()
        {
            gvActividadesJudiciales.DataSource = ConsultasEspecificas.GENMostrarJuicioActividades(hdfIdJuicio.Value, hdfTipoDocumentoCobranza.Value);
            gvActividadesJudiciales.DataBind();
        }

        private void MostrarDetalleDatosCobranza()
        {
            switch (hdfTipoDocumentoCobranza.Value.ToUpper())
            {
                case "DOCUPAGARE":
                    gvDocumentoPagare.DataSource = ConsultasEspecificas.MostrarDocuPagareCON(hdfIdCobranza.Value);
                    gvDocumentoPagare.DataBind();
                    gvDocumentoPagare.Visible = true;
                    break;
                case "DOCUJUICIO":
                    gvDocumentoJuicio.DataSource = ConsultasEspecificas.MostrarDocuJuicioCon(hdfIdCobranza.Value);
                    gvDocumentoJuicio.DataBind();
                    gvDocumentoJuicio.Visible = true;
                    break;
                case "MUTUO":
                    gvMutuo.DataSource = ConsultasEspecificas.MostrarDoc_mutuo(hdfIdCobranza.Value);
                    gvMutuo.DataBind();
                    gvMutuo.Visible = true;
                    break;
                case "DOCUESTANDARDUNO":
                    gvDocuEstandar1.DataSource = ConsultasEspecificas.MostrarDocuJuicioEstandard_1(hdfIdCobranza.Value);
                    gvDocuEstandar1.DataBind();
                    gvDocuEstandar1.Visible = true;
                    break;
                case "DOCUESTANDARDDOS":
                    gvDocuEstandar2.DataSource = ConsultasEspecificas.MostrarDocuJuicioEstandard_2(hdfIdCobranza.Value);
                    gvDocuEstandar2.DataBind();
                    gvDocuEstandar2.Visible = true;
                    break;
                case "DOCUESTANDARDTRES":
                    gvDocuEstandar3.DataSource = ConsultasEspecificas.MostrarDocuJuicioEstandard_3(hdfIdCobranza.Value);
                    gvDocuEstandar3.DataBind();
                    gvDocuEstandar3.Visible = true;
                    break;
                case "DOCUESTANDARDCUATRO":
                    gvDocuEstandar4.DataSource = ConsultasEspecificas.MostrarDocuJuicioEstandard_4(hdfIdCobranza.Value);
                    gvDocuEstandar4.DataBind();
                    gvDocuEstandar4.Visible = true;
                    break;
            }
        }

        private void CargarComentariosCallCenter()
        {
            int intIdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza);

            gvComentariosCallCenter.DataSource = new ALCSA.Negocio.CallCenter.Comentario().Listar(intIdCobranza, 0);
            gvComentariosCallCenter.DataBind();
        }

        #region Información de Cajas

        private void MostrarDetalleDeuda()
        {
            try
            {
                gvLetras.DataSource = hdfTipoCobranza.Value == "Judicial"
                    ? ConsultasEspecificas.ConsultaDocumentosPorTipoJuicio(hdfIdCobranza.Value, "TIC", "6", DateTime.Now.ToString("yyyyMMdd"))
                    : ConsultasEspecificas.ConsultaDocumentosPorTipo(hdfIdCobranza.Value, "TIC", "6", DateTime.Now.ToString("yyyyMMdd"));
                gvLetras.DataBind();

                MostrarDeudaTotal();
                CargaAbonosRealizados();
            }
            catch { }
        }

        private void CargaAbonosRealizados()
        {
            gvAbonosRealizados.DataSource = Consulta.MostrarAbono(hdfIdCobranza.Value);
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
            gvChequesIngresados.DataSource = Consulta.MostrarGrillaCheques(hdfIdCobranza.Value);
            gvChequesIngresados.DataBind();
        }

        private void MostrarDeudaTotal()
        {
            decimal decMonto = decimal.Zero;
            decimal decInteres = decimal.Zero;
            decimal decInteresAdicional = decimal.Zero;
            decimal decHonorarios = decimal.Zero;
            decimal decDescHonorarios = decimal.Zero;
            decimal decDescInteres = decimal.Zero;
            decimal decOtrosDescuentos = decimal.Zero;
            decimal decPorcentajeDescuento = decimal.Zero;

            foreach (GridViewRow objFila in this.gvLetras.Rows)
            {
                decMonto += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[2].Text);
                decInteres += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[5].Text);
                decInteresAdicional += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[6].Text);
                decHonorarios += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[7].Text);
                decDescHonorarios += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[8].Text);
                decDescInteres += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[9].Text);
                decOtrosDescuentos += ALCSA.FWK.Texto.ConvertirTextoEnDecimal(objFila.Cells[10].Text);
                decPorcentajeDescuento = ALCSA.FWK.Web.Control.ExtraerValorComoDecimal((objFila.FindControl("hdfPorcentajeDescuentoDeuda") as HiddenField));
            }

            Decimal decGastos = Decimal.Zero;
            DataTable objGastos = ConsultasEspecificas.TraeGastos(this.hdfIdCobranza.Value.ToString());

            if (objGastos != null && objGastos.Rows.Count > 0)
                decGastos = Convert.ToDecimal(objGastos.Rows[0]["gastos"]);

            decimal decTotalFinal = decMonto + decInteres + decInteresAdicional + decGastos + decHonorarios; 
            decimal decTotalDescuento = decDescHonorarios + decDescInteres + decOtrosDescuentos;

            if (decPorcentajeDescuento > decimal.Zero)
            {
                decTotalDescuento = decTotalFinal * decPorcentajeDescuento;
                decTotalFinal -= decTotalDescuento;
                lblPorcentajeDescuentos.Text = string.Format("({0:N2}%)", decPorcentajeDescuento * 100);
            }
            else decTotalFinal -= decTotalDescuento;

            ALCSA.FWK.Web.Control.AsignarValor(lblMontoDeuda, decMonto, 0);
            ALCSA.FWK.Web.Control.AsignarValor(lblMontoIntereses, decInteres + decInteresAdicional, 0);
            ALCSA.FWK.Web.Control.AsignarValor(lblMontoHonorarios, decHonorarios, 0);
            ALCSA.FWK.Web.Control.AsignarValor(lblMontoDescuentos, decTotalDescuento, 0);
            ALCSA.FWK.Web.Control.AsignarValor(lblMontoGastos, decGastos, 0);
            ALCSA.FWK.Web.Control.AsignarValor(lblMontoFinal, decTotalFinal, 0);
        }

        #endregion
    }
}

