namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using CobranzaALC.Dto;
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class MostrarActividadesExhorto : Page
    {


        private void CargaGrilla(string idExhorto)
        {
            this.Grilla.DataSource = ConsultasEspecificas.MostrarJuicioActividadesExhorto(idExhorto);
            this.Grilla.DataBind();
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla(this.hiddidExhorto.Value.ToString());
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack && !string.IsNullOrEmpty(base.Request.QueryString["Codigo"]))
            {
                string idExhorto = base.Request.QueryString["Codigo"].ToString();
                this.hiddidExhorto.Value = idExhorto.ToString();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
                this.CargaGrilla(idExhorto);
                CabezeraActividadesExhortoDTO odto = new CabezeraActividadesExhortoDTO();
                odto = (CabezeraActividadesExhortoDTO) this.Session["CabezeraActividadesExhorto"];
                if (odto != null)
                {
                   /* this.txtDeudor.Text = odto.Deudor.ToString();
                    this.txtNoperacion.Text = odto.Noperacion.ToString();
                    this.txtRol.Text = odto.Rol.ToString();
                    this.txtTribunal.Text = odto.Tribunal.ToString();*/
                }
            }
        }
    }
}

