using System;
using System.Data;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC.Cobranza.ConsultaEspecial
{
    public partial class ExcelBienMueble : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                DataTable dataSource = (DataTable)this.Session["BI_MUEBLES"];
                this.Grilla.DataSource = dataSource;
                this.Grilla.DataBind();
                StringBuilder stringBuilder = new StringBuilder();
                StringWriter writer = new StringWriter(stringBuilder);
                HtmlTextWriter writer2 = new HtmlTextWriter(writer);
                Page page = new Page();
                HtmlForm htmlForm = new HtmlForm();
                this.Grilla.EnableViewState = false;
                page.EnableEventValidation = false;
                page.DesignerInitialize();
                page.Controls.Add(htmlForm);
                htmlForm.Controls.Add(this.Grilla);
                page.RenderControl(writer2);
                base.Response.Clear();
                base.Response.Buffer = true;
                base.Response.ContentType = "application/vnd.ms-excel";
                base.Response.AddHeader("Content-Disposition", "attachment; filename=BienMueble.xls");
                base.Response.Charset = "UTF-8";
                base.Response.ContentEncoding = Encoding.Default;
                base.Response.Write(stringBuilder.ToString());
                base.Response.End();
            }
        }
    }
}