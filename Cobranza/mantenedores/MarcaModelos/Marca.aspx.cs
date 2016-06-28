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
    public partial class Marca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Mantenedores/MntBienMueble.aspx", true);
        }

        public void btn_Agregar_Click(object sender, EventArgs e)
        {           
            if (!string.IsNullOrEmpty(TextBox1.Text))
            { 
                //consultar si existe
                DataTable tabla = new DataTable();
                tabla = Transaccion.Consulta_ModeloAuto(TextBox1.Text);
                if (tabla.Rows.Count == 0)
                { Transaccion.InsertaMarcaAuto(TextBox1.Text);
                     this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Se ingreso correctamente');</script>");
                     TextBox1.Text = "";
                }
                else
                { this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('ya esta registrado la Marca');</script>");
                TextBox1.Text = "";
                }
            }
            else
            { this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe indicar Marca');</script>"); }
        }


       
    }
}