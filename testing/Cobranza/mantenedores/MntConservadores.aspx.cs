namespace CobranzaALC.Cobranza.mantenedores
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MntConservadores : Page
    {
    
        public GridViewRow gridViewRow = null;

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable table = null;
            table = Consulta.BuscarDeudor(this.txtRut.Text.Replace(".", ""));
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txtRut.ReadOnly = true;
                this.Habilitar();
                this.btnBuscar.Visible = false;
                this.btnGuardar.Visible = true;
                this.txtCalle.Focus();
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Deudor no registrado');</script>");
                this.txtRut.Focus();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            object obj2 = null;
            if (obj2 == null)
            {
                Transaccion.InsertaConservador(this.txtNombre.Text.ToString(), this.comuna.SelectedValue.ToString(), this.txtCalle.Text.ToString(), this.txtRut.Text.ToString(), this.Session["Usuario"].ToString(), this.txtCargo.Text.ToString());
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");
                this.CargaGrilla(this.comuna.SelectedValue.ToString());
                this.txtNombre.Text = "";
                this.txtRut.Text = "";
                this.txtCalle.Text = "";
                this.txtCargo.Text = "";
            }
        }

        public void Cancela()
        {
            this.txtRut.Text = "";
            this.txtCalle.Text = "";
            this.txtNombre.Text = "";
            this.txtCargo.Text = "";
            this.txtRut.ReadOnly = false;
            this.region.SelectedIndex = 0;
            this.comuna.Items.Clear();
            this.btnGuardar.Visible = false;
            this.btnBuscar.Visible = true;
            this.txtRut.Focus();
        }

        private void CargaGrilla(string id_comuna_con)
        {
            DataTable table = Consulta.GrillaConservadores(id_comuna_con);
            this.grilla.DataSource = table;
            this.grilla.DataBind();
        }

        private void CargarComunas(string idRegion)
        {
            this.comuna.DataTextField = "descripcion";
            this.comuna.DataValueField = "id_comuna";
            this.comuna.DataSource = Consulta.BuscaComunas(idRegion);
            this.comuna.DataBind();
            this.comuna.Items.Insert(0, "Seleccione");
        }

        private void CargaRegiComunaDefecto()
        {
            this.CargarRegiones();
        }

        private void CargarRegiones()
        {
            this.region.DataTextField = "descripcion";
            this.region.DataValueField = "id_regiones";
            this.region.DataSource = Consulta.BuscaRegiones();
            this.region.DataBind();
            this.region.Items.Insert(0, "Seleccione");
        }

        protected void comuna_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.comuna.SelectedValue.ToString() == "Seleccione")
            {
                this.Deshabilitar();
            }
            else
            {
                this.Habilitar();
                this.CargaGrilla(this.comuna.SelectedValue.ToString());
            }
        }

        public void Deshabilitar()
        {
            this.txtRut.Enabled = false;
            this.txtCalle.Enabled = false;
            this.txtNombre.Enabled = false;
            this.txtCargo.Enabled = false;
            this.txtRut.Text = "";
            this.txtCalle.Text = "";
            this.txtCargo.Text = "";
            this.txtNombre.Text = "";
            this.btnGuardar.Enabled = false;
            this.grilla.DataSource = null;
            this.grilla.DataBind();
        }

        public void Editar(object sender, GridViewCommandEventArgs e)
        {
            this.gridViewRow = ((Control) e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Editar") == 0)
            {
                Label label = (Label) this.gridViewRow.FindControl("lblID");
                Transaccion.EliminarConservador(label.Text.ToString());
                this.CargaGrilla(this.comuna.SelectedValue.ToString());
            }
        }

        public void Habilitar()
        {
            this.txtCargo.Enabled = true;
            this.txtRut.Enabled = true;
            this.txtCalle.Enabled = true;
            this.txtNombre.Enabled = true;
            this.btnGuardar.Enabled = true;
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
                this.CargarRegiones();
                this.Deshabilitar();
                this.btnBuscar.Visible = false;
                this.btnGuardar.Visible = true;
            }
        }

        protected void region_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.region.SelectedValue.ToString() == "Seleccione")
            {
                this.Deshabilitar();
                this.comuna.Items.Clear();
            }
            else
            {
                this.CargarComunas(this.region.SelectedValue);
            }
        }

        protected void vigencia_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}

