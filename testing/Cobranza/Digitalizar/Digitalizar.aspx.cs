namespace CobranzaALC.Cobranza.Digitalizar
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.IO;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class Digitalizar : Page
    {
        public GridViewRow gridViewRow = null;

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable table = null;
            string str = "";
            if (!string.IsNullOrEmpty(this.txtRut.Text))
            {
                str = this.txtRut.Text.ToString();
            }
            table = Consulta.BuscarDeudor(str.Replace(".", ""));
            if (table.Rows.Count > 0)
            {
                this.txtNombre.Text = table.Rows[0]["rsocial"].ToString();
                this.filesubir.Enabled = true;
                this.txtFolio.Enabled = true;
                this.Button2.Visible = true;
                this.Button1.Visible = false;
                this.txtRut.ReadOnly = true;
                this.txtRut.BackColor = Color.White;
                this.cliente.Enabled = true;
                this.descripcion.Enabled = true;
                this.CargaGrilla();
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Deudor no existe, debe ingresarlo');</script>");
                this.txtRut.Text = "";
                this.txtRut.Focus();
                this.filesubir.Enabled = false;
                this.Button2.Visible = false;
                this.Button1.Visible = true;
                this.cliente.Enabled = false;
                this.descripcion.Enabled = false;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("digitalizar.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = null;
                table = Transaccion.InsertaDocuDigitalizado(this.txtRut.Text.ToString(), this.txtFolio.Text.ToString(), this.cliente.SelectedValue.ToString(), this.descripcion.SelectedValue.ToString());
                if ((table != null) && (table.Rows.Count > 0))
                {
                    string idDocumento = table.Rows[0][0].ToString();
                    if (this.filesubir.PostedFile.ContentLength > 0)
                    {
                        string nomArchivo = "";
                        string path = base.Server.MapPath(@"~\DIGITALIZADOS");
                        nomArchivo = "DocuDigi" + idDocumento.ToString() + Path.GetExtension(this.filesubir.PostedFile.FileName);
                        string str4 = UTIL.SubirArchivo(this.filesubir, path, nomArchivo);
                        if (!(str4 == "OK"))
                        {
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('" + str4.ToString() + "');</script>");
                        }
                        else if (!string.IsNullOrEmpty(nomArchivo))
                        {
                            Transaccion.UpdateDocumentoDigitalizado(idDocumento, nomArchivo);
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Documento digitalizado exitosamente');</script>");
                            this.CargaGrilla();
                            this.filesubir.Enabled = true;
                            this.Button2.Visible = true;
                            this.Button1.Visible = false;
                            this.cliente.Enabled = true;
                            this.descripcion.Enabled = true;
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
            this.Grilla.DataSource = Consulta.MostrarDocumentosDigitalizados(this.txtRut.Text.ToString());
            this.Grilla.DataBind();
        }

        private void ComboClientes()
        {
            this.cliente.DataTextField = "rsocial";
            this.cliente.DataValueField = "rut_cli";
            this.cliente.DataSource = Consulta.ComboCliente();
            this.cliente.DataBind();
        }

        private void ComboDescripcion()
        {
            this.descripcion.DataTextField = "descripcion";
            this.descripcion.DataValueField = "id_descripcion";
            this.descripcion.DataSource = Consulta.ComboDescripcion();
            this.descripcion.DataBind();
        }

        protected void Deshabilitar(object sender, GridViewCommandEventArgs e)
        {
            this.gridViewRow = ((Control) e.CommandSource).BindingContainer as GridViewRow;
            if (e.CommandName.CompareTo("Deshabilitar") == 0)
            {
                string str = e.CommandName.ToString();
                Transaccion.EliminarDocuDigitalizado(((Label) this.gridViewRow.FindControl("lblCodigo")).Text);
                this.CargaGrilla();
                this.filesubir.Enabled = true;
                this.Button2.Visible = true;
                this.Button1.Visible = false;
                this.filesubir.Focus();
            }
        }

        private void habilitar()
        {
            this.txtRut.BackColor = Color.LightYellow;
            this.filesubir.BackColor = Color.LightYellow;
            this.txtFolio.BackColor = Color.LightYellow;
            this.cliente.BackColor = Color.LightYellow;
            this.descripcion.BackColor = Color.LightYellow;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.txtRut.Focus();
                this.habilitar();
                this.filesubir.Enabled = false;
                this.Button2.Visible = false;
                this.ComboClientes();
                this.ComboDescripcion();
            }
        }
    }
}

