<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiaRol.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.CambiaRol" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">


    function Popup() {

        return false;

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
      

    
        <TABLE width=633 align=center border=0  >
          <TBODY> 
          <TR> 
            <TD height="114" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
            
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=632 border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;MODIFICAR ROL Y TRIBUNAL EXHORTO </b></TD>
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
                        <td align="right" class="style2" >Tribunal :</td>
                        <td  align="left" class="style6" >
                          <asp:DropDownList ID="dtribunal" runat="server" 
                                 style="WIDTH: 400px; margin-left: 0px;" >
                            </asp:DropDownList>
                               
                            </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                              <asp:Button ID="Button1" Visible=false runat="server" CssClass="boton" Text="Buscar" onclick="Button1_Click"   
                             />

                                <asp:Button ID="Button2" runat="server" CssClass="boton" Text="Grabar" onclick="Button2_Click" 
                             />

                             &nbsp;
                             &nbsp;</td>
                    </tr>

                    <tr>
                        <td align="right" class="style2" >Rol - Exhorto :</td>
                        <td  align="left" class="style6" >
                          <asp:TextBox ID="txtRol" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;" ></asp:TextBox>
                               
                            </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                              
                           
                             &nbsp;
                             &nbsp;</td>
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
                           
                  &nbsp;&nbsp;
                  <!-- Fin Grilla -->
              </td>
              </tr>
             <%--<tr>
              <td valign="top">
                 Total registros : 
              
              </td>
              </tr>--%>
            </table>
            <br /> 
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
            <asp:HiddenField ID="hddIdjuicios" runat="server" />


            <asp:HiddenField ID="hddid_exhorto" runat="server" />
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


