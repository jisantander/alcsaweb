<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reversar.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.Reversar" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<base target="_self" > 
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">

    function ValidarTerminar() {
        if (confirm('Esta seguro de terminar la OT ?')) {

            return true;

        } else return false;

    }

    function ValidarGuardar() {



        if (trim(document.all("txtObservacion").value) == "") {

            alert('Debe ingresar observación antes de reversar OT');
            document.all("txtObservacion").focus();
            return false;

        }




        if (confirm('Esta seguro de reversar la OT?')) {

            return true;

        } else return false;

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
         </style>
    </head>
<body  >
      
      <FORM runat="server" id="Formulario"   >
      
      

    

      
   <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br/><br/>
        <TABLE width=400 align=center border=0  >
          <TBODY> 
          <TR> 
            <TD height="114" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;REVERSAR OT TERMINADA</b></TD>
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
                        <td align="right" class="style2" >OT :</td>
                        <td  align="left" class="style4"  colspan="2">
                           <asp:TextBox ID="txtOT" runat="server"  Enabled="false" xonKeyPress="return acceptNum(event)"
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                                
                               
                                
                        </td>
                       
                    </tr>   
               
                    
                     <tr>
                        <td align="right" class="style2" >Nuevo Estado :</td>
                        <td  align="left" class="style4"  colspan="2">
                          <asp:DropDownList ID="cbxEstados" runat="server"  
                                 style="WIDTH: 300px; margin-left: 0px;" 
                              >
                            </asp:DropDownList>
                        </td>
                    </tr>   
                    
                     <tr>
                        <td align="right" class="style2" >Observación :</td>
                        <td  align="left" class="style4"  colspan="2">
                                  <asp:TextBox ID="txtObservacion" TextMode="MultiLine" runat="server" 
                                      Height="117px" Width="412px" 
                                ></asp:TextBox>
                        </td>
                    </tr>
                    
                    
               <%--      <tr>
                        <td align="right" class="style2" >Fecha Entrega :</td>
                        <td  align="left" class="style4"  colspan="2">
                                  <asp:TextBox ID="txtEntrega" runat="server" MaxLength="10" Enabled="false"  
                                style="WIDTH: 90px; margin-left: 0px; "></asp:TextBox>
                        </td>
                    </tr>--%>
                    
                    
                       
                    
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
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                  </table>
                  
                  <!-- Fin Filtros -->
              </td>
              </tr>
            
            <tr>
              <td valign="top">
                  <!-- Inicio Grilla -->
                           
                  
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
                    
                            
                       <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Reversar" 
                            OnClientClick="return ValidarGuardar();" 
                            Visible="true" onclick="btnGuardar_Click" />
                   &nbsp;
                   <%--<asp:Button ID="btnTerminar" runat="server" CssClass="boton" Text="Terminar"
                             Visible="false" onclick="btnTerminar_Click" OnClientClick="return ValidarTerminar()" />--%>
                   &nbsp;          
                       <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Salir"  OnClientClick="window.close();"
                             Visible="true" />
                       
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
      
          </font> </div>
         
    </TD>
  </TR>
  </TBODY> 
</TABLE>

       <asp:HiddenField ID="hddOT" runat="server" />
       <asp:HiddenField ID="hddUserResponsable" runat="server" />

      </FORM>
      
    </body>
</html>
