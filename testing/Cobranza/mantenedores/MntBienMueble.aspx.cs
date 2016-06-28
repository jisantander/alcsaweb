namespace CobranzaALC.Cobranza.mantenedores
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MntBienMueble : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack) return;

            this.modelo.Items.Insert(0, "Seleccione");
            this.ComboTipoVehiculo();
            this.ComboMarca();
            this.ComboColor();
            this.txtRut.BackColor = Color.LightYellow;
            this.txtRut.Focus();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable table = Consulta.BuscarDeudor(this.txtRut.Text.Replace(".", string.Empty));

            if (table != null && table.Rows.Count > 0)
            {
                txt_FechaActual.Text = "";

                if (table.Rows[0]["DicomBienMueble"].ToString() == "1")
                {
                    Cbx_SinBienes.Checked = true;
                    if (!String.IsNullOrEmpty(table.Rows[0]["FechaDicomBienMueble"].ToString()))
                        txt_FechaActual.Text = table.Rows[0]["FechaDicomBienMueble"].ToString();
                }
                else Cbx_SinBienes.Checked = false;

                this.txtRut.ReadOnly = true;
                this.txtRut.BackColor = Color.White;
                this.habilitar();
                this.btnBuscar.Visible = false;
                btnGuardar_Bienes.Visible = false;
                this.btnGuardar.Visible = true;
                this.txtPatente.Focus();
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Deudor no registrado');</script>");
                this.txtRut.Focus();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Transaccion.ActualizaBienMueble(this.txtPatente.Text, this.tipovehiculo.SelectedValue, this.marca.SelectedValue, this.modelo.SelectedValue, this.txtChassis.Text, this.color.SelectedValue, this.txtMotor.Text, this.txtAnioFabricacion.Text, this.limitaciones.SelectedValue, this.estado.SelectedValue.ToString());
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");
            this.Deshabilitar();
            this.Cancela();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Deshabilitar();
            this.Cancela();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //Jbaez:subir documento  
            if (this.filesubir.PostedFile.ContentLength > 0)
            {
                string strRutCliente = null;
                string path = base.Server.MapPath(@"~\DIGITALIZADOS");

                string nomArchivo = this.filesubir.PostedFile.FileName;// +Path.GetExtension(this.filesubir.PostedFile.FileName);
                if (nomArchivo.Contains("\\"))
                    nomArchivo = nomArchivo.Substring(nomArchivo.LastIndexOf("\\")).Replace("\\", string.Empty);
                if (nomArchivo.Contains("/"))
                    nomArchivo = nomArchivo.Substring(nomArchivo.LastIndexOf("/")).Replace("/", string.Empty);
                
               
                string str4 = UTIL.SubirArchivo(this.filesubir, path, nomArchivo);
                if (!(str4 == "OK"))
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('" + str4.ToString() + "');</script>");
                }
                else if (!string.IsNullOrEmpty(nomArchivo))
                {
                    DataTable tabla = Consulta.InformeBienesRaicesDeudor(null, txtRut.Text);
                    strRutCliente = tabla != null && tabla.Rows.Count > 0 ? tabla.Rows[0]["RutCliente"].ToString() : "ALCSA";

                    Transaccion.InsertaDocBienesDigitalizado(txtRut.Text, nomArchivo, this.txtPatente.Text, strRutCliente, "64");
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Documento digitalizado exitosamente');</script>");
                    this.filesubir.Focus();
                }
            }

            Transaccion.InsertaBienMueble(
                this.tipovehiculo.SelectedValue,
                this.marca.SelectedValue,
                this.modelo.SelectedValue, 
                this.txtChassis.Text,
                this.color.SelectedValue,
                this.txtRut.Text.Replace(".", ""), 
                this.txtMotor.Text,
                this.txtPatente.Text,
                this.txtAnioFabricacion.Text,
                this.limitaciones.SelectedValue,
                this.estado.SelectedValue);
            
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");
            this.Deshabilitar();
            this.Cancela();
        }

        public void Cancela()
        {
            this.txtRut.Text = "";
            this.txtPatente.Text = "";
            this.txtMotor.Text = "";
            this.txtChassis.Text = "";
            this.tipovehiculo.SelectedIndex = 0;
            this.marca.SelectedIndex = 0;
            this.modelo.Items.Clear();
            this.modelo.Items.Insert(0, "Seleccione");
            this.color.SelectedIndex = 0;
            this.limitaciones.SelectedIndex = 0;
            this.txtAnioFabricacion.Text = "";
            this.estado.SelectedIndex = 0;
            this.txtRut.ReadOnly = false;
            this.btnGuardar.Visible = false;
            this.btnBuscar.Visible = true;
            this.btnActualizar.Visible = false;
            this.txtRut.BackColor = Color.LightYellow;
            this.txtRut.Focus();
        }

        public void Deshabilitar()
        {
            this.txtPatente.ReadOnly = true;
            this.txtMotor.ReadOnly = true;
            this.txtChassis.ReadOnly = true;
            this.tipovehiculo.Enabled = false;
            this.marca.Enabled = false;
            this.modelo.Enabled = false;
            this.color.Enabled = false;
            this.limitaciones.Enabled = false;
            this.txtAnioFabricacion.Enabled = false;
            this.estado.Enabled = false;
            this.txtAnioFabricacion.BackColor = Color.White;
            this.txtPatente.BackColor = Color.White;
            this.txtMotor.BackColor = Color.White;
            this.txtChassis.BackColor = Color.White;
            this.tipovehiculo.BackColor = Color.White;
            this.marca.BackColor = Color.White;
            this.modelo.BackColor = Color.White;
            this.color.BackColor = Color.White;
            this.limitaciones.BackColor = Color.White;
            this.estado.BackColor = Color.White;
        }

        public void habilitar()
        {
            this.txtPatente.ReadOnly = false;
            this.txtMotor.ReadOnly = false;
            this.txtChassis.ReadOnly = false;
            this.tipovehiculo.Enabled = true;
            this.marca.Enabled = true;
            this.modelo.Enabled = true;
            this.color.Enabled = true;
            this.limitaciones.Enabled = true;
            this.txtAnioFabricacion.Enabled = true;
            this.estado.Enabled = true;
            this.txtAnioFabricacion.BackColor = Color.LightYellow;
            this.txtPatente.BackColor = Color.LightYellow;
            this.txtMotor.BackColor = Color.LightYellow;
            this.txtChassis.BackColor = Color.LightYellow;
            this.tipovehiculo.BackColor = Color.LightYellow;
            this.marca.BackColor = Color.LightYellow;
            this.modelo.BackColor = Color.LightYellow;
            this.color.BackColor = Color.LightYellow;
            this.limitaciones.BackColor = Color.LightYellow;
            this.estado.BackColor = Color.LightYellow;
        }

        protected void marca_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ComboModelo(this.marca.SelectedValue);
        }

        protected void txtPatente_TextChanged(object sender, EventArgs e)
        {
            DataTable table = null;
            table = Consulta.BuscarPatente(this.txtPatente.Text);
            this.txtPatente.Text = this.txtPatente.Text.ToUpper().Replace("-", "");
            if (table.Rows.Count > 0)
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Patente ya est\x00e1 registrada');</script>");
                this.tipovehiculo.SelectedValue = table.Rows[0]["id_tipo_vehi"].ToString();
                this.txtAnioFabricacion.Text = table.Rows[0]["anio_fabricacion"].ToString();
                this.txtMotor.Text = table.Rows[0]["n_motor"].ToString();
                this.marca.SelectedValue = table.Rows[0]["id_marca"].ToString();
                this.ComboModelo(table.Rows[0]["id_marca"].ToString());
                this.modelo.SelectedValue = table.Rows[0]["id_modelo"].ToString();
                this.txtChassis.Text = table.Rows[0]["n_chassis"].ToString();
                if (table.Rows[0]["id_color"].ToString() == "0")
                {
                    this.color.SelectedIndex = 0;
                }
                else
                {
                    this.color.SelectedValue = table.Rows[0]["id_color"].ToString();
                }
                this.limitaciones.SelectedValue = table.Rows[0]["id_limitaciones"].ToString();
                this.estado.SelectedValue = table.Rows[0]["estado"].ToString();
                this.txtPatente.BackColor = Color.White;
                this.txtPatente.ReadOnly = true;
                this.btnActualizar.Visible = true;
                this.btnGuardar.Visible = false;
            }
            else
            {
                this.txtMotor.Focus();
            }
        }

        protected void btnGuardar_Bienes_Click(object sender, EventArgs e)
        {
            Transaccion.ActualizarDeudorDicomBienMueble(
                this.txtRut.Text.Replace(".", ""),
                Cbx_SinBienes.Checked ? "1" : "0",
                ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txt_FechaActual).ToString("yyyyMMdd"));

            btnGuardar_Bienes.Visible = false;
            btnGuardar.Visible = true;
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Se modificó dato No se Ubicaron Nuevos Bienes correctamente.');</script>");
        }

        protected void btnInformeNegativo_Click(object sender, EventArgs e)
        {
            DataTable table = Consulta.BuscarDeudor(
                ALCSA.FWK.IdentificacionTributaria.FormatearRut(txtRut.Text).Replace(".", ""));

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

        protected void Cbx_SinBienes_CheckedChanged(object sender, EventArgs e)
        {
            ALCSA.FWK.Web.Control.AsignarValor(
                txt_FechaActual,
                Cbx_SinBienes.Checked ? DateTime.Now : new DateTime()
            );
            btnGuardar_Bienes.Visible = true;
            btnGuardar.Visible = false;
        }

        #region Carga Listados

        private void ComboColor()
        {
            this.color.DataTextField = "descripcion";
            this.color.DataValueField = "id_color";
            this.color.DataSource = Consulta.ComboColor();
            this.color.DataBind();
            this.color.Items.Insert(0, "Seleccione");
        }

        private void ComboMarca()
        {
            this.marca.DataTextField = "descripcion";
            this.marca.DataValueField = "id_marca";
            this.marca.DataSource = Consulta.ComboMarca();
            this.marca.DataBind();
            this.marca.Items.Insert(0, "Seleccione");
        }

        private void ComboModelo(string id_marca)
        {
            DataTable table = null;
            table = Consulta.ComboModelo(id_marca);
            if (table.Rows.Count > 0)
            {
                this.modelo.DataTextField = "descripcion";
                this.modelo.DataValueField = "id_modelo";
                this.modelo.DataSource = table;
                this.modelo.DataBind();
            }
            else
            {
                this.modelo.Items.Clear();
                this.modelo.Items.Insert(0, "Seleccione");
            }
        }

        private void ComboTipoVehiculo()
        {
            this.tipovehiculo.DataTextField = "descripcion";
            this.tipovehiculo.DataValueField = "id_tipo_veh";
            this.tipovehiculo.DataSource = Consulta.ComboTipoVehiculo();
            this.tipovehiculo.DataBind();
        }

        #endregion
    }
}

