<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="CobranzaALC.Cobranza.Demandas.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/alc2.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.boton-imprimir-demanda').click(function () {
                var _ancho = 800;
                var _alto = 550;
                var _izquierda = (screen.width / 2) - (_ancho / 2);
                var _arriba = (screen.height / 2) - (_alto / 2);
                var _ruta = 'DatosCobranza.aspx?id_cob=' + $(this).attr('alt');
                var _ventana = window.open(_ruta, 'descarga_archivo', 'scrollbars=no,resizable=yes,width=' + _ancho + ',height=' + _alto + ',top=' + _arriba + ',left=' + _izquierda);
                _ventana.focus();
                // window.location = 'DatosCobranza.aspx?id_cob=' + $(this).attr('alt');
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="barra-titulo" colspan="4">Generador de Demandas</td>
            </tr>
            <tr>
                <td style="width: 15%">Rut Deudor</td>
                <td style="width: 35%">
                    <asp:TextBox ID="txtRutDeudor" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td style="width: 15%">N° Operación</td>
                <td style="width: 35%">
                    <asp:TextBox ID="txtNumeroOperacion" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">Cliente</td>
                <td style="width: 35%">
                        <asp:DropDownList ID="ddlClientes" runat="server"
                            Width="97%" AutoPostBack="True" OnSelectedIndexChanged="ddlClientes_SelectedIndexChanged" DataTextField="rsocial" DataValueField="rut_cli">
                        </asp:DropDownList>
                </td>
                <td style="width: 15%">Remesa</td>
                <td style="width: 35%">
                        <asp:DropDownList ID="ddlRemesas" runat="server" DataValueField="ID" DataTextField="Nombre"
                            Width="97%">
                        </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td align="right" colspan="4">
                    <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" OnClick="btnBuscar_Click" Width="150px" />
                </td>
            </tr>
            <tr>
                <td class="barra-sub-titulo" colspan="4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" valign="top" style="height: 100px;">
                    <asp:GridView ID="gvCobranzas" runat="server"
                        AllowPaging="True"
                        Width="100%"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None" PageSize="25" OnPageIndexChanging="gvCobranzas_PageIndexChanging" EmptyDataText="NO SE ENCONTRARON COBRANZAS" AutoGenerateColumns="False">
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="Nro. Operación" DataField="NumeroOperacion" />
                            <asp:BoundField HeaderText="Deudor" DataField="NombreDeudor" />
                            <asp:BoundField HeaderText="Cliente" DataField="NombreCliente" />
                            <asp:BoundField HeaderText="Remesa" DataField="NombreRemesa" />
                            <asp:TemplateField HeaderText="Acción">
                                <ItemTemplate>
                                    <asp:Image ID="imgImprimir" runat="server" Style="cursor: pointer;" ImageUrl="~/images/iconos/Buscar.png" AlternateText='<%# Bind("IdCobranza") %>' CssClass="boton-imprimir-demanda" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle CssClass="cabezabrilla" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="barra-sub-titulo" colspan="4">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>