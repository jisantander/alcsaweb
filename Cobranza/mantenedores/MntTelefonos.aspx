<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MntTelefonos.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.MntTelefonos" %>


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

        //            if (document.all("txtRazonSocial").value == "")
        //            {
        //               alert('Debe ingresar la Razón Social');
        //               document.all("txtRazonSocial").focus();
        //               return false;
        //            }



        if (confirm('Esta seguro de actualizar el teléfono ?')) {
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
        .style1
        {
            width: 213px;
        }
        .style2
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 60px;
        }
        .style3
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 84px;
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
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;MANTENEDOR TELÉFONOS</b></TD>
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
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >Rut :</td>
                        <td  align="left" class="style1" >
                            <asp:TextBox ID="txtRut" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                                <font color="red" size="-2"><b> Ej. 12324654-6</b></font>
                            </td>
                        <td align="right" class="style3" ><%--Razón Social:--%></td>
                        <td  align=left>
                            <%--<asp:TextBox ID="txtRazonSocial" runat="server" 
                                style="WIDTH: 230px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>--%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Teléfono :</td>
                        <td  align="left" class="style1" >
                            <asp:TextBox ID="txttelefono" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" >Celular :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtcelular" runat="server" MaxLength="8" 
                                style="WIDTH: 120px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
                      <tr>
                        <td align="right" class="style2" >Fax :</td>
                        <td  align="left" class="style1" >
                            <asp:TextBox ID="txtFax" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" >Vigencia :</td>
                        <td  align=left>
                            <asp:DropDownList ID="vigencia" runat="server" Enabled="False" 
                                style="WIDTH: 180px; margin-left: 0px; ">
                                <asp:ListItem Value="V">VIGENTE</asp:ListItem>
                                <asp:ListItem Value="N">NO VIGENTE</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                      <tr>
                        <td align="right" class="style2" >Tipo :</td>
                        <td  align="left" class="style1" >
                          <asp:DropDownList ID="TipoTelefono" runat="server"  
                                style="WIDTH: 180px; margin-left: 0px; " Enabled="False">
                          </asp:DropDownList>

                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                       
                        </td>
                    </tr>
                    
                   
                    
                     <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
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
                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" 
                           OnClientClick="return ValidarBuscar();" onclick="btnBuscar_Click" />
                            
                       <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" 
                            OnClientClick="return ValidarGuardar();" onclick="btnGuardar_Click" Visible="False" />
                   
                       <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar" 
                            OnClientClick="return ValidarActualizar();" Visible="False" onclick="btnActualizar_Click" />
                   
                       <asp:Button ID="btnEliminar" runat="server" CssClass="boton" Text="Eliminar" Visible="False"
                             OnClientClick="return ValidarEliminar();" onclick="btnEliminar_Click" />
                   
                       <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar" 
                            onclick="btnCancelar_Click"  Visible="False" />
                       
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