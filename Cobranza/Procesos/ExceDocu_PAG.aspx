<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExceDocu_PAG.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.ExceDocu_PAG" %>


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
                                         PageSize="200"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                        
                                         GridLines="None"> 
                            <Columns>
                            
                     
                              <asp:TemplateField HeaderText="N° Pagaré">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCssd33odigo11" runat="server" Text='<%# Bind("nropagare") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
           
                             
                             <asp:TemplateField    HeaderText="Monto Total Deuda">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombrwew33e33" runat="server" Text='<%# Bind("montotaldeuda") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                               <asp:TemplateField    HeaderText="Fecha Suscripción">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblN3ombwewere33" runat="server" Text='<%# Bind("fsuscripcion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              
                               <asp:TemplateField    HeaderText="Suma Inicial Suscripción">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lbwelNowembre33" runat="server" Text='<%# Bind("sumainisuscripcion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                                      <asp:TemplateField    HeaderText="N° Cuotas">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblN34345ggombre33" runat="server" Text='<%# Bind("nrocuotas") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                                 <asp:TemplateField    HeaderText="Tasa de Interes">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lbererlNortrmbre33" runat="server" Text='<%# Bind("tasainteres") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField    HeaderText="Fecha Mora.">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNomb4445333re444" runat="server" Text='<%# Bind("fechamora") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
              
                       
                             
                            </Columns>
                            
                            <PagerSettings Mode="NextPreviousFirstLast"
                               FirstPageText="<<"
                               LastPageText=">>"
                               PageButtonCount="3"
                               /> 
                            
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
