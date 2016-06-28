namespace CobranzaALC.Cobranza.mantenedores
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;
    using System.IO;

    public partial class MntBienRaiz : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack) return;

            this.CargaRegiComunaDefecto();
            this.txtRut.BackColor = Color.LightYellow;
            this.txtRut.Focus();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable table = Consulta.BuscarDeudor(this.txtRut.Text.Replace(".", ""));
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.txtRut.ReadOnly = true;
                    DataTable table2 = null;
                    table2 = this.ComboDomicilios(this.txtRut.Text.Replace(".", ""));
                    if (table2 != null)
                    {
                        this.vistaregion.Text = table2.Rows[0]["nomregion"].ToString();
                        this.vistacomuna.Text = table2.Rows[0]["nomcomuna"].ToString();
                        if (table.Rows[0]["DicomBienRaiz"].ToString() == "1")
                        {
                            Cbx_SinBienes.Checked = true;

                            if (!domicilio.SelectedItem.Value.Contains("No se ubican nuevos bienes"))
                                domicilio.Items.Insert(0, "No se ubican nuevos bienes");
                            if (!String.IsNullOrEmpty(table.Rows[0]["FechaDicomBienRaiz"].ToString()))
                                ALCSA.FWK.Web.Control.AsignarValor(txt_FechaActual, Convert.ToDateTime(table.Rows[0]["FechaDicomBienRaiz"]));
                            else txt_FechaActual.Text = "";
                        }
                        else
                        {
                            Cbx_SinBienes.Checked = false;
                            txt_FechaActual.Text = "";
                        }

                        this.txtRut.ReadOnly = true;
                        this.txtRut.BackColor = Color.White;
                        this.habilitar();
                        this.btnBuscar.Visible = false;
                        btnGuardar_Bienes.Visible = false;
                        this.btnGuardar.Visible = true;
                        this.txtFojaInsc.Focus();
                    }
                    else
                    {
                        this.txtRut.ReadOnly = false;
                        this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Deudor no registrada Domicilios');</script>");
                        this.txtRut.Focus();
                    }
                }
                else
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Deudor no registrado');</script>");
                    this.txtRut.Focus();
                }
            }
            catch (Exception exception)
            {
                string str = exception.Message.ToString();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Deshabilitar();
            this.Cancela();
            this.CargaRegiComunaDefecto();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string domicilioSeleccionado = this.domicilio.SelectedValue;

                if ("No se ubican nuevos bienes".Equals(domicilioSeleccionado))
                    domicilioSeleccionado = "0";

                if (Consulta.BuscaBienRaizDuplicado(domicilioSeleccionado, this.txtRut.Text) == null)
                {
                    //Jbaez:subir documento                

                    if (this.filesubir.PostedFile.ContentLength > 0)
                    {
                        string nomArchivo = "";
                        string strRutCliente = null;
                        string path = base.Server.MapPath(@"~\DIGITALIZADOS");
                        nomArchivo = this.filesubir.PostedFile.FileName;// +Path.GetExtension(this.filesubir.PostedFile.FileName);
                        string str4 = UTIL.SubirArchivo(this.filesubir, path, nomArchivo);
                        if (!(str4 == "OK"))
                        {
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('" + str4.ToString() + "');</script>");
                        }
                        else if (!string.IsNullOrEmpty(nomArchivo))
                        {
                            DataTable tabla = new DataTable();

                            tabla = Consulta.InformeBienesRaicesDeudor(null, txtRut.Text);
                            if (tabla.Rows.Count > 0)
                            {
                                strRutCliente = tabla.Rows[0]["RutCliente"].ToString();
                            }
                            else { strRutCliente = "ALCSA"; }
                            Transaccion.InsertaDocBienesDigitalizado(txtRut.Text, nomArchivo, txtFojaInsc.Text, strRutCliente, "64");
                            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Documento digitalizado exitosamente');</script>");

                            this.filesubir.Focus();
                        }
                    }

                    if (!"0".Equals(domicilioSeleccionado))
                        Transaccion.InsertaBienRaiz(this.txtRut.Text.Replace(".", ""), this.txtFojaInsc.Text, this.txtNroInsc.Text, this.txtAnioInsc.Text, this.txtFoja1hip.Text, this.txtNro1hip.Text, this.txtanio1hip.Text, this.txtFoj2hip.Text, this.txtNro2hip.Text, this.txtAnio2hip.Text, this.txtfojaproh1.Text, this.txtNroProh1.Text, this.txtAnioProh1.Text, this.txtFojaProh2.Text, this.txtNroProh2.Text, this.txtAnioProh2.Text, this.regioncbr.SelectedValue, this.comunacbr.SelectedValue, this.conservador.SelectedValue, this.regionnotaria.SelectedValue, this.comunanotaria.SelectedValue, this.notaria.SelectedValue, this.txtRolAvaluo.Text, this.txtFechaEscritura.Text, this.vigencia.SelectedValue, this.fuente.SelectedValue, this.Limitaciones.SelectedValue, this.domicilio.SelectedValue, this.tipofojainsc.SelectedValue, this.tipofojahip1.SelectedValue, this.tipofojahip2.SelectedValue, this.tipofojaproh1.SelectedValue, this.tipofojaproh2.SelectedValue);

                    Transaccion.ActualizarDeudorDicomBienRaiz(
                        this.txtRut.Text.Replace(".", ""), 
                        Cbx_SinBienes.Checked ? "1" : "0",
                        ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txt_FechaActual).ToString("yyyyMMdd"));

                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");
                    this.Deshabilitar();
                    this.Cancela();
                    this.CargaRegiComunaDefecto();


                }
                else
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Bien Raiz ya se encuentra registrado');</script>");
                    this.txtFojaInsc.Focus();
                }

            }
            catch (Exception)
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Revise bien la informaci\x00f3n e intentelo de nuevo');</script>");
            }

        }

        public void Cancela()
        {
            this.txtRut.Text = "";
            this.txtFojaInsc.Text = "";
            this.txtNroInsc.Text = "";
            this.txtAnioInsc.Text = "";
            this.txtAnioInsc.Text = "";
            this.txtNro1hip.Text = "";
            this.txtanio1hip.Text = "";
            this.txtFoj2hip.Text = "";
            this.txtNro2hip.Text = "";
            this.txtAnio2hip.Text = "";
            this.txtfojaproh1.Text = "";
            this.txtNroProh1.Text = "";
            this.txtAnioProh1.Text = "";
            this.txtFojaProh2.Text = "";
            this.txtNroProh2.Text = "";
            this.txtAnioProh2.Text = "";
            this.txtFoja1hip.Text = "";
            this.txtRolAvaluo.Text = "";
            this.txtFechaEscritura.Text = "";
            this.txtMontoavaluo.Text = "";
            this.tipofojainsc.SelectedIndex = 0;
            this.tipofojahip1.SelectedIndex = 0;
            this.tipofojahip2.SelectedIndex = 0;
            this.tipofojaproh1.SelectedIndex = 0;
            this.tipofojaproh2.SelectedIndex = 0;
            this.txtRut.ReadOnly = false;
            this.domicilio.Items.Clear();
            this.conservador.Items.Clear();
            this.btnGuardar.Visible = false;
            this.btnBuscar.Visible = true;
            this.txtRut.BackColor = Color.LightYellow;
            this.txtRut.Focus();
        }

        private void CargarComunasCBR(string idRegion)
        {
            DataTable table = null;
            table = Consulta.BuscaComunasCBR(idRegion);
            if (table.Rows.Count > 0)
            {
                this.comunacbr.DataTextField = "descripcion";
                this.comunacbr.DataValueField = "id_comuna_con";
                this.comunacbr.DataSource = table;
                this.comunacbr.DataBind();
            }
            else
            {
                this.comunacbr.Items.Clear();
                this.conservador.Items.Clear();
            }
        }

        private void CargarComunasNotaria(string idRegion)
        {
            DataTable table = null;
            table = Consulta.BuscaComunasNotaria(idRegion);
            if (table.Rows.Count > 0)
            {
                this.comunanotaria.DataTextField = "descripcion";
                this.comunanotaria.DataValueField = "id_comuna_notaria";
                this.comunanotaria.DataSource = table;
                this.comunanotaria.DataBind();
            }
            else
            {
                this.comunanotaria.Items.Clear();
                this.notaria.Items.Clear();
            }
        }

        private void CargarConservador(string idComuna)
        {
            DataTable table = null;
            table = Consulta.BuscaConservadores(idComuna);
            if (table.Rows.Count > 0)
            {
                this.conservador.DataTextField = "nombre";
                this.conservador.DataValueField = "id_conservador";
                this.conservador.DataSource = table;
                this.conservador.DataBind();
            }
        }

        private void CargaRegiComunaDefecto()
        {
            this.CargarRegiones();
            this.regioncbr.SelectedValue = "13";
            this.regionnotaria.SelectedValue = "13";
            this.CargarComunasCBR("13");
            this.comunacbr.SelectedValue = "7";
            this.CargarComunasNotaria("13");
            this.comunanotaria.SelectedValue = "1";
            this.CargarConservador("7");
            this.CargarNotarias("1");
        }

        private void CargarNotarias(string idComuna)
        {
            DataTable table = null;
            table = Consulta.BuscaNotarias(idComuna);
            if (table.Rows.Count > 0)
            {
                this.notaria.DataTextField = "nombre";
                this.notaria.DataValueField = "id_notaria";
                this.notaria.DataSource = table;
                this.notaria.DataBind();
            }
            else
            {
                this.notaria.Items.Clear();
            }
        }

        private void CargarRegiones()
        {
            this.regioncbr.DataTextField = "descripcion";
            this.regioncbr.DataValueField = "id_regiones";
            this.regioncbr.DataSource = Consulta.BuscaRegiones();
            this.regioncbr.DataBind();
            this.regionnotaria.DataTextField = "descripcion";
            this.regionnotaria.DataValueField = "id_regiones";
            this.regionnotaria.DataSource = Consulta.BuscaRegiones();
            this.regionnotaria.DataBind();
        }

        private DataTable ComboDomicilios(string RutDeudor)
        {
            DataTable table = null;
            table = Consulta.ComboDomicilios(RutDeudor);
            if (table.Rows.Count > 0)
            {
                this.domicilio.DataTextField = "Domicilio";
                this.domicilio.DataValueField = "id_domicilio";
                this.domicilio.DataSource = table;
                this.domicilio.DataBind();
                return table;
            }
            return null;
        }

        protected void comunacbr_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Cbx_SinBienes.Checked == false)
            {
                this.CargarConservador(this.comunacbr.SelectedValue);
            }
        }

        protected void comunanotaria_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Cbx_SinBienes.Checked == false)
            {
                this.CargarNotarias(this.comunanotaria.SelectedValue.ToString());
            }
        }

        public void Deshabilitar()
        {
            this.PnlPrincipal.Enabled = false;
            this.txtFojaInsc.BackColor = Color.White;
            this.txtNroInsc.BackColor = Color.White;
            this.txtAnioInsc.BackColor = Color.White;
            this.txtAnioInsc.BackColor = Color.White;
            this.txtNro1hip.BackColor = Color.White;
            this.txtanio1hip.BackColor = Color.White;
            this.txtFoj2hip.BackColor = Color.White;
            this.txtNro2hip.BackColor = Color.White;
            this.txtAnio2hip.BackColor = Color.White;
            this.txtfojaproh1.BackColor = Color.White;
            this.txtNroProh1.BackColor = Color.White;
            this.txtAnioProh1.BackColor = Color.White;
            this.txtFojaProh2.BackColor = Color.White;
            this.txtNroProh2.BackColor = Color.White;
            this.txtAnioProh2.BackColor = Color.White;
            this.txtFoja1hip.BackColor = Color.White;
            this.txtRolAvaluo.BackColor = Color.White;
            this.txtFechaEscritura.BackColor = Color.White;
            this.txtMontoavaluo.BackColor = Color.White;
            this.tipofojainsc.BackColor = Color.White;
            this.tipofojahip1.BackColor = Color.White;
            this.tipofojahip2.BackColor = Color.White;
            this.tipofojaproh1.BackColor = Color.White;
            this.tipofojaproh2.BackColor = Color.White;
            this.vigencia.BackColor = Color.White;
            this.fuente.BackColor = Color.White;
            this.Limitaciones.BackColor = Color.White;
            this.domicilio.BackColor = Color.White;
            this.regioncbr.BackColor = Color.White;
            this.comunacbr.BackColor = Color.White;
            this.conservador.BackColor = Color.White;
            this.regionnotaria.BackColor = Color.White;
            this.comunanotaria.BackColor = Color.White;
            this.notaria.BackColor = Color.White;
        }

        protected void domicilio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Cbx_SinBienes.Checked == false)
            {
                DataTable table = null;

                string domicilioSeleccionado = this.domicilio.SelectedValue;

                if ("No se ubican nuevos bienes".Equals(domicilioSeleccionado))
                    domicilioSeleccionado = "0";

                table = Consulta.ComboDomicilios(this.txtRut.Text.Replace(".", ""), domicilioSeleccionado);
                if (table != null && table.Rows.Count > 0)
                {
                    this.vistaregion.Text = table.Rows[0]["nomregion"].ToString();
                    this.vistacomuna.Text = table.Rows[0]["nomcomuna"].ToString();
                }
            }
        }

        public void habilitar()
        {
            this.PnlPrincipal.Enabled = true;
            this.txtFojaInsc.BackColor = Color.LightYellow;
            this.txtNroInsc.BackColor = Color.LightYellow;
            this.txtAnioInsc.BackColor = Color.LightYellow;
            this.txtAnioInsc.BackColor = Color.LightYellow;
            this.txtNro1hip.BackColor = Color.LightYellow;
            this.txtanio1hip.BackColor = Color.LightYellow;
            this.txtFoj2hip.BackColor = Color.LightYellow;
            this.txtNro2hip.BackColor = Color.LightYellow;
            this.txtAnio2hip.BackColor = Color.LightYellow;
            this.txtfojaproh1.BackColor = Color.LightYellow;
            this.txtNroProh1.BackColor = Color.LightYellow;
            this.txtAnioProh1.BackColor = Color.LightYellow;
            this.txtFojaProh2.BackColor = Color.LightYellow;
            this.txtNroProh2.BackColor = Color.LightYellow;
            this.txtAnioProh2.BackColor = Color.LightYellow;
            this.txtFoja1hip.BackColor = Color.LightYellow;
            this.txtRolAvaluo.BackColor = Color.LightYellow;
            this.txtFechaEscritura.BackColor = Color.LightYellow;
            this.txtMontoavaluo.BackColor = Color.LightYellow;
            this.vigencia.BackColor = Color.LightYellow;
            this.fuente.BackColor = Color.LightYellow;
            this.Limitaciones.BackColor = Color.LightYellow;
            this.tipofojainsc.BackColor = Color.LightYellow;
            this.tipofojahip1.BackColor = Color.LightYellow;
            this.tipofojahip2.BackColor = Color.LightYellow;
            this.tipofojaproh1.BackColor = Color.LightYellow;
            this.tipofojaproh2.BackColor = Color.LightYellow;
            this.domicilio.BackColor = Color.LightYellow;
            this.regioncbr.BackColor = Color.LightYellow;
            this.comunacbr.BackColor = Color.LightYellow;
            this.conservador.BackColor = Color.LightYellow;
            this.regionnotaria.BackColor = Color.LightYellow;
            this.comunanotaria.BackColor = Color.LightYellow;
            this.notaria.BackColor = Color.LightYellow;
        }

        protected void regioncbr_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Cbx_SinBienes.Checked == false)
            {
                this.CargarComunasCBR(this.regioncbr.SelectedValue);
            }
        }

        protected void regionnotaria_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Cbx_SinBienes.Checked == false)
            {
                this.CargarComunasNotaria(this.regionnotaria.SelectedValue.ToString());
            }
        }

        protected void Cbx_SinBienes_CheckedChanged(object sender, EventArgs e)
        {
            if (Cbx_SinBienes.Checked == true)
            {
                if (!domicilio.SelectedItem.Value.Contains("No se ubican nuevos bienes"))
                    domicilio.Items.Insert(0, "No se ubican nuevos bienes");

                domicilio.SelectedIndex = 0;
                ALCSA.FWK.Web.Control.AsignarValor(txt_FechaActual, DateTime.Now);
            }
            else
            {
                txt_FechaActual.Text = string.Empty;
                btnGuardar_Bienes.Visible = false;
                btnGuardar.Visible = true;
            }
        }

        protected void btnGuardar_Bienes_Click(object sender, EventArgs e)
        {
            if (Cbx_SinBienes.Checked == true)
            {
                Transaccion.ActualizarDeudorDicomBienRaiz(
                    this.txtRut.Text.Replace(".", ""),
                    "1",
                    ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txt_FechaActual).ToString("yyyyMMdd"));
            }
            else
            {
                Transaccion.ActualizarDeudorDicomBienRaiz(this.txtRut.Text.Replace(".", "").ToString(), "0", "");
            }
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");
        }

        protected void btnInformeNegativo_Click(object sender, EventArgs e)
        {
            DataTable table = Consulta.BuscarDeudor(ALCSA.FWK.IdentificacionTributaria.FormatearRut(txtRut.Text).Replace(".", ""));

            if (table == null) return;
            if (table.Rows.Count.Equals(0))
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No se encontraron datos para generar el informe.');</script>");
                return;
            }

            hdfValorInformeNegativo.Value = string.Format("{0},{1},{2},{3}", new object[] {
                table.Rows[0]["NombreCliente"],
                table.Rows[0]["RSOCIAL"],
                table.Rows[0]["rut_deudor"],
                string.Empty // table.Rows[0]["operacion"]
            });
        }

    }
}

