<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarBienRaiz.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.MostrarBienRaiz" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        function Popup() {
            var url = 'ExcelBienRaiz.aspx';
            var pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
            pWin.focus()
            return false;
        }

        function Cerrar() {
            window.location = '../ConsultaEspecial/BuscaGeneral3.aspx';
            return false;
        }

        function Imprimir() {
            window.print();
            return false;
        }

        function Ir(pagina) {
            document.location.href = pagina;
        }

        function ValidarBuscar() {

            if (document.all("txtRut").value == "" && document.all("txtNroOperacion").value == "") {
                alert('Debe ingresar como mínimo un filtro');
                document.all("txtRut").focus();
                return false;
            }

            if (!(document.all("txtRut").value == "")) {
                if (!(ChequeaRut(document.all("txtRut")))) {
                    alert('Rut no es válido');
                    document.all("txtRut").focus();
                    document.all("txtRut").select();

                    return false;
                }
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
            width: 69px;
        }

        .style6 {
            width: 301px;
        }

        .style7 {
            width: 269px;
        }

        .style8 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 117px;
        }
    </style>
</head>
<body>

    <form runat="server" id="Formulario">
        <table cellspacing="0" cellpadding="0" width="633" border="0">
            <tbody>

                <tr>
                    <td height="394" valign="top" class="textos">
                        <br>
                        <center>
                        </center>
                        <table width="633" align="center" border="0">
                            <tbody>
                                <tr>
                                    <td height="114" width="100%" valign="top">

                                        <!-- Zona de Titulo -->

                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0"
                                            width="100%" border="1">
                                            <tbody>
                                                <tr>
                                                    <td align="left" bgcolor="#eeeeee"><b>&nbsp;BIEN RAIZ</b></td>
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
                                                            <td align="left" class="style2">&nbsp;&nbsp;&nbsp;Deudor :</td>
                                                            <td align="left" class="style7">
                                                                <asp:TextBox ID="txtnomDeudor" runat="server"
                                                                    Style="WIDTH: 260px; margin-left: 0px;" Width="138px" ReadOnly="True"></asp:TextBox>

                                                            </td>
                                                            <td align="left" class="style8">&nbsp;&nbsp;&nbsp;Rut</td>
                                                            <td align="left" class="style6">
                                                                <asp:TextBox ID="txtRutDeudor" runat="server"
                                                                    Style="WIDTH: 120px; margin-left: 0px;" Width="138px" ReadOnly="True"></asp:TextBox>

                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <!-- Fin Filtros -->
                                                </td>
                                            </tr>

                                            <tr>
                                                <td valign="top">
                                                    <!-- Inicio Grilla -->
                                                    <asp:GridView ID="Grilla" runat="server"
                                                        AllowPaging="True"
                                                        AutoGenerateColumns="False"
                                                        Width="100%"
                                                        CellPadding="4" ForeColor="#333333"
                                                        GridLines="None">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Rut Deudor" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("rut_deudor") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Domicilio" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("domici") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Región" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("regnom") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Comuna" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("comnom") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Fojas" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("fojas_insc") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="N°" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("n_insc") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Año" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("anio_insc") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Conservador" HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("conservador") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
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
                                    <td valign="top" bgcolor="#CCCCCC">

                                        <!-- Zona de Botoneras -->
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="600" height="35">
                                                    <div align="center">

                                                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Imprimir"
                                                            OnClientClick="return Imprimir();" />


                                                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                                                            OnClientClick="return ValidarGuardar();"
                                                            Visible="False" />

                                                        <asp:Button ID="btnCerrar" runat="server" CssClass="boton" Text="Cerrar"
                                                            Visible="true" OnClientClick="return Cerrar();" />


                                                        &nbsp;
                       
                       <asp:ImageButton ID="exp_excel" runat="server" ImageUrl="/images/excel.jpeg" OnClientClick="return Popup();" />

                                                    </div>
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <%--   <div align="left"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
          </font> </div>--%>
         
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:HiddenField ID="hiddidjuicio" runat="server" />
    </form>
</body>
</html>
