namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class InformeGeneral : Page
    {
      
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            DataTable table = null;
            table = Consulta.BuscaReconsReporte(this.hddOT.Value.ToString());
            if ((table.Rows.Count > 0) && (table != null))
            {
                Transaccion.UpdateInformeGeneralRecon(this.hddOT.Value.ToString(), this.txtTitulo.Text.ToString(), this.txtFechaEscritura.Text.ToString(), this.txtNotario.Text.ToString(), this.txtRepertorioNotaria.Text.ToString(), this.txtConservador.Text.ToString(), this.txtCertHipGravamenesUF.Text.ToString(), this.txtCertHipGravamenesPESOS.Text.ToString(), this.txtCertDominioUF.Text.ToString(), this.txtCertDominioPESOS.Text.ToString(), this.txtEndosoUF.Text.ToString(), this.txtEndosoPESOS.Text.ToString(), this.txtCertDicomUF.Text.ToString(), this.txtCertDicomPESOS.Text.ToString(), this.txtAlzamientoEmbargoUF.Text.ToString(), this.txtAlzamientoEmbargoPESOS.Text.ToString(), this.txtAlzamientoMedidaPrecautoriaUF.Text.ToString(), this.txtAlzamientoMedidaPrecautoriaPESOS.Text.ToString(), this.txtAlzamientosHipotecasUF.Text.ToString(), this.txtAlzamientosHipotecasPESOS.Text.ToString(), this.txtAlzamientoProhibicionesUF.Text.ToString(), this.txtAlzamientoProhibicionesPESOS.Text.ToString(), this.txtReconstitucionEscrituraUF.Text.ToString(), this.txtReconstitucionEscrituraPESOS.Text.ToString(), this.txtConformidadAlzamientoUF.Text.ToString(), this.txtConformidadAlzamientoPESOS.Text.ToString(), this.txtEscrituraAdjudicacionUF.Text.ToString(), this.txtEscrituraAdjudicacionPESOS.Text.ToString(), this.txtTotalUF.Text.ToString(), this.txtTotalPESOS.Text.ToString(), this.txtCertGravaProhibiciones.Text.ToString(), this.txtcopiaInsDominioVig.Text.ToString(), this.txtCertGravaProhib2.Text.ToString(), this.txtCopiaEscrituraAlzamiento.Text.ToString(), this.txtCopiaEscrmutuohipo.Text.ToString(), this.txtFotocopiaEscAlzamiento.Text.ToString(), this.txtObservacion.Text.ToString(), this.Session["Usuario"].ToString());
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos actualizados correctamente');</script>");
            }
            else
            {
                Transaccion.InsertaInformeGeneralRecon(this.hddOT.Value.ToString(), this.txtTitulo.Text.ToString(), this.txtFechaEscritura.Text.ToString(), this.txtNotario.Text.ToString(), this.txtRepertorioNotaria.Text.ToString(), this.txtConservador.Text.ToString(), this.txtCertHipGravamenesUF.Text.ToString(), this.txtCertHipGravamenesPESOS.Text.ToString(), this.txtCertDominioUF.Text.ToString(), this.txtCertDominioPESOS.Text.ToString(), this.txtEndosoUF.Text.ToString(), this.txtEndosoPESOS.Text.ToString(), this.txtCertDicomUF.Text.ToString(), this.txtCertDicomPESOS.Text.ToString(), this.txtAlzamientoEmbargoUF.Text.ToString(), this.txtAlzamientoEmbargoPESOS.Text.ToString(), this.txtAlzamientoMedidaPrecautoriaUF.Text.ToString(), this.txtAlzamientoMedidaPrecautoriaPESOS.Text.ToString(), this.txtAlzamientosHipotecasUF.Text.ToString(), this.txtAlzamientosHipotecasPESOS.Text.ToString(), this.txtAlzamientoProhibicionesUF.Text.ToString(), this.txtAlzamientoProhibicionesPESOS.Text.ToString(), this.txtReconstitucionEscrituraUF.Text.ToString(), this.txtReconstitucionEscrituraPESOS.Text.ToString(), this.txtConformidadAlzamientoUF.Text.ToString(), this.txtConformidadAlzamientoPESOS.Text.ToString(), this.txtEscrituraAdjudicacionUF.Text.ToString(), this.txtEscrituraAdjudicacionPESOS.Text.ToString(), this.txtTotalUF.Text.ToString(), this.txtTotalPESOS.Text.ToString(), this.txtCertGravaProhibiciones.Text.ToString(), this.txtcopiaInsDominioVig.Text.ToString(), this.txtCertGravaProhib2.Text.ToString(), this.txtCopiaEscrituraAlzamiento.Text.ToString(), this.txtCopiaEscrmutuohipo.Text.ToString(), this.txtFotocopiaEscAlzamiento.Text.ToString(), this.txtObservacion.Text.ToString(), this.Session["Usuario"].ToString());
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos ingresados correctamente');</script>");
            }
        }

        private void Mostrar(string OT)
        {
            DataTable table = null;
            table = Consulta.BuscaReconsReporte(OT);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txtTitulo.Text = table.Rows[0]["titulo"].ToString();
                this.txtFechaEscritura.Text = table.Rows[0]["FechaEscritura"].ToString();
                this.txtNotario.Text = table.Rows[0]["notario"].ToString();
                this.txtRepertorioNotaria.Text = table.Rows[0]["RepertorioNotaria"].ToString();
                this.txtConservador.Text = table.Rows[0]["Conservador"].ToString();
                this.txtCertHipGravamenesUF.Text = table.Rows[0]["CertHipGravamenesUF"].ToString();
                this.txtCertHipGravamenesPESOS.Text = table.Rows[0]["CertHipGravamenesPESOS"].ToString();
                this.txtCertDominioUF.Text = table.Rows[0]["CertDominioUF"].ToString();
                this.txtCertDominioPESOS.Text = table.Rows[0]["CertDominioPESOS"].ToString();
                this.txtEndosoUF.Text = table.Rows[0]["EndosoUF"].ToString();
                this.txtEndosoPESOS.Text = table.Rows[0]["EndosoPESOS"].ToString();
                this.txtCertDicomUF.Text = table.Rows[0]["CertDicomUF"].ToString();
                this.txtCertDicomPESOS.Text = table.Rows[0]["CertDicomPESOS"].ToString();
                this.txtAlzamientoEmbargoUF.Text = table.Rows[0]["AlzamientoEmbargoUF"].ToString();
                this.txtAlzamientoEmbargoPESOS.Text = table.Rows[0]["AlzamientoEmbargoPESOS"].ToString();
                this.txtAlzamientoMedidaPrecautoriaUF.Text = table.Rows[0]["AlzamientoMedidaPrecautoriaUF"].ToString();
                this.txtAlzamientoMedidaPrecautoriaPESOS.Text = table.Rows[0]["AlzamientoMedidaPrecautoriaPESOS"].ToString();
                this.txtAlzamientosHipotecasUF.Text = table.Rows[0]["AlzamientosHipotecasUF"].ToString();
                this.txtAlzamientosHipotecasPESOS.Text = table.Rows[0]["AlzamientosHipotecasPESOS"].ToString();
                this.txtAlzamientoProhibicionesUF.Text = table.Rows[0]["AlzamientoProhibicionesUF"].ToString();
                this.txtAlzamientoProhibicionesPESOS.Text = table.Rows[0]["AlzamientoProhibicionesPESOS"].ToString();
                this.txtReconstitucionEscrituraUF.Text = table.Rows[0]["ReconstitucionEscrituraUF"].ToString();
                this.txtReconstitucionEscrituraPESOS.Text = table.Rows[0]["ReconstitucionEscrituraPESOS"].ToString();
                this.txtConformidadAlzamientoUF.Text = table.Rows[0]["ConformidadAlzamientoUF"].ToString();
                this.txtConformidadAlzamientoPESOS.Text = table.Rows[0]["ConformidadAlzamientoPESOS"].ToString();
                this.txtEscrituraAdjudicacionUF.Text = table.Rows[0]["EscrituraAdjudicacionUF"].ToString();
                this.txtEscrituraAdjudicacionPESOS.Text = table.Rows[0]["EscrituraAdjudicacionPESOS"].ToString();
                this.txtTotalUF.Text = table.Rows[0]["TotalUF"].ToString();
                this.txtTotalPESOS.Text = table.Rows[0]["TotalPESOS"].ToString();
                this.txtCertGravaProhibiciones.Text = table.Rows[0]["CertGravaProhibiciones"].ToString();
                this.txtcopiaInsDominioVig.Text = table.Rows[0]["copiaInsDominioVig"].ToString();
                this.txtCertGravaProhib2.Text = table.Rows[0]["CertGravaProhib2"].ToString();
                this.txtCopiaEscrituraAlzamiento.Text = table.Rows[0]["CopiaEscrituraAlzamiento"].ToString();
                this.txtCopiaEscrmutuohipo.Text = table.Rows[0]["CopiaEscrmutuohipo"].ToString();
                this.txtFotocopiaEscAlzamiento.Text = table.Rows[0]["FotocopiaEscAlzamiento"].ToString();
                this.txtObservacion.Text = table.Rows[0]["Observacion"].ToString();
            }
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
                this.hddOT.Value = base.Request.QueryString["ot"].ToString().ToString();
                this.txtTitulo.Focus();
                this.Mostrar(this.hddOT.Value);
            }
        }
    }
}

