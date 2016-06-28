namespace CobranzaALC.Cobranza.mantenedores
{
    using ALCLOCAL;
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MntDomicilios : Page
    {

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            hid_fechasin_nuevo_domicilio.Value = string.Empty;
            BuscarDeudor();
        }

        public void BuscarDeudor()
        {
            DataTable table = null;
            table = Consulta.BuscarDeudor(this.txtRut.Text.Replace(".", ""));
            if ((table.Rows.Count > 0) && (table != null))
            {
                this.txtRut.ReadOnly = true;
                this.txtRut.BackColor = Color.White;
                this.habilitar();
                this.btnBuscar.Visible = false;
                this.btnGuardar.Visible = true;
                this.btnActualizar.Visible = true;
                this.btnEliminar.Visible = true;
                this.txtCalle.Focus();
                txt_NombreCliente.Text = table.Rows[0]["NombreCliente"].ToString();
                txt_NombreDeudor.Text = table.Rows[0]["rsocial"].ToString();

                ComboDomicilios(txtRut.Text, table);

                DataTable table2 = null;
                if (domicilio.SelectedValue.ToString() != "No Registra Nuevos Domicilios")
                {
                    table2 = Consulta.Buscar_Domicilio_Completo(this.txtRut.Text.Replace(".", ""), domicilio.SelectedValue.ToString());
                    CargarListaDomiciliosExistentes(table2);
                }
                else
                {
                    table2 = Consulta.Buscar_Domicilio_Completo(this.txtRut.Text.Replace(".", ""), "0");
                    CargarListaDomiciliosExistentes(table2, hid_fechasin_nuevo_domicilio.Value);
                }
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Deudor no registrado');</script>");
                this.txtRut.Focus();
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
            string str = "MntDomicilios.aspx?Rut=" + this.txtRut.Text.ToString();

            if (Cbx_SinDomicilio.Checked)
            {
                Transaccion.ActualizarDeudorDicom(this.txtRut.Text.Replace(".", ""), "1");
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');location.href='" + str.ToString() + "';</script>");
            }
            else if (domicilio.SelectedValue.ToString() == "No Registra Nuevos Domicilios")
            {
                Transaccion.ActualizarDeudorDicom(this.txtRut.Text.Replace(".", ""), "0");
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');location.href='" + str.ToString() + "';</script>");
            }
            else
            {
                if (Consulta.BuscaDomicilios(this.txtNumero.Text, this.txtRut.Text.Replace(".", "")) == null)
                {
                    Transaccion.InsertaDomicilio(
                        this.txtVilla.Text,
                        this.txtCalle.Text, 
                        this.txtBlock.Text, 
                        this.txtNumero.Text, 
                        this.region.SelectedValue,
                        this.comuna.SelectedValue, 
                        this.txtRut.Text.Replace(".", ""),
                        this.vigencia.SelectedValue, 
                        this.fuente.SelectedValue,
                        this.txtNdepartamento.Text,
                        this.observacion.Text.ToString()
                    );

                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');location.href='" + str.ToString() + "';</script>");
                }
                else
                {
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Domicilio ya se encuentra registrado');</script>");
                    this.txtCalle.Focus();
                }
            }
        }

        private DataTable ComboDomicilios(string RutDeudor, DataTable tableDeudor)
        {
            DataTable table = Consulta.ComboDomicilios(RutDeudor);
            if (table.Rows.Count > 0)
            {
                this.domicilio.DataTextField = "Domicilio";
                this.domicilio.DataValueField = "id_domicilio";
                this.domicilio.DataSource = table;
                this.domicilio.DataBind();

                if (tableDeudor == null)
                    tableDeudor = Consulta.BuscarDeudor(this.txtRut.Text.Replace(".", ""));

                if (tableDeudor != null && tableDeudor.Rows.Count > 0)
                {
                    hid_fechasin_nuevo_domicilio.Value = tableDeudor.Rows[0]["fecha_sin_nuevo_domicilio"].ToString();
                    if (tableDeudor.Rows[0]["sin_nuevo_domicilio"].ToString().ToUpper() == "TRUE")
                    {
                        this.domicilio.Items.Insert(0, "No Registra Nuevos Domicilios");
                        Cbx_SinDomicilio.Checked = true;
                        txt_FechaObservacion.Text = hid_fechasin_nuevo_domicilio.Value;

                        this.txtVilla.Text = "";
                        this.txtCalle.Text = "";
                        this.txtBlock.Text = "";
                        this.txtNumero.Text = "";
                        this.observacion.Text = "";
                        this.txtNdepartamento.Text = "";                        
                    }
                    else
                    {
                        domicilio.Items.Remove("No Registra Nuevos Domicilios");
                        Cbx_SinDomicilio.Checked = false;
                    }
                }
                else
                    domicilio.Items.Remove("No Registra Nuevos Domicilios");

                return table;
            }
            return null;
        }

        public void Cancela()
        {
            this.txtRut.Text = "";
            this.txtVilla.Text = "";
            this.txtCalle.Text = "";
            this.txtBlock.Text = "";
            this.txtNumero.Text = "";
            this.observacion.Text = "";
            this.txt_FechaObservacion.Text = "";
            this.txtNdepartamento.Text = "";
            this.txtRut.ReadOnly = false;
            this.region.SelectedIndex = 0;
            this.comuna.Items.Clear();
            this.btnGuardar.Visible = false;
            this.btnBuscar.Visible = true;
            this.txtRut.BackColor = Color.LightYellow;
            this.txtRut.Focus();
        }

        private void CargarComunas(string idRegion)
        {
            this.comuna.DataTextField = "descripcion";
            this.comuna.DataValueField = "id_comuna";
            this.comuna.DataSource = Consulta.BuscaComunas(idRegion);
            this.comuna.DataBind();
        }

        private void CargaRegiComunaDefecto()
        {
            this.CargarRegiones();
            this.region.SelectedValue = "13";
            this.CargarComunas("13");
            this.comuna.SelectedValue = "281";
        }

        private void CargarRegiones()
        {
            this.region.DataTextField = "descripcion";
            this.region.DataValueField = "id_regiones";
            this.region.DataSource = Consulta.BuscaRegiones();
            this.region.DataBind();
        }

        public void Deshabilitar()
        {
            this.txtCalle.ReadOnly = true;
            this.txtNumero.ReadOnly = true;
            this.txtVilla.ReadOnly = true;
            this.txtBlock.ReadOnly = true;
            this.txtNdepartamento.ReadOnly = true;
            this.region.Enabled = false;
            this.comuna.Enabled = false;
            this.vigencia.Enabled = false;
            this.fuente.Enabled = false;
            this.txtCalle.BackColor = Color.White;
            this.txtNumero.BackColor = Color.White;
            this.txtVilla.BackColor = Color.White;
            this.txtBlock.BackColor = Color.White;
            this.txtNdepartamento.BackColor = Color.White;
            this.region.BackColor = Color.White;
            this.comuna.BackColor = Color.White;
            this.vigencia.BackColor = Color.White;
            this.fuente.BackColor = Color.White;
        }

        public void habilitar()
        {
            this.txtCalle.ReadOnly = false;
            this.txtNumero.ReadOnly = false;
            this.txtVilla.ReadOnly = false;
            this.txtBlock.ReadOnly = false;
            this.txtNdepartamento.ReadOnly = false;
            this.region.Enabled = true;
            this.comuna.Enabled = true;
            this.vigencia.Enabled = true;
            this.fuente.Enabled = true;
            this.txtCalle.BackColor = Color.LightYellow;
            this.txtNumero.BackColor = Color.LightYellow;
            this.txtVilla.BackColor = Color.LightYellow;
            this.txtBlock.BackColor = Color.LightYellow;
            this.txtNdepartamento.BackColor = Color.LightYellow;
            this.region.BackColor = Color.LightYellow;
            this.comuna.BackColor = Color.LightYellow;
            this.vigencia.BackColor = Color.LightYellow;
            this.fuente.BackColor = Color.LightYellow;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(base.Request.QueryString["Rut"]))
                {
                    this.txtRut.Text = base.Request.QueryString["Rut"].ToString();
                    this.txtRut.ReadOnly = true;
                    this.txtRut.BackColor = Color.White;
                    this.CargaRegiComunaDefecto();
                    this.habilitar();
                    this.btnBuscar.Visible = false;
                    this.btnGuardar.Visible = true;
                    this.txtCalle.Focus();
                    BuscarDeudor();
                }
                else
                {
                    this.CargaRegiComunaDefecto();
                    this.txtRut.BackColor = Color.LightYellow;
                    this.txtRut.Focus();
                }
            }
        }

        protected void region_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.CargarComunas(this.region.SelectedValue);
        }

        protected void vigencia_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void domicilio_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table = null;
            if (domicilio.SelectedValue.ToString() != "No Registra Nuevos Domicilios")
            {
                table = Consulta.Buscar_Domicilio_Completo(this.txtRut.Text.Replace(".", ""), domicilio.SelectedValue.ToString());
                CargarListaDomiciliosExistentes(table);
            }
            else
            {
                // this.txtRut.Text = "";
                this.txtVilla.Text = "";
                this.txtCalle.Text = "";
                this.txtBlock.Text = "";
                this.txtNumero.Text = "";
                this.observacion.Text = "";
                if (domicilio.SelectedValue.ToString() != "No Registra Nuevos Domicilios")
                {
                    this.txt_FechaObservacion.Text = "";
                }
                this.txtNdepartamento.Text = "";
                this.region.SelectedIndex = 0;
                //this.comuna.Items.Clear();                
            }
        }

        public void CargarListaDomiciliosExistentes(DataTable datTabla)
        {
            if (datTabla.Rows.Count > 0)
            {
                this.txtCalle.Text = datTabla.Rows[0]["calle"].ToString();
                this.txtNumero.Text = datTabla.Rows[0]["numero"].ToString();
                this.txtVilla.Text = datTabla.Rows[0]["villapob"].ToString();
                this.txtBlock.Text = datTabla.Rows[0]["block"].ToString();
                this.txtNdepartamento.Text = datTabla.Rows[0]["nrodpto"].ToString();
                this.region.Text = datTabla.Rows[0]["id_regiones"].ToString();
                this.CargarComunas(datTabla.Rows[0]["id_regiones"].ToString());


                if (!domicilio.SelectedValue.ToString().Contains("No Registra Nuevos Domicilios"))
                {
                    ALCSA.FWK.Web.Control.SeleccionarValor(this.comuna, datTabla.Rows[0]["id_comuna"].ToString());
                    // this.comuna.Text = datTabla.Rows[0]["id_comuna"].ToString();
                }

                this.vigencia.Text = datTabla.Rows[0]["estado"].ToString();


                // this.fuente.Text = datTabla.Rows[0]["fuente"].ToString();
                ALCSA.FWK.Web.Control.SeleccionarValor(this.fuente, datTabla.Rows[0]["fuente"].ToString());

                txt_FechaObservacion.Text = datTabla.Rows[0]["Fecha_observacion"].ToString();
                this.observacion.Text = datTabla.Rows[0]["observacion"].ToString();
            }
        }

        public void CargarListaDomiciliosExistentes(DataTable datTabla, string fechaObservacion)
        {
            if (datTabla.Rows.Count > 0)
            {
                this.txtCalle.Text = datTabla.Rows[0]["calle"].ToString();
                this.txtNumero.Text = datTabla.Rows[0]["numero"].ToString();
                this.txtVilla.Text = datTabla.Rows[0]["villapob"].ToString();
                this.txtBlock.Text = datTabla.Rows[0]["block"].ToString();
                this.txtNdepartamento.Text = datTabla.Rows[0]["nrodpto"].ToString();
                this.region.Text = datTabla.Rows[0]["id_regiones"].ToString();
                this.CargarComunas(datTabla.Rows[0]["id_regiones"].ToString());
                if (!domicilio.SelectedValue.ToString().Contains("No Registra Nuevos Domicilios"))
                {
                    this.comuna.Text = datTabla.Rows[0]["id_comuna"].ToString();
                }

                this.vigencia.Text = datTabla.Rows[0]["estado"].ToString();
                this.fuente.Text = datTabla.Rows[0]["fuente"].ToString();
                txt_FechaObservacion.Text = datTabla.Rows[0]["Fecha_observacion"].ToString();
                this.observacion.Text = datTabla.Rows[0]["observacion"].ToString();
            }
            else if (!string.IsNullOrEmpty(fechaObservacion))
                txt_FechaObservacion.Text = fechaObservacion;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            DataTable table = null;
            string strRut = this.txtRut.Text;
            if (!String.IsNullOrEmpty(domicilio.SelectedValue.ToString()))
            {
                Consulta.Eliminar_Domicilio(this.txtRut.Text.Replace(".", ""), domicilio.SelectedValue.ToString());

                table = Consulta.BuscarDeudor(this.txtRut.Text.Replace(".", ""));
                Cancela();
                this.txtRut.Text = strRut;
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.txtRut.ReadOnly = true;
                    this.txtRut.BackColor = Color.White;
                    this.habilitar();
                    this.btnBuscar.Visible = false;
                    this.btnGuardar.Visible = true;
                    this.btnActualizar.Visible = true;
                    this.btnEliminar.Visible = true;
                    this.txtCalle.Focus();
                    ComboDomicilios(txtRut.Text, null);
                }
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Se ha elimina el registro correctamente');</script>");
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Indique domicilio de la lista');</script>");
                this.txtCalle.Focus();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {

            if (!String.IsNullOrEmpty(domicilio.SelectedValue.ToString()))
            {
                if (domicilio.SelectedValue.ToString() != "No Registra Nuevos Domicilios")
                {
                    Transaccion.ActualizarDomiciliosCompleto(Convert.ToInt32(domicilio.SelectedValue.ToString()), txtVilla.Text, txtCalle.Text, txtBlock.Text, Convert.ToInt32(txtNumero.Text), Convert.ToInt32(region.SelectedValue.ToString()), Convert.ToInt32(comuna.SelectedValue.ToString()), vigencia.SelectedValue.ToString(), fuente.SelectedValue.ToString(), txtNdepartamento.Text, observacion.Text);
                    ComboDomicilios(this.txtRut.Text, null);
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Se actualizo correctamente');</script>");
                }
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Indique domicilio de la lista');</script>");
                this.txtCalle.Focus();
            }
        }

        protected void btnInforme_Click(object sender, ImageClickEventArgs e)
        {
            //string strId = ((ImageButton)sender).CommandArgument ;
            string strId = null;

            DataTable table = null;
            if (!String.IsNullOrEmpty(txtRut.Text))
            {
                if (domicilio.SelectedValue.ToString() != "No Registra Nuevos Domicilios")
                {
                    table = Consulta.Buscar_Domicilio_Completo(this.txtRut.Text.Replace(".", ""), domicilio.SelectedValue.ToString());
                    if (table != null)
                    {
                        strId = strId + table.Rows[0]["NombreCliente"].ToString();
                        strId = strId + ',' + table.Rows[0]["RSOCIAL"].ToString();
                        strId = strId + ',' + table.Rows[0]["rut_deudor"].ToString();
                        strId = strId + ',' + table.Rows[0]["calle"].ToString();
                        strId = strId + ',' + table.Rows[0]["numero"].ToString();
                        strId = strId + ',' + table.Rows[0]["block"].ToString();
                        strId = strId + ',' + table.Rows[0]["nrodpto"].ToString();
                        strId = strId + ',' + table.Rows[0]["villapob"].ToString();
                        strId = strId + ',' + table.Rows[0]["NOMBRECOMUNA"].ToString();
                        //Ambiente Local
                        Response.Redirect(string.Format("../Documentos/Formatos/Domicilios/InformeDomicilios.aspx?Parametros_Domicilio={0}", strId), true);
                    }
                }
                else  this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Indique domicilio de la lista');</script>");
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Indique el RUT');</script>");
                this.txtRut.Focus();
            }



        }
    }
}

