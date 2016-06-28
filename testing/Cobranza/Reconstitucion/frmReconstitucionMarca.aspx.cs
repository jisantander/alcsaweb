namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class frmReconstitucionMarca : Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!this.Page.IsPostBack)
            {
                string ot = base.Request.QueryString["OT"].ToString();
                this.hiddOT.Value = ot;
                DataTable table = null;
                table = Consulta.ReconstitucionByRut(ot);
                if ((table.Rows.Count > 0) && (table != null))
                {
                    this.hddUserResponsable.Value = table.Rows[0]["user_responsable"].ToString();
                    this.txtOT.Text = table.Rows[0]["OT"].ToString();
                    this.txtEstadoOT.Text = table.Rows[0]["estado_ot"].ToString();
                    this.txtResponsable.Text = table.Rows[0]["respo"].ToString();
                    this.txtsubproducto.Text = table.Rows[0]["subproducto"].ToString();
                    this.txtprod.Text = table.Rows[0]["prod"].ToString();
                    this.txtTipoDoc.Text = table.Rows[0]["TipoDoc"].ToString();
                    this.txtnrooperacion.Text = table.Rows[0]["nrooperacion"].ToString();
                    this.txtrutcliente.Text = table.Rows[0]["rutcliente"].ToString();
                    this.txtdv.Text = table.Rows[0]["dv"].ToString();
                    this.txtnombrecliente.Text = table.Rows[0]["nombrecliente"].ToString();
                    this.txtdireccion.Text = table.Rows[0]["direccion"].ToString();
                    this.txtcomuna.Text = table.Rows[0]["comuna"].ToString();
                    this.txtconservador.Text = table.Rows[0]["conservador"].ToString();
                    this.txtregion.Text = table.Rows[0]["region"].ToString();
                    this.txtfojasdominio.Text = table.Rows[0]["fojasdominio"].ToString();
                    this.txtnumerodominio.Text = table.Rows[0]["numerodominio"].ToString();
                    this.txtaniodominio.Text = table.Rows[0]["aniodominio"].ToString();
                    this.txtfojashipoteca.Text = table.Rows[0]["fojashipoteca"].ToString();
                    this.txtnumerohipoteca.Text = table.Rows[0]["numerohipoteca"].ToString();
                    this.txtaniohipoteca.Text = table.Rows[0]["aniohipoteca"].ToString();
                    this.txtfojasprohibicion.Text = table.Rows[0]["fojasprohibicion"].ToString();
                    this.txtnumeroprohibicion.Text = table.Rows[0]["numeroprohibicion"].ToString();
                    this.txtanioprohibicion.Text = table.Rows[0]["anioprohibicion"].ToString();
                    this.txtfechacontabilizacion.Text = table.Rows[0]["fechacontabilizacion"].ToString();
                    this.txtfechaentrega.Text = table.Rows[0]["fechaentrega"].ToString();
                    this.txtfechaescritura.Text = table.Rows[0]["fechaescritura"].ToString();
                    this.txtnotaria.Text = table.Rows[0]["notaria"].ToString();
                    this.txtcomunanotaria.Text = table.Rows[0]["comunanotaria"].ToString();
                    this.txtreportorio.Text = table.Rows[0]["reportorio"].ToString();
                    this.txtprotocolo.Text = table.Rows[0]["protocolo"].ToString();
                    this.cbxEstado.Text = table.Rows[0]["codigoestado"].ToString();
                    this.txtfechaestado.Text = table.Rows[0]["fechaestado"].ToString();
                    this.txtobservacion.Text = table.Rows[0]["observacion"].ToString();
                    this.txtnrocarillas.Text = table.Rows[0]["nrocarillas"].ToString();
                    this.txtfactura.Text = table.Rows[0]["factura"].ToString();
                    this.txtfechafactura.Text = table.Rows[0]["fechafactura"].ToString();
                    this.txtmontofactura.Text = table.Rows[0]["montofactura"].ToString();
                    this.txtfecha_producto.Text = table.Rows[0]["fecha_remesa"].ToString();
                    this.txtproducto.Text = table.Rows[0]["remesa"].ToString();
                    this.txtcentrocosto.Text = table.Rows[0]["centrocosto"].ToString();
                    this.hddCodigoEstado.Value = table.Rows[0]["codigoestado"].ToString();
                    this.hddFechaEstado.Value = table.Rows[0]["fechaestado"].ToString();
                    this.hddObservacion.Value = table.Rows[0]["observacion"].ToString();
                }
            }
        }
    }
}

