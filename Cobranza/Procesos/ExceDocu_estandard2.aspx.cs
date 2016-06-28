namespace CobranzaALC.Cobranza.Procesos
{
    using System;
    using System.Data;
    using System.IO;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class ExceDocu_estandard2 : Page
    {

        protected string Evaluar(object Rol)
        {
            Rol = "'" + Rol.ToString();
            return Rol.ToString();
        }

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
            base.Response.AddHeader("Content-Disposition", "attachment;filename=ExcelDocuEstandard2.xls");
            base.Response.Charset = "UTF-8";
            base.Response.ContentEncoding = Encoding.Default;
            base.Response.Write(sb.ToString());
        }

        public void ExportarPdf()
        {
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                DataTable table = null;
                table = (DataTable) this.Session["docu_juicio_estandard_2"];
                int count = table.Rows.Count;
                if ((table != null) && (table.Rows.Count >= 1))
                {
                    this.Grilla.DataSource = table;
                    this.Grilla.DataBind();
                    this.Excel();
                    base.Response.End();
                }
            }
        }

        private void ShowPdf(string strS)
        {
            base.Response.ClearContent();
            base.Response.ClearHeaders();
            base.Response.ContentType = "application/pdf";
            base.Response.AddHeader("Content-Disposition", "attachment; filename=" + strS);
            base.Response.TransmitFile(strS);
            base.Response.End();
            base.Response.WriteFile(strS);
            base.Response.Flush();
            base.Response.Clear();
        }
    }
}

