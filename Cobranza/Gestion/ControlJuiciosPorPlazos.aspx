<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlJuiciosPorPlazos.aspx.cs" Inherits="CobranzaALC.Cobranza.Gestion.ControlJuiciosPorPlazos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/alc2.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" style="width: 700px;">
                <tr>
                    <td class="barra-titulo" colspan="4">CONTROL DE PLAZOS</td>
                </tr>
                <tr>
                    <td style="width: 15%">Tipo Busqueda</td>
                    <td style="width: 35%">
                    <asp:DropDownList ID="ddlTipo" runat="server" Width="95%">
                        <asp:ListItem Selected="True" Value="J">Juicios</asp:ListItem>
                        <asp:ListItem Value="E">Exhortos</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    <td style="width: 15%">N° Operacion</td>
                    <td style="width: 35%">
                        <asp:TextBox ID="txtNumeroOperacion" runat="server" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">Cliente</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlClientes" runat="server" DataTextField="rsocial" DataValueField="rut_cli" Width="95%">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 15%">Rut Deudor</td>
                    <td style="width: 35%">
                        <asp:TextBox ID="txtRutDeudor" runat="server" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">Tribunal</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlTribunales" runat="server" DataTextField="descripcion" DataValueField="id_tribunal" Width="95%">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 15%">Estado Juicio</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlEstadosJuicios" runat="server" Width="95%">
                            <asp:ListItem Value="">Todos</asp:ListItem>
                            <asp:ListItem Value="A">Activo</asp:ListItem>
                            <asp:ListItem Value="S">Suspendido</asp:ListItem>
                            <asp:ListItem Value="R">Reactivado</asp:ListItem>
                            <asp:ListItem Value="N">Terminado</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">Procurador</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlProcuradores" runat="server" Width="95%" DataTextField="nombres" DataValueField="rut">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 15%">Días sin Movimientos</td>
                    <td style="width: 35%">
                        <asp:TextBox ID="txtDiasSinMovimiento" runat="server" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4" align="right">
                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                            <tr>
                                <td style="width: 50%; text-align: left;">
                                    <asp:Label ID="lblNumero" runat="server" EnableViewState="False"></asp:Label>
                                </td>
                                <td style="width: 50%; text-align: right;"><asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" OnClick="btnBuscar_Click" Width="150px" EnableViewState="False" /></td>
                            </tr>
                        </table>
                        
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 150px;">
                        <asp:GridView ID="gvDatos" runat="server"
                            AllowPaging="True"
                            Width="100%"
                            CellPadding="4" ForeColor="#333333"
                            GridLines="None" PageSize="50" OnPageIndexChanging="gvDatos_PageIndexChanging" EmptyDataText="NO SE ENCONTRARON DATOS" AutoGenerateColumns="False" EnableViewState="False">
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="Nro. Operación" DataField="NumeroOperacion" />
                                <asp:BoundField HeaderText="Rut Deudor" DataField="RutDeudor" />
                                <asp:BoundField HeaderText="Nombre Deudor" DataField="NombreDeudor" />
                                <asp:BoundField HeaderText="Tribunal" DataField="NombreTribunal" />
                                <asp:BoundField HeaderText="Rol" DataField="Rol" />
                                <asp:BoundField DataField="RolExhorto" HeaderText="Rol Exhorto" />
                                <asp:BoundField DataField="NombreTramite" HeaderText="Último Trámite" Visible="false" />
                                <asp:BoundField DataField="NombreTramite" HeaderText="Nombre Tramite" />
                                <asp:BoundField HeaderText="Fecha Último Trámite" DataField="FechaTramite" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="False" />
                                <asp:BoundField DataField="NombreSubTramite" HeaderText="Nombre Sub-Tramite" />
                                <asp:BoundField DataField="FechaSubTramite" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Fecha Sub-Tramite" HtmlEncode="False" />
                                <asp:BoundField HeaderText="Procurador" DataField="NombreProcurador" />
                                <asp:BoundField HeaderText="Estado Juicio" DataField="EstadoJuicio" />
                                <asp:BoundField HeaderText="Cliente" DataField="NombreCliente" />
                                <asp:BoundField DataField="EstadoExhorto" HeaderText="Estado Exhorto" />
                                <asp:BoundField DataField="TramiteExhorto" HeaderText="Trámite Exhorto" />
                                <asp:BoundField HeaderText="Días sin Movimientos" DataField="DiasSinMovimientos" DataFormatString="{0:N0}" HtmlEncode="False" />
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
                    <td class="barra-sub-titulo" colspan="4" align="right">
                        &nbsp;<asp:Button ID="btnExportarExcel" runat="server" CssClass="boton" Text="Exportar a Excel" OnClick="btnExportarExcel_Click" Width="150px" Visible="False" />
                    </td>
                </tr>
            </table>
    </form>
</body>
</html>
