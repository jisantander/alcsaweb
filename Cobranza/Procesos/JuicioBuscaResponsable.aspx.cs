namespace CobranzaALC.Cobranza.Procesos
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Collections.Generic;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class JuicioBuscaResponsable : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack) return;

            string strCodigo = Request.QueryString["Codigo"];
            if (strCodigo.Equals("*"))
            {
                if (Session["CODIGOS_ASIGNACION_MASIVA"] != null && !string.IsNullOrEmpty(Session["CODIGOS_ASIGNACION_MASIVA"].ToString()))
                {
                    strCodigo = Session["CODIGOS_ASIGNACION_MASIVA"].ToString();
                    if (strCodigo.EndsWith(",")) strCodigo = strCodigo.Substring(0, strCodigo.Length - 1);
                }
                else
                {
                    this.Page.RegisterStartupScript("cerrar", "<script>window.close();</script>");
                    return;
                }
            }

            this.txtFechaAsignacion.Text = DateTime.Now.ToString("dd-MM-yyyy");
            this.hddOT.Value = strCodigo;
            this.txtOT.Text = this.hddOT.Value.ToString();
            this.ComboResponsables();
            this.ComboAbogados();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string[] arrCodigos = !hddOT.Value.Contains(",") ? new string[] { hddOT.Value } : hddOT.Value.Split(new char[] { ',' });
            DataTable objTabla = null;
            string strUsuario = this.Session["Usuario"].ToString();
            System.Text.StringBuilder strbCodigosError = new System.Text.StringBuilder();

            foreach (string strCodigo in arrCodigos)
                if (!string.IsNullOrEmpty(strCodigo))
                {
                    objTabla = Consulta.Valida_Rol_Rit(strCodigo);
                    if (objTabla != null && objTabla.Rows.Count > 0)
                        Transaccion.UpdateResponsablejuici(strCodigo, strUsuario, this.cbxAbogados.SelectedValue.ToString(), this.cbxResponsable.SelectedValue.ToString());
                    else strbCodigosError.AppendFormat("{0},", strCodigo);
                }

            if (strbCodigosError.Length > 0)
            {
                strbCodigosError = strbCodigosError.Remove(strbCodigosError.Length - 1, 1);
                this.Page.RegisterStartupScript("cerrar", string.Format("<script>RecargarPadre();alert('Los siguientes juicios no tienen roles asociados: {0}');</script>", strbCodigosError.ToString()));
            }
            else this.Page.RegisterStartupScript("cerrar", "<script>Cerrar();</script>");
        }

        private void ComboAbogados()
        {
            this.cbxAbogados.DataTextField = "nombres";
            this.cbxAbogados.DataValueField = "rut";
            this.cbxAbogados.DataSource = Consulta.ComboAbogados();
            this.cbxAbogados.DataBind();
        }

        private void ComboResponsables()
        {
            this.cbxResponsable.DataTextField = "nombres";
            this.cbxResponsable.DataValueField = "rut";
            this.cbxResponsable.DataSource = Consulta.ComboProcurador();
            this.cbxResponsable.DataBind();
        }
    }
}

