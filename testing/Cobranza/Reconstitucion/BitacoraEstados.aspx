<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BitacoraEstados.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.BitacoraEstados" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
    <!--Jbaez: Imprimir bitacora 10-04-2014-->

    function imprimir() {
        if (window.print)
            window.print()
        else
            alert("Para imprimir presione Crtl+P.");
    }
    function Popup() {
        var url = 'BitacoraEstadosExcel.aspx';
        var pWin = window.open(url, 'newWin', 'width=700,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
        pWin.focus();
        return false;
    }

    function VentanaModalEdit(OT) {
        var url = "popAsignacion.aspx?OT=" + OT;
        var strFeatures = "top=100px, left=270px, width=770px, height=400px, center=yes, help=no, status=no"
        ventana = window.open(url, "NewWin", strFeatures);
        ventana.focus();

        document.getElementById("Button1").click();
    }

    function Ir(pagina) {
        document.location.href = pagina;
    }


    function ValidarBuscar() {
        return true;
    }

    </script>

    <style type="text/css">
        .style7 {
            width: 429px;
        }

        .auto-style1 {
            width: 106%;
        }

        .auto-style2 {
            width: 688px;
        }

        .auto-style3 {
            width: 146px;
            font-weight: bold;
            font-size: small;
        }

        .auto-style4 {
            font-size: small;
        }
    </style>
</head>
<body>

    <form runat="server" id="Formulario">
        &nbsp;<table cellspacing="0" cellpadding="0" border="0" style="width: 100px">
            <tbody>

                <tr>
                    <td height="394" valign="top" class="textos">
                        <br>
                        <center>
                        </center>


                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>

                        <table width="500px" align="center" border="0">
                            <tbody>
                                <tr>
                                    <td height="500px" valign="top" class="auto-style1">

                                        <!-- Zona de Titulo -->

                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0"
                                            width="100%" border="1">
                                            <tbody>
                                                <tr>
                                                    <td align="center" bgcolor="#eeeeee"><b>&nbsp;BITACORA DE ESTADOS:<br />
                                                    </b></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table height="7" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td xclass="style7" align="left" class="auto-style3">Rut Cliente&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</td>
                                                    <td xclass="style7" align="left" class="auto-style2">

                                                        <asp:Label ID="Lab_RutCliente" runat="server" Text='<%# Bind("RUTCLIENTE") %>' CssClass="auto-style4"></asp:Label>
                                                    </td>
                                                    <td xclass="style7" align="right">

                                                        <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return Popup();"
                                                            ImageUrl="~/images/ico_excel.gif" />

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td xclass="style7" align="left" class="auto-style3">Nombre Cliente :</td>
                                                    <td xclass="style7" align="left" class="auto-style2">

                                                        <asp:Label ID="Lab_NombreCliente" align="left" runat="server" Text='<%# Bind("NOMBRECLIENTE") %>' CssClass="auto-style4"></asp:Label>
                                                    </td>
                                                    <td xclass="style7" align="right">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td xclass="style7" align="left" class="auto-style3">Nº Operación&nbsp;&nbsp;&nbsp;&nbsp; :</td>
                                                    <td xclass="style7" align="left" class="auto-style2">

                                                        <asp:Label ID="Lab_NOperacion" runat="server" align="left" Text='<%# Bind("NROOPERACION") %>' CssClass="auto-style4"></asp:Label>
                                                    </td>
                                                    <td xclass="style7" align="right">&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <!-- Tabla Cuerpo Inicio -->
                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0" width="600" border="1" height="100">


                                            <tr>
                                                <td valign="top">
                                                    <!-- Inicio Grilla -->
                                                    <asp:GridView ID="Grilla" runat="server"
                                                        Width="100%"
                                                        AllowPaging="True"
                                                        AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333"
                                                        PageSize="1000"
                                                        GridLines="None" Style="font-size: 12px">
                                                        <Columns>



                                                            <asp:TemplateField HeaderText="OT" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo1" runat="server" Text='<%# Bind("ot") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Estado" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo1" runat="server" Text='<%# Bind("descriestado") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>



                                                            <asp:TemplateField HeaderText="Observación" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="true"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo2" runat="server" Text='<%# Bind("observacion") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                                            <asp:TemplateField HeaderText="Usuario" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo3" runat="server" Text='<%# Bind("usuario") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                                            <asp:TemplateField HeaderText="Fecha Proceso" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre4" runat="server" Text='<%# Bind("fproceso") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Rut Cliente" HeaderStyle-HorizontalAlign="Left" Visible="False">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre5" runat="server" Text='<%# Bind("RUTCLIENTE") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                                            <asp:TemplateField HeaderText="Nombre Cliente" HeaderStyle-HorizontalAlign="Left" Visible="False">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre6" runat="server" Text='<%# Bind("NOMBRECLIENTE") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Nº Operación" HeaderStyle-HorizontalAlign="Left" Visible="False">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre7" runat="server" Text='<%# Bind("NROOPERACION") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>



                                                        <HeaderStyle CssClass="cabezabrilla" />
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditRowStyle BackColor="#2461BF" />
                                                        <AlternatingRowStyle BackColor="White" />
                                                    </asp:GridView>

                                                    <!-- Fin Grilla -->
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
                                    <td valign="top" bgcolor="#CCCCCC" class="auto-style1">

                                        <!-- Zona de Botoneras -->
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="100%" height="35">
                                                    <div align="center">

                                                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar"
                                                            OnClientClick="return ValidarBuscar();"
                                                            Visible="False" />


                                                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                                                            OnClientClick="return ValidarGuardar();"
                                                            Visible="False" />

                                                        <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar"
                                                            Visible="False" />

                                                        <asp:Button ID="btnImprimir" runat="server" CssClass="boton" Text="Imprimir" OnClientClick="javascript:imprimir()" />

                                                    </div>
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                            </tbody>
                        </table>


                    </td>
                </tr>
            </tbody>
        </table>

    </form>

</body>
</html>

