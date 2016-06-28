namespace CobranzaALC.Cobranza.mantenedores
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MntParametros : Page
    {

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Transaccion.ActualizarParametros(Convert.ToDouble(this.txttasacorriente.Text), Convert.ToDouble(this.txttasaconvencional.Text), Convert.ToDouble(this.txttasaadicional.Text), Convert.ToDouble(this.txtHonorarios.Text), this.txtDescInteres.Text, this.txtDeschonorarios.Text, this.txtOtrosDesc.Text);
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos actualizados correctamente');</script>");
        }

        private void LlenarDatos()
        {
            DataTable table = null;
            table = Consulta.TraeParametros();
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txttasacorriente.Text = table.Rows[0]["tasainteres"].ToString();
                this.txttasaconvencional.Text = table.Rows[0]["TasaMaxConvencional"].ToString();
                this.txttasaadicional.Text = table.Rows[0]["TasaAdicional"].ToString();
                this.txtHonorarios.Text = table.Rows[0]["Honorarios"].ToString();
                this.txtDescInteres.Text = table.Rows[0]["DescIntereses"].ToString();
                this.txtDeschonorarios.Text = table.Rows[0]["DescHonorarios"].ToString();
                this.txtOtrosDesc.Text = table.Rows[0]["OtrosDescuentos"].ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.txttasacorriente.Focus();
                this.LlenarDatos();
            }
        }
    }
}

