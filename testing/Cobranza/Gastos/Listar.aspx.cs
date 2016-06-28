using ALCLOCAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Gastos
{
    public partial class Listar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            this.ddlCliente.DataSource = Consulta.ComboCliente();
            this.ddlCliente.DataBind();
            this.ddlCliente.Items.Insert(0, new ListItem("Todos", string.Empty));

            this.ddlProcurador.DataSource = Consulta.ComboProcurador();
            this.ddlProcurador.DataBind();
            this.ddlProcurador.Items.Insert(0, new ListItem("Todos", string.Empty));

            CargarGrilla(0, false);

            if (Session["Perfil"] != null && Session["Perfil"].ToString() != "1")
                gvGastos.Columns[gvGastos.Columns.Count - 1].Visible = false;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarGrilla(0, false);
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtNumeroOperacion.Text = string.Empty;
            txtRol.Text = string.Empty;
            ALCSA.FWK.Web.Control.SeleccionarValor(ddlCliente, string.Empty);
            ALCSA.FWK.Web.Control.SeleccionarValor(ddlProcurador, string.Empty);
            ALCSA.FWK.Web.Control.SeleccionarValor(ddlGastos, "T");

            ddlTiposGastos.DataSource = null;
            ddlTiposGastos.DataBind();

            lblTexto.Visible = false;
            ddlTiposGastos.Visible = false;

            CargarGrilla(0, false);
        }

        protected void btnEliminar_Click(object sender, ImageClickEventArgs e)
        {
            ALCSA.Negocio.Gastos.Gasto objGasto = new ALCSA.Negocio.Gastos.Gasto();
            objGasto.ID = Convert.ToInt32((sender as ImageButton).CommandArgument);
            objGasto.Eliminar();
            CargarGrilla(gvGastos.PageIndex, false);
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos eliminados correctamente');</script>");
        }

        protected void btnExportarExcel_Click(object sender, EventArgs e)
        {
            CargarGrilla(gvGastos.PageIndex, true);
        }

        protected void gvGastos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrilla(e.NewPageIndex, false);
        }

        protected void ddlGastos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strValor = ALCSA.FWK.Web.Control.ExtraerValor(ddlGastos);

            lblTexto.Visible = !strValor.Equals("T");
            ddlTiposGastos.Visible = !strValor.Equals("T");
            if (strValor.Equals("T")) return;

            switch (strValor)
            {
                case "P": CargarTiposGastosPrejudiciales();
                    break;
                case "J": CargarTiposGastosJudiciales();
                    break;
                case "A": CargarTiposGastosAdministrativos();
                    break;
            }
        }

        private void CargarTiposGastosPrejudiciales()
        {
            ddlTiposGastos.DataTextField = "descripcion";
            ddlTiposGastos.DataValueField = "id_act_prejudicial";
            ddlTiposGastos.DataSource = Consulta.ComboActividadesPrejudiciales();
            ddlTiposGastos.DataBind();
            ddlTiposGastos.Items.Insert(0, new ListItem("Todos", string.Empty));
        }

        private void CargarTiposGastosAdministrativos()
        {
            ddlTiposGastos.DataTextField = "descripcion";
            ddlTiposGastos.DataValueField = "id_gasto_admin";
            ddlTiposGastos.DataSource = Consulta.ComboTipoGastoAdmin();
            ddlTiposGastos.DataBind();
            ddlTiposGastos.Items.Insert(0, new ListItem("Todos", string.Empty));
        }

        private void CargarTiposGastosJudiciales()
        {
            ddlTiposGastos.DataTextField = "descripcion";
            ddlTiposGastos.DataValueField = "id_tipo_gasto_judi";
            ddlTiposGastos.DataSource = Consulta.ComboGastoJudicial();
            ddlTiposGastos.DataBind();
            ddlTiposGastos.Items.Insert(0, new ListItem("Todos", string.Empty));
        }

        private void CargarGrilla(int indice, bool exportarExcel)
        {
            ALCSA.FWK.BD.Servicio objServicio = new ALCSA.FWK.BD.Servicio();
            objServicio.Conexion = "CONN";
            objServicio.Comando = "dbo.SPALC_GASTOS_DETALLE_LISTAR";

            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@VC_NumeroOperacion", Valor = txtNumeroOperacion.Text.Trim(), Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@VC_Rol", Valor = txtRol.Text.Trim(), Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });

            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@VC_RutCliente", Valor = ddlCliente.SelectedValue, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@VC_RutProcurador", Valor = ddlProcurador.SelectedValue, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@VC_GrupoGasto", Valor = ddlGastos.SelectedValue, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@INT_TipoGasto", Valor = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(ddlTiposGastos), Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });

            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@VC_RutDeudor", Valor = txtRutDeudor.Text.Trim(), Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@VC_NumeroSucursal", Valor = txtNumeroSucursal.Text.Trim(), Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });

            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@DAT_FechaIngreso", Valor = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaIngreso), Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });

            DataTable objTable = objServicio.EjecutarDataTable();

            gvGastos.PageIndex = indice;
            gvGastos.DataSource = objTable;
            gvGastos.DataBind();

            if (!exportarExcel) return;

            string strNombreArchivo = string.Format("Gastos_{0:ddMMyyyy_hhmmss_ffff}.xls", DateTime.Now);

            using (System.IO.MemoryStream objArchivoMemoria = new ALCSA.Negocio.Documentos.GeneradorExcel().ExportarDataTableAExcel(
                objTable,
                "Tablero",
                new string[] {
                    "NumeroOperacion", "RutCliente", "NombreCliente", "RutDeudor", "NombreDeudor", "NumeroSucursal", "Rol", "NombreProcurador", "NumeroDocumento", "EstadoGasto", "FechaGasto",
                    "TipoGasto", "MontoGasto"
                },
                new string[] {
                    "Numero Operacion", "Rut Cliente", "Nombre Cliente", "Rut Deudor", "Nombre Deudor", "N° Sucursal",  "Rol", "Nombre Procurador", "Numero Documento", "Estado Gasto", "Fecha Gasto",
                    "Tipo Gasto", "Monto Gasto"
                }))
            {
                new ALCSA.FWK.Web.Sitio().DescargarArchivo(Response, objArchivoMemoria, strNombreArchivo);
            }
        }
    }
}