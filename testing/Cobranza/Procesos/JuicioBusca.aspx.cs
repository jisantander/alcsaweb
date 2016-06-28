namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class JuicioBusca : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack) return;
            this.txtRut.Focus();
            this.habilitar();
            this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;

            this.ddlJurisdicciones.DataSource = Consulta.ComboJurisdiccion();
            this.ddlJurisdicciones.DataBind();
            this.ddlJurisdicciones.Items.Insert(0, new ListItem("Todos", "0"));

            CargarTribunales();
        }

        protected void ddlJurisdicciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarTribunales();
        }

        public GridViewRow gridViewRow = null;

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.CargaGrilla(0);
        }

        private void CargaGrilla(int indice)
        {
            System.Data.DataTable objTabla = ConsultasEspecificas.ConsultaCobranzaRESPONSABLE(
                                                                this.txtRut.Text,
                                                                this.txtNroOperacion.Text,
                                                                ddlEstados.SelectedValue,
                                                                Convert.ToInt32(ddlJurisdicciones.SelectedValue),
                                                                Convert.ToInt32(ddlTribunales.SelectedValue));
            this.Grilla.PageIndex = indice;
            this.Grilla.DataSource = objTabla;
            this.Grilla.DataBind();

            System.Text.StringBuilder strbTexto = new System.Text.StringBuilder();
            foreach (System.Data.DataRow objFila in objTabla.Rows)
                if ("AR".Contains(objFila["estado"].ToString().Trim().ToUpper()))
                    strbTexto.AppendFormat("{0},", objFila["id_cobranza"]);

            Session["CODIGOS_ASIGNACION_MASIVA"] = strbTexto.ToString();
        }

        public void Editar(object sender, GridViewCommandEventArgs e)
        {
            this.gridViewRow = ((Control) e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Editar") == 0)
            {
                Label label = (Label) this.gridViewRow.FindControl("lblEstado");
                Label label2 = (Label) this.gridViewRow.FindControl("lblidCobbrnza");
                Label label3 = (Label) this.gridViewRow.FindControl("lblrespo");

                string str = "JuicioBuscaResponsable.aspx?Codigo=" + label2.Text.ToString();
                ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Error", "VentanaModalEdit('" + str + "','" + label.Text.ToString() + "');", true);
            }
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla(e.NewPageIndex);
        }

        public void habilitar()
        {
            this.txtRut.BackColor = Color.LightYellow;
            this.txtNroOperacion.BackColor = Color.LightYellow;
        }

        private void CargarTribunales()
        {
            this.ddlTribunales.DataSource = Consulta.ComboTribunales(ddlJurisdicciones.SelectedValue);
            this.ddlTribunales.DataBind();
            this.ddlTribunales.Items.Insert(0, new ListItem("Todos", "0"));
        }
    }
}

