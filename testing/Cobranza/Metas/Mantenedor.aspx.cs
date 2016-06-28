using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.Metas
{
    public partial class Mantenedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            ddlEtapas.DataSource = new ALCSA.Negocio.Procuradores.Metas.Meta().ListarEtapas();
            ddlEtapas.DataBind();
            ddlEtapas.Items.Add("TERMINO");

            CargarTramites();

            int intId = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id");
            if (intId < 1) return;

            ALCSA.Negocio.Procuradores.Metas.Meta objMeta = new ALCSA.Negocio.Procuradores.Metas.Meta(intId);
            if (objMeta.ID < 1) return;


            ALCSA.FWK.Web.Control.AsignarValor(lblIdMeta, objMeta.ID);
            ALCSA.FWK.Web.Control.SeleccionarValor(ddlEtapas, objMeta.Etapa);
            CargarTramites();

            ALCSA.FWK.Web.Control.AsignarValor(txtNumero, objMeta.Numero);
            ALCSA.FWK.Web.Control.AsignarValor(txtFechaDesde, objMeta.FechaDesde);
            ALCSA.FWK.Web.Control.AsignarValor(txtFechaHasta, objMeta.FechaHasta);

            // SELECCIONAR TRAMITES
            foreach (ListItem objItem in chklTramites.Items)
                foreach (ALCSA.Entidades.Base objTramite in objMeta.Tramites)
                    if (objItem.Value == objTramite.Nombre)
                        objItem.Selected = true;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string strUsuario = Session["Usuario"] != null ? Session["Usuario"].ToString() : string.Empty;

            ALCSA.Negocio.Procuradores.Metas.Meta objMeta1 = new ALCSA.Negocio.Procuradores.Metas.Meta()
            {
                ID = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(lblIdMeta),
                Etapa = ddlEtapas.SelectedValue,
                Numero = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(txtNumero),
                UsuarioIngreso = strUsuario,
                FechaDesde = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaDesde),
                FechaHasta = ALCSA.FWK.Web.Control.ExtraerValorComoDateTime(txtFechaHasta)
            };

            // GUARDAR TRAMITES
            objMeta1.Tramites = new List<ALCSA.Entidades.Base>();
            foreach (ListItem objItem in chklTramites.Items)
                if (objItem.Selected)
                    objMeta1.Tramites.Add(new ALCSA.Entidades.Base() { Nombre = objItem.Value });

            objMeta1.Guardar();
            Response.Redirect("Listado.aspx?mensaje=1", true);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Listado.aspx", true);
        }

        private void CargarTramites()
        {
            chklTramites.DataSource = new ALCSA.Negocio.Procuradores.Metas.Meta().ListarTramites(ddlEtapas.SelectedValue);
            chklTramites.DataBind();
        }

        protected void ddlEtapas_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarTramites();
        }
    }
}