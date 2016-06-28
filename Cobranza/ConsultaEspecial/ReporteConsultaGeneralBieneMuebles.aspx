<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteConsultaGeneralBieneMuebles.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.ReporteConsultaGeneralBieneMuebles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reporte Excel</title>
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/alc2.css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="Grilla" runat="server"
                AutoGenerateColumns="False"
                Width="100%"
                CellPadding="4" ForeColor="#333333"
                GridLines="None">
                <Columns>


                    <asp:TemplateField HeaderText="Nombre Cliente">
                        <HeaderStyle Wrap="true"></HeaderStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("NOMBRECLIENTE") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Rut Deudor">
                        <HeaderStyle Wrap="true"></HeaderStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("rut_deudor") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nombre Deudor">
                        <HeaderStyle Wrap="true"></HeaderStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("NOMBREDEUDOR") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="TIPO_VEHICULO">
                        <HeaderStyle Wrap="true"></HeaderStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblTipoVehiculo" runat="server" Text='<%# Bind("TIPO_VEHICULO") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="AÑO">
                        <HeaderStyle Wrap="true"></HeaderStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblAño" runat="server" Text='<%# Bind("AÑO") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="PATENTE">
                        <HeaderStyle Wrap="true"></HeaderStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblPatente" runat="server" Text='<%# Bind("PATENTE") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="N_MOTOR">
                        <HeaderStyle Wrap="true"></HeaderStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblNMotor" runat="server" Text='<%# Bind("N_MOTOR") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="MARCA">
                        <HeaderStyle Wrap="true"></HeaderStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblMarca" runat="server" Text='<%# Bind("MARCA") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="MODELO">
                        <HeaderStyle Wrap="true"></HeaderStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblModelo" runat="server" Text='<%# Bind("MODELO") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="COLOR">
                        <HeaderStyle Wrap="true"></HeaderStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblColor" runat="server" Text='<%# Bind("COLOR") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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


        </div>
    </form>
</body>
</html>
