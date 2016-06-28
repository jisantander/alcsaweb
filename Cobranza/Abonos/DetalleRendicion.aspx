<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleRendicion.aspx.cs" Inherits="CobranzaALC.Cobranza.Abonos.DetalleRendicion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
     <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">




    function valida() {


        if (confirm('Esta seguro de ingresar esta información ?')) {
            return true;

        } else return false;

    }

    function MostrarDocumento(id_rendicion) {

        url = 'ComprobanteRendicion.aspx?id_Rendicion=' + id_rendicion;

        pWin = window.open(url, 'newWin', 'width=680,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
    }



    function Actividades() {

        var valor = '';
        var url = '';

        valor = document.all("hiddCobranza").value;
        url = '../Procesos/MostrarActividadesPrejudiciales.aspx?Codigo=' + valor;

        Ir(url, '900', '650');

        return false;
    }


    function Ir(url, ancho, alto) {
        pWin = window.open(url, 'newWin', 'width=' + ancho + ',height=' + alto + ',scrollbars=1,satus=0,menubar=no,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
    }

   </script>
    

    <style type="text/css">
        .style1
        {
            width: 190px;
        }
        .style4
        {
            width: 343px;
        }
        .style5
        {
            width: 188px;
        }
    </style>

</head>
<body>
    <TABLE cellSpacing=0 cellPadding=0 width=633 border=0>
  <TBODY> 
  <TR> 
    <TD width="633" height=50 valign="top" bgcolor="#336699" xbackground="../../images/banner2.jpg"> 
      <TABLE width=313 align=right border=0>
        <TBODY> 
        <TR> 
          <TD class=titulo align=right>SISTEMA DE COBRANZA</TD>
        </TR>
        </TBODY> 
      </TABLE>
    </TD>
  </TR>
  <TR> 
    <TD height="394" valign="top" class=textos><BR>
      <CENTER>
      </CENTER>
      
      <FORM runat="server" id="Formulario"   >
      
        <TABLE align=center border=0 style="width: 720px"  >
          <TBODY> 
          <TR> 
                      <!---->          
            <TD height="163" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;RENDICIÓN</b></TD>
                </TR>
                </TBODY> 
              </TABLE>
              <TABLE height=7 width=345>
                <TBODY> 
                <TR> 
                  <TD>
                     
                      
                     
                    </TD>
                </TR>
                </TBODY> 
              </TABLE>
              
              <!-- Tabla Cuerpo Inicio -->
              <table borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 width=633 border=1 height="100" >
              <tr>
              <td valign="top">
               
                 
 
 
 
   <TABLE class=celdas  style="width: 720px"
style="BORDER-RIGHT: #006699; BORDER-TOP: #006699; BORDER-LEFT: #006699; BORDER-BOTTOM: #006699" 
cellSpacing=0 cellPadding=0 width="100%" bgColor=#cfe4ee border=0>
    <TBODY> 
    <TR bgColor=#333366> 
      <TD colSpan=2><B><font color="#FFFFFF">&nbsp;<font size="2">DETALLE</font></font></B></TD>
    </TR>
 
 
  <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">N° Operación</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:Label ID="lblNrooperacion" runat="server" ></asp:Label>
        </font></TD>
    </TR>
 
 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Rut Deudor</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:Label ID="lblRutDeudor" runat="server" ></asp:Label>
        </font></TD>
    </TR>
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Deudor</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:Label ID="lblDeudor" runat="server" ></asp:Label>
        </font></TD>
    </TR>
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Cliente</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:Label ID="lblCliente" runat="server" ></asp:Label>
        </font></TD>
    </TR>
    
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">N° Comprobante </font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:Label ID="lblnrocomprobante" runat="server" ></asp:Label>
        </font></TD>
    </TR>
    
 
    
    </TABLE>
    
    
    
       <TABLE class=celdas  style="width: 720px"
style="BORDER-RIGHT: #006699; BORDER-TOP: #006699; BORDER-LEFT: #006699; BORDER-BOTTOM: #006699" 
cellSpacing=0 cellPadding=0 width="100%" bgColor=#cfe4ee border=0>
    <TBODY> 
    <TR bgColor=#333366> 
      <TD colSpan=3><B><font color="#FFFFFF">&nbsp;<font size="2">CÁLCULOS</font></font></B></TD>
    </TR>
 
 
  <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Monto</font></B></FONT></TD>
      <TD vAlign=top class="style4"><font size="2">&nbsp;
          <asp:Label ID="lblMonto" runat="server" ></asp:Label>
        </font></TD>
        <td>
        
            <asp:CheckBox ID="chkMonto" runat="server"  AutoPostBack="true"
                oncheckedchanged="chkMonto_CheckedChanged" />
        </td>
        
    </TR>
 
 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Intereses</font></B></FONT></TD>
      <TD vAlign=top class="style4"><font size="2">&nbsp;
          <asp:Label ID="lblIntereses" runat="server" ></asp:Label>
        </font></TD>
          <td>
         <asp:CheckBox ID="chkIntereses" runat="server" AutoPostBack="true"
                  oncheckedchanged="chkIntereses_CheckedChanged" />
        </td>
    </TR>
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Gastos</font></B></FONT></TD>
      <TD vAlign=top class="style4"><font size="2">&nbsp;
          <asp:Label ID="lblGastos" runat="server" ></asp:Label>
        </font></TD>
          <td>
         <asp:CheckBox ID="chkGastos" runat="server" AutoPostBack="true"
                  oncheckedchanged="chkGastos_CheckedChanged" />
        </td>
    </TR>
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Interes Adicional</font></B></FONT></TD>
      <TD vAlign=top class="style4"><font size="2">&nbsp;
          <asp:Label ID="lblInteresAdicional" runat="server" ></asp:Label>
        </font></TD>
          <td>
         <asp:CheckBox ID="chkInteresAdicional" runat="server" AutoPostBack="true"
                  oncheckedchanged="chkInteresAdicional_CheckedChanged" />
        </td>
    </TR>
    
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Honorarios </font></B></FONT></TD>
      <TD vAlign=top class="style4"><font size="2">&nbsp;
          <asp:Label ID="lblHonorarios" runat="server" ></asp:Label>
        </font></TD>
          <td>
         <asp:CheckBox ID="chkHonorarios" runat="server" AutoPostBack="true"
                  oncheckedchanged="chkHonorarios_CheckedChanged" />
        </td>
    </TR>
    
    
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Desc. Honorarios</font></B></FONT></TD>
      <TD vAlign=top class="style4"><font size="2">&nbsp;
          <asp:Label ID="lblDescHonorarios" runat="server" ></asp:Label>
        </font></TD>
          <td>
         <asp:CheckBox ID="chkDescHonorarios" runat="server" AutoPostBack="true"
                  oncheckedchanged="chkDescHonorarios_CheckedChanged" />
        </td>
    </TR>
    
    
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Otros Descuentos </font></B></FONT></TD>
      <TD vAlign=top class="style4"><font size="2">&nbsp;
          <asp:Label ID="lblOtrosDescuentos" runat="server" ></asp:Label>
        </font></TD>
          <td>
         <asp:CheckBox ID="chkOtrosDescuentos" runat="server" AutoPostBack="true"
                  oncheckedchanged="chkOtrosDescuentos_CheckedChanged" />
        </td>
    </TR>
    
    
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Desc. Interes </font></B></FONT></TD>
      <TD vAlign=top class="style4"><font size="2">&nbsp;
          <asp:Label ID="lblDescInteres" runat="server" ></asp:Label>
        </font></TD>
          <td>
         <asp:CheckBox ID="chkDescInteres" runat="server" AutoPostBack="true"
                  oncheckedchanged="chkDescInteres_CheckedChanged" />
        </td>
    </TR>
 
 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">TOTAL </font></B></FONT></TD>
      <TD vAlign=top class="style4"><font size="2">&nbsp;
          <asp:Label ID="lblTotalTodo" runat="server" ></asp:Label>
        </font></TD>
          <td>
        </td>
    </TR>
 

    
    </TABLE>
    
    <br/>
   <TABLE class=celdas  style="width: 720px"
style="BORDER-RIGHT: #006699; BORDER-TOP: #006699; BORDER-LEFT: #006699; BORDER-BOTTOM: #006699" 
cellSpacing=0 cellPadding=0 width="100%" bgColor=#cfe4ee border=0>


 <TR bgColor=#333366> 
      <TD class="style5" ><B><font color="#FFFFFF">&nbsp;MONTO A RENDIR</font></B></TD>
      <TD ><B><font color="#FFFFFF">&nbsp;<font size="2"><asp:Label ID="lblMontoaRendir" runat="server" ></asp:Label></font></font></B></TD>
      <TD ><B><font color="#FFFFFF">&nbsp;</font></B></TD>
    </TR>
</TABLE>
              </td>
            </tr>
            </table>
            
                <!-- Tabla Cuerpo Fin -->
              
            </TD>
          </TR>
          
          
          
          
          
             <tr>
              <td valign="top">
                  <!-- Inicio Grilla -->
                          <%--<asp:GridView ID="Grilla" runat="server" 
                                         AllowPaging="True"  
                                         PageSize="1000"
                                         AutoGenerateColumns="False"
                                         Width="720" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                          
                              <asp:TemplateField HeaderText="N° Doc.">
                                <HeaderStyle HorizontalAlign=Left Wrap="true" Width="100"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("nrodocumento") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                             <asp:TemplateField    HeaderText="Monto">
                             <HeaderStyle HorizontalAlign=Left Wrap="true" Width="100"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1" runat="server" Text='<%# Bind("montocapital") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             
                             <asp:TemplateField    HeaderText="Estado">
                             <HeaderStyle HorizontalAlign=Center Wrap="true" Width="100"></HeaderStyle>
                             <ItemStyle Wrap="false" HorizontalAlign="Center" ></ItemStyle>
                              <ItemTemplate>
                              <asp:Image ID="imgPagado" ToolTip='<%#LetraPagadatool(Eval("pagado")) %>' ImageUrl='<%#LetraPagadaicon(Eval("pagado")) %>' runat="server" />
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField    HeaderText="MCH">
                             <HeaderStyle Wrap="true"  HorizontalAlign=Left Width="100"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("MCH") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField    HeaderText="Fecha Vcto.">
                             <HeaderStyle Wrap="true"  HorizontalAlign=Left Width="100"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("fechavcto") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField    HeaderText="Liberado">
                             <HeaderStyle Wrap="true" HorizontalAlign=Left Width="300"></HeaderStyle>
                             <ItemStyle Wrap="true" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("Liberado") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                          
                          
                              <asp:TemplateField    HeaderText="Observación">
                             <HeaderStyle Wrap="true" HorizontalAlign=Left Width="300"></HeaderStyle>
                             <ItemStyle Wrap="true" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("observacion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
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
                            </asp:GridView>--%>
                  
                  <!-- Fin Grilla -->
              </td>
              </tr>
              
              
              
          <TR> 
            <TD  valign="top" bgcolor="#CCCCCC"> 
              
              <!-- Zona de Botoneras -->
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="600" height="35" > 
                    <div align="center"> 
              
     
                       <asp:Button ID="btnCalcular"  Width="210px" runat="server" CssClass="boton" 
                            Text="Calcular" onclick="btnCalcular_Click"   
                             />
                             
                            <asp:Button ID="btnGuardar" Width="210px" runat="server" CssClass="boton2"  OnClientClick="return valida();"
                            Text="Guardar" onclick="btnGuardar_Click" 
                              />
                            
                            
                            
                            
                            </TD>
                       
                     </div>
                  </td>
                </tr>
              </table>
              
              
              <br/>
              
                 <asp:GridView ID="Grilla" runat="server" 
                                         EmptyDataText="<b>No existen abonos registrados</b>"
                                          
                                         AllowPaging="True"  
                                         PageSize="1000"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None" style="margin-right: 0px"> 
                            <Columns>
                         
                         
                              <asp:TemplateField HeaderText="N° Rendición">
                                <HeaderStyle Wrap="true" Width="180" HorizontalAlign=Left></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("id_rendicion") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                       
                              <asp:TemplateField HeaderText="Monto">
                                <HeaderStyle Wrap="true" Width="180" HorizontalAlign=Left></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("monto") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                             <asp:TemplateField    HeaderText="Fecha Rendición">
                             <HeaderStyle Wrap="true" Width="100" HorizontalAlign=Left></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%#Bind("fproceso")%>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                           
                            
                             
                             
                            <asp:TemplateField HeaderText="Imprimir Comprobante"  >
                              <ItemTemplate>
                               <a href="#" onclick="javascript:MostrarDocumento('<%# Eval("id_rendicion")%>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/lupa.jpg" ToolTip="Ver Comprobante Abono"  /></a> 
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

              
              
            </TD>
      
          </TR>
          </TBODY> 
        </TABLE>
        <div align="center"><font size="2">Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
          </font> </div>
          
          
          <asp:HiddenField ID="hddnrooperacion" runat="server" />
          <asp:HiddenField ID="hddrutdeudor" runat="server" />
          <asp:HiddenField ID="hddnomdeudor" runat="server" />
          <asp:HiddenField ID="hddnrocomprobante" runat="server" />
          <asp:HiddenField ID="hddnomcliente" runat="server" />
          <asp:HiddenField ID="hddmontoabono" runat="server" />
          
          <asp:HiddenField ID="hiddCobranza" runat="server" />
          <asp:HiddenField ID="hddIdAbono" runat="server" />
          
          
          
          
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>
</body>
</html>

