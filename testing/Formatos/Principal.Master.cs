using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CobranzaALC.Formatos
{
    public partial class Principal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConcatenarMenu();
        }

        private void ConcatenarMenu()
        {
            List<OpcionMenu> arrOpciones = new List<OpcionMenu>();
            arrOpciones.Add(new OpcionMenu() { ID = 1, IdPadre = 0, Nombre = "Mantenedores", Ruta = "#" });
            arrOpciones.Add(new OpcionMenu() { ID = 2, IdPadre = 0, Nombre = "Cobranza", Ruta = "#" });
            arrOpciones.Add(new OpcionMenu() { ID = 3, IdPadre = 0, Nombre = "Cobranza PreJudicial", Ruta = "#" });
            arrOpciones.Add(new OpcionMenu() { ID = 4, IdPadre = 0, Nombre = "Gastos", Ruta = "#" });
            arrOpciones.Add(new OpcionMenu() { ID = 5, IdPadre = 0, Nombre = "Modulo de Caja", Ruta = "#" });
            arrOpciones.Add(new OpcionMenu() { ID = 6, IdPadre = 0, Nombre = "Calculo Liquidación", Ruta = "#" });
            arrOpciones.Add(new OpcionMenu() { ID = 7, IdPadre = 0, Nombre = "Consultas Generales", Ruta = "#" });
            arrOpciones.Add(new OpcionMenu() { ID = 8, IdPadre = 0, Nombre = "Gestoría Documentación", Ruta = "#" });
            arrOpciones.Add(new OpcionMenu() { ID = 9, IdPadre = 0, Nombre = "Generador de Documentos", Ruta = "#" });
            arrOpciones.Add(new OpcionMenu() { ID = 10, IdPadre = 0, Nombre = "Digitalización", Ruta = "#" });
            arrOpciones.Add(new OpcionMenu() { ID = 11, IdPadre = 0, Nombre = "Metricas", Ruta = "#" });

            arrOpciones.Add(new OpcionMenu() { ID = 12, IdPadre = 1, Nombre = "Mantenedores 1", Ruta = "Cobranza/mantenedores/MntClientes.aspx" });
            arrOpciones.Add(new OpcionMenu() { ID = 13, IdPadre = 1, Nombre = "Mantenedores 2", Ruta = "Cobranza/mantenedores/MntDeudores.aspx" });
            arrOpciones.Add(new OpcionMenu() { ID = 14, IdPadre = 1, Nombre = "Mantenedores 3", Ruta = "Cobranza/mantenedores/MntUsuarios.aspx" });
            arrOpciones.Add(new OpcionMenu() { ID = 15, IdPadre = 1, Nombre = "Mantenedores 4", Ruta = "Cobranza/mantenedores/MntDomicilios.aspx" });
            arrOpciones.Add(new OpcionMenu() { ID = 16, IdPadre = 1, Nombre = "Mantenedores 5", Ruta = "Cobranza/mantenedores/MntBienRaiz.aspx" });
            arrOpciones.Add(new OpcionMenu() { ID = 17, IdPadre = 1, Nombre = "Mantenedores 6", Ruta = "Cobranza/mantenedores/MntBienMueble.aspx" });
            arrOpciones.Add(new OpcionMenu() { ID = 18, IdPadre = 1, Nombre = "Mantenedores 7", Ruta = "Cobranza/mantenedores/MntParametrosClientes.aspx" });
            arrOpciones.Add(new OpcionMenu() { ID = 19, IdPadre = 1, Nombre = "Mantenedores 8", Ruta = "Cobranza/procesos/BuscaDocuPrejudicial.aspx" });
            arrOpciones.Add(new OpcionMenu() { ID = 20, IdPadre = 1, Nombre = "Mantenedores 9", Ruta = "Cobranza/mantenedores/mntconservadores.aspx" });
            arrOpciones.Add(new OpcionMenu() { ID = 21, IdPadre = 1, Nombre = "Mantenedores 10", Ruta = "Cobranza/mantenedores/MntEstadosReconstitucion.aspx" });

            StringBuilder strbTexto = new StringBuilder();

            strbTexto.Append("<ul class=\"nav navbar-nav\">");
            strbTexto.Append("<li class=\"dropdown\">");
            strbTexto.Append("<ul class=\"dropdown-menu multi-level\">");
            strbTexto.Append("<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">");
            strbTexto.Append("Menú XX<b class=\"caret\"></b>");
            strbTexto.Append("</a>");
            strbTexto.Append(ConcatenarSubMenu(0, arrOpciones));
            strbTexto.Append("</ul>");
            strbTexto.Append("</li>");
            strbTexto.Append("</ul>");

            ltrMenu.Text = ConcatenarSubMenu(0, arrOpciones);
        }

        private string ConcatenarSubMenu(int id, List<OpcionMenu> opciones)
        {
            var arrOpciones = opciones.FindAll(x => x.IdPadre == id);

            StringBuilder strbTexto = new StringBuilder();

            foreach (var objOpcion in arrOpciones)
            {
                var arrSubOpciones = opciones.FindAll(x => x.IdPadre == objOpcion.ID);
                if (arrSubOpciones.Count.Equals(0))
                    strbTexto.AppendFormat(ConcatenarOpcion(objOpcion));
                else
                {
                    strbTexto.Append("<li class=\"dropdown-submenu\">");
                    strbTexto.AppendFormat("<a href=\"#\">{0}</a>", objOpcion.Nombre);
                    strbTexto.Append("<ul class=\"dropdown-menu\">");
                    strbTexto.Append(ConcatenarSubMenu(objOpcion.ID, opciones));
                    strbTexto.Append("</ul>");
                    strbTexto.Append("</li>");
                }
            }

            return strbTexto.ToString();
        }

        private string ConcatenarOpcion(OpcionMenu opcion)
        {
            return string.Format("<li><a href=\"{1}\" >{0}</a></li>", opcion.Nombre, opcion.Ruta);
        }
    }

    public class OpcionMenu
    {
        public int ID { get; set; }

        public int IdPadre { get; set; }

        public string Nombre { get; set; }

        public string Ruta { get; set; }
    }
}