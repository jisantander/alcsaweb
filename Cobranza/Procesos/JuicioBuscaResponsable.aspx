<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JuicioBuscaResponsable.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.JuicioBuscaResponsable" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <base target="_self">
    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">

        function ValidarTerminar() {
            if (confirm('Esta seguro de terminar la OT ?'))
                return true;
            else return false;
        }

        function Cerrar() {
            RecargarPadre();
            window.close();
            return false;
        }

        function RecargarPadre() {
            parent.opener.RecargarPagina();
        }

        function ValidarGuardar() {
            if (confirm('Esta seguro de asignar este responsable?'))
                return true;
            else return false;
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
    </style>
</head>
<body>
    <form runat="server" id="Formulario">
        <table width="400" align="center" border="0">
            <tbody>
                <tr>
                    <td height="114" width="100%" valign="top">
                        <!-- Zona de Titulo -->
                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0"
                            width="100%" border="1">
                            <tbody>
                                <tr>
                                    <td align="left" bgcolor="#eeeeee"><b>&nbsp;SELECCIONE RESPONSABLE</b></td>
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
                                <td align="left">
                                    <!-- Inicio Filtros -->
                                    <table border="0" width="100%" bgcolor="#e6ecf2" border="0">
                                        <tr>
                                            <td class="textos22" colspan="4">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Id Juicio :</td>
                                            <td align="left" colspan="2">
                                                <asp:TextBox ID="txtOT" runat="server" Enabled="false" xonKeyPress="return acceptNum(event)"
                                                    Style="WIDTH: 120px; margin-left: 0px;" Width="50%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Responsable :</td>
                                            <td align="left" colspan="2">
                                                <asp:DropDownList ID="cbxResponsable" runat="server"
                                                    Style="WIDTH: 200px; margin-left: 0px;" Width="50%">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Abogados :</td>
                                            <td align="left" colspan="2">
                                                <asp:DropDownList ID="cbxAbogados" runat="server"
                                                    Style="WIDTH: 200px; margin-left: 0px;" Width="50%">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="style2">Fecha Asignación :</td>
                                            <td align="left" class="style4" colspan="2">
                                                <asp:TextBox ID="txtFechaAsignacion" runat="server" MaxLength="10" Enabled="false"
                                                    Style="WIDTH: 90px; margin-left: 0px;"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="textos22" colspan="4">&nbsp;</td>
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
                                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                                            OnClientClick="return ValidarGuardar();"
                                            Visible="true" OnClick="btnGuardar_Click" />
                                        &nbsp;
                       <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Salir" OnClientClick="window.close();"
                           Visible="true" />

                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <div align="left">
            <font size="2">&nbsp;</font>
        </div>
        <asp:HiddenField ID="hddOT" runat="server" />
        <asp:HiddenField ID="hddUserResponsable" runat="server" />
    </form>

</body>
</html>
