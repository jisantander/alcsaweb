namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class SubMenu : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }


            if (!this.Page.IsPostBack)
            {
                DataTable table = Consulta.BuscarUsuariobyUsername(this.Session["Usuario"].ToString());
                if (table != null && table.Rows.Count > 0)
                {
                    this.hddPERFIL.Value = table.Rows[0]["ID_PERFIL"].ToString();
                    //Jbaez: se reasigna un nuevo perfil
                    if (this.hddPERFIL.Value.ToString() == "9")
                        this.hddPERFIL.Value = "8";

                    if (this.hddPERFIL.Value.ToString() == "1")
                    {
                        this.Button1.Enabled = true;
                        this.Button2.Enabled = true;
                        this.Button3.Enabled = true;
                        this.Button4.Enabled = true;
                        this.Button5.Enabled = true;
                        this.Button6.Enabled = true;
                        this.Button7.Enabled = true;
                    }
                    else if (this.hddPERFIL.Value.ToString() == "8")
                    {
                        this.Button1.Enabled = true;
                        this.Button3.Enabled = true;
                        this.Button5.Enabled = true;
                    }
                    else this.pnlBotones.Enabled = false;
                }
                else this.pnlBotones.Enabled = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("BuscaReconstitucion.aspx", false);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("CargaMasiva.aspx", false);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("BuscaAsignacion.aspx", false);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("CargaManual.aspx", false);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("BuscaReasignacion.aspx", false);
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("ExcelBitacoraEstados.aspx", false);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("ExcelGastos.aspx", false);
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("consultagastos.aspx", false);
        }
    }
}

