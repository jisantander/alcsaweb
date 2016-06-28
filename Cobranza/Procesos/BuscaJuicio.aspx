<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscaJuicio.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.BuscaJuicio" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">

        function Ir(idJuicio, idCobranza, tipo, producto) {

            var pagina = 'ActividadCobranza.aspx?Codigo=' + idJuicio + '&idCobranza=' + idCobranza;

            if (trim(tipo) == "A" || trim(tipo) == 'R' || trim(tipo) == 'P') {
                document.location.href = pagina;
            }
            // else if (trim(tipo) == 'P')
            //    alert('Juicio se encuentra en proceso de termino');
            else if (trim(tipo) == 'N')
                alert('Juicio se encuentra terminado');
            else if (trim(tipo) == 'S')
                alert('Juicio se encuentra suspendido');
        }

        function ValidarBuscar() {
            if (document.all("txtRol").value == "" && document.all("txtRutDeudor").value == "" && document.all("txtNroOperacion").value == "") {
                alert('Debe ingresar como mínimo un filtro');
                document.all("txtRol").focus();
                return false;
            }

            if (!(document.all("txtRutDeudor").value == "")) {
                if (!(ChequeaRut(document.all("txtRutDeudor")))) {
                    alert('Rut del deudor no es válido');
                    document.all("txtRutDeudor").focus();
                    document.all("txtRutDeudor").select();
                    return false;
                }
            }
            return true;
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
                                                            <td align="right" class="style2">Rol-Rit :</td>
                                                            <td align="left" class="style6">
                                                                <asp:TextBox ID="txtRol" runat="server"
                                                                    Style="WIDTH: 120px; margin-left: 0px;" Width="138px"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="style3"></td>
                                                            <td align="left">

                                                                <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click" />

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">N° Operación :</td>
                                                            <td align="left" class="style4" colspan="2">
                                                                <asp:TextBox ID="txtNroOperacion" runat="server"
                                                                    Style="WIDTH: 120px; margin-left: 0px;" Width="138px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Rut Deudor :</td>
                                                            <td align="left" class="style4" colspan="2">
                                                                <asp:TextBox ID="txtRutDeudor" runat="server"
                                                                    Style="WIDTH: 120px; margin-left: 0px;" Width="138px"></asp:TextBox>
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
                                                        PageSize="8"
                                                        AutoGenerateColumns="False"
                                                        Width="100%"
                                                        CellPadding="4" ForeColor="#333333"
                                                        GridLines="None">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Acción">
                                                                <ItemTemplate>
                                                                    <a href="#" onclick="javascript:Ir('<%# Eval("id_juicios") %>','<%# Eval("id_cobranza") %>','<%# Eval("tipo") %>','<%# Eval("id_producto") %>');">
                                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Agregar Juicio" /></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Rol-Rit">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("rol") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Tribunal">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombreTribunal" runat="server" Text='<%# Bind("NombreTribunal") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="N° Operación">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("operacion") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Rut Deudor">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("rut_deudor") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Rut Abogado">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("rut_abogado") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Rut Procurador">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("rut_procurador") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="F. Ingreso corte">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fingcorte") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
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
                                                            OnClientClick="return ValidarBuscar();"
                                                            Visible="False" />


                                                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                                                            OnClientClick="return ValidarGuardar();"
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
