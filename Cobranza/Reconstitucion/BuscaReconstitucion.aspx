<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscaReconstitucion.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.BuscaReconstitucion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('.control-fecha').datepicker({
                changeMonth: true,
                changeYear: true
            });
        }); 

        function Popup() {
            var url = 'ReconExcel.aspx';
            pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
            if (window.pWin)
                pWin.focus()
            return false;
        }

        function PopupDoc(url) {
            pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
            if (window.pWin)
                pWin.focus()
            return false;
        }

        function Ir(pagina) {
            document.location.href = pagina;
        }

        function ValidarBuscar() {
            if (!(trim(document.all("txtFechaRemesa").value)) == "") {
                if (!(EsFecha(document.all("txtFechaRemesa").value, 'dma'))) {
                    alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                    document.all("txtFechaRemesa").focus();
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

        .style4 {
            width: 90px;
        }

        .style6 {
            width: 210px;
        }
        .auto-style1 {
            font-size: smaller;
        }
        .auto-style2 {
            width: 64px;
        }
        .auto-style3 {
            width: 60px;
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form runat="server" id="Formulario">
        <table cellspacing="0" cellpadding="0" width="633" border="0">
            <tbody>
                <tr>
                    <td width="633" height="50" valign="top" bgcolor="#336699" xbackground="../../images/banner2.jpg" style="text-align: center">
                        <span class="titulo">SISTEMA DE RECONSTITUCIONES</span>
                    </td>
                </tr>
                <tr>
                    <td height="394" valign="top" class="textos">
                        <table width="633" align="center" border="0">
                            <tbody>
                                <tr>
                                    <td height="114" width="100%" valign="top">
                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0"
                                            width="100%" border="1">
                                            <tbody>
                                                <tr>
                                                    <td align="left" bgcolor="#eeeeee"><b>&nbsp;BUSCAR RECONSTITUCION</b></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0" width="633" border="1" height="100">
                                            <tr>
                                                <td align="left">
                                                    <table border="0" width="100%" bgcolor="#e6ecf2" border="0">
                                                        <tr>
                                                            <td class="textos22" colspan="2">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Rut Deudor :</td>
                                                            <td align="left" class="auto-style2">
                                                                <asp:TextBox ID="txtRut" runat="server"
                                                                    Style="WIDTH: 120px; margin-left: 0px;" Width="138px"></asp:TextBox>
                                                                <font color="red" size="-2"><b>(Sin DV)</b></font>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Número Operación :</td>
                                                            <td align="left" class="auto-style2">
                                                                <asp:TextBox ID="txtNroOperacion" runat="server" xonKeyPress="return acceptNum(event)"
                                                                    Style="WIDTH: 120px; margin-left: 0px;"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Fecha Remesa :</td>
                                                            <td align="left" class="auto-style2">
                                                                <asp:TextBox ID="txtFechaRemesa" runat="server"
                                                                    Style="WIDTH: 90px; margin-left: 0px;" CssClass="control-fecha"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Estado :</td>
                                                            <td align="left" class="auto-style2">
                                                                <asp:DropDownList ID="cbxEstados" runat="server"
                                                                    Style="WIDTH: 350px; margin-left: 0px;" AutoPostBack="True"
                                                                    OnSelectedIndexChanged="cbxEstados_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Responsable :</td>
                                                            <td align="left" class="auto-style2">
                                                                <asp:DropDownList ID="cbxResponsable" runat="server"
                                                                    Style="WIDTH: 350px; margin-left: 0px;" AutoPostBack="True" OnSelectedIndexChanged="cbxResponsable_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Nombre Cliente :</td>
                                                            <td align="left" class="auto-style2">
                                                                <asp:TextBox ID="txtNombreCliente" runat="server"
                                                                    Style="WIDTH: 350px; margin-left: 0px;"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Conservador :</td>
                                                            <td align="left" class="auto-style2">
                                                                <asp:TextBox ID="txtConservadorFiltro" runat="server" xonKeyPress="return acceptNum(event)"
                                                                    Style="WIDTH: 120px; margin-left: 0px;"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">SubProducto :</td>
                                                            <td align="left" class="auto-style2">
                                                                <asp:TextBox ID="txtSubProducto" runat="server" xonKeyPress="return acceptNum(event)"
                                                                    Style="WIDTH: 120px; margin-left: 0px;"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Producto :</td>
                                                            <td align="left" class="auto-style2">
                                                                <asp:DropDownList ID="cbxProductos" runat="server"
                                                                    Style="WIDTH: 350px; margin-left: 0px;" AutoPostBack="True">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">N° Casos :</td>
                                                            <td align="left" class="auto-style2">
                                                                <asp:TextBox ID="txtNroCasos" runat="server" ReadOnly="true" CssClass="auto-style3"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="textos22" colspan="2" align="center">
                                                                <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click" />
                                                                <asp:Button ID="btnLimpiar" runat="server" CssClass="boton" Text="Limpiar" OnClick="btnLimpiar_Click" />
                                                                <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return Popup();" ImageUrl="~/images/ico_excel.gif" />
                                                            </td>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:GridView ID="Grilla" runat="server"
                                                        OnPageIndexChanging="Grilla_PageIndexChanging"
                                                        AllowPaging="True"
                                                        PageSize="30"
                                                        AutoGenerateColumns="False"
                                                        Width="100%"
                                                        CellPadding="4" ForeColor="#333333"
                                                        GridLines="None" CssClass="auto-style1">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Acción" HeaderStyle-HorizontalAlign="center">
                                                                <ItemTemplate>
                                                                    <a href="#" onclick="javascript:Ir('frmReconstitucion.aspx?OT=<%# Eval("ot") %>');">
                                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Editar" /></a>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Documentos" HeaderStyle-HorizontalAlign="center">
                                                                <ItemTemplate>
                                                                    <a href="#" onclick="javascript:PopupDoc('DocDigitalizados.aspx?OT=<%# Eval("ot") %>');">
                                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/lupa.jpg" ToolTip="Mostrar documento digitalizado" /></a>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Rut Cliente" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("rutcliente") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Dv" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("dv") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="N° Operación" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("nrooperacion") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Nombre Cliente" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("nombrecliente") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Responsable" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("user_responsable") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Estado" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("estadodescripcion") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Fecha Remesa" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fecha_remesa") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Fecha Contabilización" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fechacontabilizacion") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Conservador" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("conservador") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Región" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("region") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="OT" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("ot") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Estado OT" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("estado_ot_descripcion") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Producto" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblprod" runat="server" Text='<%# Bind("prod") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="SubProducto" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblprod" runat="server" Text='<%# Bind("subproducto") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <PagerSettings Mode="NextPreviousFirstLast"
                                                            FirstPageText="<<"
                                                            LastPageText=">>"
                                                            PageButtonCount="20" />
                                                        <HeaderStyle CssClass="cabezabrilla" />
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditRowStyle BackColor="#2461BF" />
                                                        <AlternatingRowStyle BackColor="White" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <%--<tr><td valign="top">Total registros : </td></tr>--%>
                                        </table>
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
                        <div align="left" style="text-align: center">
                            <font size="2">Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483</font>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
