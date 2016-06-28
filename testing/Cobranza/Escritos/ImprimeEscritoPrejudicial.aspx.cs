namespace CobranzaALC.Cobranza.Escritos
{
    using ALCLOCAL;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ImprimeEscritoPrejudicial : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            this.lblFecha.Text = string.Format("{0:dd} de {1} de {0:yyyy}", DateTime.Now, ALCSA.FWK.Tiempo.MESES[DateTime.Now.Month - 1]);

            if (string.IsNullOrEmpty(Request.QueryString["Codigo"])
                || string.IsNullOrEmpty(Request.QueryString["Cliente"])
                || string.IsNullOrEmpty(Request.QueryString["deudor"])) return;

            lblcliente.Text = Request.QueryString["Cliente"];
            lblDeudor.Text = Request.QueryString["deudor"];
            lblDireccion.Text = Request.QueryString["direccion"];
            lblComuna.Text = string.Empty;

            string strComuna = Request.QueryString["comuna"];
            if (!string.IsNullOrEmpty(strComuna) && strComuna.Contains("|"))
                lblComuna.Text = strComuna.Split(new char[] { '|' })[1].ToString();

            this.CargaGrilla(ALCSA.FWK.Web.Sitio.ExtraerValorQueryStringComoEntero(Request, "Codigo"));
        }

        private void CargaGrilla(int idCobranza)
        {
            ALCSA.FWK.BD.Servicio objServicio = new ALCSA.FWK.BD.Servicio() { Conexion = "CONN", Comando = "dbo.SPALC_PREJUDICIAL_LISTAR_DOCUMENTOS" };

            objServicio.Parametros = new List<ALCSA.FWK.BD.Parametro>();
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@INT_IdCobranza", Valor = idCobranza, Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });

            // DataTable table = ConsultasEspecificas.EscritoPrejudicialPrint(id_cobranza);
            DataTable objTabla = objServicio.EjecutarDataTable();
            this.Grilla.DataSource = objTabla;
            this.Grilla.DataBind();
            this.lblCantidad.Text = string.Format("{0} documento{1}", objTabla.Rows.Count, objTabla.Rows.Count.Equals(1) ? string.Empty : "s");
        }

        protected string Evaluar(object monto)
        {
            return string.Format("{0:N0}", monto).Replace(",", ".");
        }
    }
}

