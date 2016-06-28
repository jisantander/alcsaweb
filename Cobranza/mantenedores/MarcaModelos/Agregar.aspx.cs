using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ALCLOCAL;
using System.Data;

namespace CobranzaALC.Cobranza.mantenedores.MarcaModelos
{
    public partial class Agregar : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                ComboMarca();
            }
        }
        public void ComboMarca()
        {
            this.Lis_marca.DataTextField = "descripcion";
            this.Lis_marca.DataValueField = "id_marca";
            this.Lis_marca.DataSource = Consulta.ComboMarca();
            this.Lis_marca.DataBind();
            this.Lis_marca.Items.Insert(0, "Seleccione");
        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Mantenedores/MntBienMueble.aspx", true);
        }

        public void btn_Agregar_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Text_Modelo.Text))
            {
                //consultar si existe Modelo
                DataTable tabla = new DataTable();
                tabla = Transaccion.Consulta_ModeloAuto(Lis_marca.SelectedValue, Text_Modelo.Text);
                if (tabla.Rows.Count == 0)
                { Transaccion.InsertaModeloAuto(Convert.ToInt32(Lis_marca.SelectedValue), Text_Modelo.Text);
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Se ingreso correctamente');</script>");
                Text_Modelo.Text = "";
                }
                else
                { this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('ya esta registrado el modelo');</script>"); }          
            }
            else
            { this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe indicar Modelo');</script>"); }
        }


       
    }
}