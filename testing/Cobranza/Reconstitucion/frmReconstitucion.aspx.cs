namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class frmReconstitucion : Page
    {
        
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if ((this.cbxEstado.SelectedValue.ToString() == "900") || (this.cbxEstado.SelectedValue.ToString() == "902"))
            {
                if (!(this.Session["Usuario"].ToString().Trim().ToUpper() == "ETORRES"))
                {
                    ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Mensaje", "alert('Atenci\x00f3n! Solo la Srta. Evelyn Torres est\x00e1 autorizada terminar una OT');", true);
                    return;
                }
                Transaccion.CerrarOTReconstitucion(this.hiddOT.Value.ToString());
                this.hddCodigoEstado.Value = "900";
                this.txtEstadoOT.Text = "TERMINADA";
                this.pnlFORMULARIO.Enabled = false;
                this.btnGuardar.Enabled = false;
            }
            Transaccion.UpdateReconstitucionResponsable(this.hiddOT.Value.ToString(), this.txtTipoDoc.Text.ToString(), this.txtfojasdominio.Text.ToString(), this.txtnumerodominio.Text.ToString(), this.txtaniodominio.Text.ToString(), this.txtfojashipoteca.Text.ToString(), this.txtnumerohipoteca.Text.ToString(), this.txtaniohipoteca.Text.ToString(), this.txtfojasprohibicion.Text.ToString(), this.txtnumeroprohibicion.Text.ToString(), this.txtanioprohibicion.Text.ToString(), this.txtfechaescritura.Text.ToString(), this.txtnotaria.Text.ToString(), this.txtcomunanotaria.Text.ToString(), this.txtreportorio.Text.ToString(), this.txtprotocolo.Text.ToString(), this.cbxEstado.SelectedValue.ToString(), this.txtfechaestado.Text.ToString(), this.txtobservacion.Text.ToString(), this.txtnrocarillas.Text.ToString(), this.txtfactura.Text.ToString(), this.txtfechafactura.Text.ToString(), this.txtmontofactura.Text.ToString(), this.txtcentrocosto.Text.ToString(), this.txtconservador.Text.ToString(), this.txtregion.Text.ToString(), this.txtdireccion.Text.ToString(), this.txtcomuna.Text.ToString(), this.txtfechacontabilizacion.Text.ToString());
            if (this.hddCodigoEstado.Value.ToString().Trim() != this.cbxEstado.SelectedValue.ToString().Trim())
            {
                Transaccion.InsertaBitacoraEstadoReconstitucion(this.hiddOT.Value.ToString(), this.cbxEstado.SelectedValue.ToString(), this.txtobservacion.Text.ToString(), this.Session["Usuario"].ToString());
                this.hddCodigoEstado.Value = this.cbxEstado.SelectedValue.ToString();
            }
            else
            {
                Transaccion.InsertaBitacoraEstadoReconstitucion(this.hiddOT.Value.ToString(), this.cbxEstado.SelectedValue.ToString(), this.txtobservacion.Text.ToString(), this.Session["Usuario"].ToString());
                this.hddCodigoEstado.Value = this.cbxEstado.SelectedValue.ToString();
            }
        }

        protected void cbxEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.cbxEstado.SelectedValue.ToString() == "100")
            {
                ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Mensaje", "alert('Atenci\x00f3n! No se puede a volver a estado [Busqueda Inscripci\x00f3n]');", true);
                this.cbxEstado.SelectedValue = this.hddCodigoEstado.Value.ToString();
                this.txtobservacion.Focus();
            }
            else if (((this.cbxEstado.SelectedValue.ToString() == "900") || (this.cbxEstado.SelectedValue.ToString() == "902")) && !(this.Session["Usuario"].ToString().Trim().ToUpper() == "ETORRES"))
            {
                ScriptManager.RegisterStartupScript(this.Page, base.GetType(), "Mensaje", "alert('Atenci\x00f3n! Solo la Srta. Evelyn Torres est\x00e1 autorizada para terminar una OT');", true);
                this.cbxEstado.SelectedValue = this.hddCodigoEstado.Value.ToString();
                this.txtobservacion.Focus();
            }
            else
            {
                this.txtobservacion.Text = "";
                this.txtfechaestado.Text = DateTime.Now.ToString("dd/MM/yyyy");
                this.txtobservacion.Focus();
            }
        }

        private void ComboEstados()
        {
            this.cbxEstado.DataTextField = "descripcion";
            this.cbxEstado.DataValueField = "id";
            this.cbxEstado.DataSource = Consulta.ComboEstadosReconstitucion();
            this.cbxEstado.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!this.Page.IsPostBack)
            {
                if (!(this.Session["Perfil"].ToString() == "1" ))
                {
                    this.btnDigitalizar.Enabled = false;
                    this.btnReversarDos.Visible = false;
                    this.btnGastos.Visible = false;
                    this.btnEditarGastos.Visible = false;
                }
                
                this.txtTipoDoc.Focus();
                this.ComboEstados();
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
                    this.cbxEstado.SelectedValue = table.Rows[0]["codigoestado"].ToString();
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
                if (this.hddCodigoEstado.Value.ToString().Trim() != "900" && this.hddCodigoEstado.Value.ToString().Trim() != "902")
                {
                    this.btnReversarDos.Visible = false;
                }
              
                if (this.hddCodigoEstado.Value.ToString().Trim() == "900" || this.hddCodigoEstado.Value.ToString().Trim() == "902")
                {
                    this.pnlFORMULARIO.Enabled = false;
                    this.btnGuardar.Enabled = false;
                }                
                else if (this.Session["Usuario"].ToString().Trim().ToUpper() != "ETORRES")
                {
                    if (this.hddUserResponsable.Value.ToString().Trim().ToUpper() != this.Session["Usuario"].ToString().Trim().ToUpper())
                    {
                        if (this.Session["Perfil"].ToString() != "1")
                            {
                                this.pnlFORMULARIO.Enabled = false;
                                this.btnGuardar.Enabled = false;
                            }                  
                    }
                    else
                    {
                        this.btnGastos.Visible = true;
                        if ((this.hddCodigoEstado.Value.ToString().Trim() == "900") || (this.hddCodigoEstado.Value.ToString().Trim() == "902"))
                        {
                            this.pnlFORMULARIO.Enabled = false;
                            this.btnGuardar.Enabled = false;
                        }
                    }
                }

                if (this.Session["Perfil"].ToString() == "9")
                {
                    //this.btnEditarGastos.Visible = true;
                    this.Button2.Visible = true;
                    this.btnBitacora.Visible = true;
                    this.btnDigitalizar.Visible = true;
                    this.btnGuardar.Visible = true;
                    this.btnGastos.Visible = true;

                    this.pnlFORMULARIO.Enabled = true;
                    this.btnEditarGastos.Enabled = true;
                    this.Button2.Enabled = true;
                    this.btnBitacora.Enabled = true;
                    this.btnDigitalizar.Enabled = true;
                    this.btnGuardar.Enabled = true;
                    this.btnGastos.Enabled = true;
                }
                if (this.hddCodigoEstado.Value.ToString().Trim() == "912")
                {
                    this.pnlFORMULARIO.Enabled = false;
                    this.btnEditarGastos.Visible = true;
                    this.Button2.Visible = true;
                    this.btnBitacora.Visible = true;
                    this.btnDigitalizar.Visible = true;
                    this.btnGuardar.Visible = false;
                    this.btnGastos.Visible = true;

                    this.btnEditarGastos.Enabled = true;
                    this.Button2.Enabled = true;
                    this.btnBitacora.Enabled = true;
                    this.btnDigitalizar.Enabled = true;
                    this.btnGuardar.Enabled = false;
                    this.btnGastos.Enabled = true;
                }

            }
        }

       

    }
}

