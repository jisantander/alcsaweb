namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class popAsignacion : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (this.Page.IsPostBack) return;

            this.txtOT.Text = base.Request.QueryString["OT"].Trim();
            this.ComboResponsables();

            string[] arrOts = txtOT.Text.Split(new char[] { ',' });
            DataTable table = Consulta.ReconstitucionByRut(arrOts[0]);
            if (table != null && table.Rows.Count > 0)
            {
                this.txtEntrega.Text = table.Rows[0]["fechaentrega"].ToString();
                this.txtFechaRemesa.Text = table.Rows[0]["fecha_remesa"].ToString();
                // this.hddUserResponsable.Value = table.Rows[0]["user_responsable"].ToString();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string[] arrOts = txtOT.Text.Split(new char[] { ',' });
            string strUsuario = this.Session["Usuario"].ToString();
            foreach (string strOt in arrOts)
                if (!string.IsNullOrEmpty(strOt))
                    Transaccion.UpdateResponsableReconstitucion(
                        strOt.Trim(),
                        this.cbxResponsable.SelectedValue,
                        strUsuario
                    );

            this.Page.RegisterStartupScript("cerrar", "<script>window.close();</script>");
        }

        private void ComboResponsables()
        {
            this.cbxResponsable.DataSource = Consulta.ComboResponsablesReconstitucion();
            this.cbxResponsable.DataBind();
        }
    }
}

