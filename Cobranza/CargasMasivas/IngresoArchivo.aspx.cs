using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using ALCSA.Negocio.CargasMasivas;

namespace CobranzaALC.Cobranza.CargasMasivas
{
    public partial class IngresoArchivo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            lblUsuario.Text = this.Session["Usuario"] != null ? this.Session["Usuario"].ToString() : "Desconocido";
            lblCodigoProceso.Text = string.Format("{0:ddMMyyyy-hhmmss}{1}", DateTime.Now, new Random().Next(1000, 999999));

            ddlClientes.DataSource = ALCLOCAL.Consulta.ComboCliente();
            ddlClientes.DataBind();
            ddlClientes.Items.Insert(0, new ListItem("Seleccione un Cliente", "0"));

            CargarRemesas();

            CargarListaProcedimientos();
        }

        protected void btnProcesarCarga_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlClientes.SelectedValue) || ddlClientes.SelectedValue == "0")
            {
                lblMensaje.Text = "Seleccione un cliente.";
                return;
            }

            if (string.IsNullOrEmpty(txtFechaVencimiento.Text))
            {
                lblMensaje.Text = "Ingrese la fecha de vencimiento.";
                return;
            }

            DateTime datFechaVencimiento = new DateTime();
            DateTime.TryParseExact(txtFechaVencimiento.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out datFechaVencimiento);
            if (datFechaVencimiento.Year <= 1900)
            {
                lblMensaje.Text = "Ingrese una fecha de vencimiento válida.";
                return;
            }

            if (ddlRemesas.SelectedIndex.Equals(0))
            {
                lblMensaje.Text = "Seleccione la REMESA";
                return;
            }

            if (!fupArchivoExcel.HasFile)
            {
                lblMensaje.Text = "Seleccione el archivo Excel";
                return;
            }

            string strExtensionArchivo = fupArchivoExcel.FileName.ToUpper();
            strExtensionArchivo = strExtensionArchivo.Substring(strExtensionArchivo.LastIndexOf(".") + 1);

            Proceso objProceso = new Proceso();
            objProceso.Codigo = lblCodigoProceso.Text;
            objProceso.UsuarioDueno = lblUsuario.Text;

            objProceso.CargarDesdeArchivo(
                fupArchivoExcel.FileContent,
                strExtensionArchivo == "XLS" ? Enumerador.TipoArchivoExcel.XLS : Enumerador.TipoArchivoExcel.XLSX,
                true
            );

            if (objProceso.Registros.Count.Equals(0)) return;

            int intIdRemesa = Convert.ToInt32(ddlRemesas.Text);
            string strNombreRemesa = ddlRemesas.SelectedItem.Text.Trim();

            foreach (ALCSA.Entidades.CargasMasivas.Registro objEntidad in objProceso.Registros)
            {
                objEntidad.IdTipoCobranza = ddlTiposCobranzas.SelectedValue;
                objEntidad.NombreTipoCobranza = ddlTiposCobranzas.SelectedItem.Text;

                objEntidad.IdProcedimiento = ddlProductos.SelectedValue;
                objEntidad.NombreProcedimiento = ddlProductos.SelectedItem.Text;

                objEntidad.IdMateria = ddlMaterias.SelectedValue.Split(new char[] { '|' })[0];
                objEntidad.NombreMateria = ddlMaterias.SelectedItem.Text;

                objEntidad.IdProducto = ddlProductos.SelectedValue;
                objEntidad.NombreProducto = ddlProductos.SelectedItem.Text;
                objEntidad.IdRemesa = intIdRemesa;
                objEntidad.NombreRemesa = strNombreRemesa;

                objEntidad.FechaVencimiento = datFechaVencimiento.ToString("yyyyMMdd");
            }

            objProceso.AsignarCliente(ddlClientes.SelectedValue);
            objProceso.GuardarTemporal();
            objProceso.ValidarDatos();

            CargarGrilla(objProceso, 0);

            lblMensaje.Text = "Los datos se guardaron temporalmente. Revice los datos en la grilla y luego presione el botón \"GUARDAR\" para crear las cobranzas.";
        }

        protected void btnProcesarFinal_Click(object sender, EventArgs e)
        {
            Proceso objProceso = new Proceso(lblCodigoProceso.Text, lblUsuario.Text);
            objProceso.GuardarTablasFinales();
            CargarGrilla(objProceso, gvDetalleArchivo.PageIndex);
            lblMensaje.Text = "Las cobranzas se crearon correctamente.";
        }

        protected void gvDetalleArchivo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CargarGrilla(new Proceso(lblCodigoProceso.Text, lblUsuario.Text), e.NewPageIndex);
        }

        protected void ddlTiposCobranzas_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarListaProcedimientos();
        }

        protected void ddlTiposProcedimientos_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarListaMaterias();
        }

        protected void ddlMaterias_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarListaProductos();
        }

        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarRemesas();
        }

        private void CargarGrilla(Proceso proceso, int indice)
        {
            gvDetalleArchivo.PageIndex = indice;
            gvDetalleArchivo.DataSource = proceso.Registros;
            gvDetalleArchivo.DataBind();

            btnProcesarFinal.Visible = !proceso.Registros.Count.Equals(0);
        }

        private void CargarListaProcedimientos()
        {
            ddlTiposProcedimientos.Items.Clear();

            ddlTiposProcedimientos.DataSource =
                ddlTiposCobranzas.SelectedValue.Equals("J")
                ? ALCLOCAL.Consulta.ComboProcedimiento()
                : ddlTiposCobranzas.SelectedValue.Equals("P")
                ? ALCLOCAL.Consulta.ComboProcedimientoPRE()
                : ALCLOCAL.Consulta.ComboProcedimientoPRENDAS();
            ddlTiposProcedimientos.DataBind();

            CargarListaMaterias();
        }

        private void CargarListaMaterias()
        {
            ddlMaterias.Items.Clear();
            ddlProductos.Items.Clear();
            string strProcedimiento = ddlTiposProcedimientos.SelectedValue;

            ddlMaterias.DataSource =
                ddlTiposCobranzas.SelectedValue.Equals("J")
                ? ALCLOCAL.Consulta.ComboMateria(strProcedimiento)
                : ddlTiposCobranzas.SelectedValue.Equals("P")
                ? ALCLOCAL.Consulta.ComboMateriaPRE(strProcedimiento)
                : ALCLOCAL.Consulta.ComboMateriaPRENDAS(strProcedimiento);
            ddlMaterias.DataBind();

            CargarListaProductos();
        }

        private void CargarListaProductos()
        {
            ddlProductos.Items.Clear();
            string strMateria = ddlMaterias.SelectedValue.Split(new char[] { '|' })[1];
            // str = id_producto.Split(new char[] { '|' })[1].ToString();

            ddlProductos.DataSource =
                ddlTiposCobranzas.SelectedValue.Equals("J")
                ? ALCLOCAL.Consulta.ComboProducto(strMateria)
                : ddlTiposCobranzas.SelectedValue.Equals("P")
                ? ALCLOCAL.Consulta.ComboProductoPRE(strMateria)
                : ALCLOCAL.Consulta.ComboProductoPRENDAS(strMateria);
            ddlProductos.DataBind();
        }

        private void CargarRemesas()
        {
            ddlRemesas.DataSource = new ALCSA.Negocio.Cobranzas.Remesa().Listar(ddlClientes.SelectedValue);
            ddlRemesas.DataBind();
            ddlRemesas.Items.Insert(0, new ListItem("Seleccione", "0"));
        }
    }
}