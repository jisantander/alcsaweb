<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaJuicioEtapaDOS.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.ConsultaJuicioEtapaDOS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>
     <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>

<script language="javascript" type="text/javascript">


    function Popup() {
        var url;
        url = 'ReporteExcelJuicioEtapa.aspx';
        pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
        if (window.pWin)
            pWin.focus()
        return false;
    }
    $(document).ready(function () {
        $('.boton-abrir-popupBRaiz').click(function () {
            var rut = $(this).attr('alt');
            var url = '../Procesos/MostrarBienRaiz.aspx?deudor=' + rut;
            var pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100');
            pWin.focus();
            return false;
        });
    });
       $(document).ready(function () {
          $('.boton-abrir-popup').click(function () {
              var rut = $(this).attr('alt');
              var url = 'BienMueble.aspx?rutdeudor=' + rut ;
              var pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100');
              pWin.focus();
              return false;
          });
      });

   function Ir(pagina, estado) {

        document.location.href = pagina;

    }


    function ValidarBuscar() {

       
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
                             <asp:DropDownList ID="tramite" runat="server"   AutoPostBack=true
                                style="WIDTH: 250px; margin-left: 0px; margin-bottom: 2px;" onselectedindexchanged="tramite_SelectedIndexChanged" 
                                 >
                            </asp:DropDownList>
                               
                            </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                              <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" onclick="Button1_Click1"  
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
                        <td align="right" class="style2" >Cliente:</td>
                        <td  align="left" class="style6" >

                    <asp:DropDownList ID="ddlCliente" runat="server"
                        Style="margin-left: 0px;"  AutoPostBack="True" Width="117%" Height="19px">
                    </asp:DropDownList>
                               
                            </td>
                        <td align="right" class="style3" >&nbsp;</td>
                        <td  align=left>
                            
                              &nbsp;</td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style2" >Tribunal:</td>
                        <td  align="left" class="style6" >

                    <asp:DropDownList ID="ddlTribunal" runat="server"
                        Style="margin-left: 0px;" Width="117%" Height="22px" AutoPostBack="True"  >
                    </asp:DropDownList>
                               
                            </td>
                        <td align="right" class="style3" >&nbsp;</td>
                        <td  align=left>
                            
                              &nbsp;</td>
                    </tr>
                    
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
                                         
                                         AllowPaging="false"  
                                         
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None" OnSelectedIndexChanged="Grilla_SelectedIndexChanged"> 
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
                      
                                             
                             <asp:TemplateField HeaderText="Abogado" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("abogado") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
           
                             
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
                      
                   
                      
                      
                      
                      
                             <asp:TemplateField    HeaderText="Tribunal" HeaderStyle-HorizontalAlign=Left>
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("tribunal") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>



                                    <asp:TemplateField    HeaderText="Trámite" HeaderStyle-HorizontalAlign=Left>
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre33333" runat="server" Text='<%# Bind("tramite") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                                    <asp:TemplateField    HeaderText="Fecha Trámite" HeaderStyle-HorizontalAlign=Left>
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre33333" runat="server" Text='<%# Bind("ftramite") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                                   <asp:TemplateField    HeaderText="SubTrámite" HeaderStyle-HorizontalAlign=Left>
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre33333" runat="server" Text='<%# Bind("SUBTRAMITE") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>

                                 <asp:TemplateField    HeaderText="Fecha SubTrámite" HeaderStyle-HorizontalAlign=Left>
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre33333" runat="server" Text='<%# Bind("FECHASUBTRAMITE") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>

                                  <asp:TemplateField    HeaderText="Bien Raiz" HeaderStyle-HorizontalAlign=Left>
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre33dd333" runat="server" Text='<%# Bind("bienraiz") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                                <asp:TemplateField>
                                <ItemTemplate>
                                  <asp:Image ID="imgVerPopupBRaiz" runat="server" Style="cursor: pointer;" ImageUrl="~/images/iconos/Buscar.png" AlternateText='<%# Bind("rut_deudor") %>' CssClass="boton-abrir-popupBRaiz"  /> 
                                    
                                </ItemTemplate>
                            </asp:TemplateField>

                                    <asp:TemplateField    HeaderText="Bien Mueble" HeaderStyle-HorizontalAlign=Left>
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre3wew3333" runat="server" Text='<%# Bind("bienmueble") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="imgVerPopup" runat="server" Style="cursor: pointer;" ImageUrl="~/images/iconos/Buscar.png" AlternateText='<%# Bind("rut_deudor") %>' CssClass="boton-abrir-popup" />
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
        
       <%--     <asp:TemplateField HeaderText="Rut Cliente" HeaderStyle-HorizontalAlign=Left>
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("rut_cli") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>
         
    </TD>
  </TR>
  </TBODY> 
</TABLE>

        

      </FORM>
      
    </body>
</html>

