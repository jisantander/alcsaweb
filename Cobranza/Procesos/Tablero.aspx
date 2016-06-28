<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tablero.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.Tablero" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">


    function Limpiar() {

        document.all("txtRut").value = "";
        document.all("txtfinicio").value = "";
        document.all("txtffin").value = "";
        document.all("txtCliente").value = "";
        document.all("txtProcurador").value = "";
        document.all("txtNroOperacion").value = "";
        document.all("tribunal").selectedIndex = 0;
        document.all("producto").selectedIndex = 0;
        document.all("tipocobranza").selectedIndex = 0;
        document.all("estadocobranza").selectedIndex = 0;
        document.all("abogado").selectedIndex = 0;



        return false;
    }

    function imprimir() {
        window.print();
        return false;


    }

    function Ir(pagina, estado) {

        if (trim(estado) == 'A') {
            document.location.href = pagina;

        } else {
            alert('Cobranza se encuentra términada');
        }
    }


    function Popup() {
        var url;
        url = 'TableroExcel.aspx';

        pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
    }


    function ValidarBuscar() {

        //        if(document.all("txtRut").value == "" && document.all("txtNroOperacion").value == "")
        //        {
        //           alert('Debe ingresar como mínimo un filtro');
        //           document.all("txtRut").focus();
        //           return false;
        //        } 


        if (!(trim(document.all("txtRut").value) == "")) {
            if (!(ChequeaRut(document.all("txtRut")))) {
                alert('Rut no es válido');
                document.all("txtRut").focus();
                document.all("txtRut").select();

                return false;
            }
        }

        if (!(trim(document.all("txtCliente").value) == "")) {
            if (!(ChequeaRut(document.all("txtCliente")))) {
                alert('Rut no es válido');
                document.all("txtCliente").focus();
                document.all("txtCliente").select();

                return false;
            }
        }

        if (!(trim(document.all("txtProcurador").value) == "")) {
            if (!(ChequeaRut(document.all("txtProcurador")))) {
                alert('Rut no es válido');
                document.all("txtProcurador").focus();
                document.all("txtProcurador").select();

                return false;
            }
        }

        var sw = 0;

        if (!(trim(document.all("txtfinicio").value) == "")) sw++;
        if (!(trim(document.all("txtffin").value) == "")) sw++;

        if (sw == 1) {
            alert('Debe ingresar rango fecha prescripción de inicio y de fin');
            return false;

        }

        if (sw == 2) {
            //válida fecha

            if (!(EsFecha(document.all("txtfinicio").value, 'dma'))) {
                alert('Ingrese fecha de inicio válida, Ej. 01-09-2010');
                document.all("txtfinicio").focus();
                return false;
            }

            if (!(EsFecha(document.all("txtffin").value, 'dma'))) {
                alert('Ingrese fecha de fin válida, Ej. 01-09-2010');
                document.all("txtffin").focus();
                return false;
            }

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
       
       .style33
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 300px;
        }
       
       
         .style3
         {
             width: 300px;
         }
       
         .style4
         {
             height: 45px;
         }
       
    </style>
    </head>
<body  >
      
      <FORM runat="server" id="Formulario"   >
      
     

    
  
  <TABLE cellSpacing="0" cellPadding="0" border="0" style="width: 769px">
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
    </TBODY> 
</TABLE>
  <!-- Zona de Titulo -->
            <br />
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 style="width: 769px" 
                        border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee class="style3"><b>&nbsp;TABLERO JUDICIAL</b></TD>
                </TR>
                </TBODY> 
              </TABLE>
            
              
 
                    <table border="1" borderColor=#c8e3f9 cellSpacing=0 cellPadding=0   bgColor="#e6ecf2"  style="width: 769px" >
                    <TBODY> 
                    <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                     <tr>
                        <td  align="left" class="style2"  >
                            Rut Deudor :
                            <asp:TextBox ID="txtRut" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; " Width="138px"></asp:TextBox>
                        </td>
                        <td  align="left" class="style2"  >
                           Rut Cliente :
                           <asp:TextBox ID="txtCliente" runat="server"  onKeyPress="return acceptNum(event)"
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                        </td>
                         <td  align="left" class="style2"  >
                           Rut Procurador :
                           <asp:TextBox ID="txtProcurador" runat="server"  onKeyPress="return acceptNum(event)"
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                        </td>
                        
                        <td  align="left" class="style2"  >
                           Número Operación :
                           <asp:TextBox ID="txtNroOperacion" runat="server"  onKeyPress="return acceptNum(event)"
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                        </td>
                        
                        
                    </tr>
                    <tr>
                        <td  align="left" class="style2"  colspan=3 >
                            Tribunal :
                            <asp:DropDownList ID="tribunal" runat="server" 
                                 style="WIDTH: 400px; margin-left: 0px;" >
                            </asp:DropDownList>
                        </td>
                        
                        <td  align="left" class="style2"   >
                          Producto :
                          <asp:DropDownList ID="producto" runat="server" 
                                 style="WIDTH: 300px; margin-left: 0px;" >
                            </asp:DropDownList>
                        </td>
                     </tr>   
                     
                     <tr>
                        <td  align="left" class="style2"  >
                            Tipo Cobranza :
                            <asp:DropDownList ID="tipocobranza" runat="server" 
                                 style="WIDTH: 100px; margin-left: 0px;" >
                                  <asp:ListItem Value="Seleccione">Seleccione</asp:ListItem>
                              <asp:ListItem Value="J">Judicial</asp:ListItem>
                              <asp:ListItem Value="P">PreJudicial</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        
                        <td  align="left" class="style2"   >
                          Estado Juicio :
                          <asp:DropDownList ID="estadocobranza" runat="server" 
                                 style="WIDTH: 100px; margin-left: 0px;" >
                              <asp:ListItem Value="Seleccione">Seleccione</asp:ListItem>
                              <asp:ListItem Value="A">Activo</asp:ListItem>
                              <asp:ListItem Value="N">No activo</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td  align="left" class="style2"   >
                          Abogado :
                          <asp:DropDownList ID="abogado" runat="server" 
                                 style="WIDTH: 170px; margin-left: 0px;" >
                            </asp:DropDownList>
                        </td>
                        
                       <%--  <td  align="left" width="30%" colspan="4" class="style33"   >
                          &nbsp;F. Prescripción de :
                           <asp:TextBox ID="txtfinicio" runat="server"  
                                style="WIDTH: 70px; margin-left: 0px; "></asp:TextBox>&nbsp;a : 
                            <asp:TextBox ID="txtffin" runat="server"  
                                style="WIDTH: 70px; margin-left: 0px; "></asp:TextBox>     
                        </td>--%>
                     </tr>
                    
                     <tr>
                     <td class="style4"  colspan="4" align="center">
                     <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" onclick="btnBuscar_Click" />
                        &nbsp;
                        <asp:Button ID="Button2" runat="server" CssClass="boton" Text="Limpiar" OnClientClick="return Limpiar();"  />
                          &nbsp;  
                              <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return Popup();" 
                                  ImageUrl="~/images/ico_excel.gif" />
                             &nbsp;
                              <%--<asp:ImageButton ID="ImageButton2" runat="server"  OnClientClick="return imprimir();"
                                  ImageUrl="~/images/action_print.gif" Width="21px" />--%>
                     
                     
                     </td>
                    </tr>
                    </TBODY> 
                  </table>
                      
      
   <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
     
                  
        <TABLE width=633 border=0  >
          <TBODY> 
          <TR> 
            <TD height="114" width="100%" valign="top"> 
            
          
              
            
              
                
              <!-- Tabla Cuerpo Inicio -->
              <table borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 width=633 border=0 height="100" >
             
            
            <tr>
              <td valign="top">
                  <!-- Inicio Grilla  http://www.devjoker.com/contenidos/Articulos/383/Fijar-el-encabezado-de-un-GridView-con-ASP-Net-y-CSS.aspx -->
                  
                  <div style="width: 770px; height: 270px; z-index: 1; 	    left: 1px; top: 280px; position: absolute" class="Marco"> 
                  
                           <asp:GridView ID="Grilla" runat="server"  CssClass="Grid"
                                         OnPageIndexChanging = "Grilla_PageIndexChanging"
                                         AllowPaging="True"  
                                         PageSize="1000"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                            
                             
                              <asp:TemplateField HeaderText="Acreedor">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("cliente") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                             <asp:TemplateField    HeaderText="Abogado">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("abogado") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Procurador">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("procurador") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="N° Operación">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("nrooperacion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                           <%--  <asp:TemplateField    HeaderText="Monto">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("monto_div_adeudado_ps") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                             
                             <asp:TemplateField    HeaderText="Producto">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("producto") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Rut Deudor">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("rut_deudor") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Nombre Deudor">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("nomdeudor") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Tipo Cobranza">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("tipocobranza") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Estado Cobranza">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("estadocobranza") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Tribunal">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("tribunal") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Rol">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("rol") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Tramite">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("tramite") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                               <asp:TemplateField    HeaderText="F. Tramite">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("ftramite") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField    HeaderText="Prox. Gestión">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("proxgestion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="F. Prox. Gestión">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fechaproxgestion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="SubTrámite">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("subtramite") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="F. SubTrámite">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fechasubtramite") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Estado Juicio">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("EstadoJuicio") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                   <%--           <asp:TemplateField    HeaderText="Fecha Prescripción">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fechaprescripcion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                             
                             
                            </Columns>
                            
                            <PagerSettings Mode="NextPreviousFirstLast"
                               FirstPageText="<<"
                               LastPageText=">>"
                               PageButtonCount="3"
                               /> 
                            
                            <HeaderStyle CssClass="cabezabrilla" />
                           
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White"  />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            
                            <EditRowStyle BackColor="#2461BF" />
                            
                            <HeaderStyle CssClass="GridHeader" />		
                            <RowStyle CssClass="GridRow" />		
                            <AlternatingRowStyle CssClass="GridAlternateRow" />
                            
                            
                            </asp:GridView>
                  </div>
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
          
          </TBODY> 
        </TABLE>
   

      </FORM>
      
    </body>
</html>
