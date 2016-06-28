<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteReconMarca.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.ReporteReconMarca" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">


    function Popup() {
        var url;
        url = 'ReconExcel.aspx';

        pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
    }



    function PopupDoc(url) {


        pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
    }


    function Ir(pagina) {




        //         if(trim(estado) == 'A')
        //          {
        document.location.href = pagina;
        //            
        //          }else{ 
        //            alert('Cobranza se encuentra términada'); 
        //          } 
    }


    function ValidarBuscar() {







        //        
        //    if (!(trim(document.all("txtFechaRemesa").value)) == "")
        //    
        //        {     
        //       if(!(EsFecha(document.all("txtFechaRemesa").value,'dma')))
        //       {
        //          alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
        //          document.all("txtFechaRemesa").focus();
        //          return false;
        //       }
        //      }



        /*
                if(document.all("txtRut").value == "" && document.all("txtNroOperacion").value == "")
                {
                   alert('Debe ingresar como mínimo un filtro');
                   document.all("txtRut").focus();
                   return false;
                } 
        
               
                if(!(document.all("txtRut").value == ""))
                {
                    if(!(ChequeaRut(document.all("txtRut"))))
                    {
                       alert('Rut no es válido');
                       document.all("txtRut").focus();
                       document.all("txtRut").select();
                       
                       return false;
                    }
                }
               
          */


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
             width: 210px;
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
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;BUSCAR RECONSTITUCION INFORME</b></TD>
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
                        <td align="right" class="style2" >Rut Deudor :</td>
                        <td  align="left" class="style6" >
                            <asp:TextBox ID="txtRut" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; " Width="138px"></asp:TextBox>
                               <font color="red" size="-2"><b> (Sin DV)</b></font>
                            </td>
                       
                        <td  align="left" colspan="2">
                            
                              <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" onclick="btnBuscar_Click" 
                             />
                            &nbsp;
                              <asp:Button ID="btnLimpiar" runat="server" CssClass="boton" Text="Limpiar" onclick="btnLimpiar_Click" 
                             />
                           
                           &nbsp;
                           
                         <%--  <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return Popup();" 
                                  ImageUrl="~/images/ico_excel.gif" />--%>
                            
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style2" >Número Operación :</td>
                        <td  align="left" class="style4"  colspan="2">
                           <asp:TextBox ID="txtNroOperacion" runat="server"  xonKeyPress="return acceptNum(event)"
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                                
                               
                                
                        </td>
                       
                    </tr>   
                 <%--   
                     <tr>
                        <td align="right" class="style2" >Fecha Remesa :</td>
                        <td  align="left" class="style4"  colspan="2">
                           
                                 
                              
                                 
                                  <asp:TextBox ID="txtFechaRemesa" runat="server"  
                                style="WIDTH: 90px; margin-left: 0px; "></asp:TextBox>
                                
                                 <asp:DropDownList ID="cbxRemesas" runat="server"  
                                 style="WIDTH: 100px; margin-left: 0px;" AutoPostBack="True" onselectedindexchanged="cbxRemesas_SelectedIndexChanged" 
                                   >
                            </asp:DropDownList>  

                                
                        </td>
                       
                    </tr>   --%>
                    
     <%--                <tr>
                        <td align="right" class="style2" >Estado :</td>
                        <td  align="left" class="style4"  colspan="2">
                           <asp:DropDownList ID="cbxEstados" runat="server"  
                                 style="WIDTH: 350px; margin-left: 0px;" AutoPostBack="True" 
                                onselectedindexchanged="cbxEstados_SelectedIndexChanged" >
                                 
                            </asp:DropDownList>
                        </td>
                    </tr>   
                    --%>
                     
          <%--           <tr>
                        <td align="right" class="style2" >Responsable :</td>
                        <td  align="left" class="style4"  colspan="2">
                           <asp:DropDownList ID="cbxResponsable" runat="server"  
                                 style="WIDTH: 350px; margin-left: 0px;" AutoPostBack="True" onselectedindexchanged="cbxResponsable_SelectedIndexChanged" 
                                >
                                 
                            </asp:DropDownList>
                        </td>
                    </tr>  --%> 
                    

                     <tr>
                        <td align="right" class="style2" >Nombre Cliente :</td>
                        <td  align="left" class="style4"  colspan="2">
                         
                          <asp:TextBox ID="txtNombreCliente" runat="server"  
                                style="WIDTH: 350px; margin-left: 0px; "></asp:TextBox>
                         
                        </td>
                    </tr>   


<%--
                          <tr>
                        <td align="right" class="style2" >Conservador :</td>
                        <td  align="left" class="style4"  colspan="2">
                           <asp:TextBox ID="txtConservadorFiltro" runat="server"  xonKeyPress="return acceptNum(event)"
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                                
                               
                                
                        </td>
                       
                    </tr>  --%>
                    
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
                                         PageSize="30"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                          
                            
                             
                              <asp:TemplateField HeaderText="Rut Cliente" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("rutcliente") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              
                             
                             
                              <asp:TemplateField HeaderText="Dv" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("dv") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField HeaderText="N° Operación" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("nrooperacion") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField    HeaderText="Nombre Cliente" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("nombrecliente") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                                <asp:TemplateField HeaderText="Responsable" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("user_responsable") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Estado" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("estadodescripcion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField    HeaderText="Fecha Remesa" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fecha_remesa") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             
                             <asp:TemplateField    HeaderText="Fecha Contabilización" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fechacontabilizacion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField    HeaderText="Conservador" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("conservador") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField    HeaderText="Región" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("region") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                               <asp:TemplateField HeaderText="OT" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("ot") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                               <asp:TemplateField    HeaderText="Estado OT" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("estado_ot_descripcion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                               <asp:TemplateField HeaderText="Acción" HeaderStyle-HorizontalAlign="center" >
                              <ItemTemplate>
                               <a href="#" onclick="javascript:Ir('frmReconstitucionMarca.aspx?OT=<%# Eval("ot") %>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Editar"  /></a> 
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
