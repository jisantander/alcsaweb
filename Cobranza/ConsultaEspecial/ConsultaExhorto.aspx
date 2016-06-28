<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaExhorto.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.ConsultaExhorto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">

        function Ir(cod) {
            var urll = "../procesos/MostrarActividadesExhorto.aspx?Codigo=" + cod + "";
            var pWin = window.open(urll, 'newWin', 'width=900,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
            if (window.pWin) pWin.focus()
            return false;
        }

        function Asignar(cod, rol, nomrespo, RutDeudor, Tribunal, id_tribunal) {

            <% if (Session["Perfil"].ToString() == "1") { %>
                urll = "IngresarRespExhorto.aspx?Codigo=" + cod + "&rol=" + rol + "&RutDeudor=" + RutDeudor + "&Tribunal=" + Tribunal + "&id_tribunal=" + id_tribunal;
                window.location.href = urll;
                return false;
            <% }%>

            if (nomrespo == '' || nomrespo == null) {
                urll = "IngresarRespExhorto.aspx?Codigo=" + cod + "&rol=" + rol + "&RutDeudor=" + RutDeudor + "&Tribunal=" + Tribunal + "&id_tribunal=" + id_tribunal;
                window.location.href = urll;
                return false;
            }
            alert('Ya se encuentra asignado, se debe reasignar');
        }

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
                                                    <td align="left" bgcolor="#eeeeee"><b>&nbsp;CONSULTA EXHORTOS</b></td>
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
                                                            <td align="right" class="style2">Rol-Rit Exhorto :</td>
                                                            <td align="left" class="style6">
                                                                <asp:TextBox ID="txtRol" runat="server"
                                                                    Style="WIDTH: 120px; margin-left: 0px;" Width="138px"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="style3"></td>
                                                            <td align="left">
                                                                <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Tribunal Exhortado :</td>
                                                            <td align="left" class="style6">

                                                                <asp:DropDownList ID="dtribunal" runat="server"
                                                                    Style="WIDTH: 400px; margin-left: 0px;">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="right" class="style3"></td>
                                                            <td align="left"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Cliente :</td>
                                                            <td align="left" class="style6">

                                                                <asp:DropDownList ID="ddlClientes" runat="server"
                                                                    Style="WIDTH: 400px; margin-left: 0px;">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="right" class="style3"></td>
                                                            <td align="left">

                                                                <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return Popup();"
                                                                    ImageUrl="~/images/ico_excel.gif" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Rut Deudor :</td>
                                                            <td align="left" class="style6">
                                                                <asp:TextBox ID="txtRutDeudor" runat="server"
                                                                    Style="WIDTH: 120px; margin-left: 0px;" Width="138px"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="style3"></td>
                                                            <td align="left">
                                                                <asp:Label ID="lab_Id_Tribunales" runat="server" Visible="False"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <%--        <tr>
                        <td align="right" class="style2" >N° Operación :</td>
                        <td  align="left" class="style4"  colspan="2">
                            <asp:TextBox ID="txtNroOperacion" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; " Width="138px"></asp:TextBox>
                        </td>
                      </tr>
                      <tr>
                        <td align="right" class="style2" >Rut Deudor :</td>
                        <td  align="left" class="style4"  colspan="2">
                            <asp:TextBox ID="txtRutDeudor" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; " Width="138px"></asp:TextBox>
                        </td>
                      </tr>  --%>
                                                        <tr>
                                                            <td align="right" class="style2">Comuna Destino:</td>
                                                            <td class="textos22" class="style2" colspan="3">

                                                                <asp:DropDownList ID="ddlComunas" runat="server"
                                                                    Style="WIDTH: 400px; margin-left: 0px;">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Responsable:</td>
                                                            <td class="textos22" class="style2" colspan="3">

                                                                <asp:DropDownList ID="ddlResponsable" runat="server"
                                                                    Style="WIDTH: 400px; margin-left: 0px;">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Ultima Actividad del Exhorto :</td>
                                                            <td class="textos22" class="style2" colspan="3">

                                                                <asp:DropDownList ID="ddlUltimaActividadExhorto" runat="server"
                                                                    Style="WIDTH: 400px; margin-left: 0px;">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Estado Exhorto :</td>
                                                            <td class="textos22" class="style2" colspan="3">

                                                                <asp:DropDownList ID="ddlEstadoExhorto" runat="server"
                                                                    Style="WIDTH: 400px; margin-left: 0px;">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="style2">Total Registros :</td>
                                                            <td class="textos22" class="style2" colspan="3">

                                                                <asp:Label ID="lab_Total_Registros" runat="server" Font-Size="Small" Font-Bold="True" ForeColor="Blue"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <!-- Inicio Grilla -->
                                                    <asp:GridView ID="Grilla" runat="server"
                                                        AutoGenerateColumns="False"
                                                        Width="100%"
                                                        CellPadding="4" ForeColor="#333333"
                                                        GridLines="None">
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <AlternatingRowStyle BackColor="White" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Mostrar Actividades">
                                                                <ItemTemplate>
                                                                    <a href="#" onclick="javascript:Ir('<%# Eval("id_exhorto") %>');">
                                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Mostrar Actividades Exhorto" /></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Asignar Responsable">
                                                                <ItemTemplate>
                                                                    <a href="#" onclick="javascript:Asignar('<%# Eval("id_exhorto") %>','<%# Eval("rolexhorto") %>','<%# Eval("nomrespo") %>','<%# Eval("rut_deudor") %>','<%# Eval("tribunal") %>','<%# Eval("Id_tribunal") %>' );">
                                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Asigna Responsable" /></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Rol Exhorto">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCo333digo" runat="server" Text='<%# Bind("rolexhorto") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="N° Operación">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNo222mbre" runat="server" Text='<%# Bind("operacion") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Rut Deudor">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNom33bre" runat="server" Text='<%# Bind("rut_deudor") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Nombre Deudor">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNo555mbre" runat="server" Text='<%# Bind("nomdeudor") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="ComunaDestino">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbl33Nombre" runat="server" Text='<%# Bind("ComunaDestino") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="F. Ingreso Exh.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbl33Nombre" runat="server" Text='<%# Bind("fingexh") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Tribunal Exh.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNom222bre" runat="server" Text='<%# Bind("tribunal") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Estado Exh.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNomeebre" runat="server" Text='<%# Bind("tipoexh") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Rut Cliente">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNomddsd33333333eebre" runat="server" Text='<%# Bind("rut_cli") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Cliente">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNomddsd333eebre" runat="server" Text='<%# Bind("cliente") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Responsable">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCo3sdsdsd33digo" runat="server" Text='<%# Bind("nomrespo") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="UltimaActividadExhorto">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCo3sdsdsd33digo" runat="server" Text='<%# Bind("NOMBRE_ACTIVIDAD") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="FechaUltimaActividad">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCo3sdsdsd33digo" runat="server" Text='<%# Bind("FECHA_ACTIVIDAD") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EditRowStyle BackColor="#2461BF" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle CssClass="cabezabrilla" />
                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <%--<tr><td valign="top">Total registros : </td></tr>--%>
                                        </table>
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
                                                            OnClientClick="return ValidarBuscar();"
                                                            Visible="False" />


                                                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                                                            OnClientClick="return ValidarGuardar();"
                                                            Visible="False" />

                                                        <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar"
                                                            Visible="False" />

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
                    </td>
                </tr>
            </tbody>
        </table>

    </form>

</body>
</html>
