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
    public partial class BienesMueblesDelCliente : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack) return;
            this.Lb_RutDeudor.Text = base.Request.QueryString["rut"].ToString();
            this.CargaBienes();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Mantenedores/MntBienMueble.aspx", true);
        }

        public void CargaBienes()
        {
            if (!string.IsNullOrEmpty(this.Lb_RutDeudor.Text))
            {
                bool muestraMensajeNoDispone = true;
                DataTable tabla = Consulta.BienesMueblesDeudor(this.Lb_RutDeudor.Text.Replace(".", ""));

                if (tabla.Rows.Count > 0)
                {
                    Session["ReporteExcelBienesMuebles"] = tabla;

                    string strRuta = Request.Url.AbsoluteUri;
                    strRuta = strRuta.ToLower().Contains("/testing/") ? "http://www.alcsa.cl/testing/DIGITALIZADOS/" : "http://www.alcsa.cl/DIGITALIZADOS/";

                    foreach(DataRow objFila in tabla.Rows)
                    {
                        string strDocumento = objFila["urldocumento"] != null ? objFila["urldocumento"].ToString() : string.Empty;
                        if(strDocumento.StartsWith("/")) strDocumento = strDocumento.Remove(0, 1);
                        objFila["urldocumento"] = string.Format("{0}{1}", strRuta, strDocumento);
                    }

                    gvBienes.DataSource = tabla;
                    gvBienes.DataBind();
                    muestraMensajeNoDispone = false;
                }

                DataTable tabla2 = Consulta.BuscarDeudor(Lb_RutDeudor.Text);
                if (tabla2 != null && tabla2.Rows.Count > 0)
                {
                    if ("1".Equals(tabla2.Rows[0]["DicomBienMueble"].ToString()))
                    {
                        Lb_MarcaSinMasBienesMuebles.Visible = true;
                        Lb_FechaMarca.Visible = true;
                        Lb_MarcaSinMasBienesMuebles.Text = "No se ubican nuevos bienes";
                        Lb_FechaMarca.Text = tabla2.Rows[0]["FechaDicomBienMueble"].ToString();
                        muestraMensajeNoDispone = false;
                    }
                    else
                    {
                        Lb_MarcaSinMasBienesMuebles.Visible = false;
                        Lb_FechaMarca.Visible = false;
                    }
                }
                else
                {
                    Lb_MarcaSinMasBienesMuebles.Visible = false;
                    Lb_FechaMarca.Visible = false;
                }
                
                if (muestraMensajeNoDispone)
                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('No dispone bienes Muebles del DEUDOR');</script>");
            }
            else
            { this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Debe indicar Rut del Deudor');</script>"); }
        }

        protected void btnEliminar_Click(object sender, ImageClickEventArgs e)
        {
            string strId = ((ImageButton)sender).CommandArgument;
            Consulta.Eliminar_BienesMueblesDeudor(strId);
            CargaBienes();

        }

        protected void gvBienes_SelectedIndexChanged(object sender, EventArgs e)
        {
            Lb_ID_BIEN_RAIZ.Text = ((ImageButton)sender).CommandArgument;
        }

        protected void btnModificar_Click(object sender, ImageClickEventArgs e)
        {
            string strId = ((ImageButton)sender).CommandArgument;
            Response.Redirect(string.Format("MantenedorBienMuebles.aspx?patente={0}", strId), true);
        }

        protected void btnInforme_Click(object sender, ImageClickEventArgs e)
        {
            string strId = ((ImageButton)sender).CommandArgument;
            Response.Redirect(string.Format("../../Documentos/Formatos/Bienes/InformeBienMuebles.aspx?id_bien_mueble={0}", strId), true);
        }

        protected void gvBienes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBienes.PageIndex = e.NewPageIndex;
            CargaBienes();
        }


    }
}