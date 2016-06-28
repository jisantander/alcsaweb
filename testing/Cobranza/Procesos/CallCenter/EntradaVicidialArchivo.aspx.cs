using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Procesos.CallCenter
{
    public partial class EntradaVicidialArchivo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            if (Session["Usuario"] == null || this.Session["Usuario"].ToString() == "")
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }

            ALCSA.FWK.Web.Control.AsignarValor(hdfIdCampana, ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_cam"));
            ALCSA.FWK.Web.Control.AsignarValor(hdfUsuario, Session["Usuario"].ToString());
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!fupArchivo.HasFile)
            {
                lblMensaje.Text = "Seleccione un archivo excel.";
                return;
            }

            List<ALCSA.Entidades.CallCenter.CampanaCobranza> arrCobranzasArchivo = LeerArchivo();
            if (arrCobranzasArchivo.Count.Equals(0))
            {
                lblMensaje.Text = "El archivo excel está vacio o los datos del archivo son invalidos";
                return;
            }

            int intIdCampana = CrearCampana();
            ALCSA.Negocio.CallCenter.CampanaCobranza objCobranzaNegocio = null;

            if (chkConservaCobranzas.Checked)
            {
                IList<ALCSA.Entidades.CallCenter.CampanaCobranza> arrCobranzasSeleccionadas = new ALCSA.Negocio.CallCenter.CampanaCobranza().Listar(intIdCampana);
                foreach (ALCSA.Entidades.CallCenter.CampanaCobranza objCobranza in arrCobranzasSeleccionadas)
                {
                    objCobranzaNegocio = new ALCSA.Negocio.CallCenter.CampanaCobranza() { ID = objCobranza.ID };
                    objCobranzaNegocio.Eliminar();
                }
            }

            IList<ALCSA.Entidades.CallCenter.CampanaCobranza> arrCobranzasNoSeleccionadas = new ALCSA.Negocio.CallCenter.CampanaCobranza().ListarNoSeleccionadas(intIdCampana);

            foreach(ALCSA.Entidades.CallCenter.CampanaCobranza objCobranzaNoSeleccionada in arrCobranzasNoSeleccionadas)
                foreach (ALCSA.Entidades.CallCenter.CampanaCobranza objCobranzaArchivo in arrCobranzasArchivo)
                    if (objCobranzaNoSeleccionada.RutDeudor.Equals(objCobranzaArchivo.RutDeudor, StringComparison.InvariantCultureIgnoreCase)
                        && objCobranzaNoSeleccionada.NumeroOperacion.Equals(objCobranzaArchivo.NumeroOperacion, StringComparison.InvariantCultureIgnoreCase))
                    {
                        ALCSA.Negocio.CallCenter.CampanaCobranza objDato = new ALCSA.Negocio.CallCenter.CampanaCobranza()
                        {
                            IdCobranza = objCobranzaNoSeleccionada.IdCobranza,
                            IdCampana = intIdCampana
                        };
                        objDato.Insertar();
                    }

            Response.Redirect(string.Format("EntradaVicidial.aspx?id_cam={0}", intIdCampana), true);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("EntradaVicidial.aspx?id_cam={0}", ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCampana)), true);
        }

        private int CrearCampana()
        {
            int intIdCampana = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(hdfIdCampana);
            if (intIdCampana > 0) return intIdCampana;

            ALCSA.Negocio.CallCenter.Campana objCampana = new ALCSA.Negocio.CallCenter.Campana();
            objCampana.EsTemporal = true;
            objCampana.UsuarioIngreso = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuario);
            objCampana.Guardar();

            return objCampana.ID;
        }

        private List<ALCSA.Entidades.CallCenter.CampanaCobranza> LeerArchivo()
        {
            List<ALCSA.Entidades.CallCenter.CampanaCobranza> arrCobranzas = new List<ALCSA.Entidades.CallCenter.CampanaCobranza>();
            try
            {
                DataTable objTabla = new ALCSA.Negocio.Documentos.GeneradorExcel().ExportarExcelADataTable(fupArchivo.FileContent, fupArchivo.FileName.ToUpper().EndsWith(".XLSX"));
                if (objTabla != null && objTabla.Rows.Count > 0 && objTabla.Columns.Count > 1)
                    foreach (DataRow objFila in objTabla.Rows)
                    {
                        string strRutDeudor = objFila[0] != null ? ALCSA.FWK.IdentificacionTributaria.FormatearRut(objFila[0].ToString()).Replace(".", string.Empty) : string.Empty;
                        string strNumeroOperacion = objFila[1] != null ? objFila[1].ToString().Trim() : string.Empty;

                        if (!string.IsNullOrWhiteSpace(strRutDeudor) && !string.IsNullOrWhiteSpace(strNumeroOperacion))
                            arrCobranzas.Add(new ALCSA.Entidades.CallCenter.CampanaCobranza() { RutDeudor = strRutDeudor, NumeroOperacion = strNumeroOperacion });
                    }
            }
            catch
            {
                lblMensaje.Text = "No fué posible leer el archivo excel.";
            }
            return arrCobranzas;
        }
    }
}