namespace CobranzaALC.Cobranza.mantenedores
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MntParametrosClientes : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }

            if (this.Page.IsPostBack) return;

            this.txttasacorriente.Focus();
            this.ComboClientes();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (this.cbxClientes.SelectedValue.ToString() != "Seleccione")
            {
                if (this.hddProceso.Value == "UPDATE")
                {
                    Transaccion.UpdParametros(
                        this.Session["Usuario"].ToString(), 
                        this.cbxClientes.SelectedValue.ToString(),
                        (ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txttasacorriente) / 100).ToString().Replace(",", "."),
                        (ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txttasaconvencional) / 100).ToString().Replace(",", "."),
                        (ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txttasaadicional) / 100).ToString().Replace(",", "."),
                        (ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txtHonorarios) / 100).ToString().Replace(",", "."),
                        ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txtDescInteres).ToString().Replace(",", "."),
                        ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txtDeschonorarios).ToString().Replace(",", "."),
                        ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txtOtrosDesc).ToString().Replace(",", ".")
                    );
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos actualizados correctamente');</script>");
                }
                else if (this.hddProceso.Value == "INSERT")
                {
                    Transaccion.InsParametros(
                        this.Session["Usuario"].ToString(), 
                        this.cbxClientes.SelectedValue.ToString(),
                        (ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txttasacorriente) / 100).ToString().Replace(",", "."), 
                        (ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txttasaconvencional) / 100).ToString().Replace(",", "."),
                        (ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txttasaadicional) / 100).ToString().Replace(",", "."),
                        (ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txtHonorarios) / 100).ToString().Replace(",", "."),
                        ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txtDescInteres).ToString().Replace(",", "."),
                        ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txtDeschonorarios).ToString().Replace(",", "."),
                        ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(this.txtOtrosDesc).ToString().Replace(",", ".")
                    );
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos ingresados correctamente');</script>");
                    this.hddProceso.Value = "UPDATE";
                }
            }
            else this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Seleccione Cliente');</script>");
        }

        protected void cbxClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.cbxClientes.SelectedValue.ToString() != "Seleccione")
            {
                DataTable table = Consulta.ComboCliente(this.cbxClientes.SelectedValue.ToString());
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.hddProceso.Value = "UPDATE";
                    this.LlenarDatos();
                }
                else
                {
                    this.hddProceso.Value = "INSERT";
                    this.LlenarDatos();
                }
            }
            else
            {
                this.txttasacorriente.Text = "0";
                this.txttasaconvencional.Text = "0";
                this.txttasaadicional.Text = "0";
                this.txtHonorarios.Text = "0";
                this.txtDescInteres.Text = "0";
                this.txtDeschonorarios.Text = "0";
                this.txtOtrosDesc.Text = "0";
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Seleccione Cliente');</script>");
            }
        }

        private void ComboClientes()
        {
            this.cbxClientes.DataTextField = "rsocial";
            this.cbxClientes.DataValueField = "rut_cli";
            this.cbxClientes.DataSource = Consulta.ComboCliente();
            this.cbxClientes.DataBind();
            this.cbxClientes.Items.Insert(0, "Seleccione");
        }

        private void LlenarDatos()
        {
            this.txttasacorriente.Text = "0";
            this.txttasaconvencional.Text = "0";
            this.txttasaadicional.Text = "0";
            this.txtHonorarios.Text = "0";
            this.txtDescInteres.Text = "0";
            this.txtDeschonorarios.Text = "0";
            this.txtOtrosDesc.Text = "0";

            DataTable table = Consulta.TraeParametros(this.cbxClientes.SelectedValue.ToString());
            if (table != null && table.Rows.Count > 0)
            {
                this.txttasacorriente.Text = (Convert.ToDecimal(table.Rows[0]["tasainteres"]) * 100).ToString("N0").Replace(".", string.Empty);
                this.txttasaconvencional.Text = (Convert.ToDecimal(table.Rows[0]["TasaMaxConvencional"]) * 100).ToString("N0").Replace(".", string.Empty);
                this.txttasaadicional.Text = (Convert.ToDecimal(table.Rows[0]["TasaAdicional"]) * 100).ToString("N0").Replace(".", string.Empty);
                this.txtHonorarios.Text = (Convert.ToDecimal(table.Rows[0]["Honorarios"]) * 100).ToString("N0").Replace(".", string.Empty);
                this.txtDescInteres.Text = table.Rows[0]["DescIntereses"].ToString();
                this.txtDeschonorarios.Text = table.Rows[0]["DescHonorarios"].ToString();
                this.txtOtrosDesc.Text = table.Rows[0]["OtrosDescuentos"].ToString();
            }
        }
    }
}

