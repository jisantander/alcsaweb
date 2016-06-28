namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class Reporte : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable table = null;
            table = Consulta.ReconstitucionByRut(base.Request.QueryString["ot"].ToString());
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.lblFechaInforme.Text = DateTime.Now.ToString("dd-MM-yyyy");
                this.lblNombre.Text = table.Rows[0]["nombrecliente"].ToString();
                this.lblRut.Text = table.Rows[0]["rutcliente"].ToString();
                this.lblDv.Text = table.Rows[0]["dv"].ToString();
                this.lblNumeroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.lblUbicacionInmueble.Text = table.Rows[0]["direccion"].ToString();
                this.lblConservador.Text = table.Rows[0]["conservador"].ToString();
                this.lblFojasdominio.Text = table.Rows[0]["fojasdominio"].ToString().Trim();
                this.lblNroDominio.Text = table.Rows[0]["numerodominio"].ToString().Trim();
                this.lblAnioDominio.Text = table.Rows[0]["aniodominio"].ToString().Trim();
                this.lblFsInscripcionHipoteca.Text = table.Rows[0]["fojashipoteca"].ToString().Trim();
                this.lblNroInscripcionHipoteca.Text = table.Rows[0]["numerohipoteca"].ToString().Trim();
                this.lblAnioHipoteca.Text = table.Rows[0]["aniohipoteca"].ToString().Trim();
                this.lblInscriProhibicion.Text = table.Rows[0]["fojasprohibicion"].ToString().Trim();
                this.lblNroProhibicion.Text = table.Rows[0]["numeroprohibicion"].ToString().Trim();
                this.lblAnioProhibicion.Text = table.Rows[0]["anioprohibicion"].ToString().Trim();
                this.lblNotaria.Text = table.Rows[0]["notaria"].ToString();
                this.lblFechaEscritura.Text = table.Rows[0]["fechaescritura"].ToString();
                this.lblLocalidadNotario.Text = table.Rows[0]["comunanotaria"].ToString();
                if (!string.IsNullOrEmpty(table.Rows[0]["montofactura"].ToString()))
                {
                    double num = Convert.ToDouble(table.Rows[0]["montofactura"].ToString());
                    this.lblTOTAL.Text = num.ToString("0,0").Replace(",", ".");
                }
                else
                {
                    this.lblTOTAL.Text = table.Rows[0]["montofactura"].ToString();
                }
                this.lblNROFACTURA.Text = table.Rows[0]["factura"].ToString();
                this.lblObservacion.Text = table.Rows[0]["observacion"].ToString();
            }
        }
    }
}

