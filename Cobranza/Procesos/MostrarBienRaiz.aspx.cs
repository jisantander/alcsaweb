namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MostrarBienRaiz : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                string str = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "deudor");
                String strbien = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "Datos");

                if (!string.IsNullOrWhiteSpace(strbien))
                {
                    string[] arrParametros = strbien.Split(',');
                    str = arrParametros[0];
                    this.txtRutDeudor.Text = str;
                    this.txtnomDeudor.Text = arrParametros[1];
                }
                else if (Session["snomdeudor"] != null && Session["snomdeudor"].ToString() != "2")
                {
                    this.txtnomDeudor.Text = Session["snomdeudor"].ToString();
                    if (Session["snoperacion"] == null)
                        txtNrooperacion.Text = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "estado");

                    txtRutDeudor.Text = Session["srutdeudor"].ToString();
                    if (string.IsNullOrWhiteSpace(str))
                        str = txtRutDeudor.Text;
                }

                DataTable table = ConsultasEspecificas.ConMostrarBienRaiz_Consulta_Generales(str);
                this.Session["Excel_Bie_Raiz"] = table;
                this.Grilla.DataSource = table;
                this.Grilla.DataBind();

                if (ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "cerrar").Equals(1))
                    btnCerrar.OnClientClick = "window.close();";
            }
        }
    }
}

