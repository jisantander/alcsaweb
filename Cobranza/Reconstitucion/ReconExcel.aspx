<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReconExcel.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.ReconExcel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="Grilla" runat="server"
            AllowPaging="True"
            PageSize="1000000"
            AutoGenerateColumns="False"
            Width="100%"
            CellPadding="4" ForeColor="#333333"
            GridLines="None">
            <Columns>
                <asp:TemplateField HeaderText="Rut Cliente" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("rutcliente") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Dv" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("dv") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="N° Operación" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("nrooperacion") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre Cliente" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("nombrecliente") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estado" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("estadodescripcion") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Conservador" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("conservador") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Región" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("region") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fojas Dominio" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fojasdominio") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Número Dominio" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("numerodominio") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Año Dominio" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("aniodominio") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha Contabilización" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fechacontabilizacion") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha Escritura" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fechaescritura") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha Estado" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre77" runat="server" Text='<%# Bind("fechaestado") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha Remesa" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fecha_remesa") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Factura" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre77" runat="server" Text='<%# Bind("factura") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha Factura" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre77" runat="server" Text='<%# Bind("fechafactura") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Monto Factura" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre77" runat="server" Text='<%# Bind("montofactura") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Notaria" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("notaria") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comuna Notaria" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("comunanotaria") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Repertorio" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("reportorio") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Protocolo" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("protocolo") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Producto" HeaderStyle-HorizontalAlign="Left">
                    <HeaderStyle Wrap="true"></HeaderStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblprod" runat="server" Text='<%# Bind("prod") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
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
    </form>
</body>
</html>
