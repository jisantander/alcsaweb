<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscaGeneral3.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.BuscaGeneral3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">

        function Popup() {
            var url;
            url = 'ReporteConsultaGeneralBieneRaices.aspx';
            pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
            if (window.pWin)
                pWin.focus()
            return false;
        }

        function Ir(pagina, estado) {
            document.location.href = pagina;
        }

    </script>

    <style type="text/css">
        .style2 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 132px;
        }

        .style3 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 104px;
        }

        .style4 {
            width: 90px;
        }

        .style6 {
            width: 210px;
        }

        .barra-sub-titulo {
            border: 1px solid #c8e3f9;
            background-color: #eeeeee;
            font: bold 15px Arial;
            padding: 2px 10px 2px 10px;
            text-transform: uppercase;
        }

        .auto-style1 {
            width: 124px;
        }

        .auto-style2 {
            font-size: small;
            color: #000000;
        }

        .auto-style3 {
            FONT-WEIGHT: normal;
            FONT-SIZE: small;
            COLOR: #000000;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 132px;
        }
    </style>
</head>
<body>

    <form runat="server" id="Formulario">





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


                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>

                        <table width="633" align="center" border="0">
                            <tbody>
                                <tr>
                                    <td height="114" width="100%" valign="top">

                                        <!-- Zona de Titulo -->

                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0"
                                            width="100%" border="1">
                                            <tbody>
                                                <tr>
                                                    <td align="left" bgcolor="#eeeeee"><b>&nbsp;BUSCAR JUICIO</b></td>
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
                                                <td align="left">
                                                    <!-- Inicio Filtros -->
                                                    <table border="0" width="100%" bgcolor="#e6ecf2" border="0">
                                                        <tr>
                                                            <td class="textos22" colspan="4">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td class="auto-style3">Rut Deudor</td>
                                                            <td align="left" class="style6">
                                                                <asp:TextBox ID="txtRut" runat="server"
                                                                    Style="WIDTH: 120px; margin-left: 0px;" Width="138px"></asp:TextBox>
                                                                <font color="red" size="-2"><b>Ej. 12324654-6</b></font>
                                                            </td>
                                                            <td align="left" class="auto-style1">&nbsp;</td>
                                                            <td align="left" class="style6">&nbsp;</td>

                                                        </tr>

                                                        <tr>
                                                            <td class="auto-style3">Número Operación</td>
                                                            <td align="left" class="style4" colspan="3">
                                                                <asp:TextBox ID="txtNroOperacion" runat="server" onKeyPress="return acceptNum(event)"
                                                                    Style="WIDTH: 120px; margin-left: 0px;"></asp:TextBox>
                                                            </td>

                                                        </tr>

                                                        <tr>
                                                            <td class="auto-style3">Cliente</td>
                                                            <td align="left" class="style4" colspan="3">
                                                                <asp:DropDownList ID="ddlCliente" runat="server"
                                                                    Style="margin-left: 0px;" AutoPostBack="True" Width="300px" Height="20px">
                                                                </asp:DropDownList>
                                                            </td>

                                                        </tr>

                                                        <tr>
                                                            <td class="auto-style3">Tribunal</td>
                                                            <td align="left" class="style4" colspan="3">
                                                                <asp:DropDownList ID="ddlTribunal" runat="server"
                                                                    Style="margin-left: 0px;" Width="300px" Height="20px" AutoPostBack="True">
                                                                </asp:DropDownList>
                                                            </td>

                                                        </tr>

                                                        <tr>
                                                            <td style="width: 25%" class="auto-style2">Total Registros</td>
                                                            <td style="width: 50%">

                                                                <asp:Label ID="lab_Total_Registros" runat="server" Font-Size="Small" Font-Bold="True" ForeColor="Blue"></asp:Label>
                                                            </td>
                                                            <td class="auto-style1">

                                                                <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return Popup();"
                                                                    ImageUrl="~/images/ico_excel.gif" Width="23px" Height="22px" />
                                                            </td>
                                                            <td style="width: 50%">

                                                                <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClick="btnBuscar_Click" Width="77px" />

                                                            </td>

                                                        </tr>

                                                        <tr>
                                                            <td class="textos22" colspan="4">&nbsp;</td>
                                                        </tr>

                                                    </table>

                                                    <!-- Fin Filtros -->
                                                </td>
                                            </tr>

                                            <tr>
                                                <td valign="top">
                                                    <!-- Inicio Grilla -->
                                                    <asp:GridView ID="Grilla" runat="server"
                                                        OnPageIndexChanging="Grilla_PageIndexChanging"
                                                        AllowPaging="True"
                                                        PageSize="20"
                                                        AutoGenerateColumns="False"
                                                        Width="100%"
                                                        CellPadding="4" ForeColor="#333333"
                                                        GridLines="None">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Acción">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="btnAccion" runat="server" OnClick="btnAccion_Click" CommandArgument='<%# Eval("rut_deudor")  +","+ Eval("nomdeudor") %>' Height="20px" ImageUrl="~/images/b_editar.gif" Width="20px" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            
                                                            <asp:TemplateField HeaderText="Nombre Cliente">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("NOMBRECLIENTE") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Rut Deudor">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRutDeudor" runat="server" Text='<%# Bind("rut_deudor") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Nombre Deudor">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombreDeudor" runat="server" Text='<%# Bind("nomdeudor") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="FOJAS">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFojas" runat="server" Text='<%# Bind("FOJAS") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="NUMERO">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNumero" runat="server" Text='<%# Bind("NUMERO") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="AÑO">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAño" runat="server" Text='<%# Bind("AÑO") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="CONSERVADOR">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblConservador" runat="server" Text='<%# Bind("CONSERVADOR") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="DOMICILIO">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDomicilio" runat="server" Text='<%# Bind("DOMICILIO") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Nuevos Bienes Raíces Encontrados">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNuevosBienes" runat="server" Text='<%# Bind("DicomBienRaiz") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Fecha Marca Nuevos Bienes Raíces">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFechaNuevosBienes" runat="server" Text='<%# Bind("FechaDicomBienRaiz") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
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
                                            <%--<tr>
              <td valign="top">
                 Total registros : 
              
              </td>
              </tr>--%>
                                        </table>

                                        <!-- Tabla Cuerpo Fin -->

                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" bgcolor="#CCCCCC">

                                        <!-- Zona de Botoneras -->
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="600" height="35">
                                                    <div align="center">

                                                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar"
                                                            Visible="False" />


                                                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                                                            Visible="False" />

                                                        <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar"
                                                            Visible="False" />

                                                    </div>
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div align="left">
                            <font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
                            </font>
                        </div>

                    </td>
                </tr>
            </tbody>
        </table>

    </form>

</body>
</html>
