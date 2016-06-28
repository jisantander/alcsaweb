<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MntDeudores.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.MntDeudores" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">

    function ValidarEliminar() {

        if (confirm('Esta seguro de eliminar el deudor ?')) {

            return true;

        } else return false;
    }


    function ValidarActualizar() {



        if (document.all("RadioButton1").checked == true) {
            if (trim(document.all("txtRazonSocial").value) == "") {
                alert('Debe ingresar la Razón Social');
                document.all("txtRazonSocial").focus();
                return false;
            }
        }


        if (document.all("RadioButton2").checked == true) {

            if (trim(document.all("txtNombres").value) == "") {
                alert('Debe ingresar los nombres');
                document.all("txtNombres").focus();
                return false;
            }
            if (trim(document.all("txtAPaterno").value) == "") {
                alert('Debe ingresar el apellido paterno');
                document.all("txtAPaterno").focus();
                return false;
            }

            if (trim(document.all("txtAMaterno").value) == "") {
                alert('Debe ingresar el apellido materno');
                document.all("txtAMaterno").focus();
                return false;
            }
        }


        if (!(trim(document.all("txtFnacimiento").value) == "")) {
            if (!(EsFecha(document.all("txtFnacimiento").value, 'dma'))) {
                alert('Ingrese fecha  válida, Ej. 01-09-2010');
                document.all("txtFnacimiento").focus();
                return false;
            }
        }

        //            if (document.all("txtProfesion").value == "")
        //            {
        //               alert('Debe ingresar la la profesión');
        //               document.all("txtProfesion").focus();
        //               return false;
        //            }



        if (confirm('Esta seguro de actualizar el deudor ?')) {
            return true;

        } else return false;
    }

    function ValidarGuardar() {


        if (document.all("RadioButton1").checked == true) {
            if (trim(document.all("txtRazonSocial").value) == "") {
                alert('Debe ingresar la Razón Social');
                document.all("txtRazonSocial").focus();
                return false;
            }
        }


        if (document.all("RadioButton2").checked == true) {

            if (trim(document.all("txtNombres").value) == "") {
                alert('Debe ingresar los nombres');
                document.all("txtNombres").focus();
                return false;
            }
            if (trim(document.all("txtAPaterno").value) == "") {
                alert('Debe ingresar el apellido paterno');
                document.all("txtAPaterno").focus();
                return false;
            }

            if (trim(document.all("txtAMaterno").value) == "") {
                alert('Debe ingresar el apellido materno');
                document.all("txtAMaterno").focus();
                return false;
            }
        }


        if (!(trim(document.all("txtFnacimiento").value) == "")) {
            if (!(EsFecha(document.all("txtFnacimiento").value, 'dma'))) {
                alert('Ingrese fecha  válida, Ej. 01-09-2010');
                document.all("txtFnacimiento").focus();
                return false;
            }
        }



        if (confirm('Esta seguro de guardar el deudor ?')) {
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
            width: 221px;
        }
        .style2
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 90px;
        }
        .style3
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 127px;
        }
        .style4
        {
            width: 79px;
        }
        .style5
        {
            width: 90px;
        }
    </style>
 
</head>
<body>


 <TABLE cellSpacing=0 cellPadding=0 width=633 border=0>
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
                      <!---->          
            <TD height="163" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;MANTENEDOR DEUDORES</b></TD>
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
               
                  <table border="0" bgColor=#e6ecf2 border=0 style="width: 644px">
                    <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >Rut :</td>
                        <td  align="left" class="style1" >
                            <asp:TextBox ID="txtRut" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px;"></asp:TextBox>
                                <font color="red" size="-2"><b> Ej. 12324654-6</b></font>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left style="margin-left: 40px">
                        </td>
                    </tr>
                    
                     <tr>
                         
                        <td align="right" class="style2" >Tipo Persona :</td>
                        <td  align="left" class="style4" style="WIDTH: 150px;" >
                          
                            <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="true"  
                                GroupName="valor"  Text="Juridica" Checked="true" 
                                oncheckedchanged="RadioButton1_CheckedChanged" Enabled="False" />
                            <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="true"  
                                GroupName="valor"  Text="Natural" 
                                oncheckedchanged="RadioButton2_CheckedChanged" Enabled="False"/>
                         
                        </td>
                       </tr>
                       
                         <!-- Persona Juridica -->
                    <asp:Panel ID="PanelRazon" runat="server">
                    <tr>
                        <td align="right" class="style2" >Razón Social:</td>
                        <td  align="left" class="style1" colspan="3" >
                            <asp:TextBox ID="txtRazonSocial" runat="server"  MaxLength="40"
                                style="WIDTH: 230px; margin-left: 0px; "></asp:TextBox>
                        </td>
                       
                    </tr>
                    </asp:Panel>
                    <!-- Fin Persona Juridica -->
                    
                    
                    
                    <!-- Persona Natural -->
                   <asp:Panel ID="PanelPnatural" runat="server" Visible="false"> 
                     <tr>
                        <td align="right" class="style2" >Nombres :</td>
                        <td  align="left" class="style1"  colspan="3">
                          <asp:TextBox ID="txtNombres" runat="server" ReadOnly="True" MaxLength="35"
                                style="WIDTH: 250px; margin-left: 0px; "></asp:TextBox>
                         </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >A. Paterno :</td>
                        <td  align="left" class="style1" >
                            <asp:TextBox ID="txtAPaterno" runat="server" MaxLength="30" 
                                style="WIDTH: 200px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" >A. Materno :</td>
                        <td  align=left class="style4">
                            <asp:TextBox ID="txtAMaterno" runat="server" MaxLength="30" ReadOnly="True" 
                                style="WIDTH: 200px; margin-left: 0px;" ></asp:TextBox>
                        </td>
                    </tr>
                    </asp:Panel>
                    <!-- Fin Persona Natural -->
                    
                    <tr>
                        <td align="right" class="style2" >F.Nacimiento :</td>
                        <td  align="left" class="style1" >
                            <asp:TextBox ID="txtFnacimiento" runat="server" 
                                style="WIDTH: 65px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                                <font color="red" size="-2"><b> Ej. 21/10/1973</b></font>
                        </td>
                        <td align="right" class="style3" >Profesión:</td>
                        <td  align=left>
                           <asp:DropDownList ID="profesion" runat="server" Enabled="False" style="WIDTH: 180px; margin-left: 0px; ">
                                 <asp:ListItem Value="0">Seleccione</asp:ListItem>
                                 <asp:ListItem Value="1">Empleado</asp:ListItem>
                                 <asp:ListItem Value="2">Transportista</asp:ListItem>
                                 <asp:ListItem Value="3">Técnico</asp:ListItem>
                                 <asp:ListItem Value="4">Ingeniero</asp:ListItem>
                                 <asp:ListItem Value="5">Abogado</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >E-Mail :</td>
                        <td  align=left class="style1">
                            <asp:TextBox ID="txtMail" runat="server" 
                                style="WIDTH: 200px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                         <td align="right" class="style3" >Estado Civil :</td>
                        <td  align="left" >
                           <asp:DropDownList ID="ecivil" runat="server" Enabled="False" style="WIDTH: 180px; margin-left: 0px; ">
                                 <asp:ListItem Value="0">Seleccione</asp:ListItem>
                                 <asp:ListItem Value="1">Soltero</asp:ListItem>
                                 <asp:ListItem Value="2">Casado</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >Teléfono 1 :</td>
                        <td  align=left class="style1">
                           <asp:TextBox ID="txtTelefono1" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                         <td align="right" class="style3" >Celular 1 :</td>
                        <td  align="left" >
                          <asp:TextBox ID="txtCelular1" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>

                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >Teléfono 2 :</td>
                        <td  align=left class="style1">
                           <asp:TextBox ID="txtTelefono2" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                         <td align="right" class="style3" ></td>
                        <td  align="left" >
                     
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style2" >Cta. Cte.:</td>
                        <td  align=left class="style1">
                            <asp:TextBox ID="txtCtaCte" runat="server" 
                                style="WIDTH: 200px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                         <td align="right" class="style3" >Banco :</td>
                        <td  align="left" >
                            <asp:DropDownList ID="Banco" runat="server" Enabled="False">
                                 <asp:ListItem Value="0">Seleccione</asp:ListItem>
                                 <asp:ListItem Value="1">Banco Chile</asp:ListItem>
                                 <asp:ListItem Value="2">Banco BBVA</asp:ListItem>
                            </asp:DropDownList>
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
                           
                           OnClientClick="return ValidarEliminar();"  onclick="btnEliminar_Click" />
                   
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
         
          <asp:HiddenField ID="CodDeudor"  runat="server" />
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>

</body>
</html>
