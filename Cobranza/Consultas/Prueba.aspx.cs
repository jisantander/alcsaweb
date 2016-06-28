namespace CobranzaALC.Cobranza.Consultas
{
    using ALCLOCAL;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class Prueba : Page
    {
        
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
        }

        protected void Grilla_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.Grilla.DataSource = Consulta.Cobranza();
                this.Grilla.DataBind();
            }
        }
    }
}

