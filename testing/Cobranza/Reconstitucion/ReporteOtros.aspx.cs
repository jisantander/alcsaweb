namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ReporteOtros : Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                DataTable table = null;
                DataTable table2 = null;
                string ot = base.Request.QueryString["ot"].ToString();
                table = Consulta.ReconstitucionByRut(ot);
                table2 = Consulta.ReconstitucionReporByOT(ot);
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.lblFechaInforme.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    this.lblNombre.Text = table.Rows[0]["nombrecliente"].ToString();
                    this.lblRut.Text = table.Rows[0]["rutcliente"].ToString();
                    this.lblDv.Text = table.Rows[0]["dv"].ToString();
                    this.lblNumeroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                    this.lblUbicacionInmueble.Text = table.Rows[0]["direccion"].ToString();
                }
                if ((table2.Rows.Count > 0) && (table2 != null))
                {
                    this.lblTITULO.Text = table2.Rows[0]["titulo"].ToString();
                    if (table2.Rows[0]["observacion"].ToString() == "")
                    {
                        this.observacion1.Visible = false;
                    }
                    else
                    {
                        this.lblObservacion.Text = table2.Rows[0]["observacion"].ToString();
                    }
                    if (table2.Rows[0]["fechaescritura"].ToString() == "")
                    {
                        this.FechaEscritura.Visible = false;
                    }
                    else
                    {
                        this.lblFechaEscritura.Text = table2.Rows[0]["fechaescritura"].ToString();
                    }
                    if (table2.Rows[0]["notario"].ToString() == "")
                    {
                        this.Notario.Visible = false;
                    }
                    else
                    {
                        this.lblNotario.Text = table2.Rows[0]["notario"].ToString();
                    }
                    if (table2.Rows[0]["repertorionotaria"].ToString() == "")
                    {
                        this.RepertorioNotaria.Visible = false;
                    }
                    else
                    {
                        this.lblRepertorioNotaria.Text = table2.Rows[0]["repertorionotaria"].ToString();
                    }
                    if (table2.Rows[0]["conservador"].ToString() == "")
                    {
                        this.conservador.Visible = false;
                    }
                    else
                    {
                        this.lblconservador.Text = table2.Rows[0]["conservador"].ToString();
                    }
                    if ((table2.Rows[0]["CertHipGravamenesUF"].ToString() == "") || (table2.Rows[0]["CertHipGravamenesPESOS"].ToString() == ""))
                    {
                        this.CertHipGravamenes.Visible = false;
                    }
                    else
                    {
                        this.lblCertHipGravamenesUF.Text = table2.Rows[0]["CertHipGravamenesUF"].ToString();
                        this.lblCertHipGravamenesPESOS.Text = table2.Rows[0]["CertHipGravamenesPESOS"].ToString();
                    }
                    if ((table2.Rows[0]["CertDominioUF"].ToString() == "") || (table2.Rows[0]["CertDominioPESOS"].ToString() == ""))
                    {
                        this.CertDominio.Visible = false;
                    }
                    else
                    {
                        this.CertDominioUF.Text = table2.Rows[0]["CertDominioUF"].ToString();
                        this.CertDominioPESOS.Text = table2.Rows[0]["CertDominioPESOS"].ToString();
                    }
                    if ((table2.Rows[0]["EndosoUF"].ToString() == "") || (table2.Rows[0]["EndosoPESOS"].ToString() == ""))
                    {
                        this.Endoso.Visible = false;
                    }
                    else
                    {
                        this.EndosoUF.Text = table2.Rows[0]["EndosoUF"].ToString();
                        this.EndosoPESOS.Text = table2.Rows[0]["EndosoPESOS"].ToString();
                    }
                    if ((table2.Rows[0]["CertDicomUF"].ToString() == "") || (table2.Rows[0]["CertDicomPESOS"].ToString() == ""))
                    {
                        this.CertDicom.Visible = false;
                    }
                    else
                    {
                        this.CertDicomUF.Text = table2.Rows[0]["CertDicomUF"].ToString();
                        this.CertDicomPESOS.Text = table2.Rows[0]["CertDicomPESOS"].ToString();
                    }
                    if ((table2.Rows[0]["AlzamientoEmbargoUF"].ToString() == "") || (table2.Rows[0]["AlzamientoEmbargoPESOS"].ToString() == ""))
                    {
                        this.AlzamientoEmbargo.Visible = false;
                    }
                    else
                    {
                        this.AlzamientoEmbargoUF.Text = table2.Rows[0]["AlzamientoEmbargoUF"].ToString();
                        this.AlzamientoEmbargoPESOS.Text = table2.Rows[0]["AlzamientoEmbargoPESOS"].ToString();
                    }
                    if ((table2.Rows[0]["AlzamientoMedidaPrecautoriaUF"].ToString() == "") || (table2.Rows[0]["AlzamientoMedidaPrecautoriaPESOS"].ToString() == ""))
                    {
                        this.AlzamientoMedidaPrecautoria.Visible = false;
                    }
                    else
                    {
                        this.AlzamientoMedidaPrecautoriaUF.Text = table2.Rows[0]["AlzamientoMedidaPrecautoriaUF"].ToString();
                        this.AlzamientoMedidaPrecautoriaPESOS.Text = table2.Rows[0]["AlzamientoMedidaPrecautoriaPESOS"].ToString();
                    }
                    if ((table2.Rows[0]["AlzamientosHipotecasUF"].ToString() == "") || (table2.Rows[0]["AlzamientosHipotecasPESOS"].ToString() == ""))
                    {
                        this.AlzamientosHipotecas.Visible = false;
                    }
                    else
                    {
                        this.AlzamientosHipotecasUF.Text = table2.Rows[0]["AlzamientosHipotecasUF"].ToString();
                        this.AlzamientosHipotecasPESOS.Text = table2.Rows[0]["AlzamientosHipotecasPESOS"].ToString();
                    }
                    if ((table2.Rows[0]["AlzamientoProhibicionesUF"].ToString() == "") || (table2.Rows[0]["AlzamientoProhibicionesPESOS"].ToString() == ""))
                    {
                        this.AlzamientoProhibiciones.Visible = false;
                    }
                    else
                    {
                        this.AlzamientoProhibicionesUF.Text = table2.Rows[0]["AlzamientoProhibicionesUF"].ToString();
                        this.AlzamientoProhibicionesPESOS.Text = table2.Rows[0]["AlzamientoProhibicionesPESOS"].ToString();
                    }
                    if ((table2.Rows[0]["ReconstitucionEscrituraUF"].ToString() == "") || (table2.Rows[0]["ReconstitucionEscrituraPESOS"].ToString() == ""))
                    {
                        this.ReconstitucionEscritura.Visible = false;
                    }
                    else
                    {
                        this.ReconstitucionEscrituraUF.Text = table2.Rows[0]["ReconstitucionEscrituraUF"].ToString();
                        this.ReconstitucionEscrituraPESOS.Text = table2.Rows[0]["ReconstitucionEscrituraPESOS"].ToString();
                    }
                    if ((table2.Rows[0]["ConformidadAlzamientoUF"].ToString() == "") || (table2.Rows[0]["ConformidadAlzamientoPESOS"].ToString() == ""))
                    {
                        this.ConformidadAlzamiento.Visible = false;
                    }
                    else
                    {
                        this.ConformidadAlzamientoUF.Text = table2.Rows[0]["ConformidadAlzamientoUF"].ToString();
                        this.ConformidadAlzamientoPESOS.Text = table2.Rows[0]["ConformidadAlzamientoPESOS"].ToString();
                    }
                    if ((table2.Rows[0]["EscrituraAdjudicacionUF"].ToString() == "") || (table2.Rows[0]["EscrituraAdjudicacionPESOS"].ToString() == ""))
                    {
                        this.EscrituraAdjudicacion.Visible = false;
                    }
                    else
                    {
                        this.EscrituraAdjudicacionUF.Text = table2.Rows[0]["EscrituraAdjudicacionUF"].ToString();
                        this.EscrituraAdjudicacionPESOS.Text = table2.Rows[0]["EscrituraAdjudicacionPESOS"].ToString();
                    }
                    if ((table2.Rows[0]["TotalUF"].ToString() == "") || (table2.Rows[0]["TotalPESOS"].ToString() == ""))
                    {
                        this.Total.Visible = false;
                    }
                    else
                    {
                        this.TotalUF.Text = table2.Rows[0]["TotalUF"].ToString();
                        this.TotalPESOS.Text = table2.Rows[0]["TotalPESOS"].ToString();
                    }
                    if (table2.Rows[0]["CertGravaProhibiciones"].ToString() == "")
                    {
                        this.CertGravaProhibiciones1.Visible = false;
                    }
                    else
                    {
                        this.CertGravaProhibiciones.Text = table2.Rows[0]["CertGravaProhibiciones"].ToString();
                    }
                    if (table2.Rows[0]["copiaInsDominioVig"].ToString() == "")
                    {
                        this.copiaInsDominioVig1.Visible = false;
                    }
                    else
                    {
                        this.copiaInsDominioVig.Text = table2.Rows[0]["copiaInsDominioVig"].ToString();
                    }
                    if (table2.Rows[0]["CertGravaProhib2"].ToString() == "")
                    {
                        this.CertGravaProhib21.Visible = false;
                    }
                    else
                    {
                        this.CertGravaProhib2.Text = table2.Rows[0]["CertGravaProhib2"].ToString();
                    }
                    if (table2.Rows[0]["CopiaEscrituraAlzamiento"].ToString() == "")
                    {
                        this.CopiaEscrituraAlzamiento1.Visible = false;
                    }
                    else
                    {
                        this.CopiaEscrituraAlzamiento.Text = table2.Rows[0]["CopiaEscrituraAlzamiento"].ToString();
                    }
                    if (table2.Rows[0]["CopiaEscrmutuohipo"].ToString() == "")
                    {
                        this.CopiaEscrmutuohipo1.Visible = false;
                    }
                    else
                    {
                        this.CopiaEscrmutuohipo.Text = table2.Rows[0]["CopiaEscrmutuohipo"].ToString();
                    }
                    if (table2.Rows[0]["FotocopiaEscAlzamiento"].ToString() == "")
                    {
                        this.FotocopiaEscAlzamiento1.Visible = false;
                    }
                    else
                    {
                        this.FotocopiaEscAlzamiento.Text = table2.Rows[0]["FotocopiaEscAlzamiento"].ToString();
                    }
                }
            }
        }
    }
}

