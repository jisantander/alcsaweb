namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class Reversar : Page
    {
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Transaccion.UPDATEREVERSAR(this.hddOT.Value.ToString(), this.cbxEstados.SelectedValue.ToString(), this.txtObservacion.Text.ToString(), this.Session["Usuario"].ToString());
            Transaccion.InsertaBitacoraEstadoReconstitucion(this.hddOT.Value.ToString(), this.cbxEstados.SelectedValue.ToString(), this.txtObservacion.Text.ToString(), this.Session["Usuario"].ToString());
            this.Page.RegisterStartupScript("cerrar", "<script>window.close();</script>");
        }

        private void ComboEstados()
        {
            this.cbxEstados.DataTextField = "descripcion";
            this.cbxEstados.DataValueField = "id";
            this.cbxEstados.DataSource = Consulta.ComboEstadosSinTerminar();
            this.cbxEstados.DataBind();
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
                string str = base.Request.QueryString["OT"].ToString();
                this.hddOT.Value = str;
                this.txtOT.Text = str;
                this.ComboEstados();
            }
        }
    }
}

