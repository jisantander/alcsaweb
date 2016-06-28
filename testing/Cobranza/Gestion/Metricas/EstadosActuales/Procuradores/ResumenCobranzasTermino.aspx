<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResumenCobranzasTermino.aspx.cs" Inherits="CobranzaALC.Cobranza.Gestion.Metricas.EstadosActuales.Procuradores.ResumenCobranzasTermino" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../../../css/alc_estilo1.0.0.css" rel="stylesheet" />
    <script type="text/javascript" src="../../../../../js/jquery-1.10.2.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; min-width: 700px;">
                <tr>
                    <td class="barra-titulo">Cobranzas</td>
                </tr>
                <tr>
                    <td align="left" class="barra-sub-titulo">&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Panel ID="pnlDatos" runat="server" ScrollBars="Vertical" Width="100%" Height="300px">
                            <asp:GridView ID="gvDetalle" runat="server"
                                Width="100%"
                                CellPadding="4" ForeColor="#333333"
                                PageSize="400" AutoGenerateColumns="False" EmptyDataText="NO SE ENCONTRO INFORMACION" EnableViewState="False">
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField HeaderText="N° Operación" DataField="NumeroOperacion"></asp:BoundField>
                                    <asp:BoundField HeaderText="Rut Deudor" DataField="RutDeudor"></asp:BoundField>
                                    <asp:BoundField HeaderText="Nombre Deudor" DataField="NombreDeudor"></asp:BoundField>
                                    <asp:BoundField HeaderText="Nombre Cliente" DataField="NombreCliente"></asp:BoundField>
                                    <asp:BoundField DataField="FechaTermino" HeaderText="Fecha Termino" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="False" />
                                    <asp:BoundField DataField="Rol" HeaderText="Rol" />
                                    <asp:BoundField DataField="Etapa" HeaderText="Etapa" />
                                    <asp:BoundField DataField="Tramite" HeaderText="Trámite" />
                                    <asp:BoundField DataField="SubTramite" HeaderText="Sub-Trámite" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle CssClass="cabecera_grilla" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                        </asp:Panel>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo">
                        <input id="btnCerrar" class="boton" type="button" value="Cerrar" onclick="window.close();" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
