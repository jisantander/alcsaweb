<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GrillaDomicilios.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.GrillaDomicilios" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
 <!-- Inicio Grilla -->
                           <asp:GridView ID="Grilla" runat="server" 
                                         EmptyDataText="<b>No se encontraron domicilios</b>"
                                         AllowPaging="True"  
                                         PageSize="5000"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                        <%--    <asp:TemplateField HeaderText="Acción"  >
                              <ItemTemplate>
                               <a href="#" onclick="javascript:Ir('Juicio.aspx?Codigo=<%# Eval("id_cobranza") %>','<%# Eval("estado") %>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Agregar Juicio"  /></a> 
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                             
                              <asp:TemplateField HeaderText="<b>Domicilios Registrados</b>">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("domicilio") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                             <asp:TemplateField HeaderText="<b>Bien Raiz</b>">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("bienraiz") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
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
    </form>
</body>
</html>
