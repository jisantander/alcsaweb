<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteListarPorRiesgo.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.ReporteListarPorRiesgo" %>

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
            <asp:GridView ID="gvJuicios" runat="server" Style="margin-right: 0px" AutoGenerateColumns="False" Width="744px">
                <Columns>
                    <asp:TemplateField HeaderText="Fecha riesgo">
                        <ItemTemplate>
                            <asp:Label ID="lblFechaRiesgo" runat="server" Text='<%# Eval("FechaRiesgo", "{0:dd-MM-yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TRIBUNAL">
                        <ItemTemplate>
                            <asp:Label ID="lblTribunal" runat="server" Text='<%# Bind("NombreTribunal") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rol">
                        <ItemTemplate>
                            <asp:Label ID="lblRol" runat="server" Text='<%# Bind("Rol") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tipo Riesgo">
                        <ItemTemplate>
                            <asp:Label ID="lblNombreRiesgo" runat="server" Text='<%# Bind("NombreRiesgo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rut Cliente">
                        <ItemTemplate>
                            <!-- <asp:Label ID="lblNombreCliente" runat="server" Text='<%# Bind("NombreCliente") %>'></asp:Label>-->
                            <asp:Label ID="lblRutCliente" runat="server" Text='<%# Bind("RutCliente") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nombre Cliente">
                        <ItemTemplate>
                            <asp:Label ID="lblNombreCliente" runat="server" Text='<%# Bind("NombreCliente") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Rut Deudor">
                        <ItemTemplate>
                            <asp:Label ID="lblRutDeudor" runat="server" Text='<%# Bind("RutDeudor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nombre Deudor">
                        <ItemTemplate>
                            <asp:Label ID="lblNombreDeudor" runat="server" Text='<%# Bind("APELLIDONOMBREDEUDOR") %>'></asp:Label>
                            <!--&nbsp;[<asp:Label ID="lblRutDeudor" runat="server" Text='<%# Bind("RutDeudor") %>'></asp:Label>]-->
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Abogado">
                        <ItemTemplate>
                            <asp:Label ID="lblNombreAbogado" runat="server" Text='<%# Bind("NombreAbogado") %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rut Abogado">
                        <ItemTemplate>
                            <asp:Label ID="lblRutAbogado" runat="server" Text='<%# Bind("RutAbogado") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Procurador">
                        <ItemTemplate>
                            <asp:Label ID="lblNombreProcurador" runat="server" Text='<%# Bind("NombreProcurador") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Rut Procurador">
                        <ItemTemplate>
                            <asp:Label ID="lblRutProcurador" runat="server" Text='<%# Bind("RutProcurador") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nombre Trámite">
                        <ItemTemplate>
                            <asp:Label ID="lblNombreActividad" runat="server" Text='<%# Bind("NOMBRE_TRAMITE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Fecha Trámite">
                        <ItemTemplate>
                            <asp:Label ID="lblFechaActividad" runat="server" Text='<%# Bind("FECHA_TRAMITE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SubTramite">
                        <ItemTemplate>
                            <asp:Label ID="lblSubTramite" runat="server" Text='<%# Bind("SUBTRAMITE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Fecha SubTramite">
                        <ItemTemplate>
                            <asp:Label ID="lblFechaSubTramite" runat="server" Text='<%# Bind("FECHASUBTRAMITE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Observacion SubTramite">
                        <ItemTemplate>
                            <asp:Label ID="lblObservacionSubTramite" runat="server" Text='<%# Bind("ObservacionSubTramite") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
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

        </div>
    </form>
</body>
</html>
