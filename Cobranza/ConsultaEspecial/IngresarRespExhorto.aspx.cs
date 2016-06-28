using ALC_FW20.ALCLOCAL;
using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    public partial class IngresarRespExhorto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["Usuario"] == null || this.Session["Usuario"].ToString() == "")
            {
                base.Response.Write("<script>alert('Por seguridad expiro la página');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (this.Page.IsPostBack) return;

            if (Session["Perfil"].ToString() == "1")
            {
                this.txtRol.Text = base.Request.QueryString["rol"].ToString();
                this.hddIdExhorto.Value = base.Request.QueryString["Codigo"].ToString();
                this.lab_Rut_Deudor.Text = base.Request.QueryString["RutDeudor"].ToString();
                this.lab_Tribunal.Text = base.Request.QueryString["Tribunal"].ToString();
                this.lab_Id_Tribunal.Text = base.Request.QueryString["id_tribunal"].ToString();
                this.ComboProcuradores();
            }
            else this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No tiene permiso para asignar responsable');window.location.href='ConsultaExhorto.aspx';</script>");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("ConsultaExhorto.aspx?RutDeudor=" + this.lab_Rut_Deudor.Text + "&Tribunal=" + this.lab_Tribunal.Text + "&id_tribunal=" + this.lab_Id_Tribunal.Text);            
        }

        private void ComboProcuradores()
        {
            this.cbxResponsable.DataTextField = "nombres";
            this.cbxResponsable.DataValueField = "rut";
            this.cbxResponsable.DataSource = Consulta.ComboProcurador();
            this.cbxResponsable.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Consulta.UpdateResponsableExhorto(this.cbxResponsable.SelectedValue.ToString(), this.hddIdExhorto.Value.ToString(), this.Session["Usuario"].ToString());
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Responsable Asignado satisfactoriamente');</script>");
        }
    }
}