<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExcelConsultaGastos.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.ExcelConsultaGastos" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
 <asp:GridView ID="Grilla" runat="server" 
                                         
                                         AllowPaging="True"  
                                         PageSize="50000"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                          
                                     <asp:TemplateField HeaderText="N° Operación" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="true" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo1eee333" runat="server" Text='<%# Bind("nrooperacion") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField HeaderText="Rut Cliente" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="true" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigoee3ddsdsd1" runat="server" Text='<%# Bind("rutcliente") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField HeaderText="Nombre Cliente" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="true" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigoeeff4441" runat="server" Text='<%# Bind("nombrecliente") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField HeaderText="Tipo Gasto" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="true" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo1" runat="server" Text='<%# Bind("tipogasto") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField HeaderText="Forma de Pago" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo2" runat="server" Text='<%# Bind("formapago") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField HeaderText="N° Documento" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo3" runat="server" Text='<%# Bind("nrodocumento") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                                   <asp:TemplateField HeaderText="Estado Gasto" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo1ddddd" runat="server" Text='<%# Bind("estadogasto") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Monto Gasto" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre4" runat="server" Text='<%# Bind("montogasto") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                        
                             
                             
                             <asp:TemplateField    HeaderText="Observación" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="false"></HeaderStyle>
                             <ItemStyle Wrap="true" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre5" runat="server" Text='<%# Bind("observacion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                               <asp:TemplateField    HeaderText="Fecha Gasto" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre77" runat="server" Text='<%# Bind("proceso") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                               <asp:TemplateField    HeaderText="Fecha Estado" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre77" runat="server" Text='<%# Bind("fechaestado") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                               <asp:TemplateField    HeaderText="Factura" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre77" runat="server" Text='<%# Bind("factura") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                               <asp:TemplateField    HeaderText="Fecha Factura" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre77" runat="server" Text='<%# Bind("fechafactura") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                         
                            <asp:TemplateField    HeaderText="Monto Factura" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre77" runat="server" Text='<%# Bind("montofactura") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField    HeaderText="usuario" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre66" runat="server" Text='<%# Bind("usuario") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                            
                             
                          
                             
                           
                
                               <asp:TemplateField HeaderText="Asignar OT" Visible="false" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Center">
                                 <ItemTemplate>
                                     <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="../../images/b_editar.gif" Width="18" Height="18"   ToolTip="Asignar OT" CommandName="Editar" Visible="true" />
                                 </ItemTemplate>
                                </asp:TemplateField>
                
                            
                             
                             
                             
                            </Columns>
                            
                        
                            
                            <HeaderStyle CssClass="cabezabrilla" />
                            <RowStyle BackColor="#EFF3FB" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White"  />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
    </form>
</body>
</html>
