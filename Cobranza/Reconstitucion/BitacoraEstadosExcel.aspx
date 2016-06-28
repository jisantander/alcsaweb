<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BitacoraEstadosExcel.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.BitacoraEstadosExcel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
   
      <asp:GridView ID="Grilla" runat="server" 
                                       
                                         AllowPaging="True"  
                                         AutoGenerateColumns="False"
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                          
                        
                             
                              <asp:TemplateField HeaderText="OT" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo1" runat="server" Text='<%# Bind("ot") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField HeaderText="Estado" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo1" runat="server" Text='<%# Bind("descriestado") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             
                              <asp:TemplateField HeaderText="Observación" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="true" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo2" runat="server" Text='<%# Bind("observacion") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField HeaderText="Usuario" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo3" runat="server" Text='<%# Bind("usuario") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField    HeaderText="Fecha Proceso" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre4" runat="server" Text='<%# Bind("fproceso") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                               <asp:TemplateField    HeaderText="Fecha Proceso" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre4" runat="server" Text='<%# Bind("fproceso") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>

                                  <asp:TemplateField    HeaderText="Rut Cliente" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre5" runat="server" Text='<%# Bind("RUTCLIENTE") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>


                             <asp:TemplateField    HeaderText="Nombre Cliente" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre6" runat="server" Text='<%# Bind("NOMBRECLIENTE") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Nº Operación" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre7" runat="server" Text='<%# Bind("NROOPERACION") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
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
