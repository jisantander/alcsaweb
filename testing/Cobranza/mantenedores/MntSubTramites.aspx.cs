namespace CobranzaALC.Cobranza.mantenedores
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MntSubTramites : Page
    {
        public GridViewRow gridViewRow = null;

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable table = null;
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.Habilitar();
                this.btnBuscar.Visible = false;
                this.btnGuardar.Visible = true;
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Deudor no registrado');</script>");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Transaccion.InsertaSubTramiteNuevo(this.txtDescripcion.Text.ToString(), this.Tipo.SelectedValue.ToString(), this.termino.SelectedValue.ToString());
            string str = "MntSubTramites.aspx";
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');location.href='" + str.ToString() + "';</script>");
        }

        public void Cancela()
        {
            this.btnGuardar.Visible = false;
            this.btnBuscar.Visible = true;
        }

        private void CargaGrilla()
        {
            if (this.Tipo.SelectedValue.ToString() == "0")
            {
                this.grilla.DataSource = null;
                this.grilla.DataBind();
            }
            else
            {
                DataTable table = Consulta.GrillaSub_Tramite(this.Tipo.SelectedValue.ToString());
                this.grilla.DataSource = table;
                this.grilla.DataBind();
            }
        }

        private void CargarComunas(string idRegion)
        {
        }

        private void CargaRegiComunaDefecto()
        {
        }

        protected void comuna_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        public void Deshabilitar()
        {
        }

        public void Editar(object sender, GridViewCommandEventArgs e)
        {
            this.gridViewRow = ((Control) e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Editar") == 0)
            {
                Label label = (Label) this.gridViewRow.FindControl("lblID");
                string str = label.Text.ToString();
            }
        }

        protected string Evaluar(object Tipo)
        {
            Tipo = Tipo.ToString().Replace("ESTANDARD1", "ESTANDARD 1-2-3-4");
            return Tipo.ToString();
        }

        public void Habilitar()
        {
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
                this.CargaGrilla();
                this.btnBuscar.Visible = false;
                this.btnGuardar.Visible = true;
            }
        }

        protected void region_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void Tipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.CargaGrilla();
        }

        protected void vigencia_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}

