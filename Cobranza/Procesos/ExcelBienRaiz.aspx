<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExcelBienRaiz.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.ExcelBienRaiz" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    
     <asp:GridView ID="Grilla" runat="server" 
                                         AllowPaging="True"  
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                            
                            
                             <asp:TemplateField HeaderText="Rut Deudor" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("rut_deudor") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                               <asp:TemplateField HeaderText="Domicilio" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("domici") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
               
                               <asp:TemplateField HeaderText="Región" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("regnom") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField HeaderText="Comuna" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("comnom") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                          
                            <asp:TemplateField HeaderText="Fojas" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("fojas_insc") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField HeaderText="N°" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("n_insc") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                            
                         
                             <asp:TemplateField HeaderText="Año" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("anio_insc") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                               <asp:TemplateField HeaderText="Conservador" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("conservador") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
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
    </div>
    </form>
</body>
</html>
