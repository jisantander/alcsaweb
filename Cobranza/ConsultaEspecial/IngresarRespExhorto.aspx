<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresarRespExhorto.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.IngresarRespExhorto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">

        function ValidarBuscar() {

            if (document.all("txtRol").value == "" && document.all("txtRutDeudor").value == "" && document.all("txtNroOperacion").value == "") {
                alert('Debe ingresar como mínimo un filtro');
                document.all("txtRol").focus();
                return false;
            }
            return true;

        }

        function Popup() {
            var url;
            url = 'ExhortoExcel.aspx';

            pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
            if (window.pWin)
                pWin.focus()

            return false;
        }

    </script>
    <style type="text/css">
        .style2 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 225px;
        }

        .style3 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 104px;
        }

        .style6 {
            width: 210px;
        }
    </style>
</head>
<body>
    <form runat="server" id="Formulario">
        <table cellspacing="0" cellpadding="0" width="633" border="0">
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
                        <table width="633" align="center" border="0">
                            <tbody>
                                <tr>
                                    <td height="114" width="100%" valign="top">
                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0"
                                            width="100%" border="1">
                                            <tbody>
                                                <tr>
                                                    <td align="left" bgcolor="#eeeeee"><b>&nbsp;INGRESAR RESPONSABLE EXHORTO</b></td>
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
                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0" width="633" border="1" height="100">
                                            <tr>
                                                <td align="left">
                                                    <!-- Inicio Filtros -->
                                                    <table border="0" width="100%" bgcolor="#e6ecf2" border="0">
                                                        <tr>
                                                            <td class="textos22" colspan="4">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Rol Exhorto :</td>
                                                            <td align="left" class="style6">
                                                                <asp:TextBox ID="txtRol" runat="server" Enabled="false"
                                                                    Style="WIDTH: 120px; margin-left: 0px;" Width="138px"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="style3"></td>
                                                            <td align="left"></td>
                                                            <tr>
                                                                <td align="right" class="style2">Asigne Responsable :</td>
                                                                <td align="left" class="style6">

                                                                    <asp:DropDownList ID="cbxResponsable" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td align="right" class="style3"></td>
                                                                <td align="left"></td>
                                                            </tr>
                                                        </tr>
                                                    <td class="textos22" colspan="4">
                                                        <asp:Label ID="lab_Rut_Deudor" runat="server" Text="Rut-Deudor" Visible="False"></asp:Label>
                                                        &nbsp;
                         <asp:Label ID="lab_Tribunal" runat="server" Text="Tribunal" Visible="False"></asp:Label>
                                                        <asp:Label ID="lab_Id_Tribunal" runat="server" Text="Codigo Tribunal" Visible="False"></asp:Label>
                                                    </td>
                                            </tr>

                                        </table>

                                        <!-- Fin Filtros -->
                                    </td>
                                </tr>


                                <%--<tr>
              <td valign="top">
                 Total registros : 
              
              </td>
              </tr>--%>
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

                                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" OnClick="btnGuardar_Click" />


                                        <asp:Button ID="btnVolver" runat="server" CssClass="boton" Text="Volver" OnClick="btnVolver_Click" />

                                    </div>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
            </tbody>
        </table>
        <div align="left">
            <font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
            </font>
        </div>

        </TD>
  </TR>
  </TBODY> 
</TABLE>

        <asp:HiddenField ID="hddIdExhorto" runat="server" />

    </form>

</body>
</html>
