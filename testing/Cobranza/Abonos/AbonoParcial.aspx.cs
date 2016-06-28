namespace CobranzaALC.Cobranza.Abonos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class AbonoParcial : Page
    {
       
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt64(this.txtMontoParcial.Text) <= 0L)
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe ingresar un monto superior a cero');</script>");
                this.txtMontoParcial.Text = "";
            }
            else
            {
                DataTable table2;
                DataTable table = Consulta.ProductoJuicio(this.hiddidcobranza.Value.ToString());
                string str = "";
                string str2 = "";
                if ((table.Rows.Count > 0) && (table != null))
                {
                    str = table.Rows[0]["id_producto"].ToString();
                    str2 = table.Rows[0]["tipocobranza"].ToString();
                }
                if (str2 == "P")
                {
                    table2 = null;
                    table2 = ConsultasEspecificas.ValidaPagoParcial(this.hiddidcobranza.Value.ToString());
                    if ((table2.Rows.Count <= 0) || (table2 == null))
                    {
                        this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No existen letras a cancelar, por lo tanto no se puede abonar parcialmente');</script>");
                        return;
                    }
                }
                if (str2 == "J")
                {
                    switch (str)
                    {
                        case "1":
                            table2 = null;
                            table2 = ConsultasEspecificas.ValidaPagoParcialMutuo(this.hiddidcobranza.Value.ToString());
                            if ((table2.Rows.Count <= 0) || (table2 == null))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No existen letras a cancelar, por lo tanto no se puede abonar parcialmente');</script>");
                                return;
                            }
                            break;

                        case "2":
                            table2 = null;
                            table2 = ConsultasEspecificas.ValidaPagoParcialPagare(this.hiddidcobranza.Value.ToString());
                            if ((table2.Rows.Count <= 0) || (table2 == null))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No existen letras a cancelar, por lo tanto no se puede abonar parcialmente');</script>");
                                return;
                            }
                            break;

                        case "3":
                            table2 = null;
                            table2 = ConsultasEspecificas.ValidaPagoParcialDocujuicio(this.hiddidcobranza.Value.ToString());
                            if ((table2.Rows.Count <= 0) || (table2 == null))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No existen letras a cancelar, por lo tanto no se puede abonar parcialmente');</script>");
                                return;
                            }
                            break;
                    }
                }
                Transaccion.InsertaAbonoParcial(
                    this.hiddidcobranza.Value,
                    "N",
                    ALCSA.FWK.Web.Control.ExtraerValorComoDecimal(txtMontoParcial),
                    Session["Usuario"].ToString());

                string str3 = "AbonoParcial.aspx?Codigo=" + this.hiddidcobranza.Value.ToString();
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Abono parcial ingresado correctamente');location.href='" + str3.ToString() + "';</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string url = "PagoAbono.aspx?Codigo=" + this.hiddidcobranza.Value.ToString().ToString();
            base.Response.Redirect(url);
        }

        private void CargaGrilla(string idcobranza)
        {
            this.grilla.DataSource = Consulta.ListaAbonoParcial(idcobranza);
            this.grilla.DataBind();
        }

        protected void Deshabilitar(object sender, GridViewCommandEventArgs e)
        {
        }

        private string MostrarDatosJuicio(string id_cobranza)
        {
            string str = "";
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDatosCabezeraAbonos(id_cobranza);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtCliente.Text = table.Rows[0]["nomcliente"].ToString();
                this.txtNomDeudor.Text = table.Rows[0]["nomdeudor"].ToString();
                this.txtRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                str = table.Rows[0]["tipocobranza"].ToString();
            }
            return str;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string str = base.Request.QueryString["Codigo"].ToString();
                this.hiddidcobranza.Value = str;
                string str2 = this.MostrarDatosJuicio(str);
                this.CargaGrilla(str);
                this.txtFecha.Text = DateTime.Now.ToString("dd-MM-yyyy");
                DataTable table = Consulta.ListaTotalParcial(str);
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.txtTotalParcial.Text = table.Rows[0]["total"].ToString();
                }
                else
                {
                    this.txtTotalParcial.Text = "0";
                }
                this.txtMontoParcial.Focus();
            }
        }
    }
}