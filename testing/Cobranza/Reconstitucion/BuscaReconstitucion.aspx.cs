namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;
    using System.Globalization;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.Drawing;
    using System.Linq;
    using System.Text;
    using System.IO;

    public partial class BuscaReconstitucion : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (this.Page.IsPostBack) return;
            
            this.txtRut.Focus();
            this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
            this.ComboEstados();
            this.ComboResponsables();
            this.ComboProductos();
            this.txtNroCasos.Text = "0";
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
            this.txtNroOperacion.Text = "";
            this.txtRut.Text = "";
            this.cbxEstados.SelectedIndex = 0;
            this.cbxResponsable.SelectedIndex = 0;
            this.cbxProductos.SelectedIndex = 0;
            this.txtFechaRemesa.Text = "";
            this.txtConservadorFiltro.Text = "";
            this.txtSubProducto.Text = "";
            this.txtNombreCliente.Text = "";
            this.txtNroCasos.Text = "0";
            this.txtRut.Focus();
        }

        private void CargaGrilla()
        {
            DataTable table = null;
            DateTime datFecha = new DateTime(1900, 1, 1);
            if (!string.IsNullOrEmpty(this.txtFechaRemesa.Text))
                DateTime.TryParseExact(this.txtFechaRemesa.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out datFecha);

            table = ConsultasEspecificas.ConsultaReconstitucion(
                this.txtRut.Text.Trim(),
                this.txtNroOperacion.Text.Trim(),
                this.cbxEstados.SelectedValue,
                datFecha.Year > 1900 ? datFecha.ToString("yyyyMMdd") : string.Empty, 
                this.cbxResponsable.SelectedValue, 
                this.txtConservadorFiltro.Text.Trim(), 
                this.txtNombreCliente.Text, 
                this.txtSubProducto.Text, 
                this.cbxProductos.Text
            );

            this.Session["ExcelRecon"] = table;
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();

            this.txtNroCasos.Text = table.Rows.Count > 0 ? table.Rows.Count.ToString() : "0";
        }

        protected void cbxEstados_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
        }

        protected void cbxResponsable_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Grilla.DataSource = null;
            this.Grilla.DataBind();
        }

        private void ComboEstados()
        {
            this.cbxEstados.DataTextField = "descripcion";
            this.cbxEstados.DataValueField = "id";
            this.cbxEstados.DataSource = Consulta.ComboReconstitucion();
            this.cbxEstados.DataBind();
            this.cbxEstados.Items.Insert(0, "Seleccione");
        }

        private void ComboProductos()
        {
            this.cbxProductos.DataTextField = "Producto";
            this.cbxProductos.DataValueField = "Producto";
            this.cbxProductos.DataSource = Consulta.ComboProductosReconstitucion();
            this.cbxProductos.DataBind();
            this.cbxProductos.Items.Insert(0, "Seleccione");
        }

        private void ComboResponsables()
        {
            this.cbxResponsable.DataTextField = "nombre";
            this.cbxResponsable.DataValueField = "username";
            this.cbxResponsable.DataSource = Consulta.ComboResponsablesReconstitucion();
            this.cbxResponsable.DataBind();
            this.cbxResponsable.Items.Insert(0, "Seleccione");
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla();
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            StringWriter writer = new StringWriter(sb);
            HtmlTextWriter writer2 = new HtmlTextWriter(writer);
            Page page = new Page();
            HtmlForm child = new HtmlForm();
            this.Grilla.EnableViewState = false;
            page.EnableEventValidation = false;
            page.DesignerInitialize();
            page.Controls.Add(child);
            child.Controls.Add(this.Grilla);
            page.RenderControl(writer2);
            base.Response.Clear();
            base.Response.Buffer = true;
            base.Response.ContentType = "application/vnd.ms-excel";
            base.Response.AddHeader("Content-Disposition", "attachment;filename=Tablero.xls");
            base.Response.Charset = "UTF-8";
            base.Response.ContentEncoding = Encoding.Default;
            base.Response.Write(sb.ToString());
        }
       
        

    }
}

