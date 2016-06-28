namespace CobranzaALC.Cobranza.Abonos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MuestraRendicion : Page
    {
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            this.btnGuardar.Visible = true;
            this.CargaGrilla();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.txtNro.Text))
            {
                string str = this.txtNro.Text.ToString();
                DataTable table = Consulta.ValidaDocRendicion(str);
                if ((table.Rows.Count > 0) && (table != null))
                {
                    Transaccion.UpdateDocRendicion(str, null, null, this.cbxBanco.SelectedValue.ToString(), this.txtNroCheque.Text.ToString(), this.txtNroSerie.Text.ToString(), this.txtFechacheque.Text.ToString(), this.txtNroCtaCte.Text.ToString(), this.Session["Usuario"].ToString());
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos actualizados correctamente');</script>");
                }
                else
                {
                    Transaccion.InsertaDocRendicion(str, null, null, this.cbxBanco.SelectedValue.ToString(), this.txtNroCheque.Text.ToString(), this.txtNroSerie.Text.ToString(), this.txtFechacheque.Text.ToString(), this.txtNroCtaCte.Text.ToString(), this.Session["Usuario"].ToString());
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos ingresados correctamente');</script>");
                }
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe ingresar N\x00b0 de rendici\x00f3n');</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
        }

        private void CargaGrilla()
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarRendicion(this.txtNro.Text.ToString());
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.pnlCheque.Visible = true;
                this.txtNro.Enabled = false;
                this.VerRendicion(this.txtNro.Text.ToString());
            }
            this.Grilla.DataSource = table;
            this.Grilla.DataBind();
        }

        private void ComboBancos()
        {
            this.cbxBanco.DataTextField = "descripcion";
            this.cbxBanco.DataValueField = "id_banco";
            this.cbxBanco.DataSource = Consulta.ComboBancos();
            this.cbxBanco.DataBind();
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla();
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        public void habilitar()
        {
            this.txtNro.BackColor = Color.LightYellow;
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
                if (base.Request.QueryString["RENDICION"] != null)
                {
                    string str = base.Request.QueryString["RENDICION"].ToString();
                    this.btnGuardar.Visible = false;
                    this.ComboBancos();
                    this.txtNro.Text = str.ToString();
                    this.txtNro.Focus();
                    this.txtNro.Enabled = false;
                    this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
                }
                else
                {
                    this.btnGuardar.Visible = false;
                    this.ComboBancos();
                    this.txtNro.Focus();
                    this.txtNro.Enabled = true;
                    this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
                }
            }
        }

        public void VerRendicion(string idrendicion)
        {
            DataTable table = null;
            table = Consulta.ValidaDocRendicion(idrendicion);
            if (((table.Rows.Count > 0) && (table != null)) && (table.Rows[0]["impreso"].ToString() == "S"))
            {
                this.btnGuardar.Enabled = false;
                this.cbxBanco.Enabled = false;
                this.txtNroCheque.Enabled = false;
                this.txtNroSerie.Enabled = false;
                this.txtFechacheque.Enabled = false;
                this.txtNroCtaCte.Enabled = false;
            }
            DataTable table2 = Consulta.ValidaDocRendicion(idrendicion);
            if ((table2.Rows.Count > 0) && (table2 != null))
            {
                this.cbxBanco.SelectedValue = table2.Rows[0]["id_banco"].ToString();
                this.txtNroCheque.Text = table2.Rows[0]["nrocheque"].ToString();
                this.txtNroSerie.Text = table2.Rows[0]["serie"].ToString();
                this.txtFechacheque.Text = table2.Rows[0]["fcheque"].ToString();
                this.txtNroCtaCte.Text = table2.Rows[0]["nroctacte"].ToString();
            }
        }
    }
}

