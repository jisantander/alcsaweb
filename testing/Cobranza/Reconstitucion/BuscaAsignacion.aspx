<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscaAsignacion.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.BuscaAsignacion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script language="javascript" type="text/javascript">

        $(document).ready(function () {
            $('input[type="checkbox"]').each(function () {
                var selectedID = $(this).attr('id');
                var value = $('label[for=' + selectedID + ']').css("display", "none");
            });

            $('#aAsignarOT').click(function () {
                var ots = '';
                $('input[type="checkbox"]:checked').each(function () {
                    var selectedID = $(this).attr('id');
                    var value = $('label[for=' + selectedID + ']').html();
                    ots = ots + value + ',';
                });
                if (ots == '') return;
                VentanaModalEdit(ots);
            });
        });

        function VentanaModalEdit(OT) {
            var url = "popAsignacion.aspx?OT=" + OT;
            var strFeatures = "top=100px, left=270px, width=770px, height=400px, center=yes, help=no, status=no"
            ventana = window.open(url, "NewWin", strFeatures);
            ventana.focus();

            document.getElementById("Button1").click();
        }

        function Popup() {
            var url = 'ReconExcel.aspx';
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
    </style>
</head>
<body>
    <form runat="server" id="Formulario">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <table cellspacing="0" cellpadding="0" width="633" border="0">
            <tbody>
                <tr>
                    <td height="50px" valign="top" bgcolor="#336699" style="text-align: center" xbackground="../../images/banner2.jpg">
                        <span class="titulo">SISTEMA DE RECONSTITUCIONES</span></td>
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
                                                    <td align="left" bgcolor="#eeeeee"><b>&nbsp;ASIGNAR OT</b></td>
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
                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0" width="633" border="1" height="100">
                                            <tr>
                                                <td align="left">
                                                    <table border="0" width="100%" bgcolor="#e6ecf2" border="0">
                                                        <tr>
                                                            <td class="textos22" colspan="4">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Rut Deudor :</td>
                                                            <td align="left" class="style6">
                                                                <asp:TextBox ID="txtRut" runat="server"
                                                                    Style="WIDTH: 120px; margin-left: 0px;" Width="138px"></asp:TextBox>
                                                                <font color="red" size="-2"><b>(Sin DV)</b></font>
                                                            </td>
                                                            <td align="left" colspan="2">
                                                                <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click" />
                                                                &nbsp;
                                                                <asp:Button ID="btnLimpiar" runat="server" CssClass="boton" Text="Limpiar" OnClick="btnLimpiar_Click" />
                                                                <%--<asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return Popup();" ImageUrl="~/images/ico_excel.gif" />--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Número Operación :</td>
                                                            <td align="left" class="style4" colspan="2">
                                                                <asp:TextBox ID="txtNroOperacion" runat="server" xonKeyPress="return acceptNum(event)"
                                                                    Style="WIDTH: 120px; margin-left: 0px;"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Fecha Remesa :</td>
                                                            <td align="left" class="style4" colspan="2">
                                                                <asp:TextBox ID="txtFechaRemesa" runat="server"
                                                                    Style="WIDTH: 90px; margin-left: 0px;"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <%-- <tr><td align="right" class="style2" >Estado :</td><td  align="left" class="style4"  colspan="2"><asp:DropDownList ID="cbxEstados" runat="server" style="WIDTH: 350px; margin-left: 0px;" AutoPostBack="True" onselectedindexchanged="cbxEstados_SelectedIndexChanged" ></asp:DropDownList></td></tr>   --%>
                                                        <tr>
                                                            <td colspan="4" align="right">
                                                                <a id="aAsignarOT" href="#">Asignar OT</a>
                                                            </td>
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
                                                        GridLines="None">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Asignar OT" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="../../images/b_editar.gif" Width="18px" Height="18px" ToolTip="Asignar OT" CommandName="Editar" CssClass='<%# Bind("OT") %>' OnClientClick="VentanaModalEdit($(this).attr('class'));" />
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Rut Cliente" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo1" runat="server" Text='<%# Bind("rutcliente") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Dv" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo2" runat="server" Text='<%# Bind("dv") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="N° Operación" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo3" runat="server" Text='<%# Bind("nrooperacion") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Nombre Cliente" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre4" runat="server" Text='<%# Bind("nombrecliente") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Fecha Remesa" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre5" runat="server" Text='<%# Bind("fecha_remesa") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Conservador" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre66" runat="server" Text='<%# Bind("conservador") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Región" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre77" runat="server" Text='<%# Bind("region") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="OT" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo1ddddd" runat="server" Text='<%# Bind("OT") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Estado OT" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblOT222" runat="server" Text='<%# Bind("estado_ot_descripcion") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ConvertEmptyStringToNull="False">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSeleccionar" runat="server" Text='<%# Bind("OT") %>' />
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
                            <font size="2">Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
                            </font>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
