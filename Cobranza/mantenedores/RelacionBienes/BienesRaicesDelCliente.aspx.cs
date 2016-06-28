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
    public partial class BienesRaicesDelCliente : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.Lb_RutDeudor.Text = base.Request.QueryString["rut"].ToString();
                this.CargaBienes();
            }

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Mantenedores/MntBienRaiz.aspx", true);
        }

        public void CargaBienes()
        {
            if (!string.IsNullOrEmpty(this.Lb_RutDeudor.Text))
            {
                bool muestraMensajeNoDispone = true;
                DataTable tabla = Consulta.BienesRaicesDeudor(Lb_RutDeudor.Text);

                if (tabla.Rows.Count > 0)
                {
                    this.Session["ReporteExcelBienesRaices"] = tabla;
                    this.gvBienes.DataSource = tabla;
                    this.gvBienes.DataBind();
                    muestraMensajeNoDispone = false;
                }

                DataTable tabla2 = Consulta.BuscarDeudor(Lb_RutDeudor.Text);
                if (tabla2 != null && tabla2.Rows.Count > 0)
                {
                    if ("1".Equals(tabla2.Rows[0]["DicomBienRaiz"].ToString()))
                    {
                        Lb_MarcaSinMasBienesRaices.Visible = true;
                        Lb_FechaMarca.Visible = true;
                        Lb_MarcaSinMasBienesRaices.Text = "No se ubican nuevos bienes";
                        Lb_FechaMarca.Text = tabla2.Rows[0]["FechaDicomBienRaiz"].ToString();
                        muestraMensajeNoDispone = false;
                    }
                    else
                    {
                        Lb_MarcaSinMasBienesRaices.Visible = false;
                        Lb_FechaMarca.Visible = false;
                    }
                }
                else
                {
                    Lb_MarcaSinMasBienesRaices.Visible = false;
                    Lb_FechaMarca.Visible = false;
                }

                if (muestraMensajeNoDispone)
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No dispone bienes raices el DEUDOR');</script>");
            }
            else
            { this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe indicar Rut del Deudor');</script>"); }
        }

        protected void btnEliminar_Click(object sender, ImageClickEventArgs e)
        {
            string strId = ((ImageButton)sender).CommandArgument;
            Consulta.Eliminar_BienesRaicesDeudor(strId);
            CargaBienes();

        }

        protected void gvBienes_SelectedIndexChanged(object sender, EventArgs e)
        {
            Lb_ID_BIEN_RAIZ.Text = ((ImageButton)sender).CommandArgument;
        }

        protected void btnModificar_Click(object sender, ImageClickEventArgs e)
        {
            string strId = ((ImageButton)sender).CommandArgument;
            Response.Redirect(string.Format("Mantenedor.aspx?ID_BIEN_RAIZ={0}", strId), true);
        }

        protected void btnInforme_Click(object sender, ImageClickEventArgs e)
        {
            string strId = ((ImageButton)sender).CommandArgument;
            Response.Redirect(string.Format("../../Documentos/Formatos/Bienes/InformeBienRaiz.aspx?ID_BIEN_RAIZ={0}", strId), true);
        }

        protected void gvBienes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBienes.PageIndex = e.NewPageIndex;
            CargaBienes();
        }


    }
}