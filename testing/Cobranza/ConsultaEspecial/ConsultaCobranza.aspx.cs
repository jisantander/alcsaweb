namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ConsultaCobranza : Page
    {
       

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("BuscaCobranzaConsulta.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"])) && !string.IsNullOrEmpty(base.Request.QueryString["estado"]))
            {
                string idcobranza = base.Request.QueryString["Codigo"].ToString();
                if (base.Request.QueryString["estado"].ToString() == "A")
                {
                    this.txtestado.Text = "Activa";
                }
                else
                {
                    this.txtestado.Text = "No Activa";
                }
                DataTable table = null;
                table = ConsultasEspecificas.ConsultaTableroConsulta(null, null, null, null, null, null, null, null, idcobranza);
                this.lblnrooperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtdeudor.Text = table.Rows[0]["nomdeudor"].ToString();
                this.txtrutdeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                this.txtcliente.Text = table.Rows[0]["cliente"].ToString();
                this.txtnrooperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtmontocobranza.Text = table.Rows[0]["monto_div_adeudado_ps"].ToString();
                this.txtfechaprescripcion.Text = table.Rows[0]["fechaprescripcion"].ToString();
                this.txttitulocobranza.Text = table.Rows[0]["producto"].ToString();
                this.txtfechaingresodemanda.Text = table.Rows[0]["fingresocorte"].ToString();
                this.txtjuzgado.Text = table.Rows[0]["tribunal"].ToString();
                this.txtrol.Text = table.Rows[0]["rol"].ToString();
                this.txtestadojuicio.Text = table.Rows[0]["estadojuicio"].ToString();
                this.txtultimotramitejudi.Text = table.Rows[0]["tramite"].ToString();
                this.txtfechaultitraju.Text = table.Rows[0]["ftramite"].ToString();
                this.txtproxtramitejudi.Text = table.Rows[0]["proxgestion"].ToString();
                this.txtfechaproximotrajud.Text = table.Rows[0]["fechaproxgestion"].ToString();
                this.txtabogado.Text = table.Rows[0]["abogado"].ToString();
                this.txtprocurador.Text = table.Rows[0]["procurador"].ToString();
                this.doc1.Value = table.Rows[0]["urlmutuo"].ToString();
                this.doc2.Value = table.Rows[0]["urljuicio"].ToString();
            }
        }
    }
}

