<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MntParametros.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.MntParametros" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
   
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">



    function ValidarEliminar() {

        if (confirm('Esta seguro de eliminar el teléfono ?')) {
            return true;

        } else return false;
    }


    function ValidarActualizar() {

        if (!(trim(document.all("txttasacorriente").value) == "")) {
            if (!(checkDecimals(document.all("txttasacorriente"), document.all("txttasacorriente").value, 8) == 0)) {
                alert('Ingrese porcentaje válido para tasa de interes corriente (Ej. 0.05)')
                document.all("txttasacorriente").focus();
                return false;
            }
        }


        if (!(trim(document.all("txttasaconvencional").value) == "")) {
            if (!(checkDecimals(document.all("txttasaconvencional"), document.all("txttasaconvencional").value, 8) == 0)) {
                alert('Ingrese porcentaje válido para tasa de máxima convencional (Ej. 0.05)')
                document.all("txttasaconvencional").focus();
                return false;
            }
        }

        if (!(trim(document.all("txttasaadicional").value) == "")) {
            if (!(checkDecimals(document.all("txttasaadicional"), document.all("txttasaadicional").value, 8) == 0)) {
                alert('Ingrese porcentaje válido para tasa adicional (Ej. 0.05)')
                document.all("txttasaadicional").focus();
                return false;
            }
        }

        if (!(trim(document.all("txtHonorarios").value) == "")) {
            if (!(checkDecimals(document.all("txtHonorarios"), document.all("txtHonorarios").value, 8) == 0)) {
                alert('Ingrese porcentaje válido para honorarios (Ej. 0.05)')
                document.all("txtHonorarios").focus();
                return false;
            }
        }


        if (confirm('Esta seguro de actualizar los parámetros ?')) {
            return true;

        } else return false;
    }

    function ValidarGuardar() {


        //        if (trim(document.all("txtRazonSocial").value) == "")
        //        {
        //           alert('Debe ingresar la Razón Social');
        //           document.all("txtRazonSocial").focus();
        //           return false;
        //        }





        if (confirm('Esta seguro de guardar el teléfono ?')) {

            return true;

        } else return false;
    }


    function ValidarBuscar() {

        if (!(ChequeaRut(document.all("txtRut")))) {
            alert('Rut no es válido');
            document.all("txtRut").focus();
            document.all("txtRut").select();

            return false;
        }

        if (document.all("txtRut").value == "") {
            alert('Debe ingresar el Rut');
            document.all("txtRut").focus();
            return false;
        }

        return true;

    }

 </script>
 
    <style type="text/css">
        .style3
        {
            width: 202px;
        }
        </style>
 
</head>
<body  >


 <TABLE cellSpacing="0" cellPadding="0" width="633" border="0">
  <TBODY> 
  <TR> 
    <TD width="633" height=50 valign="top" bgcolor="#336699" xbackground="../../images/banner2.jpg"> 
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
      
      <FORM runat="server" id="Formulario"   >
      
        <TABLE width=633 align=center border=0  >
          <TBODY> 
          <TR> 
            <TD height="147" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;MANTENEDOR PARÁMETROS</b></TD>
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
              <td valign="top">
               
                  <table border="0" width="633" bgColor=#e6ecf2 border=0>
                    <tr>
                     <td class="textos22"  colspan="2">&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style3">Tasa Interes Corriente :</td>
                        <td  align="left"  >
                            <asp:TextBox ID="txttasacorriente" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                            </td>
                    </tr>
                  <tr>
                        <td align="right" class="style3"   >Tasa Máxima Convencional :</td>
                        <td  align="left"  >
                            <asp:TextBox ID="txttasaconvencional" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                            </td>
                    </tr>
                     <tr>
                        <td align="right" class="style3"   >Tasa Adicional :</td>
                        <td  align="left"  >
                            <asp:TextBox ID="txttasaadicional" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                            </td>
                    </tr>
                     <tr>
                        <td align="right" class="style3"   >Honorarios :</td>
                        <td  align="left"  >
                            <asp:TextBox ID="txtHonorarios" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                            </td>
                    </tr>
                     <tr>
                        <td align="right" class="style3"   >Descuento Interes :</td>
                        <td  align="left"  >
                            <asp:TextBox ID="txtDescInteres" runat="server" onKeyPress="return acceptNum(event)" 
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                            </td>
                    </tr>
                     <tr>
                        <td align="right" class="style3"   >Descuento Honorarios :</td>
                        <td  align="left"  >
                            <asp:TextBox ID="txtDeschonorarios" runat="server" onKeyPress="return acceptNum(event)" 
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                            </td>
                    </tr>
                     <tr>
                        <td align="right" class="style3"   >Otros Descuentos :</td>
                        <td  align="left"  >
                            <asp:TextBox ID="txtOtrosDesc" runat="server" onKeyPress="return acceptNum(event)" 
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                            </td>
                    </tr>
                    
                    
                   
                    
                     <tr>
                     <td class="textos22"  colspan="2">&nbsp;</td>
                    </tr>
                    
                  </table>
 
              </td>
            </tr>
            
            
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
                      
                            
                     
                   
                       <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar" 
                            OnClientClick="return ValidarActualizar();" 
                            onclick="btnActualizar_Click"  />
                   
                      
                       
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
         
          <asp:HiddenField ID="CodCliente"  runat="server" />
          
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>

</body>
</html>
