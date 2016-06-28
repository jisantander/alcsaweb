namespace CobranzaALC.Cobranza.Reconstitucion
{
    using System;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ReporteOtrosMarca : Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.lblFechaInforme.Text = DateTime.Now.ToString("dd-MM-yyyy");
                this.lblTITULO.Text = base.Request.QueryString["txtTitulo"].ToString();
                if (base.Request.QueryString["ot"].ToString() == "")
                {
                    this.lblot.Visible = false;
                }
                else
                {
                    this.txtOT.Text = base.Request.QueryString["ot"].ToString();
                }
                if (base.Request.QueryString["txtEstadoOT"].ToString() == "")
                {
                    this.lblestado0t.Visible = false;
                }
                else
                {
                    this.txtEstadoOT.Text = base.Request.QueryString["txtEstadoOT"].ToString();
                }
                if (base.Request.QueryString["txtResponsable"].ToString() == "")
                {
                    this.lblresponsable.Visible = false;
                }
                else
                {
                    this.txtResponsable.Text = base.Request.QueryString["txtResponsable"].ToString();
                }
                if (base.Request.QueryString["txtsubproducto"].ToString() == "")
                {
                    this.lblsubproducto.Visible = false;
                }
                else
                {
                    this.txtsubproducto.Text = base.Request.QueryString["txtsubproducto"].ToString();
                }
                if (base.Request.QueryString["txtprod"].ToString() == "")
                {
                    this.lblproducto.Visible = false;
                }
                else
                {
                    this.txtprod.Text = base.Request.QueryString["txtprod"].ToString();
                }
                if (base.Request.QueryString["txtTipoDoc"].ToString() == "")
                {
                    this.lbltipodocumento.Visible = false;
                }
                else
                {
                    this.txtTipoDoc.Text = base.Request.QueryString["txtTipoDoc"].ToString();
                }
                if (base.Request.QueryString["txtnrooperacion"].ToString() == "")
                {
                    this.lblnrooperacion.Visible = false;
                }
                else
                {
                    this.txtnrooperacion.Text = base.Request.QueryString["txtnrooperacion"].ToString();
                }
                if (base.Request.QueryString["txtrutcliente"].ToString() == "")
                {
                    this.lblrutcliente.Visible = false;
                }
                else
                {
                    this.txtrutcliente.Text = base.Request.QueryString["txtrutcliente"].ToString();
                }
                if (base.Request.QueryString["txtdv"].ToString() == "")
                {
                    this.lbldv.Visible = false;
                }
                else
                {
                    this.txtdv.Text = base.Request.QueryString["txtdv"].ToString();
                }
                if (base.Request.QueryString["txtnombrecliente"].ToString() == "")
                {
                    this.lblnombrecliente.Visible = false;
                }
                else
                {
                    this.txtnombrecliente.Text = base.Request.QueryString["txtnombrecliente"].ToString();
                }
                if (base.Request.QueryString["txtdireccion"].ToString() == "")
                {
                    this.lbldireccion.Visible = false;
                }
                else
                {
                    this.txtdireccion.Text = base.Request.QueryString["txtdireccion"].ToString();
                }
                if (base.Request.QueryString["txtcomuna"].ToString() == "")
                {
                    this.lblcomuna.Visible = false;
                }
                else
                {
                    this.txtcomuna.Text = base.Request.QueryString["txtcomuna"].ToString();
                }
                if (base.Request.QueryString["txtconservador"].ToString() == "")
                {
                    this.lblconservador.Visible = false;
                }
                else
                {
                    this.txtconservador.Text = base.Request.QueryString["txtconservador"].ToString();
                }
                if (base.Request.QueryString["txtregion"].ToString() == "")
                {
                    this.lblregion.Visible = false;
                }
                else
                {
                    this.txtregion.Text = base.Request.QueryString["txtregion"].ToString();
                }
                if (base.Request.QueryString["txtfojasdominio"].ToString() == "")
                {
                    this.lblfojasdominio.Visible = false;
                }
                else
                {
                    this.txtfojasdominio.Text = base.Request.QueryString["txtfojasdominio"].ToString();
                }
                if (base.Request.QueryString["txtnumerodominio"].ToString() == "")
                {
                    this.lblnrodominio.Visible = false;
                }
                else
                {
                    this.txtnumerodominio.Text = base.Request.QueryString["txtnumerodominio"].ToString();
                }
                if (base.Request.QueryString["txtaniodominio"].ToString() == "")
                {
                    this.lblaniodominio.Visible = false;
                }
                else
                {
                    this.txtaniodominio.Text = base.Request.QueryString["txtaniodominio"].ToString();
                }
                if (base.Request.QueryString["txtfojashipoteca"].ToString() == "")
                {
                    this.lblfojashipoteca.Visible = false;
                }
                else
                {
                    this.txtfojashipoteca.Text = base.Request.QueryString["txtfojashipoteca"].ToString();
                }
                if (base.Request.QueryString["txtnumerohipoteca"].ToString() == "")
                {
                    this.lblnrohipoteca.Visible = false;
                }
                else
                {
                    this.txtnumerohipoteca.Text = base.Request.QueryString["txtnumerohipoteca"].ToString();
                }
                if (base.Request.QueryString["txtaniohipoteca"].ToString() == "")
                {
                    this.lblaniohipoteca.Visible = false;
                }
                else
                {
                    this.txtaniohipoteca.Text = base.Request.QueryString["txtaniohipoteca"].ToString();
                }
                if (base.Request.QueryString["txtfojasprohibicion"].ToString() == "")
                {
                    this.lblfojasprohibiciones.Visible = false;
                }
                else
                {
                    this.txtfojasprohibicion.Text = base.Request.QueryString["txtfojasprohibicion"].ToString();
                }
                if (base.Request.QueryString["txtnumeroprohibicion"].ToString() == "")
                {
                    this.lblnroprohibiciones.Visible = false;
                }
                else
                {
                    this.txtnumeroprohibicion.Text = base.Request.QueryString["txtnumeroprohibicion"].ToString();
                }
                if (base.Request.QueryString["txtanioprohibicion"].ToString() == "")
                {
                    this.lblanioprohibiciones.Visible = false;
                }
                else
                {
                    this.txtanioprohibicion.Text = base.Request.QueryString["txtanioprohibicion"].ToString();
                }
                if (base.Request.QueryString["txtfechacontabilizacion"].ToString() == "")
                {
                    this.lblfechacontabilizacion.Visible = false;
                }
                else
                {
                    this.txtfechacontabilizacion.Text = base.Request.QueryString["txtfechacontabilizacion"].ToString();
                }
                if (base.Request.QueryString["txtfechaentrega"].ToString() == "")
                {
                    this.lblfechaentrega.Visible = false;
                }
                else
                {
                    this.txtfechaentrega.Text = base.Request.QueryString["txtfechaentrega"].ToString();
                }
                if (base.Request.QueryString["txtfechaescritura"].ToString() == "")
                {
                    this.lblfechaescritura.Visible = false;
                }
                else
                {
                    this.txtfechaescritura.Text = base.Request.QueryString["txtfechaescritura"].ToString();
                }
                if (base.Request.QueryString["txtnotaria"].ToString() == "")
                {
                    this.lblnotaria.Visible = false;
                }
                else
                {
                    this.txtnotaria.Text = base.Request.QueryString["txtnotaria"].ToString();
                }
                if (base.Request.QueryString["txtcomunanotaria"].ToString() == "")
                {
                    this.lblcomunanotaria.Visible = false;
                }
                else
                {
                    this.txtcomunanotaria.Text = base.Request.QueryString["txtcomunanotaria"].ToString();
                }
                if (base.Request.QueryString["txtreportorio"].ToString() == "")
                {
                    this.lblrepertorio.Visible = false;
                }
                else
                {
                    this.txtreportorio.Text = base.Request.QueryString["txtreportorio"].ToString();
                }
                if (base.Request.QueryString["txtprotocolo"].ToString() == "")
                {
                    this.lblprotocolo.Visible = false;
                }
                else
                {
                    this.txtprotocolo.Text = base.Request.QueryString["txtprotocolo"].ToString();
                }
                if (base.Request.QueryString["cbxEstado"].ToString() == "")
                {
                    this.lblestado.Visible = false;
                }
                else
                {
                    this.cbxEstado.Text = base.Request.QueryString["cbxEstado"].ToString();
                }
                if (base.Request.QueryString["txtfechaestado"].ToString() == "")
                {
                    this.lblfechaestado.Visible = false;
                }
                else
                {
                    this.txtfechaestado.Text = base.Request.QueryString["txtfechaestado"].ToString();
                }
                if (base.Request.QueryString["txtobservacion"].ToString() == "")
                {
                    this.lblobservacion.Visible = false;
                }
                else
                {
                    this.txtobservacion.Text = base.Request.QueryString["txtobservacion"].ToString();
                }
                if (base.Request.QueryString["txtnrocarillas"].ToString() == "")
                {
                    this.lblnrocarillas.Visible = false;
                }
                else
                {
                    this.txtnrocarillas.Text = base.Request.QueryString["txtnrocarillas"].ToString();
                }
                if (base.Request.QueryString["txtfactura"].ToString() == "")
                {
                    this.lblfactura.Visible = false;
                }
                else
                {
                    this.txtfactura.Text = base.Request.QueryString["txtfactura"].ToString();
                }
                if (base.Request.QueryString["txtfechafactura"].ToString() == "")
                {
                    this.lblfechafactura.Visible = false;
                }
                else
                {
                    this.txtfechafactura.Text = base.Request.QueryString["txtfechafactura"].ToString();
                }
                if (base.Request.QueryString["txtmontofactura"].ToString() == "")
                {
                    this.lblmontofactura.Visible = false;
                }
                else
                {
                    this.txtmontofactura.Text = base.Request.QueryString["txtmontofactura"].ToString();
                }
                if (base.Request.QueryString["txtfecha_producto"].ToString() == "")
                {
                    this.lblfecharemesa.Visible = false;
                }
                else
                {
                    this.txtfecha_producto.Text = base.Request.QueryString["txtfecha_producto"].ToString();
                }
                if (base.Request.QueryString["txtfecha_producto"].ToString() == "")
                {
                    this.lblfecharemesa.Visible = false;
                }
                else
                {
                    this.txtfecha_producto.Text = base.Request.QueryString["txtfecha_producto"].ToString();
                }
                if (base.Request.QueryString["txtremesa"].ToString() == "")
                {
                    this.lblremesa.Visible = false;
                }
                else
                {
                    this.txtproducto_remesa.Text = base.Request.QueryString["txtremesa"].ToString();
                }
                if (base.Request.QueryString["txtcentrocosto"].ToString() == "")
                {
                    this.lblcentrocosto.Visible = false;
                }
                else
                {
                    this.txtcentrocosto.Text = base.Request.QueryString["txtcentrocosto"].ToString();
                }
            }
        }
    }
}

