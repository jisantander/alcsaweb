using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ALCSA.Negocio.Gestion.Metricas;

namespace CobranzaALC.Cobranza.Gestion.Metricas
{
    public partial class Mantenedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            ddlClientes.DataSource = ALCLOCAL.Consulta.ComboCliente();
            ddlClientes.DataBind();
            IngresoPrimerItem(ddlClientes, "Seleccione un Cliente", string.Empty);

            PlazoCobranzaCliente objPlazo = new PlazoCobranzaCliente(ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id"));
            

            if (objPlazo != null && objPlazo.ID > 0)
            {
                ALCSA.FWK.Web.Control.SeleccionarValor(ddlClientes, objPlazo.RutCliente);
                ddlClientes.Enabled = false;
                ddlTiposCobranzas.Enabled = false;
                ddlProcedimientos.Enabled = false;
                ddlMaterias.Enabled = false;
                ddlProductos.Enabled = false;
            }
            CargarProcedimientos(objPlazo);
        }

        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarTramites();
        }

        protected void ddlProcedimientos_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarMaterias(null);
        }

        protected void ddlMaterias_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarProductos(null);
        }

        protected void ddlProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarTramites();
        }

        protected void ddlTiposCobranzas_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarProcedimientos(null);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // Guardar Relacion Cliente / Producto
            string strIdMateria = ALCSA.FWK.Web.Control.ExtraerValor(ddlMaterias);
            int intIdMateria = strIdMateria.Contains("|") ? Convert.ToInt32(strIdMateria.Split(new char[] { '|' })[0]) : 0;

            PlazoCobranzaCliente objPlazoCliente = new PlazoCobranzaCliente()
            {
                IdProducto = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlProductos),
                IdMateria = intIdMateria,
                RutCliente = ALCSA.FWK.Web.Control.ExtraerValor(ddlClientes)
            };
            objPlazoCliente.Guardar();

            // Guardar Relaciones Producto / Tramites
            PlazoCobranzaTramite objPlazoTramite = null;
            foreach (GridViewRow objFila in gvTramites.Rows)
            {
                objPlazoTramite = new PlazoCobranzaTramite()
                {
                    IdPlazoCobranza = objPlazoCliente.ID,
                    IdTramite = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(objFila.FindControl("hdfIdTramite") as HiddenField),
                    PlazoDias = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(objFila.FindControl("txtDias") as TextBox)
                };
                objPlazoTramite.Guardar();
            }

            // Mostrar Mensaje
            Response.Redirect("Listado.aspx?mensaje=1", true);
        }

        private void CargarProcedimientos(PlazoCobranzaCliente plazo)
        {
            switch (ALCSA.FWK.Web.Control.ExtraerValor(ddlTiposCobranzas))
            {
                case "J": 
                    ddlProcedimientos.DataSource = ALCLOCAL.Consulta.ComboProcedimiento();
                    break;
                case "P":
                    ddlProcedimientos.DataSource = ALCLOCAL.Consulta.ComboProcedimientoPRE();
                    break;
                default:
                    ddlProcedimientos.DataSource = ALCLOCAL.Consulta.ComboProcedimientoPRENDAS();
                    break;
            }

            ddlProcedimientos.DataBind();
            IngresoPrimerItem(ddlProcedimientos, "Seleccione un Procedimiento");

            if (plazo != null && plazo.IdProcedimiento > 0)
                ALCSA.FWK.Web.Control.SeleccionarValor(ddlProcedimientos, plazo.IdProcedimiento);

            CargarMaterias(plazo);
        }

        private void CargarMaterias(PlazoCobranzaCliente plazo)
        {
            string strIdProcedimiento = ALCSA.FWK.Web.Control.ExtraerValor(ddlProcedimientos);
            switch (ALCSA.FWK.Web.Control.ExtraerValor(ddlTiposCobranzas))
            {
                case "J":
                    ddlMaterias.DataSource = ALCLOCAL.Consulta.ComboMateria(strIdProcedimiento);
                    break;
                case "P":
                    ddlMaterias.DataSource = ALCLOCAL.Consulta.ComboMateriaPRE(strIdProcedimiento);
                    break;
                default:
                    ddlMaterias.DataSource = ALCLOCAL.Consulta.ComboMateriaPRENDAS(strIdProcedimiento);
                    break;
            }

            ddlMaterias.DataBind();
            IngresoPrimerItem(ddlMaterias, "Seleccione una Materia");

            if (plazo != null && plazo.IdMateria > 0)
                ALCSA.FWK.Web.Control.SeleccionarValor(ddlMaterias, string.Format("{0}|{1}", plazo.IdMateria, plazo.IdProducto));

            CargarProductos(plazo);
        }

        private void CargarProductos(PlazoCobranzaCliente plazo)
        {
            string strIdProducto = ALCSA.FWK.Web.Control.ExtraerValor(ddlMaterias);
            strIdProducto = strIdProducto.Contains("|") ? strIdProducto.Split(new char[] { '|' })[1] : "0";
            switch (ALCSA.FWK.Web.Control.ExtraerValor(ddlTiposCobranzas))
            {
                case "J":
                    ddlProductos.DataSource = ALCLOCAL.Consulta.ComboProducto(strIdProducto);
                    break;
                case "P":
                    ddlProductos.DataSource = ALCLOCAL.Consulta.ComboProductoPRE(strIdProducto);
                    break;
                default:
                    ddlProductos.DataSource = ALCLOCAL.Consulta.ComboProductoPRENDAS(strIdProducto);
                    break;
            }

            ddlProductos.DataBind();
            IngresoPrimerItem(ddlProductos, "Seleccione un Producto");

            if (plazo != null && plazo.IdProducto > 0)
                ALCSA.FWK.Web.Control.SeleccionarValor(ddlProductos, plazo.IdProducto);

            CargarTramites();
        }

        private void CargarTramites()
        {
            CambiarEstadoBotonGuardar();
            int intIdProducto = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlProductos);
            string strIdMateria = ALCSA.FWK.Web.Control.ExtraerValor(ddlMaterias);
            int intIdMateria = strIdMateria.Contains("|") ? Convert.ToInt32(strIdMateria.Split(new char[] { '|' })[0]) : 0;

            if (intIdProducto < 1)
            {
                gvTramites.DataSource = null;
                gvTramites.DataBind();
                return;
            }

            gvTramites.DataSource = new ALCSA.Negocio.Gestion.Metricas.PlazoCobranzaTramite().Listar(
                new ALCSA.Entidades.Parametros.Entradas.Metricas.ListadoTramite()
                {
                    IdProducto = intIdProducto,
                    IdMateria = intIdMateria,
                    TipoCobranza = ALCSA.FWK.Web.Control.ExtraerValor(ddlTiposCobranzas),
                    RutCliente = ALCSA.FWK.Web.Control.ExtraerValor(ddlClientes)
                });
            gvTramites.DataBind();

            CambiarEstadoBotonGuardar();
        }

        private void CambiarEstadoBotonGuardar()
        {
            btnGuardar.Visible = gvTramites.Rows.Count > 0 && !string.IsNullOrEmpty(ALCSA.FWK.Web.Control.ExtraerValor(ddlClientes));
        }

        private void IngresoPrimerItem(DropDownList lista, string texto)
        {
            IngresoPrimerItem(lista, texto, "0");
        }

        private void IngresoPrimerItem(DropDownList lista, string texto, string valor)
        {
            lista.Enabled = lista.Items.Count > 0;
            if (lista.Items.Count.Equals(1))
                lista.SelectedIndex = 0;
            else lista.Items.Insert(0, new ListItem(texto, valor));
        }
    }
}