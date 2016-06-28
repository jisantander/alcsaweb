namespace CobranzaALC.Cobranza.Reconstitucion
{
    using System;
    using System.Data;
    using System.IO;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ExcelConsultaGastos : Page
    {

        private void Excel()
        {
            StringBuilder sb = new StringBuilder();
            StringWriter writer = new StringWriter(sb);
            HtmlTextWriter writer2 = new HtmlTextWriter(writer);
            Page page = new Page();
            HtmlForm child = new HtmlForm();
            this.Grilla.EnableViewState = false;
            page.EnableEventValidation = false;
            page.DesignerInitialize();
            page.Controls.Add(child);
            child.Controls.Add(this.Grilla);
            page.RenderControl(writer2);
            base.Response.Clear();
            base.Response.Buffer = true;
            base.Response.ContentType = "application/vnd.ms-excel";
            base.Response.AddHeader("Content-Disposition", "attachment;filename=GastosReconstituciones.xls");
            base.Response.Charset = "UTF-8";
            base.Response.ContentEncoding = Encoding.Default;
            base.Response.Write(sb.ToString());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                DataTable table = null;
                table = (DataTable) this.Session["Excel_GastosReconstituciones"];
                if ((table == null) || (table.Rows.Count < 1))
                {
                    base.Response.Write("NO EXISTEN REGISTROS");
                }
                else
                {
                    this.Grilla.DataSource = table;
                    this.Grilla.DataBind();
                    this.Excel();
                    base.Response.End();
                }
            }
        }
    }
}

