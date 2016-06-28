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
    public partial class Mantenedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            string [] arrParametros= Request.QueryString["ID_BIEN_RAIZ"].Split(',');
            string strID_BIEN_RAIZ=arrParametros[0];
            string strID_Region=arrParametros[1];
            string strID_Comuna=arrParametros[2];
            string strID_ComunaCBR = arrParametros[3];
            if (!string.IsNullOrEmpty(strID_BIEN_RAIZ))
            {
                lblIdBienDeudor.Text = strID_BIEN_RAIZ;
                DataTable tabla = new DataTable();
                tabla = Consulta.Buscar_BienesRaicesDeudor(lblIdBienDeudor.Text);
                if (tabla.Rows.Count > 0)
                {                    
                    //this.Session["ReporteExcelBienesRaices"] = tabla;
                    txtRutDeudor.Text = tabla.Rows[0]["RUT_DEUDOR"].ToString();

                    txtFojas1.Text = tabla.Rows[0]["fojas1"].ToString();
                    txtNumero1.Text = tabla.Rows[0]["numero1"].ToString();
                    txtAno1.Text = tabla.Rows[0]["año1"].ToString();

                    txtFojas2.Text = tabla.Rows[0]["fojas2"].ToString();
                    txtNumero2.Text = tabla.Rows[0]["numero2"].ToString();
                    txtAno2.Text = tabla.Rows[0]["año2"].ToString();

                    txtFojas3.Text = tabla.Rows[0]["fojas3"].ToString();
                    txtNumero3.Text = tabla.Rows[0]["numero3"].ToString();
                    txtAno3.Text = tabla.Rows[0]["año3"].ToString();

                    txtFojas4.Text = tabla.Rows[0]["fojas4"].ToString();
                    txtNumero4.Text = tabla.Rows[0]["numero4"].ToString();
                    txtAno4.Text = tabla.Rows[0]["año4"].ToString();

                    txtFojas5.Text = tabla.Rows[0]["fojas5"].ToString();
                    txtNumero5.Text = tabla.Rows[0]["numero5"].ToString();
                    txtAno5.Text = tabla.Rows[0]["año5"].ToString();
                    //this.gvBienes.DataBind();

                    ComboDomicilios(txtRutDeudor.Text);
                    CargarRegiones();
                    this.lisRegion.Text = strID_Region;
                    CargarComunas(strID_Region);
                    this.lisComuna.Text = strID_Comuna;
                    CargarConservador(strID_Region);
                    this.lisConservador.Text = strID_ComunaCBR;
                }
            }
        }
       

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if ( this.txtRutDeudor.Text != null)
            {
                Transaccion.ActualizarBienesRaicesDeudor                    
                    (lblIdBienDeudor.Text,
                        Convert.ToInt32(this.lisDomicilio.SelectedValue),
                        Convert.ToInt32(this.lisRegion.SelectedValue),
                       // Convert.ToInt32(this.lisComuna.SelectedValue),
                        Convert.ToInt32(this.lisConservador.SelectedValue),                       
                        Convert.ToInt32(this.txtFojas1.Text), 
                        Convert.ToInt32(this.txtNumero1.Text),
                        Convert.ToInt32(this.txtAno1.Text),
                        Convert.ToInt32(this.txtFojas2.Text),
                        Convert.ToInt32(this.txtNumero2.Text),
                        Convert.ToInt32(this.txtAno2.Text),
                        Convert.ToInt32(this.txtFojas3.Text),
                        Convert.ToInt32(this.txtNumero3.Text),
                        Convert.ToInt32(this.txtAno3.Text),
                        Convert.ToInt32(this.txtFojas4.Text),
                        Convert.ToInt32(this.txtNumero4.Text),
                        Convert.ToInt32(this.txtAno4.Text),
                        Convert.ToInt32(this.txtFojas5.Text),
                        Convert.ToInt32(this.txtNumero5.Text),
                        Convert.ToInt32(this.txtAno5.Text)                     
                    );

                Transaccion.ActualizarDomiciliosBienesRaicesDeudor(Convert.ToInt32(this.lisDomicilio.SelectedValue), Convert.ToInt32(this.lisRegion.SelectedValue), Convert.ToInt32(this.lisComuna.SelectedValue)); 
              //   this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");
                 
            }
            else
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Bien Raiz ya se encuentra registrado');</script>");
                //this.txtFojaInsc.Focus();
            }
            this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Datos guardados correctamente');</script>");  
            Response.Redirect("BienesRaicesDelCliente.aspx?rut="+ txtRutDeudor.Text);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("BienesRaicesDelCliente.aspx?rut="+txtRutDeudor.Text);
        }
        private DataTable ComboDomicilios(string RutDeudor)
        {
            DataTable table = null;
            table = Consulta.ComboDomicilios(RutDeudor);
            if (table.Rows.Count > 0)
            {
                this.lisDomicilio.DataTextField = "Domicilio";
                this.lisDomicilio.DataValueField = "id_domicilio";
                this.lisDomicilio.DataSource = table;
                this.lisDomicilio.DataBind();
                return table;
            }
            return null;
        }
        private void CargarRegiones()
        {
            this.lisRegion.DataTextField = "descripcion";
            this.lisRegion.DataValueField = "id_regiones";
            this.lisRegion.DataSource = Consulta.BuscaRegiones();
            this.lisRegion.DataBind();
        }
        private void CargarComunas(string idRegion)
        {
            DataTable table = null;
            table = Consulta.BuscaComunas(idRegion);
            if (table.Rows.Count > 0)
            {
                this.lisComuna.DataTextField = "descripcion";
                this.lisComuna.DataValueField = "id_comuna";
                this.lisComuna.DataSource = table;
                this.lisComuna.DataBind();
            }
            else
            {
                this.lisComuna.Items.Clear();
                this.lisComuna.Items.Clear();
            }
        }
        private void CargarConservador(string idRegion)
        {
            DataTable table = null;
            table = Consulta.BuscaComunasCBR(idRegion);
            if (table.Rows.Count > 0)
            {
                this.lisConservador.DataTextField = "descripcion";
                this.lisConservador.DataValueField = "id_comuna_con";
                this.lisConservador.DataSource = table;
                this.lisConservador.DataBind();
            }
        }

        protected void lisComuna_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.CargarConservador(this.lisRegion.SelectedValue);
        }

        protected void lisDomicilio_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table = null;
            table = Consulta.Buscar_Domicilios(this.txtRutDeudor.Text.Replace(".", ""), this.lisDomicilio.SelectedValue.ToString());
            if (table != null)
            {
                this.lisRegion.Text = table.Rows[0]["id_regiones"].ToString();
                CargarComunas(table.Rows[0]["id_regiones"].ToString());
                this.lisComuna.Text = table.Rows[0]["id_comuna"].ToString();
            }
        }

        protected void lisConservador_SelectedIndexChanged(object sender, EventArgs e)
        {
           // this.CargarConservador(this.lisComuna.SelectedValue);
        }

        protected void lisRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarComunas(this.lisRegion.SelectedValue);
            CargarConservador(this.lisRegion.SelectedValue);
        }
    }
}