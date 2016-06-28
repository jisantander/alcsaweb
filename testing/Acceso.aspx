<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acceso.aspx.cs" Inherits="CobranzaALC.Acceso" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="css/alc_estilo.css" rel="stylesheet" />

</head>
<body bgcolor="#FFFFFF" text="#000000">

    <form runat="server" id="Formulario">
        <center>
            <table cellspacing="0" cellpadding="0" width="633px" border="0">
                <tbody>
                    <tr>
                        <td class="barra-titulo">SISTEMA DE COBRANZA</td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" align="left">CONTROL DE ACCESO</td>
                    </tr>
                    <tr>
                        <td align="center" style="height: 150px; background-color: #e6ecf2; border: 1px solid #c8e3f9;">
                            <table cellpadding="0" cellspacing="0" border="0" style="width: 300px;">
                                <tbody>
                                    <tr>
                                        <td>Usuario</td>
                                        <td>
                                            <asp:TextBox size="14" ID="txtUsuario" runat="server" Width="150px" ClientIDMode="Static"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Contrase&ntilde;a</td>
                                        <td>
                                            <asp:TextBox size="16" ID="txtPassword" runat="server" TextMode="Password" Width="150px" ClientIDMode="Static"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Button ID="btnAceptar" CssClass="boton" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" Width="155px" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align: center; border: 1px solid #c8e3f9;">Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 </td>
                    </tr>
                </tbody>
            </table>
        </center>
        <asp:HiddenField ID="hdfCodigoBarra" runat="server" Value="" />
    </form>
</body>
</html>
