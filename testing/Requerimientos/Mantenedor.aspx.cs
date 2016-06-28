using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Requerimientos
{
    public partial class Mantenedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ----------------------------------------------
            if (Page.IsPostBack) return;
            // ----------------------------------------------
            if (Session["Usuario"] == null)
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            // ----------------------------------------------
            ALCSA.FWK.Web.Control.AsignarValor(lblFechaIngreso, DateTime.Now, true);
            ALCSA.FWK.Web.Control.AsignarValor(lblNombreUsuario, Session["Usuario"].ToString());
            ALCSA.FWK.Web.Control.AsignarValor(hdfUsuario, lblNombreUsuario.Text);
            // ----------------------------------------------
            ALCSA.Negocio.Requerimientos.Estado objEstado = new ALCSA.Negocio.Requerimientos.Estado(ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_PENDIENTE);
            ALCSA.FWK.Web.Control.AsignarValor(hdfCodigoEstadoActual, objEstado.Codigo);
            ALCSA.FWK.Web.Control.AsignarValor(lblEstado, objEstado.Nombre);
            ALCSA.FWK.Web.Control.AsignarValor(hdfEsPopup, ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "popup"));
            // ----------------------------------------------
            ALCSA.Negocio.Requerimientos.Requerimiento objRequerimiento = new ALCSA.Negocio.Requerimientos.Requerimiento(
                ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_req")
            );
            // ----------------------------------------------
            ddlDesarrolladores.DataSource = new ALCSA.Negocio.Requerimientos.Usuario().Listar();
            ddlDesarrolladores.DataBind();
            // ----------------------------------------------
            if (objRequerimiento.ID > 0)
            {
                ALCSA.FWK.Web.Control.AsignarValor(hdfIdRequerimiento, objRequerimiento.ID);
                ALCSA.FWK.Web.Control.AsignarValor(lblFechaIngreso, objRequerimiento.FechaIngreso, true);
                ALCSA.FWK.Web.Control.AsignarValor(lblNombreUsuario, objRequerimiento.UsuarioSolicitante);
                ALCSA.FWK.Web.Control.AsignarValor(txtDescripcion, objRequerimiento.Descripcion);
                ALCSA.FWK.Web.Control.AsignarValor(hdfCodigoEstadoActual, objRequerimiento.CodigoEstado);
                ALCSA.FWK.Web.Control.AsignarValor(lblEstado, objRequerimiento.NombreEstado);

                txtDescripcion.Enabled = false;
                fupArchivoInicial.Visible = false;
                btnGuardar.Visible = false;

                btnEliminar.Visible =
                    objRequerimiento.CodigoEstado == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_PENDIENTE
                    && objRequerimiento.UsuarioSolicitante == hdfUsuario.Value;

                if (objRequerimiento.IdDocumento > 0)
                {
                    ALCSA.Negocio.Documentos.Fisicos.Documento objDocumento = new ALCSA.Negocio.Documentos.Fisicos.Documento(objRequerimiento.IdDocumento);

                    ALCSA.FWK.Web.Control.AsignarValor(hdfIdDocumentoInicial, objRequerimiento.IdDocumento);
                    lblDescargarArchivoInicial.Text = objDocumento.Nombre;
                    lblDescargarArchivoInicial.Visible = true;
                }

                if (ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "mensaje").Equals(1))
                    ALCSA.FWK.Web.Control.AsignarValor(lblMensaje, "El requerimiento se guardó correctamente.");
            }
            // ----------------------------------------------
            CargarListaEstados(objRequerimiento);
            // ----------------------------------------------
            CargarGrillaObservaciones(0);
            // ----------------------------------------------
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // ----------------------------------------------
            int intIdDocumento = 0;
            // ----------------------------------------------
            if (fupArchivoInicial.HasFile)
            {
                ALCSA.Negocio.Documentos.Fisicos.Documento objDocumentoFisico = new ALCSA.Negocio.Documentos.Fisicos.Documento()
                {
                    Nombre = fupArchivoInicial.PostedFile.FileName,
                    Descripcion = string.Empty,
                    CodigoTipoDocumento = ALCSA.Negocio.Requerimientos.Requerimiento.TIPO_DOCUMENTO,
                    FechaIngreso = DateTime.Now,
                    IdTipoDocumento = 0,
                    Peso = fupArchivoInicial.PostedFile.ContentLength,
                    Archivo = fupArchivoInicial.FileBytes
                };
                objDocumentoFisico.Insertar();
                intIdDocumento = objDocumentoFisico.ID;
            }
            // ----------------------------------------------
            ALCSA.Negocio.Requerimientos.Requerimiento objRequerimiento = new ALCSA.Negocio.Requerimientos.Requerimiento() {
                IdEstado = 0,
                IdDocumento = intIdDocumento,
                UsuarioSolicitante = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuario),
                UsuarioAprobador = string.Empty,
                UsuarioResponsable = string.Empty,
                Descripcion = ALCSA.FWK.Web.Control.ExtraerValor(txtDescripcion)
            };

            objRequerimiento.Guardar();
            // ----------------------------------------------
            EnviarCorreo(objRequerimiento, true);
            // ----------------------------------------------
            // AGREGAR MENSAJE
            Response.Redirect(string.Format("Mantenedor.aspx?id_req={0}&mensaje=1", objRequerimiento.ID), true);
            // ----------------------------------------------
        }

        protected void btnGuardarObservacion_Click(object sender, EventArgs e)
        {
            // ----------------------------------------------
            ALCSA.Negocio.Requerimientos.Observacion objObservacion = new ALCSA.Negocio.Requerimientos.Observacion()
            {
                IdDocumento = 0,
                Descripcion = ALCSA.FWK.Web.Control.ExtraerValor(txtObservacion),
                IdRequerimientos = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdRequerimiento),
                Usuario = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuario)
            };

            objObservacion.Guardar();
            // ----------------------------------------------
            CargarGrillaObservaciones(gvObservaciones.PageIndex);
            // ----------------------------------------------
            // AGREGAR MENSAJE
            ALCSA.FWK.Web.Control.AsignarValor(lblMensaje, "La observación se guardó correctamente.");
            // ----------------------------------------------
        }

        protected void btnGuardarArchivo_Click(object sender, EventArgs e)
        {
            // ----------------------------------------------
            if (!fupArchivo.HasFile) return;
            // ----------------------------------------------
            ALCSA.Negocio.Documentos.Fisicos.Documento objDocumentoFisico = new ALCSA.Negocio.Documentos.Fisicos.Documento()
            {
                Nombre = fupArchivo.PostedFile.FileName,
                Descripcion = string.Empty,
                CodigoTipoDocumento = ALCSA.Negocio.Requerimientos.Requerimiento.TIPO_DOCUMENTO,
                FechaIngreso = DateTime.Now,
                IdTipoDocumento = 0,
                Peso = fupArchivo.PostedFile.ContentLength,
                Archivo = fupArchivo.FileBytes
            };
            objDocumentoFisico.Insertar();
            // ----------------------------------------------
            ALCSA.Negocio.Requerimientos.Observacion objObservacion = new ALCSA.Negocio.Requerimientos.Observacion()
            {
                IdDocumento = objDocumentoFisico.ID,
                Descripcion = objDocumentoFisico.Nombre,
                IdRequerimientos = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdRequerimiento),
                Usuario = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuario)
            };

            objObservacion.Guardar();
            // ----------------------------------------------
            CargarGrillaObservaciones(gvObservaciones.PageIndex);
            // ----------------------------------------------
            // AGREGAR MENSAJE
            ALCSA.FWK.Web.Control.AsignarValor(lblMensaje, "El archivo se guardó correctamente.");
            // ----------------------------------------------
        }

        protected void btnCambiarEstado_Click(object sender, EventArgs e)
        {
            // ----------------------------------------------
            ALCSA.Negocio.Requerimientos.Estado objEstado = new ALCSA.Negocio.Requerimientos.Estado(ALCSA.FWK.Web.Control.ExtraerValor(ddlEstados));

            int intIdRequerimiento = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdRequerimiento);
            // ----------------------------------------------
            ALCSA.Negocio.Requerimientos.Observacion objObservacion = new ALCSA.Negocio.Requerimientos.Observacion()
            {
                IdDocumento = 0,
                Descripcion = ALCSA.FWK.Web.Control.ExtraerValor(txtObservacionEstado),
                IdRequerimientos = intIdRequerimiento,
                Usuario = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuario)
            };

            objObservacion.Guardar();
            // ----------------------------------------------
            ALCSA.Negocio.Requerimientos.Requerimiento objRequerimiento = new ALCSA.Negocio.Requerimientos.Requerimiento(intIdRequerimiento);
            objRequerimiento.IdEstado = objEstado.ID;

            if (objEstado.Codigo == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_RECHAZADO)
            {
                objRequerimiento.UsuarioAprobador = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuario);
            }
            else if (objEstado.Codigo == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_EN_DESARROLLO)
            {
                objRequerimiento.UsuarioAprobador = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuario);
                objRequerimiento.UsuarioResponsable = ALCSA.FWK.Web.Control.ExtraerValor(ddlDesarrolladores);
            }

            objRequerimiento.Guardar();
            // ----------------------------------------------
            CargarGrillaObservaciones(gvObservaciones.PageIndex);
            // ----------------------------------------------
            ALCSA.FWK.Web.Control.AsignarValor(hdfCodigoEstadoActual, objEstado.Codigo);
            ALCSA.FWK.Web.Control.AsignarValor(lblEstado, objEstado.Nombre);
            CargarListaEstados(objRequerimiento);
            // ----------------------------------------------
            btnGuardar.Visible = false;
            btnEliminar.Visible = false;
            // ----------------------------------------------
            // AGREGAR MENSAJE
            ALCSA.FWK.Web.Control.AsignarValor(lblMensaje, "El cambio de estado se registró correctamente.");
            // ----------------------------------------------
            EnviarCorreo(objRequerimiento, false);
            // ----------------------------------------------
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            // ----------------------------------------------
            int intIdRequerimiento = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdRequerimiento);
            // ----------------------------------------------
            ALCSA.Negocio.Requerimientos.Estado objEstado = new ALCSA.Negocio.Requerimientos.Estado(ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_ELIMINADA);
            // ----------------------------------------------
            ALCSA.Negocio.Requerimientos.Requerimiento objRequerimiento = new ALCSA.Negocio.Requerimientos.Requerimiento(intIdRequerimiento);
            objRequerimiento.IdEstado = objEstado.ID;
            objRequerimiento.Guardar();
            // ----------------------------------------------
            Response.Redirect(string.Format("~/Requerimientos/Listar.aspx?mensaje={0}", ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_ELIMINADA), true);
            // ----------------------------------------------
        }

        protected void btnEliminar_Click1(object sender, EventArgs e)
        {
            ALCSA.Negocio.Requerimientos.Observacion objObservacion = new ALCSA.Negocio.Requerimientos.Observacion()
            {
                IdDocumento = ALCSA.FWK.Texto.ConvertirTextoEnEntero((sender as LinkButton).CommandArgument)
            };
            objObservacion.Eliminar();
            ALCSA.FWK.Web.Control.AsignarValor(lblMensaje, "La observación se eliminó correctamente.");

            CargarGrillaObservaciones(gvObservaciones.PageIndex);
        }

        private void CargarGrillaObservaciones(int indice)
        {
            int intIdRequerimiento = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdRequerimiento);

            gvObservaciones.PageIndex = indice;
            gvObservaciones.DataSource = new ALCSA.Negocio.Requerimientos.Observacion().Listar(intIdRequerimiento);
            gvObservaciones.DataBind();

            LinkButton btnEliminar = null;
            Label lblObservacionHistorica = null, lblDescargarArchivo = null;
            HiddenField hdfIdDocumento = null;

            string strUsuario = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuario).ToUpper();

            for (int intIndice = 0; intIndice < gvObservaciones.Rows.Count; intIndice++)
            {
                lblDescargarArchivo = gvObservaciones.Rows[intIndice].FindControl("lblDescargarArchivo") as Label;
                btnEliminar = gvObservaciones.Rows[intIndice].FindControl("btnEliminar") as LinkButton;
                lblObservacionHistorica = gvObservaciones.Rows[intIndice].FindControl("lblObservacionHistorica") as Label;
                hdfIdDocumento = gvObservaciones.Rows[intIndice].FindControl("hdfIdDocumento") as HiddenField;

                lblDescargarArchivo.Visible = hdfIdDocumento.Value != "0";
                lblObservacionHistorica.Visible = hdfIdDocumento.Value == "0";

                btnEliminar.Visible = gvObservaciones.Rows[intIndice].Cells[1].Text.ToUpper().Equals(strUsuario);
            }
        }

        private void CargarListaEstados(ALCSA.Negocio.Requerimientos.Requerimiento requerimiento)
        {
            IList<ALCSA.Entidades.Requerimientos.Estado> arrEstados = new ALCSA.Negocio.Requerimientos.Estado().Listar();
            string strEstado = ALCSA.FWK.Web.Control.ExtraerValor(hdfCodigoEstadoActual);
            string strUsuarioRevision = ConfigurationManager.AppSettings["USUARIO_REVISION"];
            string strUsuario = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuario);
            int intIndice = 0;

            gvObservaciones.Columns[3].Visible = 
                !(requerimiento.CodigoEstado == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_ELIMINADA ||
                requerimiento.CodigoEstado == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_RECHAZADO);

            while (intIndice < arrEstados.Count)

                
                if (arrEstados[intIndice].Codigo != ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_ELIMINADA
                    && requerimiento.UsuarioSolicitante == strUsuario
                    && requerimiento.UsuarioSolicitante != strUsuarioRevision)
                    arrEstados.RemoveAt(intIndice);

                // ELIMIAR MISMO ESTADO
                else if (arrEstados[intIndice].Codigo == requerimiento.CodigoEstado)
                    arrEstados.RemoveAt(intIndice);

                // RECHAZADO
                else if (strEstado == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_RECHAZADO
                     && arrEstados[intIndice].Codigo != ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_RECHAZADO)
                    arrEstados.RemoveAt(intIndice);

                // ELIMINADO
                else if (strEstado == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_ELIMINADA
                    && arrEstados[intIndice].Codigo != ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_ELIMINADA)
                    arrEstados.RemoveAt(intIndice);

                // TERMINADA
                else if (strEstado == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_TERMINADO
                     && arrEstados[intIndice].Codigo != ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_TERMINADO)
                    arrEstados.RemoveAt(intIndice);

                // DE PENDIENTE A RECHAZADA O EN DESARROLLO (SOLO PARA USUARIO REVISION)
                else if (strEstado == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_PENDIENTE
                    && arrEstados[intIndice].Codigo != ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_RECHAZADO
                    && arrEstados[intIndice].Codigo != ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_EN_DESARROLLO)
                    arrEstados.RemoveAt(intIndice);

                // DE EN DESARROLLO A APROBADA (USUARIO SOLICITANTE Y USUARIO REVISIÓN)
                else if (strEstado == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_EN_DESARROLLO
                    && arrEstados[intIndice].Codigo != ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_APROBADO)
                    arrEstados.RemoveAt(intIndice);

                // DE APROBADA A TERMINADA (USUARIO RESPONSABLE Y USUARIO REVISIÓN)
                else if (strEstado == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_APROBADO
                    && arrEstados[intIndice].Codigo != ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_TERMINADO)
                    arrEstados.RemoveAt(intIndice);

                else intIndice++;

            ddlEstados.DataSource = arrEstados;
            ddlEstados.DataBind();
            ddlEstados.Items.Insert(0, new ListItem("Seleccione un Estado", string.Empty));
        }

        private void EnviarCorreo(ALCSA.Negocio.Requerimientos.Requerimiento requerimiento, bool creacion)
        {
            try
            {
                ALCSA.FWK.Web.Mail objMail = new ALCSA.FWK.Web.Mail();
                objMail.Destinatarios = BuscarDestinatariosEnBaseDatos(requerimiento, creacion);

                if (objMail.Destinatarios.Count.Equals(0)) return;

                objMail.Emisor = ConfigurationManager.AppSettings["CORREO_EMISOR"];
                objMail.Asunto = string.Format("ALCSA - {0} Requerimiento Número {1:00000}", creacion ? "Creacion" : "Cambio de Estado", requerimiento.ID);


                objMail.Mensaje = CrearMensaje(requerimiento, creacion);
                objMail.Enviar(
                    ConfigurationManager.AppSettings["SERVIDOR_CORREO"],
                    Convert.ToInt32(ConfigurationManager.AppSettings["PUERTO_SERVIDOR_CORREO"]),
                    false,
                    ConfigurationManager.AppSettings["CONTRASENA_CORREO"]
                );
            }
            catch { }
        }

        private string CrearMensaje(ALCSA.Negocio.Requerimientos.Requerimiento requerimiento, bool creacion)
        {
            string strServidor = Request.Url.OriginalString.Replace(Request.Url.PathAndQuery, string.Empty).ToLower();
            if (!strServidor.EndsWith("/")) strServidor += "/";
            if (strServidor.Contains("Testing")) strServidor += "Testing/";

            string strRuta = string.Format("{0}Cobranza/Procesos/Correo/NotificacionRequerimiento.aspx?id_req={1}&creacion={2}", strServidor, requerimiento.ID, creacion ? 1 : 0);

            using (System.IO.StreamReader objPagina = new System.IO.StreamReader(System.Net.WebRequest.Create(strRuta).GetResponse().GetResponseStream()))
            {
                return objPagina.ReadToEnd();
            }
        }

        private IList<string> BuscarDestinatariosEnBaseDatos(ALCSA.Negocio.Requerimientos.Requerimiento requerimiento, bool creacion)
        {
            IList<string> arrDestinatarios = new List<string>();
            string strCorreo = string.Empty;

            if (creacion
                || requerimiento.CodigoEstado == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_RECHAZADO
                || requerimiento.CodigoEstado == ALCSA.Negocio.Requerimientos.Requerimiento.ESTADO_TERMINADO)
            {
                strCorreo = BuscarCorreo(requerimiento.UsuarioSolicitante);
                if (!string.IsNullOrWhiteSpace(strCorreo)) arrDestinatarios.Add(strCorreo);
            }

            strCorreo = BuscarCorreo(requerimiento.UsuarioAprobador);
            if (!string.IsNullOrWhiteSpace(strCorreo)) arrDestinatarios.Add(strCorreo);

            strCorreo = BuscarCorreo(requerimiento.UsuarioResponsable);
            if (!string.IsNullOrWhiteSpace(strCorreo)) arrDestinatarios.Add(strCorreo);

            return arrDestinatarios;
        }

        private string BuscarCorreo(string usuario)
        {
            ALCSA.FWK.BD.Servicio objServicio = new ALCSA.FWK.BD.Servicio();
            objServicio.Comando = "dbo.SPALCSA_USUARIO_BUSCAR_CORREO";
            objServicio.Conexion = "CONN";
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@VC_Usuario", Valor = usuario, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });
            object objCorreo = objServicio.EjecutarEscalar();
            return objCorreo != null ? objCorreo.ToString() : string.Empty;
        }
    }
}