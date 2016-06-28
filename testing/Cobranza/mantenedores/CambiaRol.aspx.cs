using ALC_FW20.ALCLOCAL;
using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.mantenedores
{
    public partial class CambiaRol : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                string text = base.Request.QueryString["Codigo"].ToString();
                string selectedValue = base.Request.QueryString["tribunal"].ToString();
                string text2 = base.Request.QueryString["rolexhorto"].ToString();
                this.hddid_exhorto.Value = text.ToString();
                this.ComboTribunal();
                this.txtRol.Text = text2;
                this.dtribunal.SelectedValue = selectedValue;
                this.Button2.Visible = true;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string text = this.txtRol.Text.ToString();
            if (string.IsNullOrEmpty(text))
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe ingresar Rol-Exhorto');</script>");
            }
            else
            {
                Consulta.ActualizaRol(this.hddid_exhorto.Value.ToString(), text, this.dtribunal.SelectedValue.ToString());
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos modificados correctamente');</script>");
            }
        }
        private void ComboTribunal()
        {
            this.dtribunal.DataTextField = "descripcion";
            this.dtribunal.DataValueField = "id_tribunal";
            this.dtribunal.DataSource = Consulta.ComboTribunales();
            this.dtribunal.DataBind();
        }
    }
}