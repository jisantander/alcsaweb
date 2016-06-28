using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC
{
    public partial class LectorCodigo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarCodigoBarra(txtValor.Text.ToUpper());
        }

        protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            CargarCodigoBarra(txtValor.Text.ToUpper());
        }

        private void CargarCodigoBarra(string valor)
        {
            if (string.IsNullOrWhiteSpace(valor)) return;

            ALCSA.Negocio.Documentos.Fisicos.CodigoBarra objCodigo = new ALCSA.Negocio.Documentos.Fisicos.CodigoBarra(valor);
            if (objCodigo.ID < 1) return;

            hdfRuta.Value = objCodigo.RutaMantenedor;
        }
    }
}