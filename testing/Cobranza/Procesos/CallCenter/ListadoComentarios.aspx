<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoComentarios.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.CallCenter.ListadoComentarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/alc_estilo.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="barra-titulo">Cometarios Cobranza</td>
            </tr>
            <tr>
                <td class="barra-sub-titulo">&nbsp;</td>
            </tr>
            <tr>
                <td>
                                        <asp:GridView ID="gvComentariosCallCenter" runat="server"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            EmptyDataText="NO SE ENCONTRARON REGISTROS"
                                            GridLines="None" PageSize="1000">
                                            <Columns>
                                                <asp:BoundField HeaderText="Usuario Ingreso" DataField="UsuarioIngreso">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="Fecha Ingreso" DataField="FechaIngreso" HtmlEncode="false" DataFormatString="{0:dd-MM-yyyy HH:mm}" >
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="Disposición" DataField="NombreDisposicion" NullDisplayText="...">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="Comentario" DataField="Descripcion">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle HorizontalAlign="Left" Width="50%" />
                                                </asp:BoundField>
                                            </Columns>
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
            <tr>
                <td align="right" class="barra-sub-titulo">
                    <input id="btnCerrar" class="boton" type="button" value="Cerrar" onclick="window.close();" /></td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
