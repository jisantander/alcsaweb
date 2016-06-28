<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exhorto.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.Exhorto" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        function Actividades() {
            var valor = document.all("hiddidjuicio").value;
            var url = 'MostrarActividades.aspx?Codigo=' + valor;
            IrJudicial(url, '750', '600');
            return false;
        }

        function IrJudicial(url, ancho, alto) {
            var pWin = window.open(url, 'newWin', 'width=' + ancho + ',height=' + alto + ',scrollbars=1,satus=0,menubar=no,top=10,left=210')
            if (window.pWin)
                pWin.focus()
            return false;
        }

        function ValidarEliminar() {
            if (confirm('Esta seguro de eliminar el deudor ?'))
                return true;
            else return false;
        }

        function ValidarActualizar() {
            if (confirm('Esta seguro de actualizar el deudor ?')) {

                if (document.all("txtNombre").value == "") {
                    alert('Debe ingresar la Razón Social');
                    document.all("txtNombre").focus();
                    return false;
                }

                if (document.all("txtProfesion").value == "") {
                    alert('Debe ingresar la la profesión');
                    document.all("txtProfesion").focus();
                    return false;
                }

                return true;

            } else return false;
        }

        function ValidarGuardar() {

            if (trim(document.all("filesubir").value) == '') {
                alert("Seleccione documento a digitalizar");
                return false;
            }

            if (trim(document.all("txtFechaingreso").value) == "") {
                alert('Debe ingresar fecha de ingreso');
                document.all("txtFechaingreso").focus();
                return false;
            }

            if (confirm('Esta seguro de guardar el exhorto ?'))
                return true;
            else return false;
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
        .style2 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 483px;
        }

        .style3 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 329px;
        }

        .style4 {
            width: 215px;
        }

        .style5 {
            width: 282px;
        }
    </style>
</head>
<body>
    <table cellspacing="0" cellpadding="0" border="0" style="width: 740px">
        <tbody>
            <tr>
                <td width="633" height="50" valign="top" bgcolor="#336699" xbackground="../../images/banner2.jpg">
                    <table width="313" align="right" border="0">
                        <tbody>
                            <tr>
                                <td class="titulo" align="right">SISTEMA DE COBRANZA</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="394" valign="top" class="textos">
                    <br>
                    <center>
                    </center>

                    <form runat="server" id="Formulario">

                        <table align="center" border="0" style="width: 750px">
                            <tbody>
                                <tr>
                                    <!---->
                                    <td height="163" width="100%" valign="top">
                                        <!-- Zona de Titulo -->
                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0"
                                            width="100%" border="1">
                                            <tbody>
                                                <tr>
                                                    <td align="left" bgcolor="#eeeeee"><b>&nbsp;INGRESO EXHORTOS</b></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table height="7" width="345">
                                            <tbody>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <!-- Tabla Cuerpo Inicio -->
                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0" width="633" border="1" height="100">
                                            <tr>
                                                <td valign="top">

                                                    <table border="0" bgcolor="#e6ecf2" border="0" style="width: 754px">
                                                        <tr>
                                                            <td class="textos22" colspan="4">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" class="style2">N° Operación :</td>
                                                            <td align="left" class="style4">
                                                                <asp:TextBox ID="txtNroOperacion" runat="server"
                                                                    Style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="style3">Cliente :</td>
                                                            <td align="left" style="margin-left: 40px" class="style5">
                                                                <asp:TextBox ID="txtCliente" runat="server"
                                                                    Style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" class="style2">Rut Deudor :</td>
                                                            <td align="left" class="style4">
                                                                <asp:TextBox ID="txtRutDeudor" runat="server"
                                                                    Style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="style3">Deudor:</td>
                                                            <td align="left" class="style5">
                                                                <asp:TextBox ID="txtNomDeudor" runat="server"
                                                                    Style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" class="style2">Producto :</td>
                                                            <td align="left" class="style4" colspan="2">
                                                                <asp:TextBox ID="txtProducto" runat="server"
                                                                    Style="WIDTH: 300px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                                                            </td>

                                                            <%--  <td align="right" class="style3" >Sub Producto:</td>
                        <td  align=left class="style5">
                            <asp:TextBox ID="txtSubProducto" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>--%>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" class="style2">Rol-Rit :</td>
                                                            <td align="left" class="style4">
                                                                <asp:TextBox ID="txtRol" runat="server"
                                                                    Style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="style3">Tribunal :</td>
                                                            <td align="left" class="style5">
                                                                <asp:TextBox ID="txtTribunal" runat="server"
                                                                    Style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" class="style2">Digitalizar :</td>
                                                            <td align="left" class="style1" colspan="3">
                                                                <asp:FileUpload ID="filesubir" Style="WIDTH: 405px; margin-left: 0px;" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Tipo de Exhorto:</td>
                                                            <td align="left" class="style4">
                                                                <asp:DropDownList ID="tipoexhorto" runat="server"
                                                                    Style="WIDTH: 250px; margin-left: 0px;">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="right" class="style3">Comuna Destino</td>
                                                            <td align="left" class="style5">
                                                                <asp:DropDownList ID="ddlComunas" runat="server"
                                                                    Style="WIDTH: 350px; margin-left: 0px;" DataTextField="descripcion" DataValueField="id_comuna">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>



                                                        <tr>
                                                            <td align="right" class="style2">Rol Exhorto :</td>
                                                            <td align="left" class="style4">
                                                                <asp:TextBox ID="txtRolExhorto" runat="server"
                                                                    Style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="style3"></td>
                                                            <td align="left" class="style5"></td>
                                                        </tr>


                                                        <tr>
                                                            <td align="right" class="style2">Jurisdicción :</td>
                                                            <td align="left" class="style4">

                                                                <asp:DropDownList ID="juris" runat="server" AutoPostBack="True"
                                                                    OnSelectedIndexChanged="juris_SelectedIndexChanged">
                                                                </asp:DropDownList>

                                                            </td>
                                                            <td align="right" class="style3">Tribunal Exhortado :</td>
                                                            <td align="left" class="style5">
                                                                <asp:DropDownList ID="tribunalexhorto" runat="server"
                                                                    Style="WIDTH: 350px; margin-left: 0px;">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>



                                                        <tr>
                                                            <td align="right" class="style2">Fecha Ingreso :</td>
                                                            <td align="left" class="style4">
                                                                <asp:TextBox ID="txtFechaingreso" runat="server"
                                                                    Style="WIDTH: 100px; margin-left: 0px;"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="style3">Procurador :</td>
                                                            <td align="left" class="style5">
                                                                <asp:DropDownList ID="procurador" runat="server"
                                                                    Style="WIDTH: 250px; margin-left: 0px;">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" class="style2">Receptor:</td>
                                                            <td align="left" class="style4">
                                                                <asp:DropDownList ID="receptor" runat="server"
                                                                    Style="WIDTH: 250px; margin-left: 0px;">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="right" class="style3"></td>
                                                            <td align="left" class="style5"></td>
                                                        </tr>

                                                        <%--          <tr>
                        <td align="right" class="style2" >Observación:</td>
                        <td  align="left" class="style4"  >
                          <asp:TextBox ID="observacion" runat="server"  
                                 TextMode="MultiLine" MaxLength="10" Width="250px" Height="50px" ></asp:TextBox>
                        </td>
                         <td align="right" class="style3" ></td>
                        <td  align=left>
                                        
                   <asp:Button ID="btnPoder" runat="server" Visible="true" CssClass="boton2" Text="Poder Judicial" 
                          OnClientClick="return IrJudicial('http://www.poderjudicial.cl/index2.php?pagina1=estados_causas.php','700','650');"  />
                   <asp:Button ID="btnActividades" runat="server" Visible="true" CssClass="boton2" Text="Ver Actividades" 
                          
                                OnClientClick="return Actividades();" 
                                />
                      
                   
                        </td>
                        
                    </tr>--%>



                                                        <tr>
                                                            <td class="textos22" colspan="4">&nbsp;</td>
                                                        </tr>

                                                    </table>

                                                </td>
                                            </tr>
                                        </table>

                                        <!-- Tabla Cuerpo Fin -->

                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" bgcolor="#CCCCCC">

                                        <!-- Zona de Botoneras -->
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="600" height="35">
                                                    <div align="center">
                                                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar"
                                                            OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click"
                                                            Visible="False" />

                                                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                                                            OnClientClick="return ValidarGuardar();" OnClick="btnGuardar_Click" />

                                                        <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar"
                                                            OnClientClick="return ValidarActualizar();" Visible="False" OnClick="btnActualizar_Click" />

                                                        <asp:Button ID="btnEliminar" runat="server" CssClass="boton" Text="Eliminar" Visible="False"
                                                            OnClientClick="return ValidarEliminar();" OnClick="btnEliminar_Click" />

                                                        <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar"
                                                            OnClick="btnCancelar_Click" />




                                                    </div>
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div align="center">
                            <font size="2">Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
                            </font>
                        </div>
                        <asp:HiddenField ID="hiddidjuicio" runat="server" />

                    </form>

                </td>
            </tr>
        </tbody>
    </table>

</body>
</html>
