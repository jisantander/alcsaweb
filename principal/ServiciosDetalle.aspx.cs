using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.principal
{
    public partial class ServiciosDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string a = base.Request.QueryString["p"].ToString();
            if (a == "uno")
            {
                this.Panel1.Visible = true;
                this.titulo.Text = "Gestoría de Documentos";
            }
            if (a == "dos")
            {
                this.Panel2.Visible = true;
                this.titulo.Text = "Reconstitución de Títulos Masivos";
            }
            if (a == "tres")
            {
                this.Panel3.Visible = true;
                this.titulo.Text = "Alzamientos Masivos";
            }
            if (a == "cuatro")
            {
                this.Panel4.Visible = true;
                this.titulo.Text = "Arqueo y Verificaciones";
            }
            if (a == "cinco")
            {
                this.Panel5.Visible = true;
                this.titulo.Text = "Estudio de Títulos";
            }
            if (a == "seis")
            {
                this.Panel6.Visible = true;
                this.titulo.Text = "Auditorias y Capacitación";
            }
            if (a == "siste")
            {
                this.Panel7.Visible = true;
                this.titulo.Text = "Soluciones en Cobranza";
            }
        }
        protected void Home_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("Menu.aspx");
        }
    }
}