using ALCLOCAL;
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
    public partial class EntradaVicidial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            if (Session["Usuario"] == null || this.Session["Usuario"].ToString() == "")
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }

            gvCobranzasSeleccionadas.PageSize = 50;
            gvCobranzasNoSeleccionadas.PageSize = 50;

            ModoVisibilidad(true);
            ALCSA.FWK.Web.Control.AsignarValor(hdfUsuario, Session["Usuario"].ToString());

            ALCSA.Negocio.CallCenter.Campana objCampana = new ALCSA.Negocio.CallCenter.Campana(ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id_cam"));
            if (objCampana.ID > 0)
            {
                ALCSA.FWK.Web.Control.AsignarValor(lblNumeroCampana, objCampana.ID.ToString("00000"));
                ALCSA.FWK.Web.Control.AsignarValor(lblFechaIngreso, objCampana.FechaIngreso);
                ALCSA.FWK.Web.Control.AsignarValor(lblFechaVicidial, objCampana.FechaRegistroVicidial);
                ALCSA.FWK.Web.Control.AsignarValor(hdfEsTemporal, objCampana.EsTemporal ? 1 : 0);
                ModoVisibilidad(objCampana.EsTemporal);
            }

            if (pnlDatosCreacion.Visible)
            {
                ddlClientes.DataSource = Consulta.ComboCliente();
                ddlClientes.DataBind();
                ddlClientes.Items.Insert(0, new ListItem("Todos", string.Empty));
            }

            CargarSeleccionadas(0);
            CargarNoSeleccionadas(0);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarNoSeleccionadas(0);
        }

        protected void btnAgregarArchivo_Click(object sender, EventArgs e)
        {
            int intIdCampana = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(lblNumeroCampana);
            Response.Redirect(string.Format("EntradaVicidialArchivo.aspx?id_cam={0}", intIdCampana), true);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow objFila in gvCobranzasNoSeleccionadas.Rows)
                if ((objFila.FindControl("chkSeleccionado") as CheckBox).Checked)
                {
                    ALCSA.Negocio.CallCenter.CampanaCobranza objDato = new ALCSA.Negocio.CallCenter.CampanaCobranza()
                    {
                        IdCobranza = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(objFila.FindControl("hdfIdCobranza") as HiddenField),
                        IdCampana = CrearCampana()
                    };
                    objDato.Insertar();
                }

            CargarSeleccionadas(gvCobranzasSeleccionadas.PageIndex);
            CargarNoSeleccionadas(gvCobranzasNoSeleccionadas.PageIndex);
        }

        protected void btnQuitar_Click(object sender, EventArgs e)
        {
            int intIdCampana = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(lblNumeroCampana);
            if (intIdCampana < 1) return;

            foreach(GridViewRow objFila in gvCobranzasSeleccionadas.Rows)
                if ((objFila.FindControl("chkSeleccionado") as CheckBox).Checked)
                {
                    ALCSA.Negocio.CallCenter.CampanaCobranza objDato = new ALCSA.Negocio.CallCenter.CampanaCobranza();
                    objDato.ID = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(objFila.FindControl("hdfIdCampanaCobranza") as HiddenField);
                    objDato.Eliminar();
                }

            CargarSeleccionadas(gvCobranzasSeleccionadas.PageIndex);
            CargarNoSeleccionadas(gvCobranzasNoSeleccionadas.PageIndex);
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            int intIdCampana = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(lblNumeroCampana);
            if (intIdCampana < 1) return;

            ALCSA.Negocio.CallCenter.Campana objCampana = new ALCSA.Negocio.CallCenter.Campana(intIdCampana);
            objCampana.EsTemporal = false;
            objCampana.Guardar();

            ModoVisibilidad(objCampana.EsTemporal);

            CargarSeleccionadas(0);
        }

        protected void gvCobranzasNoSeleccionadas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarNoSeleccionadas(e.NewPageIndex);
        }

        protected void gvCobranzasSeleccionadas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarSeleccionadas(e.NewPageIndex);
        }

        protected void btnDescargarArchivo_Click(object sender, EventArgs e)
        {
            DescargarArchivoExcel();
        }

        protected void btnDescargarArchivoExcel_Click(object sender, EventArgs e)
        {
            CargarSeleccionadas(gvCobranzasSeleccionadas.PageIndex, true);
        }

        private void DescargarArchivoExcel()
        {
            int intIdCampana = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(lblNumeroCampana);
            if (intIdCampana < 1) return;

            DataTable objDatos = new ALCSA.Negocio.CallCenter.CampanaCobranza().ListarFormatoVicidial(intIdCampana);

            using (System.IO.MemoryStream objArchivoMemoria = new ALCSA.Negocio.Documentos.GeneradorExcel().ExportarDataTableAExcel(objDatos, "Vicidial"))
            {
                new ALCSA.FWK.Web.Sitio().DescargarArchivo(Response, objArchivoMemoria, string.Format("Vicidial_{0:ddMMyyyy_mmss_fff}.xls", DateTime.Now));
            }
        }

        private void CargarSeleccionadas(int indice)
        {
            CargarSeleccionadas(indice, false);
        }

        private void CargarSeleccionadas(int indice, bool exportarExcel)
        {
            int intIdCampana = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(lblNumeroCampana);

            IList<ALCSA.Entidades.CallCenter.CampanaCobranza> arrCobranzas = new ALCSA.Negocio.CallCenter.CampanaCobranza().Listar(intIdCampana);

            gvCobranzasSeleccionadas.PageIndex = indice;
            gvCobranzasSeleccionadas.DataSource = arrCobranzas;
            gvCobranzasSeleccionadas.DataBind();

            if (!exportarExcel) return;

            using (System.IO.MemoryStream objArchivoMemoria = new ALCSA.Negocio.Documentos.GeneradorExcel().ExportarListaDtoAExcel<ALCSA.Entidades.CallCenter.CampanaCobranza>(
                arrCobranzas, 
                "Vicidial",
                new string[] { "IdCampana", "RutDeudor", "NombreDeudor", "RutCliente", "NombreCliente", "NumeroOperacion", "NumeroComentarios", "DisposicionDeudor" }))
            {
                new ALCSA.FWK.Web.Sitio().DescargarArchivo(Response, objArchivoMemoria, string.Format("Vicidial_{0:ddMMyyyy_mmss_fff}.xls", DateTime.Now));
            }
        }

        private void CargarNoSeleccionadas(int indice)
        {
            if (!pnlDatosCreacion.Visible) return;

            int intIdCampana = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(lblNumeroCampana);

            gvCobranzasNoSeleccionadas.PageIndex = indice;
            gvCobranzasNoSeleccionadas.DataSource = new ALCSA.Negocio.CallCenter.CampanaCobranza().ListarNoSeleccionadas(
                intIdCampana,
                ALCSA.FWK.Web.Control.ExtraerValor(ddlClientes),
                ALCSA.FWK.Web.Control.ExtraerValor(txtRutDeudor),
                ALCSA.FWK.Web.Control.ExtraerValor(txtNumeroOperacion));
            gvCobranzasNoSeleccionadas.DataBind();
        }

        private int CrearCampana()
        {
            int intIdCampana = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(lblNumeroCampana);
            if (intIdCampana > 0) return intIdCampana;

            ALCSA.Negocio.CallCenter.Campana objCampana = new ALCSA.Negocio.CallCenter.Campana();
            objCampana.EsTemporal = true;
            objCampana.UsuarioIngreso = ALCSA.FWK.Web.Control.ExtraerValor(hdfUsuario);
            objCampana.Guardar();

            ALCSA.FWK.Web.Control.AsignarValor(lblNumeroCampana, objCampana.ID.ToString("00000"));
            ALCSA.FWK.Web.Control.AsignarValor(lblFechaIngreso, DateTime.Now);

            return objCampana.ID;
        }

        private void ModoVisibilidad(bool temporal)
        {
            pnlDatosCreacion.Visible = temporal;
            btnAgregar.Visible = temporal;
            btnAgregarArchivo.Visible = temporal;

            btnFinalizar.Visible = temporal;
            btnQuitar.Visible = temporal;

            btnDescargarArchivo.Visible = !temporal;
            btnDescargarArchivoExcel.Visible = !temporal;

            gvCobranzasSeleccionadas.Columns[5].Visible = !temporal;
            gvCobranzasSeleccionadas.Columns[6].Visible = !temporal;
            gvCobranzasSeleccionadas.Columns[7].Visible = temporal;
            gvCobranzasSeleccionadas.Columns[8].Visible = !temporal;

            if (!temporal) pnlCobranzasSeleccionadas.Height = new Unit(500, UnitType.Pixel);
        }
    }
}