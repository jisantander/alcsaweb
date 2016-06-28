<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaPrejudicial.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.ConsultaPrejudicial" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">


        function Actividades() {
            var valor = document.all("hiddCobranza").value;
            var url = '../Procesos/MostrarActividadesPrejudiciales.aspx?Codigo=' + valor;
            Ir(url, '900', '650');
            return false;
        }

        function Ir(url, ancho, alto) {
            var pWin = window.open(url, 'newWin', 'width=' + ancho + ',height=' + alto + ',scrollbars=1,satus=0,menubar=no,top=10,left=100')
            if (window.pWin)
                pWin.focus();
            return false;
        }

    </script>

    <style type="text/css">
        .style1 {
            width: 190px;
        }

        .style2 {
            width: 190px;
            height: 16px;
        }

        .style3 {
            height: 16px;
        }
    </style>

</head>
<body>
    <table cellspacing="0" cellpadding="0" width="633" border="0">
        <tbody>
            <tr>
                <td width="633" height="50" valign="top" bgcolor="#336699" xbackground="../../images/banner2.jpg">
                    <table width="313" align="right" border="0">
                        <tbody>
                            <tr>
                                <td class="titulo" align="right">SISTEMA DE COBRANZA</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="394" valign="top" class="textos">
                    <br>
                    <center>
                    </center>

                    <form runat="server" id="Formulario">

                        <table align="center" border="0" style="width: 720px">
                            <tbody>
                                <tr>
                                    <!---->
                                    <td height="163" width="100%" valign="top">

                                        <!-- Zona de Titulo -->

                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0"
                                            width="100%" border="1">
                                            <tbody>
                                                <tr>
                                                    <td align="left" bgcolor="#eeeeee"><b>&nbsp;CONSULTA PREJUDICIAL</b></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table height="7" width="345">
                                            <tbody>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <!-- Tabla Cuerpo Inicio -->
                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0" width="633" border="1" height="100">
                                            <tr>
                                                <td valign="top">





                                                    <table class="celdas" style="width: 720px"
                                                        style="BORDER-RIGHT: #006699; BORDER-TOP: #006699; BORDER-LEFT: #006699; BORDER-BOTTOM: #006699"
                                                        cellspacing="0" cellpadding="0" width="100%" bgcolor="#cfe4ee" border="0">
                                                        <tbody>
                                                            <tr bgcolor="#333366">
                                                                <td colspan="2"><b><font color="#FFFFFF">&nbsp;<font size="2">DETALLE</font></font></b></td>
                                                            </tr>


                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Cliente</font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lblCliente" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>

                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Deudor</font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lblDeudor" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Rut Deudor</font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lblRutDeudor" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">N° Operación</font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lblnrooperacion" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>

                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Número&nbsp; </font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lblnumero" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>

                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Teléfono 1&nbsp; </font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lbltelefono1" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>

                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Teléfono 2 </font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lbltelefono2" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>

                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Celular </font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lblcelular" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>

                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Tipo Documento</font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lbltipodoc" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>



                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Fecha ing. Cobranza</font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lblfechaingresocob" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>

                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style2"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Monto Capital </font></b></font></td>
                                                                <td valign="top" class="style3"><font size="2">&nbsp;
          <asp:Label ID="lblMontoCapital" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Saldo Deuda </font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lblSaldoDeuda" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>

                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Cantidad de Documentos</font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lblcantidad" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top" bgcolor="#0080c0" class="style1"><font
                                                                    color="#ffffff">&nbsp;&nbsp;<b><font size="2">Abonos</font></b></font></td>
                                                                <td valign="top"><font size="2">&nbsp;
          <asp:Label ID="lblabonos" runat="server"></asp:Label>
                                                                </font></td>
                                                            </tr>




                                                    </table>
                                                </td>
                                            </tr>
                                        </table>

                                        <!-- Tabla Cuerpo Fin -->

                                    </td>
                                </tr>





                                <tr>
                                    <td valign="top">
                                        <!-- Inicio Grilla -->
                                        <asp:GridView ID="Grilla" runat="server"
                                            AllowPaging="True"
                                            PageSize="1000"
                                            AutoGenerateColumns="False"
                                            Width="720"
                                            CellPadding="4" ForeColor="#333333"
                                            GridLines="None">
                                            <Columns>

                                                <asp:TemplateField HeaderText="N° Doc.">
                                                    <HeaderStyle HorizontalAlign="Left" Wrap="true" Width="100"></HeaderStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("nrodocumento") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Monto">
                                                    <HeaderStyle HorizontalAlign="Left" Wrap="true" Width="100"></HeaderStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNombre1" runat="server" Text='<%# Bind("montocapital") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>



                                                <asp:TemplateField HeaderText="Estado">
                                                    <HeaderStyle HorizontalAlign="Center" Wrap="true" Width="100"></HeaderStyle>
                                                    <ItemStyle Wrap="false" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgPagado" ToolTip='<%#LetraPagadatool(Eval("pagado")) %>' ImageUrl='<%#LetraPagadaicon(Eval("pagado")) %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="MCH">
                                                    <HeaderStyle Wrap="true" HorizontalAlign="Left" Width="100"></HeaderStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("MCH") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Fecha Vcto.">
                                                    <HeaderStyle Wrap="true" HorizontalAlign="Left" Width="100"></HeaderStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("fechavcto") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Liberado">
                                                    <HeaderStyle Wrap="true" HorizontalAlign="Left" Width="300"></HeaderStyle>
                                                    <ItemStyle Wrap="true"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("Liberado") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Observación">
                                                    <HeaderStyle Wrap="true" HorizontalAlign="Left" Width="300"></HeaderStyle>
                                                    <ItemStyle Wrap="true"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("observacion") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>






                                            </Columns>

                                            <PagerSettings Mode="NextPreviousFirstLast"
                                                FirstPageText="<<"
                                                LastPageText=">>"
                                                PageButtonCount="3" />

                                            <HeaderStyle CssClass="cabezabrilla" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditRowStyle BackColor="#2461BF" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>

                                        <!-- Fin Grilla -->
                                    </td>
                                </tr>



                                <tr>
                                    <td valign="top" bgcolor="#CCCCCC">

                                        <!-- Zona de Botoneras -->
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="600" height="35">
                                                    <div align="center">


                                                        <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar" OnClick="btnCancelar_Click" />
                                                        <asp:Button ID="Button1" runat="server" CssClass="boton2" Text="Ver Actividades"
                                                            OnClientClick="return Actividades();" />

                                                        <asp:Button ID="Button2" runat="server" CssClass="boton2"
                                                            Text="Agregar Act." OnClick="Button2_Click" />
                                                </td>

                                                </div>
                                    </td>
                                </tr>
                        </table>
                </td>
            </tr>
        </tbody>
    </table>
    <div align="center">
        <font size="2">Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
        </font>
    </div>
    <asp:HiddenField ID="hiddCobranza" runat="server" />

    </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>
</body>
</html>
