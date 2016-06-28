<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MntParametrosClientes.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.MntParametrosClientes" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>

    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">

        function ValidarEliminar() {
            if (confirm('Esta seguro de eliminar el teléfono ?'))
                return true;
            else return false;
        }

        function ValidarActualizar() {
            if (confirm('Esta seguro de actualizar los parámetros ?'))
                return true;
            return false;
        }

        function ValidarGuardar() {
            if (confirm('Esta seguro de guardar el teléfono ?'))
                return true;
            return false;
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
        .style3 {
            width: 202px;
        }
    </style>

</head>
<body>


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

                    <form runat="server" id="Formulario">

                        <table width="633" align="center" border="0">
                            <tbody>
                                <tr>
                                    <td height="147" width="100%" valign="top">

                                        <!-- Zona de Titulo -->

                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0"
                                            width="100%" border="1">
                                            <tbody>
                                                <tr>
                                                    <td align="left" bgcolor="#eeeeee"><b>&nbsp;MANTENEDOR PARÁMETROS CLIENTE</b></td>
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
                                        <asp:Panel ID="PnlDetalle" runat="server" Visible="true">

                                            <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0" width="633" border="1" height="100">
                                                <tr>
                                                    <td valign="top">

                                                        <table border="0" width="633" bgcolor="#e6ecf2" border="0">
                                                            <tr>
                                                                <td class="textos22" colspan="2">&nbsp;</td>
                                                            </tr>

                                                            <tr>
                                                                <td align="right" class="style3">Seleccione Cliente:</td>
                                                                <td align="left">
                                                                    <asp:DropDownList ID="cbxClientes" runat="server"
                                                                        AutoPostBack="True" OnSelectedIndexChanged="cbxClientes_SelectedIndexChanged" Width="90%">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>



                                                            <tr>
                                                                <td align="right" class="style3">Tasa Interes Corriente :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txttasacorriente" runat="server" Width="80px"
                                                                        ></asp:TextBox>
                                                                    %</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style3">Tasa Máxima Convencional :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txttasaconvencional" runat="server" Width="80px"
                                                                        ></asp:TextBox>
                                                                    %</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style3">Tasa Adicional :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txttasaadicional" runat="server" Width="80px"
                                                                        ></asp:TextBox>
                                                                    %</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style3">Honorarios :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtHonorarios" runat="server" Width="80px"
                                                                        ></asp:TextBox>
                                                                    %</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style3">Descuento Interes :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtDescInteres" runat="server" onKeyPress="return acceptNum(event)" Width="80px"
                                                                        ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style3">Descuento Honorarios :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtDeschonorarios" runat="server" onKeyPress="return acceptNum(event)" Width="80px"
                                                                        ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style3">Otros Descuentos :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtOtrosDesc" runat="server" onKeyPress="return acceptNum(event)" Width="80px"
                                                                        ></asp:TextBox>
                                                                </td>
                                                            </tr>




                                                            <tr>
                                                                <td class="textos22" colspan="2">&nbsp;</td>
                                                            </tr>

                                                        </table>

                                                    </td>
                                                </tr>


                                            </table>

                                        </asp:Panel>
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
                                                        <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar"
                                                            OnClientClick="return ValidarActualizar();"
                                                            OnClick="btnActualizar_Click" />
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

                        <asp:HiddenField ID="hddProceso" runat="server" />

                    </form>

                </td>
            </tr>
        </tbody>
    </table>

</body>
</html>
