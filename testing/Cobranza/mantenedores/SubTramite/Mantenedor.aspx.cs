using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.mantenedores.SubTramite
{
    public partial class Mantenedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ----------------------------------------------------------------------------------
            if (IsPostBack) return;
            // ----------------------------------------------------------------------------------
            CargarTramites();
            // ----------------------------------------------------------------------------------
            CargarSubTramite(ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id"));
            // ----------------------------------------------------------------------------------
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // -----------------------------------------------------------------------------------
            ALCSA.Negocio.Tramites.SubTramite objSubTramite = new ALCSA.Negocio.Tramites.SubTramite();
            objSubTramite.ID = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(lblIdSubTramite);
            objSubTramite.Vigente = chkEsVigente.Checked;
            objSubTramite.Descripcion = ALCSA.FWK.Web.Control.ExtraerValor(txtNombre);
            objSubTramite.Tipo = ALCSA.FWK.Web.Control.ExtraerValor(ddlTipo);
            objSubTramite.Termino = "N";
            objSubTramite.Guardar();
            // -----------------------------------------------------------------------------------
            // GUARDAR TRAMITES ASOCIADOS
            IList<ALCSA.Entidades.Tramites.Tramite> arrTramites = new ALCSA.Negocio.Tramites.Tramite().Listar(objSubTramite.ID);
            int intIdTramite = 0, intIndice = 0;
            foreach (GridViewRow objFila in gvTramites.Rows)
                if ((objFila.FindControl("chkSeleccionado") as CheckBox).Checked)
                {
                    intIdTramite = ALCSA.FWK.Web.Control.ExtraerValorComoEntero(objFila.FindControl("hdfIdTramite") as HiddenField);
                    intIndice = 0;
                    while (intIndice < arrTramites.Count)
                        if (arrTramites[intIndice].ID.Equals(intIdTramite))
                        {
                            arrTramites[intIndice].ID = 0;
                            intIdTramite = 0;
                            break;
                        }
                        else intIndice++;

                    if (intIdTramite > 0)
                        objSubTramite.AsociarTramite(intIdTramite);
                }
            // -----------------------------------------------------------------------------------
            // QUITAR ASOCIASIONES OBSOLETAS
            foreach (ALCSA.Entidades.Tramites.Tramite objTramite in arrTramites)
                if (objTramite.ID > 0)
                    objSubTramite.DesasociarTramite(objTramite.ID);
            // -----------------------------------------------------------------------------------
            // REDIRECCIONAR A LISTADO Y MOSTRAR MENSAJE
            Response.Redirect("Listar.aspx?mensaje=1", true);
            // -----------------------------------------------------------------------------------
        }

        protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarTramites();
        }

        private void CargarSubTramite(int id)
        {
            // -----------------------------------------------------------------------------------
            if (id < 1) return;
            // -----------------------------------------------------------------------------------
            ALCSA.Negocio.Tramites.SubTramite objSubTramite = new ALCSA.Negocio.Tramites.SubTramite(id);
            if (objSubTramite.ID < 1) return;
            // -----------------------------------------------------------------------------------
            lblIdSubTramite.Text = objSubTramite.ID.ToString("0000");
            chkEsVigente.Checked = objSubTramite.Vigente;
            txtNombre.Text = objSubTramite.Descripcion.Trim();
            ALCSA.FWK.Web.Control.SeleccionarValor(ddlTipo, objSubTramite.Tipo);
            // -----------------------------------------------------------------------------------
            // BUSCAR TRAMITES ASOCIADOS
            IList<ALCSA.Entidades.Tramites.Tramite> arrTramites = new ALCSA.Negocio.Tramites.Tramite().Listar(objSubTramite.ID);

            foreach (GridViewRow objFila in gvTramites.Rows)
                foreach (ALCSA.Entidades.Tramites.Tramite objTramite in arrTramites)
                    if (ALCSA.FWK.Web.Control.ExtraerValorComoEntero(objFila.FindControl("hdfIdTramite") as HiddenField) == objTramite.ID)
                    {
                        (objFila.FindControl("chkSeleccionado") as CheckBox).Checked = true;
                        break;
                    }
            // -----------------------------------------------------------------------------------
        }

        private void CargarTramites()
        {
            IList<ALCSA.Entidades.Tramites.Tramite> arrTramites = new ALCSA.Negocio.Tramites.Tramite().Listar(ddlTipo.SelectedValue, ALCSA.Negocio.Enumeradores.Estado.Basico.Vigente);
            for (int intIndice = 0; intIndice < arrTramites.Count; intIndice++)
                arrTramites[intIndice].Termino = arrTramites[intIndice].Termino == "N" ? "NO" : "SI";

            gvTramites.DataSource = arrTramites;
            gvTramites.DataBind();
        }
    }
}