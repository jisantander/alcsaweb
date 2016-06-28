<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="CobranzaALC.Contacto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="/css/alc2.css" rel="stylesheet" type="text/css" />
    
        <script language="javascript" type="text/javascript">


            function validar() {
                if (document.all("txtnombre").value == "") {
                    alert('Debe ingresar el nombre');
                    document.all("txtnombre").focus();
                    return false;
                }

                if (document.all("txtAsunto").value == "") {
                    alert('Debe ingresar el asunto');
                    document.all("txtAsunto").focus();
                    return false;
                }

                if (document.all("txtmail").value == "") {
                    alert('Debe ingresar el E-mail');
                    document.all("txtmail").focus();
                    return false;
                }

                if (document.all("txtcomentario").value == "") {
                    alert('Debe ingresar un comentarios o preguntas');
                    document.all("txtcomentario").focus();
                    return false;
                }



                return true;

            }
    </script>
    
    </head>
<body>
<br/><br/>
<center>
 <TABLE cellSpacing=0 cellPadding=0 width=633 border=0>
  <TBODY> 
  <TR> 
    <TD width="633" 
                height=50 valign="top" 
                background="../images/banner2.jpg"> 
      <TABLE width=313 align=right border=0>
        <TBODY> 
        <TR> 
          <TD class=titulo align=right>CONTACTO ALC</TD>
          <TD width=5></TD>
        </TR>
        </TBODY> 
      </TABLE>
    </TD>
  </TR>
  <TR> 
    <TD height="394" valign="top" class=textos><BR>
      <CENTER>
      </CENTER>
      
      <FORM runat="server" id="Formulario"  onsubmit="return validar();" >
        <TABLE width=605 align=center border=0>
          <TBODY> 
          <TR> 
            <TD height="247" width="600" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=600 border=1>
                <TBODY> 
                <TR> 
                  <TD align="left" xalign=middle bgColor=#eeeeee><b>&nbsp;FORMULARIO DE ENVIO</b></TD>
                </TR>
                </TBODY> 
              </TABLE>
              <TABLE height=7 width=345>
                <TBODY> 
                <TR> 
                  <TD></TD>
                </TR>
                </TBODY> 
              </TABLE>
              
              <!-- Rotulo 1 -->
              <table borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=600 border=1 >
            <tr>
              <td valign="top">
               
                  <table border="0" width="100%" bgColor=#e6ecf2 border=0>
                    <tr>
                     <td class="textos22"  colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" class="textos22" >
                            Nombre:&nbsp;&nbsp;&nbsp;</td>
                        <td  align=left>
                            <asp:TextBox ID="txtnombre" runat="server" 
                                style="WIDTH: 290px; margin-left: 0px;"></asp:TextBox>
                                </td>
                    </tr>
                    <tr>
                        <td align="right" class="textos22">
                            Asunto:&nbsp;&nbsp;&nbsp;</td>
                        <td align=left>
                            <asp:TextBox ID="txtAsunto" runat="server" style="WIDTH: 290px"></asp:TextBox>
                                </td>
                    </tr>
                    <tr>
                        <td align="right" class="textos22">
                            E-mail:&nbsp;&nbsp;&nbsp;</td>
                        <td align=left>
                            <asp:TextBox ID="txtmail" runat="server" style="WIDTH: 290px"></asp:TextBox>
                                </td>
                    </tr>
                    <tr>
                        <td vAlign="top" align="right" class="textos22">
                            Comentarios/Preguntas:&nbsp;&nbsp;&nbsp;       
                        <td align=left>
                            <asp:TextBox ID="txtcomentario" runat="server" style="WIDTH: 290px" Rows="5" 
                                TextMode="MultiLine"></asp:TextBox>
                                </td>
                    </tr>
                    <tr>
                        <td colSpan="2" height="5">
                          <p align="center" style="margin-top: 0; margin-bottom: 0">
                              &nbsp;</p>
                        </td>
                    </tr>
                  </table>
 
              </td>
            </tr>
            </table>
              <!-- -->
              
            </TD>
          </TR>
          <TR> 
            <TD height="60" valign="top" bgcolor="#CCCCCC"> 
              
              <!-- Zona de Botoneras -->
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="600" height="58" > 
                    <div align="center"> 
                    
                        <asp:Button ID="btnAceptar" CssClass="boton" runat="server" Text="Enviar" 
                            onclick="btnAceptar_Click" />&nbsp;
                        </div>
                  </td>
                </tr>
              </table>
              
            </TD>
          </TR>
          </TBODY> 
        </TABLE>
        <div align="center"><font size="2">Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
          </font> </div>
      </form>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>
</center>
</body>
</html>
