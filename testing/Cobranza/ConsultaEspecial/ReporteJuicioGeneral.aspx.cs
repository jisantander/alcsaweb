namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ReporteJuicioGeneral : Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.lblFechaInforme.Text = DateTime.Now.ToString("dd-MM-yyyy");
                DataTable table = ConsultasEspecificas.ConsulGeneraljuicio(base.Request.QueryString["codigo"].ToString().ToString());
                string idjuicio = "";
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.txtCliente.Text = table.Rows[0]["cliente"].ToString();
                    this.txtNomDeudor.Text = table.Rows[0]["nomdeudor"].ToString();
                    this.txtRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                    this.txtOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                    this.txtProcedimiento.Text = table.Rows[0]["procedimiento"].ToString();
                    this.txtTribunal.Text = table.Rows[0]["tribunal"].ToString();
                    this.txtrol.Text = table.Rows[0]["rol"].ToString();
                    this.txtCuantia.Text = "0";
                    idjuicio = table.Rows[0]["id_juicios"].ToString();
                    DataTable table2 = ConsultasEspecificas.ConsulGeneralActJudiciales(idjuicio);
                    this.grilla.DataSource = table2;
                    this.grilla.DataBind();
                    DataTable table3 = ConsultasEspecificas.ConsulGeneralActJudiciales(idjuicio, "");
                    if ((table3.Rows.Count > 0) && (table3 != null))
                    {
                        this.Label1.Text = table3.Rows[0]["tramite"].ToString();
                        this.Label2.Text = table3.Rows[0]["observacion"].ToString();
                    }
                }
            }
        }
    }
}

