using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace CobranzaALC.Servicios
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class ListadosAutocompletar
    {
        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.WrappedRequest, ResponseFormat = WebMessageFormat.Json)]
        public IList<ALCSA.Entidades.Parametros.Salidas.Personas.Basico> ListarClientes(string term)
        {
            return new ALCSA.Negocio.Deudor().ListarSimilares(term);
        }

        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.WrappedRequest, ResponseFormat = WebMessageFormat.Json)]
        public IList<ALCSA.Entidades.Parametros.Salidas.Domicilios.Basico> ListarDomicilios(string term)
        {
            return new ALCSA.Negocio.Domicilio().ListarSimilares(term);
        }

        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.WrappedRequest, ResponseFormat = WebMessageFormat.Json)]
        public IList<ALCSA.Entidades.Base> ListarPorConcepto(string concepto)
        {
            return new ALCSA.Negocio.ServiciosJson.ListadorConceptos().Listar(concepto);
        }

        [OperationContract]
        [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.WrappedRequest, ResponseFormat = WebMessageFormat.Json)]
        public IList<ALCSA.Entidades.Parametros.Salidas.Cobranzas.Mutuo.BienRaiz> ListarBienesRaicesDisponiblesMutuo(string rutDeudor, int idBienRaizActual)
        {
            if (rutDeudor == null) return null;
            return new ALCSA.Negocio.Cobranzas.Mutuo().ListarBienesRaicesDisponibles(rutDeudor.Replace(".", string.Empty), idBienRaizActual);
        }
        
    }
}
