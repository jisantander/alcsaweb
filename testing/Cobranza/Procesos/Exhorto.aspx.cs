namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using ALCSA.Negocio.Documentos.Fisicos;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Drawing;
    using System.IO;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class Exhorto : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string str = base.Request.QueryString["Codigo"].ToString();
                this.hiddidjuicio.Value = str;
                this.MostrarDatosJuicioActividad(str);
                this.txtFechaingreso.Text = DateTime.Now.ToString("dd-MM-yyyy");
                this.LlenarComboComunas();
                this.ComboReceptor();
                this.ComboTipoExhorto();
                this.ComboJurisdiccion();
                this.juris.SelectedIndex = 6;
                this.ComboTribunalesExhorto("7");
                this.ComboProcurador();
                this.habilitar();
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
            base.Response.Redirect("BuscaCobranzaExhortos.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            DataTable table = ConsultasEspecificas.BuscarExhortoDupli(this.hiddidjuicio.Value.ToString(), this.tribunalexhorto.SelectedValue.ToString(), this.txtRolExhorto.Text);
            if (table != null && table.Rows.Count > 0)
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Exhorto ya est\x00e1 registrado');</script>");
                this.tipoexhorto.Focus();
            }
            else
            {
                int intIdExhorto = Transaccion.InsertaExhorto(
                    this.hiddidjuicio.Value.ToString(), 
                    this.tribunalexhorto.SelectedValue, 
                    this.procurador.SelectedValue, 
                    this.tipoexhorto.SelectedValue, 
                    this.receptor.SelectedValue, 
                    this.txtFechaingreso.Text, 
                    this.txtRolExhorto.Text, 
                    this.juris.SelectedValue.ToString(),
                    Convert.ToInt32(ddlComunas.SelectedValue)
                );

                if (intIdExhorto > 0)
                {
                    int intIdDocumento = 0;

                    if (filesubir.HasFile)
                    {
                        ALCSA.Negocio.Documentos.Fisicos.Documento objDocumentoFisico = new ALCSA.Negocio.Documentos.Fisicos.Documento()
                        {
                            Nombre = this.filesubir.PostedFile.FileName,
                            Descripcion = string.Empty,
                            CodigoTipoDocumento = TipoDocumento.TIPO_DOCUMENTO_ESTANDAR_1,
                            FechaIngreso = DateTime.Now,
                            IdTipoDocumento = 0,
                            Peso = this.filesubir.PostedFile.ContentLength,
                            Archivo = this.filesubir.FileBytes
                        };
                        objDocumentoFisico.Insertar(new List<ALCSA.Entidades.Documentos.Fisicos.Identificador>() { 
                            new ALCSA.Negocio.Documentos.Fisicos.Identificador()
                            {
                                CodigoTipoIdentificador = TipoIdentificador.TIPO_IDENTIFICADOR_EXHORTO,
                                Valor = intIdExhorto.ToString()
                            },
                            new ALCSA.Negocio.Documentos.Fisicos.Identificador()
                            {
                                CodigoTipoIdentificador = TipoIdentificador.TIPO_IDENTIFICADOR_JUICIO,
                                Valor = hiddidjuicio.Value
                            }
                        });

                        intIdDocumento = objDocumentoFisico.ID;
                    }

                    this.Page.RegisterClientScriptBlock("Mensaje", string.Format("<script>location.href='BuscaCobranzaExhortos.aspx?mensaje=1&id_doc={0}';</script>", intIdDocumento));

                    /*
                    string idexhorto = intIdExhorto.ToString();
                    string nomArchivo = "";
                    string path = base.Server.MapPath(@"~\DOCUMENTOS");
                    nomArchivo = "DocExhorto" + idexhorto.ToString() + Path.GetExtension(this.filesubir.PostedFile.FileName);
                    string str4 = UTIL.SubirArchivo(this.filesubir, path, nomArchivo);
                    if (!(str4 == "OK"))
                    {
                        this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('" + str4.ToString() + "');</script>");
                    }
                    else if (!string.IsNullOrEmpty(nomArchivo))
                    {
                        Transaccion.UpdateDocumentoExhorto(idexhorto, nomArchivo);
                        
                    }
                    */
                }
            }
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
            this.procurador.DataTextField = "nombres";
            this.procurador.DataValueField = "rut";
            this.procurador.DataSource = Consulta.ComboProcurador();
            this.procurador.DataBind();
        }

        private void ComboReceptor()
        {
            this.receptor.DataTextField = "nombres";
            this.receptor.DataValueField = "rut_receptor";
            this.receptor.DataSource = Consulta.ComboReceptor();
            this.receptor.DataBind();
        }

        private void ComboTipoExhorto()
        {
            this.tipoexhorto.DataTextField = "descripcion";
            this.tipoexhorto.DataValueField = "id_tipoexhorto";
            this.tipoexhorto.DataSource = Consulta.ComboTipoExhorto();
            this.tipoexhorto.DataBind();
        }

        private void ComboTribunalesExhorto(string id_jurisdiccion)
        {
            this.tribunalexhorto.DataTextField = "descripcion";
            this.tribunalexhorto.DataValueField = "id_tribunal";
            this.tribunalexhorto.DataSource = Consulta.ComboTribunales(id_jurisdiccion);
            this.tribunalexhorto.DataBind();
        }

        private void LlenarComboComunas()
        {
            ddlComunas.DataSource = Consulta.ComboComunaGeneral();
            ddlComunas.DataBind();
            ddlComunas.Items.Insert(0, new ListItem("Seleccione una comuna", "0"));
        }

        public void habilitar()
        {
            this.filesubir.BackColor = Color.LightYellow;
            this.tipoexhorto.BackColor = Color.LightYellow;
            this.txtRolExhorto.BackColor = Color.LightYellow;
            this.tribunalexhorto.BackColor = Color.LightYellow;
            this.txtFechaingreso.BackColor = Color.LightYellow;
            this.procurador.BackColor = Color.LightYellow;
            this.receptor.BackColor = Color.LightYellow;
            this.juris.BackColor = Color.LightYellow;
        }

        protected void juris_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ComboTribunalesExhorto(this.juris.SelectedValue.ToString());
        }

        private void MostrarDatosJuicioActividad(string id_juicio)
        {
            DataTable table = ConsultasEspecificas.MostrarDatosCabezeraExhorto(id_juicio);
            if (table != null && table.Rows.Count > 0)
            {
                this.txtNroOperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                this.txtCliente.Text = table.Rows[0]["nomcliente"].ToString();
                this.txtRutDeudor.Text = table.Rows[0]["rut_deudor"].ToString();
                this.txtNomDeudor.Text = table.Rows[0]["nomdeudor"].ToString();
                this.txtRol.Text = table.Rows[0]["rol"].ToString();
                this.txtTribunal.Text = table.Rows[0]["tribunal"].ToString();
                this.txtProducto.Text = table.Rows[0]["producto"].ToString();
            }
        }
    }
}

