namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.IO;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class Digitalizar : Page
    {
        public GridViewRow gridViewRow = null;

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = null;
                table = Transaccion.DigitalizaReconstitucion(this.hddOT.Value.ToString(), "", this.Session["Usuario"].ToString());
                if ((table != null) && (table.Rows.Count > 0))
                {
                    string idDocumento = table.Rows[0][0].ToString();
                    if (this.filesubir.PostedFile.ContentLength > 0)
                    {
                        string nomArchivo = "";
                        string path = base.Server.MapPath(@"~\DIGITALIZADOS");
                        nomArchivo = "DigiReconstitucion" + idDocumento.ToString() + Path.GetExtension(this.filesubir.PostedFile.FileName);
                        string str4 = UTIL.SubirArchivo(this.filesubir, path, nomArchivo);
                        if (!(str4 == "OK"))
                        {
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('" + str4.ToString() + "');</script>");
                        }
                        else if (!string.IsNullOrEmpty(nomArchivo))
                        {
                            Transaccion.UpdateDigitalizadoReconstitucion(idDocumento, nomArchivo);
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Documento digitalizado exitosamente');</script>");
                            this.CargaGrilla();
                            this.filesubir.Focus();
                        }
                    }
                }
            }
            catch (Exception)
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Revise bien la informaci\x00f3n e intentelo de nuevo');</script>");
            }
        }

        private void CargaGrilla()
        {
            this.Grilla.DataSource = Consulta.MostrarDigitalizadosReconstitucion(this.hddOT.Value.ToString());
            this.Grilla.DataBind();
        }

        protected void Deshabilitar(object sender, GridViewCommandEventArgs e)
        {
            this.gridViewRow = ((Control) e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Deshabilitar") == 0)
            {
                string str = e.CommandName.ToString();
                Transaccion.EliminarDocuDigitalizado(((Label) this.gridViewRow.FindControl("lblCodigo")).Text);
                this.filesubir.Enabled = true;
                this.Button2.Visible = true;
                this.filesubir.Focus();
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
                this.filesubir.Enabled = true;
                string str = base.Request.QueryString["OT"].ToString();
                this.hddOT.Value = str;
                this.CargaGrilla();
            }
        }
    }
}

