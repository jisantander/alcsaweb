<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MuestraDesglose.aspx.cs" Inherits="CobranzaALC.Cobranza.Abonos.MuestraDesglose" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
</head>
<body>

    <form runat="server" id="Formulario">
        <table border="0" style="width: 800px">
            <tr>
                <td class="barra-titulo">SISTEMA DE COBRANZA<br />
                </td>
            </tr>

            <tr>
                <td class="barra-sub-titulo" align="right">
                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                        <tr>
                            <td align="left" class="barra-sub-titulo">DESGLOSE DE ABONO</td>
                            <td align="right" class="barra-sub-titulo">
                                <asp:Button ID="btnExportarExcel" runat="server" CssClass="boton" OnClick="btnExportarExcel_Click" Text="Exportar Excel" /></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td align="left">
                    <asp:GridView ID="gvDesglose" runat="server"
                        PageSize="100"
                        AutoGenerateColumns="False"
                        Width="100%"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="tipo_doc" HeaderText="Tipo Doc." />
                            <asp:BoundField DataField="nro_doc" HeaderText="N° Doc." />
                            <asp:BoundField DataField="monto" HeaderText="Monto" DataFormatString="{0:N0}" HtmlEncode="False" />
                            <asp:BoundField DataField="fvto" HeaderText="Fecha Vcto." />
                            <asp:BoundField DataField="dias" HeaderText="Dias" />
                            <asp:BoundField DataField="intereses" HeaderText="Intereses" DataFormatString="{0:N2}" HtmlEncode="False" />
                            <asp:BoundField DataField="int_adic" HeaderText="Interes Adicional" DataFormatString="{0:N2}" HtmlEncode="False" />
                            <asp:BoundField DataField="honorarios" HeaderText="Honorarios" DataFormatString="{0:N0}" HtmlEncode="False" />
                            <asp:BoundField DataField="desc_honorarios" HeaderText="Desc. Honorarios" DataFormatString="{0:N0}" HtmlEncode="False" />

                            <asp:BoundField DataField="desc_interes" HeaderText="Desc. Intereses" DataFormatString="{0:N0}" HtmlEncode="False" />

                            <asp:BoundField DataField="Otros_desc" HeaderText="Otros Descuentos" DataFormatString="{0:N0}" HtmlEncode="False" />
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

                </td>
            </tr>

            <tr>
                <td align="right" class="barra-sub-titulo">
                    <input id="btnCerrar" class="boton" type="button" value="Cerrar" onclick="window.close();" />
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hdfIdCobranza" runat="server" Value="0" />
        <asp:HiddenField ID="hdfIdAbono" runat="server" Value="0" />
    </form>
</body>
</html>
