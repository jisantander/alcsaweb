using ALCGLOBAL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC
{
    public partial class Acceso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtUsuario.Focus();
            if (!Page.IsPostBack)
                hdfCodigoBarra.Value = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "codigo");

            if (Session["Usuario"] != null && Session["Perfil"] != null)
                Response.Redirect(string.Format("Indice.aspx?codigo={0}", hdfCodigoBarra.Value), true);
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtUsuario.Text))
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Ingrese el nombre de usuario.');</script>");
                return;
            }
            if (string.IsNullOrEmpty(this.txtPassword.Text))
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Ingrese la contraseña.');</script>");
                return;
            }

            DataTable dataTable = new BaseDatos().getResultset(string.Concat(new string[]
			{
				"select username,id_perfil,rut_usu from usuarios where rtrim(ltrim(username)) = '",
				txtUsuario.Text.Trim(),
				"' and rtrim(ltrim(password)) = '",
				txtPassword.Text.Trim(),
				"'"
			}));

            if (dataTable != null)
            {
                if (dataTable.Rows.Count > 0)
                {
                    this.Session["Usuario"] = txtUsuario.Text.Trim();
                    this.Session["Perfil"] = dataTable.Rows[0]["id_perfil"].ToString();
                    this.Session["RutUsuario"] = dataTable.Rows[0]["rut_usu"].ToString();
                    Response.Redirect(string.Format("Indice.aspx?codigo={0}", hdfCodigoBarra.Value), true);
                }
                else this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Usuario no registrado en nuestra Base de Datos');</script>");
            }
        }
    }
}