namespace CobranzaALC.Cobranza.Prendas
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class Prenda : Page
    {
        
        protected void bienmueble_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.bienmueble.SelectedValue.ToString() == "Seleccione")
            {
                this.txtTipoVehiculo.Text = "";
                this.txtaniofabricacion.Text = "";
                this.txtpatente.Text = "";
                this.txtmarca.Text = "";
                this.txtchassis.Text = "";
                this.txtEstado.Text = "";
            }
            else
            {
                DataTable table = null;
                table = ConsultasEspecificas.MostrarDatosBienMueble(this.bienmueble.SelectedValue.ToString());
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.txtTipoVehiculo.Text = table.Rows[0]["tipovehiculo"].ToString();
                    this.txtaniofabricacion.Text = table.Rows[0]["anio_fabricacion"].ToString();
                    this.txtpatente.Text = table.Rows[0]["patente"].ToString();
                    this.txtmarca.Text = table.Rows[0]["marca"].ToString();
                    this.txtchassis.Text = table.Rows[0]["n_chassis"].ToString();
                    this.txtEstado.Text = table.Rows[0]["estado"].ToString();
                }
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Transaccion.InsertaPrendas(this.hiddidcobranza.Value.ToString(), this.txtrutaval.Text, this.ejecutivos.SelectedValue, this.sucursal.SelectedValue, this.bienmueble.SelectedValue, this.proveedor.SelectedValue, this.txtrutvendedor.Text, this.txtmonto.Text, this.txtobservacion.Text, this.txtfecha.Text, this.Session["Usuario"].ToString());
            string str = "Prenda.aspx?Codigo=" + this.hiddidcobranza.Value.ToString();
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');location.href='" + str.ToString() + "';</script>");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("buscaCobranzaPrenda.aspx");
        }

        private void ComboBienMueble(string rut_deudor)
        {
            this.bienmueble.DataTextField = "patente";
            this.bienmueble.DataValueField = "id_bien_mueble";
            this.bienmueble.DataSource = Consulta.ComboBienMueble(rut_deudor);
            this.bienmueble.DataBind();
            this.bienmueble.Items.Insert(0, "Seleccione");
        }

        private void ComboEjecutivos()
        {
            this.ejecutivos.DataTextField = "nombre";
            this.ejecutivos.DataValueField = "id_ejecutivo";
            this.ejecutivos.DataSource = Consulta.ComboEjecutivos();
            this.ejecutivos.DataBind();
        }

        private void ComboProveedor()
        {
            this.proveedor.DataTextField = "nombre";
            this.proveedor.DataValueField = "rut_proveedor";
            this.proveedor.DataSource = Consulta.ComboProveedores();
            this.proveedor.DataBind();
        }

        private void ComboSucursal()
        {
            this.sucursal.DataTextField = "nombresucursal";
            this.sucursal.DataValueField = "id_sucursal";
            this.sucursal.DataSource = Consulta.ComboSucursal();
            this.sucursal.DataBind();
        }

        private string getDeudor(string rut)
        {
            string str = "";
            DataTable table = null;
            rut = rut.Replace(".", "");
            table = Consulta.BuscarDeudor(rut);
            if ((table != null) && (table.Rows.Count > 0))
            {
                str = table.Rows[0]["rsocial"].ToString();
            }
            return str;
        }

        private void habilitar()
        {
            this.txtrutaval.BackColor = Color.LightYellow;
            this.ejecutivos.BackColor = Color.LightYellow;
            this.sucursal.BackColor = Color.LightYellow;
            this.bienmueble.BackColor = Color.LightYellow;
            this.proveedor.BackColor = Color.LightYellow;
            this.txtrutvendedor.BackColor = Color.LightYellow;
            this.txtmonto.BackColor = Color.LightYellow;
            this.txtobservacion.BackColor = Color.LightYellow;
            this.txtfecha.BackColor = Color.LightYellow;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtrutaval.Text))
            {
                this.txtrutaval.Text = "";
                this.txtnomaval.Text = "";
            }
            else
            {
                string str = this.getDeudor(this.txtrutaval.Text.ToString());
                if (string.IsNullOrEmpty(str))
                {
                    this.txtnomaval.Text = "";
                    this.txtrutaval.Text = "";
                    this.txtrutaval.Focus();
                }
                else
                {
                    this.txtnomaval.Text = str;
                }
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtrutvendedor.Text))
            {
                this.txtrutvendedor.Text = "";
                this.txtnomvendedor.Text = "";
            }
            else
            {
                string str = this.getDeudor(this.txtrutvendedor.Text.ToString());
                if (string.IsNullOrEmpty(str))
                {
                    this.txtnomvendedor.Text = "";
                    this.txtrutvendedor.Text = "";
                    this.txtrutvendedor.Focus();
                }
                else
                {
                    this.txtnomvendedor.Text = str;
                }
            }
        }

        private void MostrarDatosJuicio(string id_cobranza)
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDatosCabezeraPrendas(id_cobranza);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtCliente.Text = table.Rows[0]["nomcliente"].ToString();
                this.txtdeudor.Text = table.Rows[0]["nomdeudor"].ToString();
                this.txtrutdeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                this.ComboBienMueble(this.txtrutdeudor.Text);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!this.Page.IsPostBack)
            {
                this.habilitar();
                this.ComboEjecutivos();
                this.ComboSucursal();
                this.ComboProveedor();
                this.titulo.Text = "INGRESAR PRENDA";
                if (!string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
                {
                    string str = base.Request.QueryString["Codigo"].ToString();
                    this.hiddidcobranza.Value = str;
                    this.MostrarDatosJuicio(str);
                }
            }
        }
    }
}

