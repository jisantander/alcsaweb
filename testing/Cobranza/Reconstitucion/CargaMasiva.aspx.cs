namespace CobranzaALC.Cobranza.Reconstitucion
{
    using ALCLOCAL;
    using System;
    using System.Collections;
    using System.Configuration;
    using System.Data;
    using System.IO;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public partial class CargaMasiva : Page
    {
     

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtRemesa.Text))
            {
                this.lblMessage.Text = "Debe ingresar la cantidad de casos de la remesa";
            }
            else if ((this.FileUp.PostedFile == null) || (this.FileUp.PostedFile.ContentLength <= 0))
            {
                this.lblMessage.Text = "Debe seleccionar un archivo antes de cargar";
            }
            else if (!Path.GetFileName(this.FileUp.PostedFile.FileName).Contains(".csv"))
            {
                this.lblMessage.Text = "Archivo a cargar debe ser de tipo plano .CSV";
            }
            else
            {
                string path = ConfigurationSettings.AppSettings["CARPETA_CARGA"].ToString();
                string str3 = base.Server.MapPath(path);
                string fileName = Path.GetFileName(this.FileUp.PostedFile.FileName);
                string str5 = SubirArchivo(this.FileUp, str3, fileName);
                if (!(str5 == "OK"))
                {
                    this.lblMessage.Text = str5.ToString();
                }
                else
                {
                    string[] strArray;
                    string str11;
                    Exception exception;
                    this.hddRemesa.Value = this.txtRemesa.Text.ToString();
                    DataTable table = null;
                    table = Consulta.FechaRemesa();
                    if ((table.Rows.Count > 0) && (table != null))
                    {
                        this.hddFentrega.Value = table.Rows[0]["fentrega"].ToString();
                        this.hddFactual.Value = table.Rows[0]["factual"].ToString();
                    }
                    else
                    {
                        this.lblMessage.Text = "Problemas con fecha entrega y fecha actual";
                        return;
                    }
                    StreamReader reader = new StreamReader(str3 + @"\" + fileName);
                    string str7 = "";
                    ArrayList list = new ArrayList();
                    while (str7 != null)
                    {
                        str7 = reader.ReadLine();
                        if (!string.IsNullOrEmpty(str7) && !str7.Contains(";"))
                        {
                            reader.Close();
                            throw new ArgumentException("La linea [" + str7 + "] No contiene el separador punto y coma ';' correspondiente. No se proceso la carga.");
                        }
                        if (str7 != null)
                        {
                            list.Add(str7);
                        }
                    }
                    reader.Close();
                    long num = 0L;
                    int num2 = 0;
                    foreach (string str8 in list)
                    {
                        strArray = str8.ToString().Split(new char[] { ';' });
                        if (num2 == 1)
                        {
                            if (strArray[0].ToString().Trim() == "")
                            {
                                break;
                            }
                            if (strArray.Length < 12)
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('El archivo debe tener al menos 12 columnas, carga anulada. Por favor revisar antes de cargar');</script>");
                                return;
                            }
                            if (string.IsNullOrEmpty(strArray[0].ToString().Trim()))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Existen casos sin subproducto, carga anulada. Por favor revisar antes de cargar');</script>");
                                return;
                            }
                            if (string.IsNullOrEmpty(strArray[1].ToString().Trim()))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Existen casos sin producto, carga anulada. Por favor revisar antes de cargar');</script>");
                                return;
                            }
                            str11 = strArray[2].ToString().Trim();
                            if (string.IsNullOrEmpty(str11))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Existen casos sin N\x00b0 de operaci\x00f3n, carga anulada. Por favor revisar antes de cargar [como alternativa puede agregar el valor 999999999, eso indica que este caso no tiene N\x00b0 de operaci\x00f3n]');</script>");
                                return;
                            }
                            DataTable table2 = null;
                            table2 = Consulta.ValidaNROopeRecon(str11);
                            if ((table2.Rows.Count > 0) && (table2 != null))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('El numero de operacion : " + str11.ToString() + " ya existe, carga anulada. Por favor revisar antes de cargar  ');</script>");
                                return;
                            }
                            if (string.IsNullOrEmpty(strArray[3].ToString().Trim()))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Existen casos sin rut cliente, carga anulada. Por favor revisar antes de cargar');</script>");
                                return;
                            }
                            if (string.IsNullOrEmpty(strArray[4].ToString().Trim()))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Existen casos sin dv de rut, carga anulada. Por favor revisar antes de cargar');</script>");
                                return;
                            }
                            if (string.IsNullOrEmpty(strArray[5].ToString().Trim()))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Existen casos sin nombre cliente, carga anulada. Por favor revisar antes de cargar');</script>");
                                return;
                            }
                            if (string.IsNullOrEmpty(strArray[6].ToString().Trim()))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Existen casos sin  direcci\x00f3n, carga anulada. Por favor revisar antes de cargar');</script>");
                                return;
                            }
                            if (string.IsNullOrEmpty(strArray[7].ToString().Trim()))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Existen casos sin  comuna, carga anulada. Por favor revisar antes de cargar');</script>");
                                return;
                            }
                            if (string.IsNullOrEmpty(strArray[8]))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Existen casos sin fecha de contabilización, carga anulada. Por favor revisar antes de cargar');</script>");
                                return;
                            }


                            if (string.IsNullOrEmpty(strArray[9]))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Existen casos sin conservador, carga anulada. Por favor revisar antes de cargar');</script>");
                                return;
                            }
                            if (string.IsNullOrEmpty(strArray[10]))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Existen casos sin región, carga anulada. Por favor revisar antes de cargar');</script>");
                                return;
                            }
                            if (string.IsNullOrEmpty(strArray[11]))
                            {
                                this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Existen casos sin fecha centro de costo, carga anulada. Por favor revisar antes de cargar');</script>");
                                return;
                            }

                        }
                        num += 1L;
                        num2 = 1;
                    }
                    num = 0L;
                    num2 = 0;
                    try
                    {
                        DataTable table3 = new DataTable();
                        table3.Columns.Add(new DataColumn("tabla", typeof(string)));
                        foreach (string str8 in list)
                        {
                            strArray = str8.ToString().Split(new char[] { ';' });
                            if (num2 == 1)
                            {
                                if (strArray[0].ToString().Trim() == "")
                                {
                                    break;
                                }
                                string subproducto = strArray[0].Trim().ToUpper();
                                string prod = strArray[1].Trim().ToUpper();
                                str11 = strArray[2].Trim();
                                string rutcliente = strArray[3].Trim();
                                string dv = strArray[4].Trim();
                                string nombrecliente = strArray[5].Trim();
                                string direccion = strArray[6].Trim().ToUpper();
                                string comuna = strArray[7].Trim().ToUpper();
                                
                                string fechacontabilizacion = ConvertirFecha(strArray[8]);

                                string conservador = strArray[9].Trim().ToUpper();
                                string strRegion = strArray[10].Trim().ToUpper();
                                string strCentroCosto = strArray[11].Trim().ToUpper();

                                string codigoestado = "100";
                                string fechaestado = this.hddFactual.Value.ToString();
                                string str23 = this.hddFactual.Value.ToString();
                                string str24 = this.hddFentrega.Value.ToString();
                                string remesa = this.hddRemesa.Value.ToString();

                                

                                try
                                {
                                    Transaccion.InsertaReconstitucion(
                                        subproducto, 
                                        prod, 
                                        str11, 
                                        rutcliente, 
                                        dv, 
                                        nombrecliente, 
                                        direccion, 
                                        comuna, 
                                        conservador, 
                                        strRegion, 
                                        fechacontabilizacion,
                                        codigoestado, 
                                        fechaestado, 
                                        str23,
                                        remesa, 
                                        str24, 
                                        this.Session["Usuario"].ToString(),
                                        strCentroCosto
                                    );

                                    num += 1L;
                                }
                                catch (Exception exception1)
                                {
                                    exception = exception1;
                                    throw new ArgumentException(exception.Message.ToString());
                                }
                            }
                            num2 = 1;
                        }
                        this.grilla.DataSource = table3;
                        this.grilla.DataBind();
                    }
                    catch (Exception exception2)
                    {
                        exception = exception2;
                        this.lblMessage.Text = "Existen inconsistencias en la planilla cargada. Detalle: " + exception.Message.ToString();
                        return;
                    }
                    this.lblMessage.Text = "Proceso finalizado satisfactoriamente";
                    this.txtRemesa.Text = "";
                }
            }
        }

        private string ConvertirFecha(string fecha)
        {
            fecha = fecha.Trim();
            DateTime datFechaContabilizacion = new DateTime(1900, 1, 1);
            bool blnConversionOK = false;

            if (fecha.Contains("/") && fecha.Length == 10)
                blnConversionOK = DateTime.TryParseExact(fecha, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out datFechaContabilizacion);

            if (!blnConversionOK && fecha.Contains("/") && fecha.Length == 8)
                blnConversionOK = DateTime.TryParseExact(fecha, "dd/MM/yy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out datFechaContabilizacion);

            if (!blnConversionOK && fecha.Contains("-") && fecha.Length == 10)
                blnConversionOK = DateTime.TryParseExact(fecha, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out datFechaContabilizacion);

            if (!blnConversionOK && fecha.Contains("-") && fecha.Length == 8)
                blnConversionOK = DateTime.TryParseExact(fecha, "dd-MM-yy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out datFechaContabilizacion);
            
            if (datFechaContabilizacion.Year < 1900)
                datFechaContabilizacion = new DateTime(1900, 1, 1);

            return datFechaContabilizacion.ToString("yyyyMMdd");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Transaccion.LimpiaReconstituciones();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((this.Session["Usuario"] == null) || (this.Session["Usuario"].ToString() == ""))
            {
                base.Response.Write("<script>alert('Por seguridad expiro la p\x00e1gina');window.open('" + ConfigurationSettings.AppSettings["Inicio"].ToString() + "','_top')</script>");
                base.Response.End();
            }
            if (!base.IsPostBack)
            {
            }
            this.lblMessage.Text = "";
        }

        public static string SubirArchivo(FileUpload filesubir, string Path, string NomArchivo)
        {
            try
            {
                if ((filesubir.PostedFile != null) && (filesubir.PostedFile.ContentLength > 0))
                {
                    string str = NomArchivo;
                    string filename = Path + @"\" + str;
                    filesubir.PostedFile.SaveAs(filename);
                }
                else
                {
                    return "Seleccione un archivo para cargar";
                }
            }
            catch (Exception exception)
            {
                return ("No fue posible subir el archivo. Detalle : " + exception.Message.ToString());
            }
            return "OK";
        }
    }
}

