<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarActividadesPrejudiciales.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.MostrarActividadesPrejudiciales" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">


    function Imprimir() {

        window.print();
        return false;
    }

    function Cerrar() {
        window.close();
        return false;
    }

    function Ir(pagina) {
        document.location.href = pagina;
    }

    function ValidarBuscar() {

        if (document.all("txtRut").value == "" && document.all("txtNroOperacion").value == "") {
            alert('Debe ingresar como mínimo un filtro');
            document.all("txtRut").focus();
            return false;
        }


        if (!(document.all("txtRut").value == "")) {
            if (!(ChequeaRut(document.all("txtRut")))) {
                alert('Rut no es válido');
                document.all("txtRut").focus();
                document.all("txtRut").select();

                return false;
            }
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
             width: 138px;
         }
         .style6
         {
             width: 301px;
         }
         .style7
         {
             width: 269px;
         }
         .style8
         {
             FONT-WEIGHT: normal;
             FONT-SIZE: 12px;
             COLOR: #493f46;
             FONT-FAMILY: "Gill Sans MT", Arial;
             width: 119px;
         }
         </style>
    </head>
<body  >
      
      <FORM runat="server" id="Formulario"   >
      
      

    
  
  <TABLE cellSpacing="0" cellPadding="0" width="633" border="0">
  <TBODY> 

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
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;ACTIVIDADES PREJUDICIALES INGRESADAS </b></TD>
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
              <table border="0" bgColor=#e6ecf2 border=0 style="width: 113%">
                    <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                     <tr>
                        <td align="left" class="style2" >&nbsp;&nbsp;&nbsp;Deudor :</td>
                        <td  align="left" class="style7" >
                            <asp:TextBox ID="txtDeudor" runat="server" 
                                style="WIDTH: 260px; margin-left: 0px; " Width="138px" ReadOnly="True"></asp:TextBox>
                               
                        </td>
                        <td align="left" class="style8" >&nbsp;&nbsp;&nbsp;Rut Deudor:</td>
                        <td  align="left" class="style6" >
                            <asp:TextBox ID="txtrutdeudor" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; " Width="138px" ReadOnly="True"></asp:TextBox>
                               
                        </td>
                        
                       
                    </tr>
                    
                      <tr>
                        <td align="left" class="style2" >&nbsp;&nbsp;&nbsp;Cliente :</td>
                        <td  align="left" class="style7" >
                            <asp:TextBox ID="txtcliente" runat="server" 
                                style="WIDTH: 260px; margin-left: 0px; " Width="138px" ReadOnly="True"></asp:TextBox>
                               
                        </td>
                        <td align="left" class="style8" >&nbsp;&nbsp;&nbsp;N° Operación</td>
                        <td  align="left" class="style6" >
                            <asp:TextBox ID="txtNrooperacion" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; " Width="138px" ReadOnly="True"></asp:TextBox>
                               
                        </td>
                        
                       
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
                         <asp:GridView ID="Grilla" runat="server" 
                                         OnPageIndexChanging = "Grilla_PageIndexChanging"
                                         AllowPaging="True"  
                                         PageSize="15"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                            
                            
                        
                             
                              <asp:TemplateField HeaderText="Actividad">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("actividad") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                             <asp:TemplateField    HeaderText="Fecha Actividad">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("factividad") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Próxima Gestión">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("prox") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                           <asp:TemplateField    HeaderText="Fecha Próx. Gestión">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fproxima") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                           
                             
                              <asp:TemplateField    HeaderText="Observación">
                             <HeaderStyle Wrap="true"></HeaderStyle>
                             <ItemStyle Wrap="true" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("observacion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
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
                    
                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Imprimir" 
                           OnClientClick="return Imprimir();"  
                            Visible="true" />
                    
                            
                       <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" 
                            OnClientClick="return ValidarGuardar();" 
                            Visible="False" />
                   
                       <asp:Button ID="btnCerrar" runat="server" CssClass="boton" Text="Cerrar" 
                             Visible="true" OnClientClick="return Cerrar();" />
                       
                     </div>
                  </td>
                </tr>
              </table>
              
            </TD>
          </TR>
          </TBODY> 
        </TABLE>
     <%--   <div align="left"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
          </font> </div>--%>
         
    </TD>
  </TR>
  </TBODY> 
</TABLE>
<asp:HiddenField ID="hiddidCobranza" runat="server" />

      </FORM>
      
    </body>
</html>
