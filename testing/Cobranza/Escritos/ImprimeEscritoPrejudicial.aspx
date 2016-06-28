<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImprimeEscritoPrejudicial.aspx.cs" Inherits="CobranzaALC.Cobranza.Escritos.ImprimeEscritoPrejudicial" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 383px;
        }
        .style2
        {
            width: 635px;
        }
        .style3
        {
            width: 635px;
            height: 92px;
        }
        .style4
        {
            height: 92px;
        }
        </style>
        
      
</head>
<body>
    <form id="form1" runat="server">
         <table width="730" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="115" valign="top" colspan="2"> 
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="19" valign="top" class="style1"> 
            <div align="right"></div>
          </td>
          <td width="279" valign="top">Santiago, 
              <asp:Label ID="lblFecha" runat="server" ></asp:Label>
              </td>
        </tr>
        <tr> 
          <td valign="top" height="19" colspan="2">Se&ntilde;or (a)</td>
        </tr>
        <tr> 
          <td height="19" valign="top" colspan="2"><b><asp:Label ID="lblDeudor" runat="server" ></asp:Label>
              </b></td>
        </tr>
        <tr> 
          <td height="19" valign="top" colspan="2"><asp:Label 
                  ID="lblDireccion" runat="server" ></asp:Label>
                                 </td>
        </tr>
        <tr> 
          <td height="19" valign="top" colspan="2"><asp:Label ID="lblComuna" 
                  runat="server" ></asp:Label>
                                 </td>
        </tr>
        <tr> 
          <td height="19" valign="top" colspan="2"><u>Presente</u></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td height="22" valign="top" colspan="2">&nbsp;</td>
  </tr>
  <tr> 
<%--    <td height="555" width="53" valign="top"> 
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="555" valign="top" class="style2">&nbsp;</td>
        </tr>
      </table>
    </td>--%>
    <td width="677" valign="top"> 
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="30" valign="top" class="style2">&nbsp;</td>
          <td width="15" rowspan="12" valign="top"> 
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="15" height="555" valign="top">&nbsp;</td>
              </tr>
            </table>
          </td>
          <td width="2"></td>
        </tr>
        <tr> 
          <td valign="top" height="27" class="style2">De nuestra consideraci&oacute;n :</td>
          <td></td>
        </tr>
        <tr> 
          <td height="24" valign="top" class="style2"> Hemos recibido de nuestro cliente 
              <asp:Label ID="lblcliente" runat="server" ></asp:Label>
               . <asp:Label ID="lblCantidad" runat="server" ></asp:Label>
&nbsp;, impagos desde su vencimiento ,consistentes en : </td>
          <td></td>
        </tr>
        <tr> 
          <td height="116" valign="top" class="style2"> 
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="660" height="116" valign="top">
                
                <asp:GridView ID="Grilla" runat="server" BackColor="White" 
                     AutoGenerateColumns="False"
                     EmptyDataText="<b>No se encontraron documentos</b>"
                     Width="100%" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        ForeColor="Black" GridLines="Horizontal">
                        
                        <Columns>
                         <asp:TemplateField HeaderText="TIPO DCTO.">
                                <HeaderStyle Wrap="true" Width="200"></HeaderStyle>
                                <HeaderStyle HorizontalAlign="Left" />
                               
                                <ItemStyle Wrap="false" Font-Size="9" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("tipodocu") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                          <asp:TemplateField HeaderText="N° DCTO.">
                                <HeaderStyle Wrap="true" Width="60"></HeaderStyle>
                                <ItemStyle Wrap="false" Font-Size="9"></ItemStyle>
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("nrodocumento") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                           <asp:TemplateField HeaderText="MONTO ($)">
                                <HeaderStyle Wrap="true" Width="70"></HeaderStyle>
                                  <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Wrap="false" Font-Size="9" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%#Evaluar(Eval("montocapital")) %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField HeaderText="BANCO">
                                <HeaderStyle HorizontalAlign="Left" />
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" Font-Size="9"></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("banco") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>     
                             
                              <asp:TemplateField HeaderText="F. Vencimiento">
                                <HeaderStyle HorizontalAlign="Left" />
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" Font-Size="9"></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("fvcto") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>     
                               
                        
                        </Columns>
                        <HeaderStyle CssClass="GridHeader" />	
                        
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black"   />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        
                        
                        <HeaderStyle BackColor="#333333" Font-Size="8"  Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                
                </td>
              </tr>
            </table>
          </td>
          <td></td>
        </tr>
        <tr> 
          <td height="95" valign="top" class="style2"> 
            <P align=justify> &nbsp;&nbsp;&nbsp;Con el objeto de evitar las consecuencias de la cobranza y los mayores 
              gastos que ello le implicar&aacute;, agradecemos se sirva concurrir 
              a su mayor brevedad hasta nuestra oficina, ubicada en calle Estado 
              N&deg; 359, piso 13, Santiago, a fin de regularizar y ver las alternativas 
              de pago de la deuda que en ellos consta.<br>
            </p>
          </td>
          <td></td>
        </tr>
        <tr> 
          <td height="38" valign="top" class="style2">&nbsp;&nbsp;&nbsp;&nbsp;Para su mejor atenci&oacute;n, 
            puede contactarse a los tel&eacute;fonos 6333115 o al 6333483, donde 
            nuestros ejecutivos atender&aacute;n sus consultas.<br />
              <br />
              Si al recibo de la presente, el pago de los documentos se encuentra normalizado, 
              por favor no considere este aviso.</td>
          <td></td>
        </tr>
        <tr> 
          <td height="28" valign="top" class="style2">&nbsp;</td>
          <td></td>
        </tr>
        <tr> 
          <td valign="top" class="style3">&nbsp;&nbsp;&nbsp;&nbsp;Sin otro particular, 
            le saluda atentamente.</td>
          <td class="style4"></td>
        </tr>
        <tr> 
          <td height="18" valign="top" align="center" class="style2"><font size="3"><b>&nbsp;ALC 
              Asesoría Legal y Crediticía Limitada</b></font></td>
          <td></td>
        </tr>
        <tr> 
          <td height="15" valign="top" class="style2"> 
            <div align="center"></div>
          </td>
          <td></td>
        </tr>
        <tr> 
          <td height="45" valign="top" class="style2"><font size="2">JSR/cl/cs<br>
            cc./archivo </font></td>
          <td></td>
        </tr>
        <tr> 
          <td height="80" valign="top" class="style2">&nbsp;</td>
          <td></td>
        </tr>
      </table>
    </td>
  </tr>
</table>

    </form>
</body>
</html>
 <script language="javascript" type="text/javascript">

     window.print();

    </script>
    