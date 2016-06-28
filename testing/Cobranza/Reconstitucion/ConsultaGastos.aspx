<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaGastos.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.ConsultaGastos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">


    function Popup() {
        var url = 'ExcelConsultaGastos.aspx';
        var pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
        pWin.focus();
        return false;
    }

    function VentanaModalEdit(OT) {
        var url = "popAsignacion.aspx?OT=" + OT;
        var strFeatures = "top=100px, left=270px, width=770px, height=400px, center=yes, help=no, status=no"
        ventana = window.open(url, "NewWin", strFeatures);
        ventana.focus();

        document.getElementById("Button1").click();
    }

    function Ir(pagina) {
        document.location.href = pagina;
    }


    function ValidarBuscar() {

        var contador = 0;
        if (!(trim(document.all("txtFechainicio").value)) == "") {
            if (!(EsFecha(document.all("txtFechainicio").value, 'dma'))) {
                alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                document.all("txtFechainicio").focus();
                return false;
            }

            contador++;
        }

        if (!(trim(document.all("txtfechafin").value)) == "") {
            if (!(EsFecha(document.all("txtfechafin").value, 'dma'))) {
                alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                document.all("txtfechafin").focus();
                return false;
            }
            contador++;
        }


        if (contador == 1) {
            alert('Debe ingresar fecha de inicio y fecha de fin (ambas)');
            return false;
        }

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
         .style4
         {
             width: 90px;
         }
         .style6
         {
             width: 462px;
         }
    </style>
    </head>
<body  >
      
      <FORM runat="server" id="Formulario"   >
      
      

    
  
  <TABLE cellSpacing="0" cellPadding="0" width="633" border="0">
  <TBODY> 
  <TR> 
    <TD width="633" height=50 valign="top" bgcolor="#336699"  xbackground="../../images/banner2.jpg"> 
      <TABLE width=500 align=right border=0>
        <TBODY> 
        <TR> 
          <TD class=titulo align=right>SISTEMA DE RECONSTITUCIONES</TD>
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
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;CONSULTA GASTOS</b></TD>
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
                        <td align="right" class="style2" >Rut Cliente :</td>
                        <td  align="left" class="style6" >
                             <asp:TextBox ID="txtRut" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; " Width="138px"></asp:TextBox>
                             (sin DV)</td>
                       
                        <td  align="left" colspan="2">
                        
                           
                           <%--<asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return Popup();" 
                                  ImageUrl="~/images/ico_excel.gif" />--%>
                            
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style2" >N° Operación :</td>
                        <td  align="left" class="style4"  colspan="2">
                           <asp:TextBox ID="txtNrooperacion" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; " Width="138px"></asp:TextBox>
                                
                               
                                
                        </td>
                       
                    </tr>   
                    
                    
                                         <tr>
                        <td align="right" class="style2" >Nombre Cliente :</td>
                        <td  align="left" class="style4"  colspan="2">
                         
                          <asp:TextBox ID="txtNombreCliente" runat="server"  
                                style="WIDTH: 350px; margin-left: 0px; "></asp:TextBox>
                         
                        </td>
                    </tr>   
                    
                    
                    <tr>
                        <td align="right" class="style2" >Remesa :</td>
                        <td  align="left" class="style6"  xcolspan="2">
                           <asp:TextBox ID="txtRemesa" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 120px; margin-left: 0px; " Width="138px"></asp:TextBox>
                                
                            <asp:DropDownList ID="cbxRemesaAll" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="cbxRemesaAll_SelectedIndexChanged">
                            </asp:DropDownList>
                                
                        </td>
                       
                    </tr>   
                    
                     <tr>
                        <td align="right" class="style2" >Rango Fecha :</td>
                        <td  xalign="left" class="style6"  xcolspan="4">
                           <asp:TextBox ID="txtFechainicio" runat="server"  MaxLength="10"
                                style="WIDTH: 70px; margin-left: 0px; " ></asp:TextBox>
                            &nbsp;    
                            <asp:TextBox ID="txtfechafin" runat="server" MaxLength="10"
                                style="WIDTH: 70px; margin-left: 0px; " ></asp:TextBox>   
                                
                        </td>
                       
                    </tr>   
                    
                     <tr>
                        <td align="right" class="style2" >Tipo Gasto:</td>
                        <td  align="left" class="style4"  colspan="2">
                           
                                
                              
                                 
                                   <asp:DropDownList ID="cbxTipoGastos" runat="server" style="WIDTH: 350px; margin-left: 0px;">
                              
                                </asp:DropDownList>
                                
                        </td>
                       
                    </tr>   
                    
          <%--           <tr>
                        <td align="right" class="style2" >Estado :</td>
                        <td  align="left" class="style4"  colspan="2">
                          
                           <asp:DropDownList ID="cbxEstados" runat="server"  
                                 style="WIDTH: 350px; margin-left: 0px;" AutoPostBack="True" 
                                onselectedindexchanged="cbxEstados_SelectedIndexChanged" >
                                 
                            </asp:DropDownList>
                          
                          
                        </td>
                       
                    </tr>   --%>
                  
                  
                     <tr>
                     <td class="textos22"  colspan="4">&nbsp;
                     
                    
                     </td>
                    </tr>
                      
                     <tr>
                     <td class="textos22"  colspan="4">&nbsp;
                     
                      
                              <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" onclick="btnBuscar_Click" 
                             />
                            &nbsp;
                              <asp:Button ID="btnLimpiar" runat="server" CssClass="boton" Text="Limpiar" onclick="btnLimpiar_Click" 
                             />
                           
                           &nbsp;
                           
                              <asp:Button ID="Button2" runat="server" OnClientClick="window.print();" CssClass="boton" Text="Imprimir" 
                             />
                             &nbsp;
                               <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return Popup();" 
                                  ImageUrl="~/images/ico_excel.gif" Width="20px" />
                     </td>
                    </tr>
                    
                         <tr>
                     <td class="textos22"  colspan="4">&nbsp;
                     
                    
                     </td>
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
                                         PageSize="30"
                                         AutoGenerateColumns="False"
                                         Width="780px" 
                                         OnRowCommand="Editar"   
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                          
                        
                             
                              <asp:TemplateField HeaderText="N° Operación" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="true" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo122233444" runat="server" Text='<%# Bind("nrooperacion") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField HeaderText="Rut Cliente" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="false"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo1454545356" runat="server" Text='<%# Bind("rutcliente") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField HeaderText="Nombre Cliente" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="true" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo166653434" runat="server" Text='<%# Bind("nombrecliente") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField HeaderText="Remesa" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="true" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo166eeeere653434" runat="server" Text='<%# Bind("remesa") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
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
                            
                            <PagerSettings Mode="NextPreviousFirstLast"
                               FirstPageText="<<"
                               LastPageText=">>"
                               PageButtonCount="20"
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
                    
                            
                       <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" 
                            OnClientClick="return ValidarGuardar();" 
                            Visible="False" />
                   
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
          </font> </div>
         
    </TD>
  </TR>
  </TBODY> 
</TABLE>

      </FORM>
      
    </body>
</html>
