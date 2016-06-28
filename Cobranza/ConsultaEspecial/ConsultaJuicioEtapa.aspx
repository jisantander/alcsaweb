<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaJuicioEtapa.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.ConsultaJuicioEtapa" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">


    function Popup() {
        var url;
        url = 'jui_EtapaExcel.aspx';

        pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
    }



    function Ir(pagina, estado) {

        //if(trim(estado) == 'A')
        //{
        document.location.href = pagina;

        //}else{ 
        // alert('Cobranza se encuentra términada'); 
        //} 
    }


    function ValidarBuscar() {

        //        if(document.all("txtRut").value == "" && document.all("txtNroOperacion").value == "")
        //        {
        //           alert('Debe ingresar como mínimo un filtro');
        //           document.all("txtRut").focus();
        //           return false;
        //        } 

        //       
        //        if(!(document.all("txtRut").value == ""))
        //        {
        //            if(!(ChequeaRut(document.all("txtRut"))))
        //            {
        //               alert('Rut no es válido');
        //               document.all("txtRut").focus();
        //               document.all("txtRut").select();
        //               
        //               return false;
        //            }
        //        }


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
            width: 68px;
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
                        width=632 border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;JUICIOS POR ETAPA</b></TD>
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
                        <td align="right" class="style2" >Seleccione Etapa :</td>
                        <td  align="left" class="style6" >
                             <asp:DropDownList ID="Etapas" runat="server"  AutoPostBack=true
                                style="WIDTH: 250px; margin-left: 0px;" onselectedindexchanged="Etapas_SelectedIndexChanged"  
                                 >
                            </asp:DropDownList>
                               
                            </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                              <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" onclick="btnBuscar_Click" 
                             />
                             &nbsp;
                             &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return Popup();" 
                                  ImageUrl="~/images/ico_excel.gif" />
                                  
                            
                        </td>
                    </tr>
                    
                  <%--   <tr>
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
                           
                  N° Casos &nbsp;
                  <!-- Fin Grilla -->
                  <asp:TextBox ID="casos" runat="server" ReadOnly="true" Width="37px"></asp:TextBox>
              </td>
              </tr>
             <%--<tr>
              <td valign="top">
                 Total registros : 
              
              </td>
              </tr>--%>
            </table>
            <br /> 
            <asp:GridView ID="Grilla" runat="server" 
                                         OnPageIndexChanging = "Grilla_PageIndexChanging"
                                         AllowPaging="True"  
                                         PageSize="50000"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                    
                             
                              <asp:TemplateField HeaderText="N° de Operación" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("nrooperacion") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                                        <asp:TemplateField HeaderText="Rut Deudor" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("rut_deudor") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                           <asp:TemplateField HeaderText="Deudor" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("nomdeudor") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                      <%--     <asp:TemplateField HeaderText="Rut Cliente" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("rut_cli") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                                
                        <asp:TemplateField HeaderText="Cliente" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("cliente") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField HeaderText="Producto" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("Producto") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField HeaderText="Tipo Cobranza" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("TipoCobranza") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                                <asp:TemplateField HeaderText="Estado Cobranza" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("EstadoCobranza") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                  <%--      <asp:TemplateField HeaderText="Rut Abogado" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("rut_abogado") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                             
                             <asp:TemplateField HeaderText="Abogado" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("abogado") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                           <%--  <asp:TemplateField HeaderText="Rut Procurador" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("rut_procurador") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                             
                             <asp:TemplateField HeaderText="Procurador" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("procurador") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField HeaderText="Rol" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("rol") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                  <%--    <asp:TemplateField HeaderText="F. Ingreso Corte" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("fingresocorte") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                      
                      
                      
                      
                      
                      
                             <asp:TemplateField    HeaderText="Tribunal" HeaderStyle-HorizontalAlign=Left>
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("tribunal") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
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
        
       <%-- 
        <div align="left"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
          </font> </div>--%>
         
    </TD>
  </TR>
  </TBODY> 
</TABLE>

      </FORM>
      
    </body>
</html>
