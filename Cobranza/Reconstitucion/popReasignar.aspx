<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="popReasignar.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.popReasignar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <base target="_self">
    <script src="../../js/funciones.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function ValidarTerminar() {
            if (confirm('Esta seguro de terminar la OT ?')) {
                return true;
                return false;
            }
        }

        function ValidarGuardar() {
            if (confirm('Esta seguro de asignar la OT a este responsable?')) {
                return true;
                return false;
            }
        }
    </script>
    <style type="text/css">
        .style2 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 132px;
        }

        .style4 {
            width: 90px;
        }

        .style6 {
            width: 210px;
        }
    </style>
</head>
<body>
    <form runat="server" id="Formulario">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <br />
        <table width="400" align="center" border="0">
            <tbody>
                <tr>
                    <td height="114" width="100%" valign="top">
                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0" width="633" border="1" height="100">
                            <tr>
                                <td align="left">
                                    <!-- Inicio Filtros -->
                                    <table border="0" width="100%" bgcolor="#e6ecf2" border="0">
                                        <tr>
                                            <td class="titulo" colspan="2" align="center" bgcolor="#336699">SELECCIONE RESPONSABLE
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="textos22" colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">OT :</td>
                                            <td align="left" class="style4">
                                                <asp:TextBox ID="txtOT" runat="server" Enabled="false" xonKeyPress="return acceptNum(event)"
                                                    Style="WIDTH: 120px; margin-left: 0px;"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Responsable :</td>
                                            <td align="left" class="style4">
                                                <asp:DropDownList ID="cbxResponsable" runat="server"
                                                    Style="WIDTH: 200px; margin-left: 0px;" DataTextField="nombre" DataValueField="username">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Fecha Remesa :</td>
                                            <td align="left" class="style4">
                                                <asp:TextBox ID="txtFechaRemesa" runat="server" MaxLength="10" Enabled="false"
                                                    Style="WIDTH: 90px; margin-left: 0px;"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Fecha Entrega :</td>
                                            <td align="left" class="style4">
                                                <asp:TextBox ID="txtEntrega" runat="server" MaxLength="10" Enabled="false"
                                                    Style="WIDTH: 90px; margin-left: 0px;"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <%-- <tr><td align="right" class="style2" >Estado :</td><td  align="left" class="style4"  colspan="2"><asp:DropDownList ID="cbxEstados" runat="server"  style="WIDTH: 350px; margin-left: 0px;" AutoPostBack="True" onselectedindexchanged="cbxEstados_SelectedIndexChanged" ></asp:DropDownList></td></tr>   --%>
                                        <tr>
                                            <td class="textos22" colspan="2">&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top"></td>
                            </tr>
                            <%--<tr><td valign="top">Total registros : </td></tr>--%>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" bgcolor="#CCCCCC">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="600" height="35">
                                    <div align="center">
                                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" OnClientClick="return ValidarGuardar();" Visible="true" OnClick="btnGuardar_Click" />
                                        &nbsp;
                                        <%--<asp:Button ID="btnTerminar" runat="server" CssClass="boton" Text="Terminar"Visible="false" onclick="btnTerminar_Click" OnClientClick="return ValidarTerminar()" />--%>
                                        <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Salir" OnClientClick="window.close();" Visible="true" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
