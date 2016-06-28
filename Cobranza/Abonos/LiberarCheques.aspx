<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LiberarCheques.aspx.cs" Inherits="CobranzaALC.Cobranza.Abonos.LiberarCheques" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">



    function guardarabono() {


        if (!(EsFecha(document.all("txtFechaDeposito").value, 'dma'))) {
            alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
            document.all("txtFechaDeposito").focus();
            return false;
        }


        if (trim(document.all("txtCuentaDeposito").value) == "") {
            alert('Debe ingresar Cuenta Deposito');
            document.all("txtCuentaDeposito").focus();
            return false;
        }


        if (trim(document.all("txtNroComprobante").value) == "") {
            alert('Debe ingresar N° Comprobante');
            document.all("txtNroComprobante").focus();
            return false;
        }




        if (!(EsFecha(document.all("txtFexhaLiberacionCheque").value, 'dma'))) {
            alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
            document.all("txtFexhaLiberacionCheque").focus();
            return false;
        }


        if (confirm('Esta seguro de ingresar esta información ?')) {
            return true;

        } else return false;

    }



    function guardarabonoMCH() {


        if (!(EsFecha(document.all("txtFechaDeposito").value, 'dma'))) {
            alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
            document.all("txtFechaDeposito").focus();
            return false;
        }


        if (trim(document.all("txtCuentaDeposito").value) == "") {
            alert('Debe ingresar Cuenta Deposito');
            document.all("txtCuentaDeposito").focus();
            return false;
        }


        if (trim(document.all("txtNroComprobante").value) == "") {
            alert('Debe ingresar N° Comprobante');
            document.all("txtNroComprobante").focus();
            return false;
        }

        if (!(EsFecha(document.all("txtFexhaLiberacionCheque").value, 'dma'))) {
            alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
            document.all("txtFexhaLiberacionCheque").focus();
            return false;
        }


        if (confirm('Esta seguro de ingresar esta información ?')) {
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
            alert('Debe ingresar el N° de Operación');
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
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;BUSCAR DOCUMENTO</b></TD>
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
                        <td align="right" class="style2" >N° Operación :</td>
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
                                         OnRowCommand="Editar"  
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
                             
                              <asp:TemplateField HeaderText="Rut Cliente">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo1" runat="server" Text='<%# Bind("rut_cli") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                            
                            
                            <asp:TemplateField HeaderText="Nombre Cliente">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo2" runat="server" Text='<%# Bind("nomcliente") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                            
                            
                             <asp:TemplateField HeaderText="Nombre Deudor">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo3" runat="server" Text='<%# Bind("nomdeudor") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField HeaderText="N° Comprobante">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo4" runat="server" Text='<%# Bind("nrocomprobante") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                            
                            
                              <asp:TemplateField HeaderText="Fecha Abono">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo45" runat="server" Text='<%# Bind("fechaabono") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                            
                             
                              <asp:TemplateField HeaderText="Monto Abono">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo46" runat="server" Text='<%# Bind("montoabono") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField HeaderText="Tipo Abono">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo47" runat="server" Text='<%# Bind("moneda") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField HeaderText="N° cheque">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo477" runat="server" Text='<%# Bind("nrocheque") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                               <asp:TemplateField HeaderText="Serie">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo4747" runat="server" Text='<%# Bind("serie") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             
                            
                             <asp:TemplateField HeaderText="Rendido">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo48" runat="server" Text='<%# Bind("rendicion") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                            
                               <asp:TemplateField HeaderText="Multicheque (MCH)">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo49" runat="server" Text='<%# Bind("mch") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                                   <asp:TemplateField HeaderText="IdContratista" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblidAbono" runat="server" Text='<%# Bind("id_abono") %>' SortExpression = "lblIdAccion"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>  
                
                
                            <asp:TemplateField HeaderText="IdContratista" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblmch" runat="server" Text='<%# Bind("mch") %>' SortExpression = "lblIdAccion"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>  
                
                
                
                            <asp:TemplateField HeaderText="IdContratista" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblRendido" runat="server" Text='<%# Bind("rendicion") %>' SortExpression = "lblIdAccion"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>  
                
                
                           
            <%--               
                                <asp:TemplateField HeaderText="">
                              <ItemTemplate>
                               <a href="#" onclick="javascript:Ir('PagoAbonoSub.aspx?Codigo=<%# Eval("id_abono") %>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Agregar MCH"  /></a> 
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                             
                  <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Left">
                 <ItemTemplate>
                     <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="~/images/b_editar.gif" Width="18" Height="18"   ToolTip="Editar" CommandName="Editar" Visible="true" />
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
                            
                            
                            
                  <asp:Panel ID="pnlMCH" runat="server">
                  
                  <br/>
                  
                  <asp:GridView ID="grillaMCH" runat="server" 
                                         OnRowCommand="Muestra" 
                                        
                                         PageSize="1000"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                      
                                         GridLines="None"> 
                            <Columns>
                            
                             
                              <asp:TemplateField HeaderText="N° Comprobante" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true" ></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo222" runat="server" Text='<%# Bind("id_abono_comprobante") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                            
                            
                              <asp:TemplateField HeaderText="Fecha Pago" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo223" runat="server" Text='<%# Bind("fpago") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                            
                             
                              <asp:TemplateField HeaderText="N° Cheque" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo224" runat="server" Text='<%# Bind("nrocheque") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField HeaderText="Serie" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo225" runat="server" Text='<%# Bind("serie") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField HeaderText="Monto Abono" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo226" runat="server" Text='<%# Bind("montoabono") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                       
                             
                             
                                   <asp:TemplateField HeaderText="id_abono_comprobante" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblidAbono" runat="server" Text='<%# Bind("id_abonoMCH") %>' SortExpression = "lblIdAccion"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>  
                
                
                            
                                   <asp:TemplateField HeaderText="id_abono_comprobante" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblnrocheque" runat="server" Text='<%# Bind("nrocheque") %>' SortExpression = "lblIdAccion"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>  
                
                
                
            
                             
                  <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Left">
                 <ItemTemplate>
                     <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="~/images/b_editar.gif" Width="18" Height="18"   ToolTip="Editar" CommandName="Muestra" Visible="true" />
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
                  
                  </asp:Panel>
                            
                            
                            
                  <asp:Panel ID="pnlCheque" runat="server" Visible=false>
                  
                   <!-- Zona de Titulo -->
     <%--       
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;INGRESO DOCUMENTO</b></TD>
                </TR>
                </TBODY> 
              </TABLE>--%>
    <%--          <TABLE height=7 width=345>
                <TBODY> 
                <TR> 
                  <TD>
                     
                      
                     
                    </TD>
                </TR>
                </TBODY> 
              </TABLE>--%>
                  
                 <br />
                    
     <div id="panel" runat="server">                 
                  
                  <TABLE class=celdas  style="width: 720px"   
style="BORDER-RIGHT: #006699; BORDER-TOP: #006699; BORDER-LEFT: #006699; BORDER-BOTTOM: #006699" 
cellSpacing=0 cellPadding=0 width="100%" bgColor=#cfe4ee border=0>
    <TBODY> 
    <TR bgColor=#333366> 
      <TD colSpan=2><B>
          <font color="#FFFFFF">&#160;<font size="2"><asp:Label ID="lblTitulo" runat="server" ></asp:Label></font>
          <asp:Label ID="lblNroCOM" runat="server" Text=""></asp:Label>
          </font>
          
          </B></TD>
    </TR>
 
 <!-- Datos del documento  -->
 
 
 <!--  -->
 
  <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">Fecha Deposito</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:TextBox ID="txtFechaDeposito" MaxLength="10"  runat="server" Width="227px"></asp:TextBox>
        </font></TD>
    </TR>
 
 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">Cuenta Deposito</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:TextBox ID="txtCuentaDeposito" runat="server" Width="227px"></asp:TextBox>
        </font></TD>
    </TR>
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">N° Comprobante Deposito</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:TextBox ID="txtNroComprobante" runat="server" Width="227px"></asp:TextBox>
        </font></TD>
    </TR>
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">Fecha Liberación Cheque</font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:TextBox ID="txtFexhaLiberacionCheque" MaxLength="10" runat="server" Width="227px"></asp:TextBox>
        </font></TD>
    </TR>
    
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style7">
          <font color="#ffffff">&#160;&#160;<b><font size="2">Estado </font></b></font></TD>
      <TD vAlign=top><font size="2">&nbsp;
          </font>
          <asp:DropDownList ID="cbxEstado" runat="server" Height="19px" Width="234px">
              <asp:ListItem Value="N">Seleccione</asp:ListItem>
              <asp:ListItem Value="L">Liberado</asp:ListItem>
              <asp:ListItem Value="P">Protestado</asp:ListItem>
             
                      </asp:DropDownList>
        </TD>
    </TR>
    
 
    
    </TABLE>
    
    </div>
                     
    
    
    
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
                            
                            
                            
                             <asp:Button ID="btnGuardarMCH" runat="server" CssClass="boton" Text="Guardar" 
                            OnClientClick="return guardarabonoMCH();" 
                            Visible="true" onclick="btnGuardarMCH_Click"  />
                            
                            
                   
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
          </div>
         
    </TD>
  </TR>
  </TBODY> 
</TABLE>

 <asp:HiddenField ID="hiddidcobranza" runat="server" />
 
 <asp:HiddenField ID="hddIdAbonoMCH" runat="server" />

      </FORM>
      
    </body>
</html>
