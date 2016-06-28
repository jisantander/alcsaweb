using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CobranzaALC
{
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtnombre.Focus();
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress("contactoalc@alcsa.cl"));
                mailMessage.From = new MailAddress(this.txtmail.Text.ToString());
                mailMessage.Subject = this.txtAsunto.Text.ToString();
                mailMessage.Body = this.txtcomentario.Text.ToString();
                mailMessage.Bcc.Add(new MailAddress("marcaro2001@gmail.com"));
                new SmtpClient("200.63.97.27", 25)
                {
                    Credentials = new NetworkCredential("csilva@alcsa.cl", "1234")
                }.Send(mailMessage);
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Mensaje enviado con éxito');self.close();</script>");
            }
            catch (Exception var_2_C2)
            {
                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Correo no válido, ingreselo nuevamente');</script>");
            }
        }
    }
}