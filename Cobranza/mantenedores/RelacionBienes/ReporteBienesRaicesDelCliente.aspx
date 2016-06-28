<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteBienesRaicesDelCliente.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.RelacionBienes.ReporteBienesRaicesDelCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reporte Excel Listar por Juicio</title>
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/alc2.css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvBienes" runat="server"
                            AllowPaging="True"
                            Width="100%"
                            CellPadding="4" ForeColor="#333333"
                            GridLines="None" PageSize="25"  EmptyDataText="NO SE ENCONTRARON Bienes Raices" AutoGenerateColumns="False">
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                               
                                <asp:BoundField DataField="RUT_DEUDOR" HeaderText="Rut Deudor">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DIRECCION" HeaderText="Domicilio">
                                    <ItemStyle HorizontalAlign="Left" Width="40%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Region" HeaderText="Región">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Comuna" HeaderText="Comuna">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="FOJAS_INSC" HeaderText="Fojas">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="N_INSC" HeaderText="Nº">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="ANIO_INSC" HeaderText="Año">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Conservador" HeaderText="Conservador">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:TemplateField ConvertEmptyStringToNull="False">
                                    <EditItemTemplate>
                                        <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="" Mode="Edit" />
                                    </EditItemTemplate>
                                 
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField ConvertEmptyStringToNull="False">
                                    <EditItemTemplate>
                                        <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="" Mode="Edit" />
                                    </EditItemTemplate>
                                  
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle CssClass="cabezabrilla" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>

        </div>
    </form>
</body>
</html>
