using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using ALCLOCAL;
using CobranzaALC.Dto;

namespace CobranzaALC.Cobranza.Procesos
{
    public partial class ActividadCobranza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // -------------------------------------------------------------------------------------------------------
            hdfMostrarMensaje.Value = "0";
            hdfIdDocumento.Value = "0";
            hdfIdGasto.Value = "0";

            if (Page.IsPostBack) return;
            // -------------------------------------------------------------------------------------------------------
            int intIdJuicio = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "Codigo");
            hdfIdDocumento.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_doc").ToString();
            hdfIdGasto.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_gasto").ToString();
            // -------------------------------------------------------------------------------------------------------
            ALCSA.Negocio.Juicios.Juicio objJuicio = new ALCSA.Negocio.Juicios.Juicio(intIdJuicio);
            if (objJuicio.ID.Equals(0)) return;
            // -------------------------------------------------------------------------------------------------------
            string strEstadoCobranza = CargarDatosCobranzaJuicio(objJuicio.IdCobranza, intIdJuicio);

            ALCSA.FWK.Web.Control.AsignarValor(txtFechaTramite, DateTime.Now);

            habilitar();
            // -----------------------------------------------------------------------------------
            // CargarListadoSubTramites();

            // gasto_ok
            ALCSA.Negocio.Juicios.ActividadJudicial objActividad = new ALCSA.Negocio.Juicios.ActividadJudicial(0, intIdJuicio);
            if (objActividad.ID.Equals(0))
            {
                CargarListadoTramites(0, hdfTipoActividad.Value, 0);
                CargarListadoSubTramites(0);
                hdfMostrarMensaje.Value = "1";
            }
            else
            {
                CargarListadoTramites(objActividad.IdTramite, hdfTipoActividad.Value, objActividad.Indice + 1);
                CargarListadoSubTramites(objActividad.IdSubTramite);

                if (strEstadoCobranza == "P" || strEstadoCobranza == "T")
                    ddlTramites.Enabled = false;
            }

            CargarListadoTramites(100, hdfTipoActividad.Value, 0);
            CargarListadoSubTramites(100);
            // -----------------------------------------------------------------------------------
            MostrarProximaGestion();
            // -----------------------------------------------------------------------------------
        }

        protected void btnGastos_Click(object sender, EventArgs e)
        {
            ALCSA.Negocio.Juicios.Juicio objJuicio = new ALCSA.Negocio.Juicios.Juicio(ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdJuicio));
            Response.Redirect(string.Format("../Gastos/Gastos.aspx?Codigo={0}&pag_act=1", objJuicio.IdCobranza), true);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("BuscaJuicio.aspx");
        }

        protected void ddlTramites_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarListadoSubTramites(0);
            MostrarProximaGestion();

            string[] arrDatos = ddlTramites.SelectedValue.Split(new char[] { '-' });
            pnlCorreo.Visible = arrDatos.Length > 2 && arrDatos[2] == "S";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string[] arrTramite = ddlTramites.SelectedValue.ToString().Split(new char[] { '-' });

            if (arrTramite.Length != 3) arrTramite = new string[] { "0", "0", "N" };

            string strIdTramite = arrTramite[0];
            string strIndice = arrTramite[1];

            DateTime datFechaTramite = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaTramite);
            int intNumeroDias = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfNumeroDias);

            new ALCSA.Negocio.Juicios.ActividadJudicial()
            {
                IdJuicios = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdJuicio),
                IdTramite = Convert.ToInt32(strIdTramite),
                IdSubTramite = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlSubTramites),
                Ftramite = datFechaTramite,
                Fsubtramite = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaSubTramite),
                Fproxgestion = datFechaTramite.AddDays(intNumeroDias),
                IdProxGestion = Convert.ToInt32(strIndice),
                Observacion = observacion.Text.Trim(),
                Indice = Convert.ToInt32(strIndice)
            }.Guardar();

            if (arrTramite[2] == "S" && arrTramite[1] != "999")
                new ALCSA.Negocio.Cobranzas.Cobranza().ActualizarEstado(
                    ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza),
                    ALCSA.Negocio.Cobranzas.Cobranza.ESTADO_COBRANZA_PROCESO_TERMINO);

            EnviarCorreo();

            Page.RegisterClientScriptBlock("Mensaje",
                string.Format("<script>alert('Operaci\x00f3n realizada correctamente');location.href='ActividadCobranza.aspx?Codigo={0}&idCobranza={1}';</script>",
                    hdfIdJuicio.Value,
                    hdfIdCobranza.Value));
        }

        private void MostrarProximaGestion()
        {
            string[] arrTramite = ddlTramites.SelectedValue.ToString().Split(new char[] { '-' });
            int intIndice = arrTramite.Length > 2 ? Convert.ToInt32(arrTramite[1]) : 0;

            ALCSA.FWK.BD.Servicio objServicio = new ALCSA.FWK.BD.Servicio();
            objServicio.Comando = "dbo.SPALC_ACTIVIDADESJUDICIALES_BUSCAR_SIGUIENTE";
            objServicio.Conexion = "CONN";
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@INT_IdCobranza", Valor = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza), Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@INT_IndiceTramite", Valor = intIndice, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });

            DataTable objTabla = objServicio.EjecutarDataTable();

            if (objTabla != null && objTabla.Rows.Count > 0)
            {
                txtProximoTramite.Text = objTabla.Rows[0]["NombreTramite"].ToString();
                ALCSA.FWK.Web.Control.AsignarValor(hdfNumeroDias, Convert.ToInt32(objTabla.Rows[0]["Plazo"]));
            }
            else
            {
                txtProximoTramite.Text = string.Empty;
                hdfNumeroDias.Value = "1";
            }
        }

        private void CargarListadoTramites(int idTramiteActual, string tipo, int proximoIndice)
        {
            ALCSA.FWK.BD.Servicio objServicio = new ALCSA.FWK.BD.Servicio();
            objServicio.Comando = "dbo.SPALC_TRAMITE_GENERAL_LISTAR";
            objServicio.Conexion = "CONN";
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@INT_IdTramiteActual", Valor = idTramiteActual, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@VC_Tipo", Valor = tipo, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@INT_Indice", Valor = proximoIndice, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@INT_IdCobranza", Valor = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCobranza), Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });

            ddlTramites.DataSource = objServicio.EjecutarDataTable();
            ddlTramites.DataBind();

            if (idTramiteActual > 0)
            {
                string strIdTramite = string.Format("{0}-{1}-", idTramiteActual, proximoIndice - 1);
                for(int intIndice = 0; intIndice < ddlTramites.Items.Count; intIndice++)
                    if (ddlTramites.Items[intIndice].Value.StartsWith(strIdTramite)
                        || ddlTramites.Items[intIndice].Value.StartsWith("TODOSTIPOS"))
                    {
                        ddlTramites.SelectedIndex = -1;
                        ddlTramites.Items[intIndice].Selected = true;
                        break;
                    }
            }
        }

        private void CargarListadoSubTramites(int idSubTramiteActual)
        {
            string[] arrTramite = ddlTramites.SelectedValue.ToString().Split(new char[] { '-' });
            int intIdTramite = arrTramite.Length > 2 ? Convert.ToInt32(arrTramite[0]) : 0;

            string strTipo = hdfTipoActividad.Value.StartsWith("ESTANDARD")
                             ? ALCSA.Negocio.Cobranzas.Cobranza.TIPO_COBRANZA_DOCUMENTO_ESTANDAR_UNO
                             : hdfTipoActividad.Value;

            ALCSA.FWK.BD.Servicio objServicio = new ALCSA.FWK.BD.Servicio();
            objServicio.Comando = "dbo.SPALC_SUBTRAMITE_GENERAL_LISTAR";
            objServicio.Conexion = "CONN";
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@INT_IdSubTramiteActual", Valor = idSubTramiteActual, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@VC_Tipo", Valor = strTipo, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@INT_IdTramite", Valor = intIdTramite, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });

            ddlSubTramites.DataSource = objServicio.EjecutarDataTable();
            ddlSubTramites.DataBind();
            ddlSubTramites.Items.Insert(0, "...");

            if (idSubTramiteActual > 0)
                ALCSA.FWK.Web.Control.SeleccionarValor(ddlSubTramites, idSubTramiteActual);
        }

        public void habilitar()
        {
            ddlTramites.BackColor = Color.LightYellow;
            txtFechaTramite.BackColor = Color.LightYellow;
            ddlSubTramites.BackColor = Color.LightYellow;
            txtFechaSubTramite.BackColor = Color.LightYellow;
            observacion.BackColor = Color.LightYellow;
        }

        private string CargarDatosCobranzaJuicio(int idCobranza, int idJuicio)
        {
            ALCSA.Negocio.Cobranzas.Cobranza objCobranza = new ALCSA.Negocio.Cobranzas.Cobranza(idCobranza);

            hdfIdCobranza.Value = idCobranza.ToString();
            hdfIdJuicio.Value = idJuicio.ToString();
            hdfTipoActividad.Value = objCobranza.TipoActividad;

            txtNroOperacion.Text = objCobranza.Nrooperacion;
            txtCliente.Text = objCobranza.NombreCliente;
            txtRutDeudor.Text = ALCSA.FWK.IdentificacionTributaria.FormatearRut(objCobranza.RutDeudor);
            txtNomDeudor.Text = objCobranza.NombreDeudor;
            txtNumeroSucursal.Text = !string.IsNullOrWhiteSpace(objCobranza.Codigo) ? objCobranza.Codigo : "SIN NÚMERO";

            DataTable table = ConsultasEspecificas.MostrarDatosJuicioActividad(idJuicio.ToString());

            ALCSA.Negocio.Juicios.Juicio objJuicio = new ALCSA.Negocio.Juicios.Juicio(idJuicio);

            if ((table.Rows.Count > 0) && (table != null))
            {
                txtRol.Text = objJuicio.Rol;

                txtFechaIngCorte.Text = objJuicio.Fingresocorte.ToString("dd/MM/yyyy");
                txtProcedimiento.Text = table.Rows[0]["procedimiento"].ToString();
                txtMateria.Text = table.Rows[0]["materia"].ToString();
                txtProducto.Text = table.Rows[0]["producto"].ToString();
                txtTribunal.Text = table.Rows[0]["tribunal"].ToString();

                CabezeraActividadesDTO sdto = new CabezeraActividadesDTO
                {
                    Deudor = objCobranza.NombreDeudor,
                    Noperacion = objCobranza.Nrooperacion,
                    Rol = objJuicio.Rol,
                    Tribunal = table.Rows[0]["tribunal"].ToString()
                };
                Session["CabezeraActividades"] = sdto;
            }
            return !string.IsNullOrEmpty(objCobranza.Tipo) ? objCobranza.Tipo.Trim() : string.Empty;
        }

        private bool EnviarCorreo()
        {
            try
            {
                if (!pnlCorreo.Visible) return false;
                ALCSA.FWK.Web.Mail objMail = new ALCSA.FWK.Web.Mail();
                objMail.Destinatarios = BuscarDestinatariosEnBaseDatos();

                string[] arrDestinatarios = txtDestinatarios.Text.Replace(" ", string.Empty).Split(new char[] { ',' });
                foreach (string strDestinatario in arrDestinatarios)
                    if (ALCSA.FWK.Web.Mail.EmailValido(strDestinatario))
                        objMail.Destinatarios.Add(strDestinatario);

                if (objMail.Destinatarios.Count.Equals(0)) return false;

                objMail.Emisor = ConfigurationManager.AppSettings["CORREO_EMISOR"];
                objMail.Asunto = ConfigurationManager.AppSettings["ASUNTO_MAIL"];
                objMail.Mensaje = CrearMensaje();
                return objMail.Enviar(ConfigurationManager.AppSettings["SERVIDOR_CORREO"],
                    Convert.ToInt32(ConfigurationManager.AppSettings["PUERTO_SERVIDOR_CORREO"]),
                    false,
                    ConfigurationManager.AppSettings["CONTRASENA_CORREO"]);
            }
            catch { }
            return false;
        }

        private string CrearMensaje()
        {
            // REVISAR PARAMETROS
            string strServidor = Request.Url.OriginalString.Replace(Request.Url.PathAndQuery, string.Empty).ToLower();
            if (!strServidor.EndsWith("/")) strServidor += "/";
            if (strServidor.Contains("oozma")) strServidor += "alcsa/";

            string strRuta = string.Format("{0}Cobranza/Procesos/Correo/FormatoAvisoSuspencionAcciones.aspx?id_juicio={1}", strServidor, hdfIdJuicio.Value);

            using (System.IO.StreamReader objPagina = new System.IO.StreamReader(System.Net.WebRequest.Create(strRuta).GetResponse().GetResponseStream()))
            {
                return objPagina.ReadToEnd();
            }
        }

        private IList<string> BuscarDestinatariosEnBaseDatos()
        {
            IList<string> arrDestinatarios = new List<string>();
            ALCSA.FWK.BD.Servicio objServicio = new ALCSA.FWK.BD.Servicio();
            objServicio.Comando = "dbo.SPALCA_USUARIO_MAIL_LISTAR";
            objServicio.Conexion = "CONN";
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@INT_IdJuicio", Valor = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdJuicio), Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });

            DataTable objTabla = objServicio.EjecutarDataTable();
            if(objTabla != null && objTabla.Rows.Count > 0)
                foreach (DataRow objFila in objTabla.Rows)
                {
                    string strDestinatario = objFila[0] != null ? objFila[0].ToString() : string.Empty;
                    if (ALCSA.FWK.Web.Mail.EmailValido(strDestinatario))
                        arrDestinatarios.Add(strDestinatario);
                }

            return arrDestinatarios;
        }
    }
}