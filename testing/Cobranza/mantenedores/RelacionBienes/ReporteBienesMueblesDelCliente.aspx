<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteBienesMueblesDelCliente.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.RelacionBienes.ReporteBienesMueblesDelCliente" %>

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
                            GridLines="None"  PageSize="25"  EmptyDataText="No se encontraron Bienes Muebles" AutoGenerateColumns="False" >
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                 
                                <asp:TemplateField>
                                <ItemTemplate>
                                   <asp:ImageButton ID="btnInforme" runat="server" CommandArgument='<%# Eval("id_bien_mueble")  +","+ Eval("TipoVehiculo")+","+ Eval("Marca") +","+ Eval("Modelo")+","+ Eval("n_chassis")+","+ Eval("Color")+","+ Eval("RUT_DEUDOR") %>' Height="20px"  ImageUrl="~/images/b_editar.gif"  Width="20px" />
                                   
                                        
                                </ItemTemplate>
                                 
                                </asp:TemplateField>
                                <asp:BoundField DataField="id_bien_mueble"  HeaderText="Id">
                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                </asp:BoundField>
                                 
                                <asp:BoundField DataField="RUT_DEUDOR" HeaderText="Rut Deudor">
                                    <ItemStyle HorizontalAlign="Left" Width="30%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TipoVehiculo" HeaderText="TipoVehiculo">
                                    <ItemStyle HorizontalAlign="Left" Width="40%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Marca" HeaderText="Marca">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Modelo" HeaderText="Modelo">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="n_chassis" HeaderText="n_chassis">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="Color" HeaderText="Color">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="n_motor" HeaderText="n_motor">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="patente" HeaderText="patente">
                                    <ItemStyle HorizontalAlign="Left" Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="anio_fabricacion" HeaderText="Año Fabric.">
                                    <ItemStyle HorizontalAlign="Left" Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="id_limitaciones" HeaderText="id_limitaciones">
                                    <ItemStyle HorizontalAlign="Left" Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="estado" HeaderText="estado">
                                    <ItemStyle HorizontalAlign="Left" Width="100%" />
                                </asp:BoundField>
               
                             
                             
                            </Columns>
                            <EditRowStyle BackColor="#2461BF"  />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle CssClass="cabezabrilla"  />
                            <PagerStyle BackColor="#2461BF"  ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB"   />
                            <SelectedRowStyle BackColor="#D1DDF1"  Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>
        </div>
    </form>
</body>
</html>
