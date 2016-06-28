<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MuestraRendicion.aspx.cs" Inherits="CobranzaALC.Cobranza.Abonos.MuestraRendicion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">


    function guardarabono() {


        if (trim(document.all("txtNroCheque").value) == "") {
            alert('Debe ingresar Nro. de Cheque');
            document.all("txtNroCheque").focus();
            return false;
        }

        if (trim(document.all("txtNroSerie").value) == "") {
            alert('Debe ingresar Nro. de Serie');
            document.all("txtNroSerie").focus();
            return false;
        }


        if (!(EsFecha(document.all("txtFechacheque").value, 'dma'))) {
            alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
            document.all("txtFechacheque").focus();
            return false;
        }

        if (trim(document.all("txtNroCtaCte").value) == "") {
            alert('Debe ingresar Nro. de Cta. Cte.');
            document.all("txtNroCtaCte").focus();
            return false;
        }


        if (confirm('Esta seguro de ingresar está información ?')) {
            return true;

        } else return false;

    }



    function Ir(pagina, estado) {

        if (trim(estado) == 'A') {
            document.location.href = pagina;

        } else {
            alert('Cobranza se encuentra términada');
        }
    }


    function ValidarBuscar() {

        if (trim(document.all("txtNro").value == "")) {
            alert('Debe ingresar el N° de comprobante');
            document.all("txtNro").focus();
            return false;
        }





        //        if (document.all("txtNroOperacion").value == "")
        //        {
        //           alert('Debe ingresar N° de operación');
        //           document.all("txtNroOperacion").focus();
        //           return false;
        //        }

        return true;

    }



 </script>
 
 

     <style type="text/css">
        .style2
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 132px;
        }
        .style3
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 104px;
        }
         .style6
         {
             width: 210px;
         }
         .style7
         {
             width: 227px;
         }
    </style>
    </head>
<body  >
      
      <FORM runat="server" id="Formulario"   >
      
      

    
  
  <TABLE cellSpacing="0" cellPadding="0" width="633" border="0">
  <TBODY> 
  <TR> 
    <TD width="633" height=50 valign="top" bgcolor="#336699"  xbackground="../../images/banner2.jpg"> 
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
      
      
   <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
        <TABLE width=633 align=center border=0  >
          <TBODY> 
          <TR> 
            <TD height="114" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;BUSCAR RENDICIÓN</b></TD>
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
              <td align="left">
                  <!-- Inicio Filtros -->
                      <table border="0" width="100%" bgColor=#e6ecf2 border=0>
                    <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style2" >N° Rendición :</td>
                        <td  align="left" class="style6" >
                            <asp:TextBox ID="txtNro" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 120px; margin-left: 0px; " Width="138px"></asp:TextBox>
                            
                            </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                              <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" onclick="btnBuscar_Click" 
                             />
                             
                               <asp:Button ID="Button2" Visible=false runat="server" CssClass="boton" Text="Imprimir" OnClientClick="window.print();" 
                             />
                            
                        </td>
                    </tr>
                    
                    <%-- <tr>
                        <td align="right" class="style2" >Número Operación :</td>
                        <td  align="left" class="style4"  colspan="2">
                           <asp:TextBox ID="txtNroOperacion" runat="server"  onKeyPress="return acceptNum(event)"
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                        </td>
                       
                    </tr>   --%>
                    
                     <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                  </table>
                  
                  <!-- Fin Filtros -->
              </td>
              </tr>
            
            <tr>
              <td valign="top">
              
                 
              
              
                  <!-- Inicio Grilla -->
                           <asp:GridView ID="Grilla" runat="server" 
                                         OnPageIndexChanging = "Grilla_PageIndexChanging"
                                         AllowPaging="True"  
                                         PageSize="8"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                            
<%--                            <asp:TemplateField HeaderText="Acción">
                              <ItemTemplate>
                               <a href="#" onclick="javascript:Ir('PagoAbono.aspx?Codigo=<%# Eval("id_cobranza") %>','<%# Eval("tipo") %>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Agregar gasto"  /></a> 
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField HeaderText="MCH">
                              <ItemTemplate>
                               <a href="#" onclick="javascript:Ir('PagoAbonoSub.aspx?Codigo=<%# Eval("id_cobranza") %>','<%# Eval("tipo") %>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Agregar MCH"  /></a> 
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                             
                              <asp:TemplateField HeaderText="id_abono">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo1" runat="server" Text='<%# Bind("id_abono") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                            
                            
                            <asp:TemplateField HeaderText="id_cobranza">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo2" runat="server" Text='<%# Bind("id_cobranza") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                            
                            
                             <asp:TemplateField HeaderText="monto">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo3" runat="server" Text='<%# Bind("monto") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField HeaderText="Fecha Rendición">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo4" runat="server" Text='<%# Bind("fproceso") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
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
                            
                  <asp:Panel ID="pnlCheque" runat="server" Visible=false>
                  
                   <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;INGRESO DOCUMENTO</b></TD>
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
                  
                 
                  
                  
                  <TABLE class=celdas  style="width: 720px"
style="BORDER-RIGHT: #006699; BORDER-TOP: #006699; BORDER-LEFT: #006699; BORDER-BOTTOM: #006699" 
cellSpacing=0 cellPadding=0 width="100%" bgColor=#cfe4ee border=0>
    <TBODY> 
    <TR bgColor=#333366> 
      <TD colSpan=2><B><font color="#FFFFFF">&nbsp;<font size="2">DETALLE</font></font></B></TD>
    </TR>
 
 <!-- Datos del documento  -->
 
  <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">Banco</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
           <asp:DropDownList ID="cbxBanco" runat="server" Height="19px" Width="234px">
              
                      </asp:DropDownList>
        </font></TD>
    </TR>
  <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">N° Cheque</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:TextBox ID="txtNroCheque" runat="server" Width="227px"></asp:TextBox>
        </font></TD>
    </TR>
 
 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">N° Serie</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:TextBox ID="txtNroSerie" runat="server" Width="227px"></asp:TextBox>
        </font></TD>
    </TR>


 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">Fecha Cheque</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:TextBox ID="txtFechacheque" MaxLength="10" runat="server" Width="227px"></asp:TextBox>
        </font></TD>
    </TR> 
  <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">N° Cta. Cte.</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:TextBox ID="txtNroCtaCte" runat="server" Width="227px"></asp:TextBox>
        </font></TD>
    </TR>  
 
 <!--  -->
 
 <%-- <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">Fecha Deposito</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:TextBox ID="TextBox1" runat="server" Width="227px"></asp:TextBox>
        </font></TD>
    </TR>
 
 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">Cuenta Deposito</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:TextBox ID="TextBox2" runat="server" Width="227px"></asp:TextBox>
        </font></TD>
    </TR>
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">N° Comprobante Deposito</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:TextBox ID="TextBox3" runat="server" Width="227px"></asp:TextBox>
        </font></TD>
    </TR>
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">Fecha liberación Cheque</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:TextBox ID="TextBox4" runat="server" Width="227px"></asp:TextBox>
        </font></TD>
    </TR>
    
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">Estado </font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          </font>
          <asp:DropDownList ID="DropDownList1" runat="server" Height="19px" Width="234px">
              <asp:ListItem>Seleccione</asp:ListItem>
              <asp:ListItem>Liberado</asp:ListItem>
              <asp:ListItem>Protestado</asp:ListItem>
                      </asp:DropDownList>
        </TD>
    </TR>--%>
    
 
    
    </TABLE>
     </asp:Panel>
                  <!-- Fin Grilla -->
              </td>
              </tr>
             <%--<tr>
              <td valign="top">
                 Total registros : 
              
              </td>
              </tr>--%>
            </table>
            
                <!-- Tabla Cuerpo Fin -->
              
            </TD>
          </TR>
          <TR> 
            <TD  valign="top" bgcolor="#CCCCCC"> 
              
              <!-- Zona de Botoneras -->
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="600" height="35" > 
                    <div align="center"> 
                    
                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" 
                           OnClientClick="return ValidarBuscar();"  
                            Visible="False" />
                    
                     <asp:Button ID="Button3" runat="server" CssClass="boton" Text="Volver" 
                            
                            Visible="false" onclick="Button3_Click" />
                   
                            
                       <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" 
                            OnClientClick="return guardarabono();" 
                            Visible="true" onclick="btnGuardar_Click" />
                   
                       <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar" 
                             Visible="False" />
                       
                     </div>
                  </td>
                </tr>
              </table>
              
            </TD>
          </TR>
          </TBODY> 
        </TABLE>
        <div align="left"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
          iv>
         
    </TD>
  </TR>
  </TBODY> 
</TABLE>

 <asp:HiddenField ID="hiddidcobranza" runat="server" />

      </FORM>
      
    </body>
</html>
