using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza
{
    public partial class RedireccionMantenedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int intId = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "id");
            if (intId < 1) return;

            ALCSA.Negocio.Documentos.Fisicos.Documento objDocumento = new ALCSA.Negocio.Documentos.Fisicos.Documento(intId);
            if (objDocumento.ID < 1) return;

            ALCSA.Negocio.Documentos.Fisicos.TipoDocumento objTipo = new ALCSA.Negocio.Documentos.Fisicos.TipoDocumento(objDocumento.IdTipoDocumento);

            IList<ALCSA.Entidades.Documentos.Fisicos.Identificador> arrIdentificadores =
                new ALCSA.Negocio.Documentos.Fisicos.Identificador().Listar(objDocumento.ID);

            string strRuta = objTipo.RutaMantenedorObjeto;
            foreach (ALCSA.Entidades.Documentos.Fisicos.Identificador objIdentificador in arrIdentificadores)
                strRuta = strRuta.Replace(ConcatenarFormato(objIdentificador.CodigoTipoIdentificador), objIdentificador.Valor);

            int intIndiceInicial = 0, intIndiceFinal = 0;
            while ((intIndiceInicial = strRuta.IndexOf("{")) > 0)
            {
                intIndiceFinal = strRuta.IndexOf("}", intIndiceInicial);
                if (intIndiceFinal > 0)
                    strRuta = strRuta.Substring(intIndiceInicial, intIndiceFinal); 
            }

            Response.Redirect(strRuta, true);
        }

        private string ConcatenarFormato(string dato)
        {
            StringBuilder strbTexto = new StringBuilder();
            strbTexto.Append("{");
            strbTexto.Append(dato);
            strbTexto.Append("}");
            return strbTexto.ToString();
        }
    }
}