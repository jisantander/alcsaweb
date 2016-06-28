<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mantenedor.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.SubTramite.Mantenedor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnVolver').click(function () {
                window.location = 'Listar.aspx';
            });
        });
    </script>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="barra-titulo" colspan="4">SUB-trámite</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4">Datos Generales</td>
                </tr>
                <tr>
                    <td style="width: 15%">ID</td>
                    <td style="width: 35%">
                        <asp:Label ID="lblIdSubTramite" runat="server" Font-Bold="True" Text="0000"></asp:Label>
                    </td>
                    <td style="width: 15%">
                        &nbsp;</td>
                    <td style="width: 35%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 15%">Nombre</td>
                    <td style="width: 35%">
                        <asp:TextBox ID="txtNombre" runat="server" Width="95%"></asp:TextBox>
                    </td>
                    <td style="width: 15%">
                        &nbsp;</td>
                    <td style="width: 35%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 15%">Tipo</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlTipo" runat="server" Width="96%" AutoPostBack="True" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged">
                            <asp:ListItem Selected="True">DOCUJUICIO</asp:ListItem>
                            <asp:ListItem>DOCUPAGARE</asp:ListItem>
                            <asp:ListItem>ESTANDARD1</asp:ListItem>
                            <asp:ListItem>ESTANDARD2</asp:ListItem>
                            <asp:ListItem>ESTANDARD3</asp:ListItem>
                            <asp:ListItem>ESTANDARD4</asp:ListItem>
                            <asp:ListItem>MUTUO</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 15%">
                        &nbsp;</td>
                    <td style="width: 35%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 15%">Vigente</td>
                    <td style="width: 35%">
                        <asp:CheckBox ID="chkEsVigente" runat="server" Checked="True" />
                    </td>
                    <td style="width: 15%">
                        &nbsp;</td>
                    <td style="width: 35%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4">asociación a trámites</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Panel ID="pnlTramites" runat="server" Height="300px" ScrollBars="Vertical" Width="100%">
                            <asp:GridView ID="gvTramites" runat="server"
                            Width="98%"
                            CellPadding="4" ForeColor="#333333"
                            GridLines="None" PageSize="25" EmptyDataText="NO SE ENCONTRARON TRAMITES" AutoGenerateColumns="False">
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Seleccionar">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSeleccionado" runat="server" />
                                            <asp:HiddenField ID="hdfIdTramite" runat="server" Value='<%# Bind("ID") %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="etapa" HeaderText="Etapa">
                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="tipo" HeaderText="Tipo">
                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="descripcion" HeaderText="Nombre">
                                    <ItemStyle HorizontalAlign="Left" Width="40%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="termino" HeaderText="Es Termino">
                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle CssClass="cabezabrilla" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="4">
                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" OnClick="btnGuardar_Click" Text="Guardar" />
                        &nbsp;<input id="btnVolver" class="boton" type="button" value="Volver" /></td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
