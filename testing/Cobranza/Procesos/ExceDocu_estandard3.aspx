<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExceDocu_estandard3.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.ExceDocu_estandard3" %>


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
                                         PageSize="15"
                                         AutoGenerateColumns="False"
                                         
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                            
                     
                              <asp:TemplateField HeaderText="Cuantia">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblweweCodiwewego" runat="server" Text='<%# Bind("cuantia") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
           
           <asp:TemplateField HeaderText="Monto Remuneración">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCweweweweodigo" runat="server" Text='<%# Bind("txtMontoRemuneracion") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                      
                         
           <asp:TemplateField HeaderText="Cargo">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblwewewrrr44Codigo" runat="server" Text='<%# Bind("txtCargo") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
           
            <asp:TemplateField HeaderText="Relación Hechos">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lbl333Codigo" runat="server" Text='<%# Bind("Relacion_Hechos") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             
                             
                                  <asp:TemplateField HeaderText="Petitorio">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCod4343igo" runat="server" Text='<%# Bind("petitorio") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                                 <asp:TemplateField HeaderText="Documentos Fundantes">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCod4343igo" runat="server" Text='<%# Bind("doc_fundantes") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             
                                  <asp:TemplateField HeaderText="Observación">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCod4343igo" runat="server" Text='<%# Bind("observacion") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             
                            <asp:TemplateField HeaderText="IdContratista" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblArchivo" runat="server" Text='<%# Bind("urldocumento") %>' SortExpression = "lblArchivo"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>  
                                    
                            <asp:TemplateField HeaderText="Documento" HeaderStyle-HorizontalAlign="Left">
                             <ItemTemplate>
                                 <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="/images/lupa.jpg" Width="18" Height="18"   ToolTip="Mostrar documento" CommandName="Editar" Visible="true" />
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
