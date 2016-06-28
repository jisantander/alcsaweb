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

    public partial class Carga : Page
    {
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            if ((this.FileUp.PostedFile != null) && (this.FileUp.PostedFile.ContentLength > 0))
            {
                if (!Path.GetFileName(this.FileUp.PostedFile.FileName).Contains(".csv"))
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
                        string str9;
                        string str10;
                        string str11;
                        string str12;
                        string str13;
                        string str14;
                        string str15;
                        string str16;
                        string str17;
                        string str18;
                        string str19;
                        string str20;
                        string str21;
                        string str22;
                        string str23;
                        string str24;
                        string str25;
                        string str26;
                        string str27;
                        string str28;
                        string str29;
                        string str30;
                        string str31;
                        string str32;
                        string str33;
                        string str34;
                        string str35;
                        string str36;
                        string str37;
                        string str38;
                        string str39;
                        string str40;
                        string str41;
                        string str42;
                        string str43;
                        string str44;
                        string str45;
                        string str46;
                        Exception exception;
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
                                str9 = strArray[0].ToString().Trim();
                                str10 = strArray[1].ToString().Trim();
                                str11 = strArray[2].ToString().Trim();
                                str12 = strArray[3].ToString().Trim();
                                str13 = strArray[4].ToString().Trim();
                                str14 = strArray[5].ToString().Trim();
                                str15 = strArray[6].ToString().Trim();
                                str16 = strArray[7].ToString().Trim();
                                str17 = strArray[8].ToString().Trim();
                                str18 = strArray[9].ToString().Trim();
                                str19 = strArray[10].ToString().Trim();
                                str20 = strArray[11].ToString().Trim();
                                str21 = strArray[12].ToString().Trim();
                                str22 = strArray[13].ToString().Trim();
                                str23 = strArray[14].ToString().Trim();
                                str24 = strArray[15].ToString().Trim();
                                str25 = strArray[0x10].ToString().Trim();
                                str26 = strArray[0x11].ToString().Trim();
                                str27 = strArray[0x12].ToString().Trim();
                                str28 = strArray[0x13].ToString().Trim();
                                str29 = strArray[20].ToString().Trim();
                                str30 = strArray[0x15].ToString().Trim();
                                str31 = strArray[0x16].ToString().Trim();
                                str32 = strArray[0x17].ToString().Trim();
                                str33 = strArray[0x18].ToString().Trim();
                                str34 = strArray[0x19].ToString().Trim();
                                str35 = strArray[0x1a].ToString().Trim();
                                str36 = strArray[0x1b].ToString().Trim();
                                str37 = strArray[0x1c].ToString().Trim();
                                str38 = strArray[0x1d].ToString().Trim();
                                str39 = strArray[30].ToString().Trim();
                                str40 = strArray[0x1f].ToString().Trim();
                                str41 = strArray[0x20].ToString().Trim();
                                str42 = strArray[0x21].ToString().Trim();
                                str43 = strArray[0x22].ToString().Trim();
                                str44 = strArray[0x23].ToString().Trim();
                                str45 = strArray[0x24].ToString().Trim();
                                str46 = strArray[0x25].ToString().Trim();
                                if (string.IsNullOrEmpty(str13))
                                {
                                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Falta Rut de Clientes (Planilla con errores) Revisar y solucionar. No se proceso nada.');</script>");
                                    return;
                                }
                                if (string.IsNullOrEmpty(str14))
                                {
                                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Falta DV de Clientes (Planilla con errores) Revisar y solucionar. No se proceso nada.');</script>");
                                    return;
                                }
                                if (string.IsNullOrEmpty(str36))
                                {
                                    this.Page.RegisterClientScriptBlock("Mensaje", "<script>alert('Falta C\x00f3digo Estado de Clientes (Planilla con errores) Revisar y solucionar. No se proceso nada.');</script>");
                                    return;
                                }
                            }
                            num += 1L;
                            num2 = 1;
                        }
                        num = 0L;
                        num2 = 0;
                        string str47 = "";
                        try
                        {
                            DataTable table = new DataTable();
                            table.Columns.Add(new DataColumn("tabla", typeof(string)));
                            foreach (string str8 in list)
                            {
                                strArray = str8.ToString().Split(new char[] { ';' });
                                if (num2 == 1)
                                {
                                    str9 = strArray[0].ToString().Trim();
                                    str10 = strArray[1].ToString().Trim();
                                    str11 = strArray[2].ToString().Trim();
                                    str12 = strArray[3].ToString().Trim();
                                    str13 = strArray[4].ToString().Trim();
                                    str14 = strArray[5].ToString().Trim();
                                    str15 = strArray[6].ToString().Trim();
                                    str16 = strArray[7].ToString().Trim();
                                    str17 = strArray[8].ToString().Trim();
                                    str18 = strArray[9].ToString().Trim();
                                    str19 = strArray[10].ToString().Trim();
                                    str20 = strArray[11].ToString().Trim();
                                    str21 = strArray[12].ToString().Trim();
                                    str22 = strArray[13].ToString().Trim();
                                    str23 = strArray[14].ToString().Trim();
                                    str24 = strArray[15].ToString().Trim();
                                    str25 = strArray[0x10].ToString().Trim();
                                    str26 = strArray[0x11].ToString().Trim();
                                    str27 = strArray[0x12].ToString().Trim();
                                    str28 = strArray[0x13].ToString().Trim();
                                    str29 = strArray[20].ToString().Trim();
                                    str30 = strArray[0x15].ToString().Trim();
                                    str31 = strArray[0x16].ToString().Trim();
                                    str32 = strArray[0x17].ToString().Trim();
                                    str33 = strArray[0x18].ToString().Trim();
                                    str34 = strArray[0x19].ToString().Trim();
                                    str35 = strArray[0x1a].ToString().Trim();
                                    str36 = strArray[0x1b].ToString().Trim();
                                    str37 = strArray[0x1c].ToString().Trim();
                                    str38 = strArray[0x1d].ToString().Trim();
                                    str39 = strArray[30].ToString().Trim();
                                    str40 = strArray[0x1f].ToString().Trim();
                                    str41 = strArray[0x20].ToString().Trim();
                                    str42 = strArray[0x21].ToString().Trim();
                                    str43 = strArray[0x22].ToString().Trim();
                                    str44 = strArray[0x23].ToString().Trim();
                                    str45 = strArray[0x24].ToString().Trim();
                                    str46 = strArray[0x25].ToString().Trim();
                                    try
                                    {
                                        Transaccion.InsertaReconstitucion(str9, str10, str11, str12, str13, str14, str15, str16, str17, str18, str19, str20, str21, str22, str23, str24, str25, str26, str27, str28, str29, str30, str31, str32, str33, str34, str35, str36, str37, str38, str39, str40, str41, str42, str43, str44, str45, str46);
                                        num += 1L;
                                    }
                                    catch (Exception exception1)
                                    {
                                        exception = exception1;
                                        str47 = str47 + str13 + ",";
                                        if (exception.ToString().Contains("clave duplicada"))
                                        {
                                            DataRow row = table.NewRow();
                                            row["tabla"] = str13.ToString();
                                            table.Rows.Add(row);
                                        }
                                    }
                                }
                                num2 = 1;
                            }
                            this.grilla.DataSource = table;
                            this.grilla.DataBind();
                        }
                        catch (Exception exception2)
                        {
                            exception = exception2;
                            this.lblMessage.Text = "Existen inconsistencias en la planilla cargada. Detalle: " + exception.Message.ToString();
                            return;
                        }
                        this.lblMessage.Text = "Proceso finalizado satisfactoriamente";
                    }
                }
            }
            else
            {
                this.lblMessage.Text = "Debe seleccionar un archivo antes de cargar";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Transaccion.LimpiaReconstituciones();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
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

