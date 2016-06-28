using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Procesos.CallCenter
{
    public partial class IngresoDisposicion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // -----------------------------------------------------
            if (this.Page.IsPostBack) return;
            // -----------------------------------------------------
            int intIdCobranza = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "Codigo"); ;
            string strRutDeudorCallCenter = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_RUT);
            string strUsuarioCallCenter = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_USUARIO);
            string strDisposicion = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_DISPOSICION);
            int intCampanaCallCenter = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_CAMPANA);
            int intManual = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "Manual");

            ddlTiposDisposiciones.DataSource = new ALCSA.Negocio.CallCenter.TipoDisposicion().Listar();
            ddlTiposDisposiciones.DataBind();
            // -----------------------------------------------------
            if (!string.IsNullOrWhiteSpace(strRutDeudorCallCenter))
            {
                Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_RUT] = strRutDeudorCallCenter;
                Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_USUARIO] = strUsuarioCallCenter;
                Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_CAMPANA] = intCampanaCallCenter;
                Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_DISPOSICION] = strDisposicion;

                Response.Redirect("IngresoDisposicion.aspx", true);
                return;
            }
            // -----------------------------------------------------
            else if (Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_RUT] != null)
            {
                CargarListadosInformacionAdicional();

                strRutDeudorCallCenter = Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_RUT].ToString();
                strUsuarioCallCenter = Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_USUARIO].ToString();
                intCampanaCallCenter = Convert.ToInt32(Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_CAMPANA]);
                strDisposicion = Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_DISPOSICION].ToString();

                Session.Remove(ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_RUT);
                Session.Remove(ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_USUARIO);
                Session.Remove(ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_CAMPANA);
                Session.Remove(ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_DISPOSICION);

                strRutDeudorCallCenter = ALCSA.FWK.IdentificacionTributaria.FormatearRut(strRutDeudorCallCenter).Replace(".", string.Empty).ToUpper();

                IList<ALCSA.Entidades.CallCenter.CampanaCobranza> arrCobranzas = new ALCSA.Negocio.CallCenter.CampanaCobranza().Listar(intCampanaCallCenter);
                foreach (ALCSA.Entidades.CallCenter.CampanaCobranza objCobranzaCampana in arrCobranzas)
                    if (objCobranzaCampana.RutDeudor.ToUpper() == strRutDeudorCallCenter)
                    {
                        intIdCobranza = objCobranzaCampana.IdCobranza;
                        break;
                    }

                ALCSA.Negocio.CallCenter.Disposicion objDisposicion = new ALCSA.Negocio.CallCenter.Disposicion(strDisposicion);
                ALCSA.FWK.Web.Control.SeleccionarValor(ddlTiposDisposiciones, objDisposicion.IdTipoDisposicion);

                CargarListadoDisposiciones();

                ALCSA.FWK.Web.Control.AsignarValor(hdfIdCobranza, intIdCobranza);
                ALCSA.FWK.Web.Control.AsignarValor(hdfRutDeudor, strRutDeudorCallCenter);
                ALCSA.FWK.Web.Control.AsignarValor(hdfUsuarioCallCenter, strUsuarioCallCenter);
                ALCSA.FWK.Web.Control.AsignarValor(lblIdCampana, intCampanaCallCenter);
                ALCSA.FWK.Web.Control.SeleccionarValor(ddlDisposiciones, strDisposicion);
            }
            // -----------------------------------------------------
            else if (intManual > 0 && intIdCobranza > 0)
            {
                CargarListadosInformacionAdicional();

                ddlCampanas.Items.Add(new ListItem("Sin Campaña", "0"));

                ALCSA.FWK.Web.Control.AsignarValor(hdfIdCobranza, intIdCobranza);
                ALCSA.FWK.Web.Control.AsignarValor(hdfComentarioManual, 1);

                CargarListadoDisposiciones();

                ddlCampanas.Visible = true;
                lblIdCampana.Visible = false;
            }
            else
            {
                CargarListadoDisposiciones();
                CargarListadosInformacionAdicional();
            }
        }

        protected void ddlTiposDisposiciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarListadoDisposiciones();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(ddlDisposiciones.SelectedValue) && string.IsNullOrWhiteSpace(txtComentario.Text))
            {
                lblMensaje.Text = "Debe seleccionar una disposición o ingresar una observación.";
                return;
            }

            int intIdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza);

            int intIdCampana = ddlCampanas.Visible
                ? ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlCampanas)
                : ALCSA.FWK.Web.Control.ExtraerValorComoEntero(lblIdCampana);

            string strUsuario = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuarioCallCenter);
            if (string.IsNullOrWhiteSpace(strUsuario) && Session["Usuario"] != null)
                strUsuario = Session["Usuario"].ToString();

            new ALCSA.Negocio.CallCenter.Comentario()
            {
                IdCobranza = intIdCobranza,
                IdDisposicion = new ALCSA.Negocio.CallCenter.Disposicion(ddlDisposiciones.SelectedValue).ID,
                IdCampana = intIdCampana,
                UsuarioIngreso = strUsuario,
                Descripcion = ALCSA.FWK.Web.Control.ExtraerValor(txtComentario),

                IdAdicionalTipoVivienda = pnlTipoDisposicionTerreno.Visible ? ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlTiposViviendas) : 0,
                IdAdicionalAntiguedadVivienda = pnlTipoDisposicionTerreno.Visible ? ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlAntiguedadesViviendas) : 0

            }.Insertar();

            if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfComentarioManual).Equals(0))
            {
                Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_RUT] = ALCSA.FWK.Web.Control.ExtraerValor(hdfRutDeudor);
                Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_USUARIO] = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuarioCallCenter);
                Session[ALCSA.Negocio.CallCenter.ParametrosConsulta.NOMBRE_PARAMETRO_CAMPANA] = intIdCampana;
            }

            Response.Redirect(string.Format("../Consultas_Juicios.aspx?Mensaje=1&Codigo={0}", intIdCobranza), true);
        }

        private void CargarListadoDisposiciones()
        {
            int intIdTipo = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlTiposDisposiciones);
            ALCSA.Negocio.CallCenter.TipoDisposicion objTipoDisposicion = new ALCSA.Negocio.CallCenter.TipoDisposicion(intIdTipo);

            ddlDisposiciones.DataSource = new ALCSA.Negocio.CallCenter.Disposicion().Listar(objTipoDisposicion.ID);
            ddlDisposiciones.DataBind();
            ddlDisposiciones.Items.Insert(0, new ListItem(".......", string.Empty));

            pnlTipoDisposicionTerreno.Visible = objTipoDisposicion.Codigo == "DISP_TERRENO";
        }

        private void CargarListadosInformacionAdicional()
        {
            ddlTiposViviendas.DataSource = new ALCSA.Negocio.CallCenter.AdicionalComentario().Listar("TIPO_VIVIENDA");
            ddlTiposViviendas.DataBind();
            ddlTiposViviendas.Items.Insert(0, new ListItem(".......", string.Empty));

            ddlAntiguedadesViviendas.DataSource = new ALCSA.Negocio.CallCenter.AdicionalComentario().Listar("ANTIGUEDAD_VIVIENDA");
            ddlAntiguedadesViviendas.DataBind();
            ddlAntiguedadesViviendas.Items.Insert(0, new ListItem(".......", string.Empty));
        }
    }
}