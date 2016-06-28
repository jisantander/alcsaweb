using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ALCLOCAL;
using System.Data;

namespace CobranzaALC.Cobranza.mantenedores.RelacionBienes
{
    public partial class MantenedorBienMuebles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {         
            
            if (!this.Page.IsPostBack)
            {
                
                this.modelo.Items.Insert(0, "Seleccione");
                this.ComboTipoVehiculo();
                this.ComboMarca();
                this.ComboColor();           
            
                if (!String.IsNullOrEmpty(Request.QueryString["patente"].ToString()))
                {
                    lblIdBienDeudor.Text = Request.QueryString["patente"];
                    DataTable tabla = new DataTable();
                    tabla = Consulta.Buscar_BienesMueblesDeudor(lblIdBienDeudor.Text);
                    //tabla = Transaccion.ActualizaBienMueble(lblIdBienDeudor.Text);
                    if (tabla.Rows.Count > 0)
                    {
                        txtRutDeudor.Text = tabla.Rows[0]["RUT_DEUDOR"].ToString();
                        this.tipovehiculo.SelectedValue = tabla.Rows[0]["TipoVehiculo"].ToString();
                        this.marca.SelectedValue = tabla.Rows[0]["Marca"].ToString();
                        this.ComboModelo(tabla.Rows[0]["Marca"].ToString());
                        this.modelo.SelectedValue = tabla.Rows[0]["Modelo"].ToString();                        
                        this.txtChassis.Text = tabla.Rows[0]["n_chassis"].ToString();
                        if (tabla.Rows[0]["Color"].ToString() == "0")
                        {
                            this.color.SelectedIndex = 0;
                        }
                        else
                        {
                            this.color.SelectedValue = tabla.Rows[0]["Color"].ToString();
                        }
                        if (tabla.Rows[0]["id_limitaciones"].ToString() == "0")
                        {
                            this.color.SelectedIndex = 0;
                        }
                        else
                        {
                            this.limitaciones.SelectedValue = tabla.Rows[0]["id_limitaciones"].ToString();
                        }
                        this.txtMotor.Text = tabla.Rows[0]["n_motor"].ToString();
                        this.txtPatente.Text = tabla.Rows[0]["patente"].ToString();
                        this.txtAnioFabricacion.Text = tabla.Rows[0]["anio_fabricacion"].ToString();
                        //this.limitaciones.SelectedValue = tabla.Rows[0]["id_limitaciones"].ToString();
                        this.estado.SelectedValue = tabla.Rows[0]["estado"].ToString();
                    }
                }
            }
        }
       

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Transaccion.ActualizaBienMueble(this.txtPatente.Text, this.tipovehiculo.SelectedValue, this.marca.SelectedValue, this.modelo.SelectedValue, this.txtChassis.Text, this.color.SelectedValue, this.txtMotor.Text, this.txtAnioFabricacion.Text, this.limitaciones.SelectedValue, this.estado.SelectedValue.ToString());
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");
         
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("BienesMueblesDelCliente.aspx?rut="+txtRutDeudor.Text);
        }
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
            }
            else
            {
                this.txtMotor.Focus();
            }
        }
    }
}