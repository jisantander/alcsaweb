namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.IO;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;
    using System.Globalization;
    using ALCSA.Negocio.Documentos.Fisicos;
    using System.Collections.Generic;

    public partial class Juicio : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string str = base.Request.QueryString["Codigo"].ToString();
                this.hiddidcobranza.Value = str;
                this.MostrarDatosJuicio(str);
                this.txtFechaIngCorte.Text = DateTime.Now.ToString("dd-MM-yyyy");
                this.habilitar();
                this.ComboAbogados();
                this.ComboProcurador();
                this.ComboJurisdiccion();
                this.juris.SelectedIndex = 6;
                this.ComboTribunal("7");
                CargarRiesgos();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("buscacobranza.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            DataTable table = null;
            table = Consulta.BuscarJuicio(this.hiddidcobranza.Value.ToString());
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Cobranza ya tiene juicio asociado');</script>");
                this.txtRol.Focus();
                return;
            }

            DateTime datFechaCorte = new DateTime(1900, 1, 1), datFechaRiesgo = new DateTime(1900, 1, 1);

            if (!string.IsNullOrEmpty(txtFechaIngCorte.Text))
                DateTime.TryParseExact(txtFechaIngCorte.Text.Replace("-", "/"), "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out datFechaCorte);

            if (!string.IsNullOrEmpty(txtFechaRiesgo.Text))
                DateTime.TryParseExact(txtFechaRiesgo.Text.Replace("-", "/"), "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out datFechaRiesgo);

            DataTable table2 = Transaccion.InsertaJuicio(
                this.hiddidcobranza.Value,
                this.Tribunal.SelectedValue,
                this.Abogado.SelectedValue,
                this.Procurador.SelectedValue,
                this.txtRol.Text,
                datFechaCorte,
                this.juris.SelectedValue,
                Convert.ToInt32(ddlRiesgo.SelectedValue),
                datFechaRiesgo
            );

            if (table2 != null && table2.Rows.Count > 0)
            {
                /*string idjuicio = table2.Rows[0][0].ToString();
                string nomArchivo = "";
                string path = base.Server.MapPath(@"~\DOCUMENTOS");
                nomArchivo = "DocJuicio" + idjuicio.ToString() + Path.GetExtension(this.filesubir.PostedFile.FileName);
                string str4 = filesubir.HasFile ? UTIL.SubirArchivo(this.filesubir, path, nomArchivo) : "OK";*/

                int intIdDocumento = 0;
                int intIdJuicio = Convert.ToInt32(table2.Rows[0][0]);

                if (filesubir.HasFile)
                {
                    ALCSA.Negocio.Documentos.Fisicos.Documento objDocumentoFisico = new ALCSA.Negocio.Documentos.Fisicos.Documento()
                    {
                        Nombre = this.filesubir.PostedFile.FileName,
                        Descripcion = string.Empty,
                        CodigoTipoDocumento = TipoDocumento.TIPO_DOCUMENTO_JUICIO,
                        FechaIngreso = DateTime.Now,
                        IdTipoDocumento = 0,
                        Peso = this.filesubir.PostedFile.ContentLength,
                        Archivo = this.filesubir.FileBytes
                    };
                    objDocumentoFisico.Insertar(new List<ALCSA.Entidades.Documentos.Fisicos.Identificador>() { 
                    new ALCSA.Negocio.Documentos.Fisicos.Identificador()
                    {
                        CodigoTipoIdentificador = TipoIdentificador.TIPO_IDENTIFICADOR_COBRANZA,
                        Valor = hiddidcobranza.Value
                    },
                    new ALCSA.Negocio.Documentos.Fisicos.Identificador()
                    {
                        CodigoTipoIdentificador = TipoIdentificador.TIPO_IDENTIFICADOR_JUICIO,
                        Valor = intIdJuicio.ToString()
                    }
                });

                    intIdDocumento = objDocumentoFisico.ID;
                }

                /*if (str4 != "OK")
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('" + str4.ToString() + "');</script>");
                else if (!string.IsNullOrEmpty(nomArchivo))
                    Transaccion.UpdateDocumentoJuicio(idjuicio, nomArchivo);*/

                this.Page.RegisterClientScriptBlock("Mensaje",
                    string.Format("<script>alert('Datos guardados correctamente');location.href='ActividadCobranza.aspx?Codigo={0}&idCobranza={1}&termino=N&id_doc={2}';</script>", intIdJuicio, hiddidcobranza.Value, intIdDocumento)
                );
            }
        }

        private void ComboAbogados()
        {
            this.Abogado.DataTextField = "nombres";
            this.Abogado.DataValueField = "rut";
            this.Abogado.DataSource = Consulta.ComboAbogados();
            this.Abogado.DataBind();
            this.Abogado.SelectedIndex = 1;
        }

        private void ComboJurisdiccion()
        {
            this.juris.DataTextField = "descripcion";
            this.juris.DataValueField = "id_jurisdiccion";
            this.juris.DataSource = Consulta.ComboJurisdiccion();
            this.juris.DataBind();
        }

        private void ComboProcurador()
        {
            this.Procurador.DataTextField = "nombres";
            this.Procurador.DataValueField = "rut";
            this.Procurador.DataSource = Consulta.ComboProcurador();
            this.Procurador.DataBind();
        }

        private void ComboTribunal(string id_jurisdiccion)
        {
            this.Tribunal.DataTextField = "descripcion";
            this.Tribunal.DataValueField = "id_tribunal";
            this.Tribunal.DataSource = Consulta.ComboTribunales(id_jurisdiccion);
            this.Tribunal.DataBind();
        }

        public void habilitar()
        {
            this.filesubir.BackColor = Color.LightYellow;
            this.txtRol.BackColor = Color.LightYellow;
            this.Tribunal.BackColor = Color.LightYellow;
            this.txtFechaIngCorte.BackColor = Color.LightYellow;
            this.Procurador.BackColor = Color.LightYellow;
            this.Abogado.BackColor = Color.LightYellow;
            this.juris.BackColor = Color.LightYellow;
        }

        protected void juris_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ComboTribunal(this.juris.SelectedValue.ToString());
        }

        private void MostrarDatosJuicio(string id_cobranza)
        {
            DataTable table = null;
            table = ConsultasEspecificas.MostrarDatosJuicio(id_cobranza);
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtCliente.Text = table.Rows[0]["cliente"].ToString();
                this.txtNomDeudor.Text = table.Rows[0]["deudor"].ToString();
                this.txtRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                this.txtProcedimiento.Text = table.Rows[0]["procedimiento"].ToString().ToUpper();
                this.txtMateria.Text = table.Rows[0]["materia"].ToString().ToUpper();
                this.txtProducto.Text = table.Rows[0]["producto"].ToString().ToUpper();
            }
        }

        private void CargarRiesgos()
        {
            ddlRiesgo.DataSource = new ALCSA.Negocio.Juicios.Riesgo().Listar();
            ddlRiesgo.DataBind();
            ddlRiesgo.Items.Insert(0, new ListItem("Sin Riesgo", "0"));
        }
    }
}

