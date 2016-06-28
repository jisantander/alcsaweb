namespace CobranzaALC.Cobranza.Escritos
{
    using ALCLOCAL;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Drawing;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class EscritoPrejudicial : Page
    {
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable table = null;
            table = ConsultasEspecificas.EscritoPrejudicial(this.txtRut.Text);
            if ((table != null) && (table.Rows.Count > 0))
            {
                this.domicilios.Items.Clear();
                this.domicilios.DataTextField = "domicilio";
                this.domicilios.DataValueField = "comuna";
                this.domicilios.DataSource = table;
                this.domicilios.DataBind();
                this.hiddeDeudor.Value = table.Rows[0]["rsocial"].ToString();
                this.hiddenDireccion.Value = this.domicilios.SelectedItem.ToString();
                this.hiddenComuna.Value = this.domicilios.SelectedValue.ToString();
                this.CargaGrilla(this.txtRut.Text);
            }
            else
            {
                this.domicilios.Items.Clear();
                this.domicilios.Items.Insert(0, "Seleccione");
                this.Grilla.DataSource = null;
                this.Grilla.DataBind();
            }
        }

        private void CargaGrilla(string rut_deudor)
        {
            ALCSA.FWK.BD.Servicio objServicio = new ALCSA.FWK.BD.Servicio() { Conexion = "CONN", Comando = "dbo.SPALC_PREJUDICIAL_LISTAR" };

            objServicio.Parametros = new List<ALCSA.FWK.BD.Parametro>();
            objServicio.Parametros.Add(new ALCSA.FWK.BD.Parametro() { Nombre = "@VC_RutDeudor", Valor = rut_deudor.Replace(".", string.Empty), Direccion = ALCSA.FWK.BD.Enumeradores.Direcciones.Entrada });

            // DataTable table = ConsultasEspecificas.EscritoPrejudicialGrilla(rut_deudor);
            this.Grilla.DataSource = objServicio.EjecutarDataTable();
            this.Grilla.DataBind();
        }

        protected void domicilios_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.hiddenDireccion.Value = this.domicilios.SelectedItem.ToString();
            this.hiddenComuna.Value = this.domicilios.SelectedValue.ToString();
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.CargaGrilla(this.txtRut.Text);
            this.Grilla.PageIndex = e.NewPageIndex;
            this.Grilla.DataBind();
        }

        public void habilitar()
        {
            this.txtRut.BackColor = Color.LightYellow;
            this.domicilios.BackColor = Color.LightYellow;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                this.txtRut.Focus();
                this.habilitar();
                this.Grilla.PagerSettings.Mode = PagerButtons.Numeric;
            }
        }
    }
}

