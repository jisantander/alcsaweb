<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JuicioBusca.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.JuicioBusca" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        function VentanaModalEdit(pagina, estado) {
            if (trim(estado) == 'A' || trim(estado) == 'R' || trim(estado) == 'S') {
                var Url = pagina;
                var strFeatures = "top=100px, left=270px, width=550px, height=250px, status=no"
                objNewWindow = window.open(Url, "NewWin", strFeatures)
                // document.getElementById("Button1").click();
            }
            else if (trim(estado) == 'N')
                alert('Juicio se encuentra terminado');
            // } else if (trim(estado) == 'S') {
            //     alert('Juicio se encuentra suspendido');
            // }
        }

        function AsignarTodas() {
            var strRuta = 'JuicioBuscaResponsable.aspx?Codigo=*';
            var strFeatures = "top=100px, left=270px, width=550px, height=250px, status=no";
            var objVentana = window.open(strRuta, "Ventana", strFeatures);
            // document.getElementById("Button1").click();
        }

        function RecargarPagina() {
            document.getElementById("Button1").click();
        }

        function ValidarBuscar() {

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
            width: 132px;
        }

        .style3 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 104px;
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
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>

                        <table width="633" align="center" border="0">
                            <tbody>
                                <tr>
                                    <td height="114" width="100%" valign="top">
                                        <!-- Zona de Titulo -->
                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0"
                                            width="100%" border="1">
                                            <tbody>
                                                <tr>
                                                    <td align="left" bgcolor="#eeeeee"><b>&nbsp;BUSCAR JUICIO</b></td>
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
                                                            <td align="right" class="style2">Rut Deudor :</td>
                                                            <td align="left" class="style6">
                                                                <asp:TextBox ID="txtRut" runat="server"
                                                                    Style="WIDTH: 120px; margin-left: 0px;" Width="138px"></asp:TextBox>
                                                                <font color="red" size="-2"><b>Ej. 12324654-6</b></font>
                                                            </td>
                                                            <td align="right" class="style3"></td>
                                                            <td align="left">

                                                                <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click" />

                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" class="style2">Número Operación :</td>
                                                            <td align="left" class="style4" colspan="2">
                                                                <asp:TextBox ID="txtNroOperacion" runat="server" onKeyPress="return acceptNum(event)"
                                                                    Style="WIDTH: 120px; margin-left: 0px;"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" class="style2">Jurisdicción</td>
                                                            <td align="left" colspan="2">
                                                                <asp:DropDownList ID="ddlJurisdicciones" DataTextField="descripcion" DataValueField="id_jurisdiccion" runat="server" Width="90%" AutoPostBack="True" OnSelectedIndexChanged="ddlJurisdicciones_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" class="style2">Tribunal</td>
                                                            <td align="left" colspan="2">
                                                                <asp:DropDownList ID="ddlTribunales" DataTextField="descripcion" DataValueField="id_tribunal" runat="server" Width="90%">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td align="right" class="style2">Estado</td>
                                                            <td align="left" colspan="2">
                                                                <asp:DropDownList ID="ddlEstados" runat="server" Width="90%">
                                                                    <asp:ListItem Selected="True">Todos</asp:ListItem>
                                                                    <asp:ListItem Value="SIN ASIGNAR">Sin Asignar</asp:ListItem>
                                                                    <asp:ListItem Value="EN PROCESO">En Proceso</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="textos22" colspan="4" align="right">
                                                                <a href="#" onclick="AsignarTodas();">Asignar Todas las OT's</a>
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
                                                        OnPageIndexChanging="Grilla_PageIndexChanging"
                                                        AllowPaging="True"
                                                        PageSize="50"
                                                        AutoGenerateColumns="False"
                                                        Width="100%"
                                                        OnRowCommand="Editar"
                                                        CellPadding="4" ForeColor="#333333"
                                                        GridLines="None">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Id Juicio">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo1" runat="server" Text='<%# Bind("id_cobranza") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="N° de Operación">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCodigo11" runat="server" Text='<%# Bind("Nrooperacion") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Rut Cliente">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre1111344" runat="server" Text='<%# Bind("rut_cli") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Rut Deudor">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre1111" runat="server" Text='<%# Bind("rut_deudor") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Estado">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre2222" runat="server" Text='<%# Bind("estado") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Estado OT">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre333" runat="server" Text='<%# Bind("estado_ot") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Responsable">
                                                                <HeaderStyle Wrap="true"></HeaderStyle>
                                                                <ItemStyle Wrap="false"></ItemStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNombre334566633" runat="server" Text='<%# Bind("Respon") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="IdContratista" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblrespo" runat="server" Text='<%# Bind("Respon") %>' SortExpression="lblIdAccion"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="IdContratista" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("estado") %>' SortExpression="lblIdAccion"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="IdContratista" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblidCobbrnza" runat="server" Text='<%# Bind("id_cobranza") %>' SortExpression="lblIdAccion"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Asignar OT">
                                                                <ItemTemplate>

                                                                    <!--<a href="#" onclick="VentanaModalEdit('JuicioBuscaResponsable.aspx?Codigo=<%# Eval("id_cobranza") %>','<%# Eval("estado") %>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Asignar responsable"  /></a>-->
                                                                    <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="../../images/b_editar.gif" Width="18" Height="18" ToolTip="Asignar responsable" CommandName="Editar" Visible="true" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <PagerSettings Mode="NextPreviousFirstLast"
                                                            FirstPageText="<<"
                                                            LastPageText=">>"
                                                            PageButtonCount="3" />

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
                                            <%-- <a href="#" onclick="javascript:Ir('JuicioBuscaResponsable.aspx?Codigo=<%# Eval("id_cobranza") %>','<%# Eval("estado") %>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Asignar responsable"  /></a> --%>
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
                        <div align="left" style="text-align:center;">
                            <font size="2" >
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
