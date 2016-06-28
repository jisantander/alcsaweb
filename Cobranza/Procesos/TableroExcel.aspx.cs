namespace CobranzaALC.Cobranza.Procesos
{
    using System;
    using System.Data;
    using System.IO;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class TableroExcel : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.EnableViewState = false;

            string strParametro1 = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "par1");
            string strParametro2 = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "par2");
            string strParametro3 = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "par3");
            string strParametro4 = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "par4");
            string strParametro5 = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "par5");
            string strParametro6 = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "par6");
            string strParametro7 = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "par7");
            string strParametro8 = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "par8");
            string strParametro9 = ALCSA.FWK.Web.Sitio.ExtraerValorQueryString(Request, "par9");
            int intParametro10 = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "par10");
            int intParametro11 = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "par11");
            int intParametro12 = ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "par12");

            DataTable datTabla = ALCLOCAL.ConsultasEspecificas.ConsultaTableroDOS(
                strParametro1,
                strParametro2,
                strParametro3,
                strParametro4,
                strParametro5,
                strParametro6,
                strParametro7,
                strParametro8,
                strParametro9,
                intParametro10,
                intParametro11.Equals(1),
                intParametro12
            );


            string strNombreArchivo = string.Format("Tablero_{0:ddMMyyyy_hhmmss_fff}.xls", DateTime.Now);

            using (System.IO.MemoryStream objArchivoMemoria = new ALCSA.Negocio.Documentos.GeneradorExcel().ExportarDataTableAExcel(
                datTabla,
                "Tablero",
                new string[] {
                    "cliente", "abogado", "NombreRemesa",
                    "procurador", "nrooperacion", "procedimiento",
                    "materia", "producto", "rut_deudor",
                    "nomdeudor", "tipocobranza", "estadocobranza",
                    "tribunal", "rol", "tramite",
                    "ftramite", "proxgestion", "fechaproxgestion",
                    "DiasSinGestion", "subtramite", "fechasubtramite",
                    "EstadoJuicio", "IdCampanaCallCenter", "observacion"
                },
                new string[] {
                    "Acreedor", "Abogado", "Remesa",
                    "Procurador", "N° Operación", "Procedimiento",
                    "Materia", "Producto", "Rut Deudor",
                    "Nombre Deudor", "Tipo Cobranza", "Estado Cobranza",
                    "Tribunal", "Rol" ,  "Tramite",
                    "F. Tramite", "Prox. Gestión", "F. Prox. Gestión",
                    "Días sin Gestión", "SubTrámite", "F. SubTrámite",
                    "Estado Juicio", "ID Campaña Call Center", "Observación"
                }))
            {
                new ALCSA.FWK.Web.Sitio().DescargarArchivo(Response, objArchivoMemoria, strNombreArchivo);
            }
        }
    }
}

