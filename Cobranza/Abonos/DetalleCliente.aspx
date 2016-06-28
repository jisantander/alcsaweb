<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleCliente.aspx.cs" Inherits="CobranzaALC.Cobranza.Abonos.DetalleCliente" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>

    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>

    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('.control-calendario').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true
            });
        });

        function Ir(pagina, rendido) {
            document.location.href = pagina;
        }

        function ValidarBuscar() {

            if ($.trim($('#txtRutCli').val()) && $.trim($('#ddlClientes').val()) == '') {
                alert('Debe ingresar Rut del Cliente o seleccionar un cliente de la lista.');
                document.all("txtRutCli").focus();
                return false;
            }

            if (trim(document.all("txtFechaInicio").value) == '') {
                alert("Debe ingresar fecha desde");
                document.all("txtFechaInicio").focus();
                return false;
            }

            if (!(EsFecha(document.all("txtFechaInicio").value, 'dma'))) {
                alert('Debe ingresar fecha desde válida, Ej. 01-09-2011');
                document.all("txtFechaInicio").focus();
                return false;
            }

            if (trim(document.all("txtFechaFin").value) == '') {
                alert("Debe ingresar fecha hasta");
                document.all("txtFechaFin").focus();
                return false;
            }

            if (!(EsFecha(document.all("txtFechaFin").value, 'dma'))) {
                alert('Debe ingresar fecha hasta válida, Ej. 01-09-2011');
                document.all("txtFechaFin").focus();
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
            width: 83px;
        }

        .style3 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 71px;
        }

        .style7 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 10px;
        }

        .style8 {
            width: 61px;
        }
    </style>
</head>
<body>

    <form runat="server" id="Formulario">

        <table border="0" style="width: 800px">
            <tr>
                <td class="barra-titulo" colspan="4">SISTEMA DE COBRANZA</td>
            </tr>

            <tr>
                <td class="barra-sub-titulo" colspan="4">ACCESO SISTEMA RENDICIONES</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Rut Cliente</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRutCli" runat="server" Width="95%"></asp:TextBox>

                </td>
                <td align="left" style="width: 20%">Cliente</td>
                <td align="left" style="width: 30%">
                        <asp:DropDownList ID="dllClientes" runat="server"
                            Width="97%" DataTextField="rsocial" DataValueField="rut_cli">
                        </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Fecha Desde</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFechaInicio" runat="server" CssClass="control-calendario"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Fecha Hasta</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFechaFin" runat="server" CssClass="control-calendario"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" class="barra-sub-titulo" colspan="4">
                    <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CssClass="boton" Text="Limpiar" OnClick="Button2_Click" />

                    &nbsp;<asp:ImageButton ID="exp_excel" runat="server" ImageUrl="/images/excel.jpeg" OnClick="exp_excel_Click" Width="22px" />

                </td>
            </tr>
            <tr>
                <td align="left" colspan="4">
                    <asp:GridView ID="Grilla" runat="server"
                        OnPageIndexChanging="Grilla_PageIndexChanging"
                        AllowPaging="True"
                        PageSize="25"
                        AutoGenerateColumns="False"
                        Width="100%"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None">
                        <Columns>

                            <asp:TemplateField HeaderText="N° Operación" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblCodigo1" runat="server" Text='<%# Bind("nrooperacion") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Rut Deudor" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblCodigo2" runat="server" Text='<%# Bind("rut_deudor") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Nombre Deudor" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblCodigo2" runat="server" Text='<%# Bind("nomdeudor") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="N° Comprobante" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblCodigo3" runat="server" Text='<%# Bind("nrocomprobante") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Fecha Comprobante" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblCodigo4" runat="server" Text='<%# Bind("fechaabono") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Monto" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblCodigo5" runat="server" Text='<%# Bind("montoabono") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Concepto Pago" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblCodigo5" runat="server" Text='<%# Bind("concepto") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Forma de Pago" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblCodigo5" runat="server" Text='<%# Bind("moneda") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Rendido" HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblCodigo5" runat="server" Text='<%# Bind("rendicion") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Acción" HeaderStyle-HorizontalAlign="center">
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:Ir('DetalleRendicion.aspx?rutdeudor=<%# Eval("rut_deudor") %>&nrooperacion=<%# Eval("nrooperacion") %>&nomdeudor=<%# Eval("nomdeudor") %>&nrocomprobante=<%# Eval("nrocomprobante") %>&nomcliente=<%# Eval("nomcliente") %>&montoabono=<%# Eval("montoabono") %>&id_abono=<%# Eval("id_abono") %>&id_cobranza=<%# Eval("id_cobranza") %>','<%# Eval("rendicion") %>');">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="" /></a>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                        <PagerSettings Mode="NextPreviousFirstLast"
                            FirstPageText="<<"
                            LastPageText=">>"
                            PageButtonCount="17" />

                        <HeaderStyle CssClass="cabezabrilla" />
                        <RowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">
                    
                    &nbsp;</td>
            </tr>
        </table>
        <asp:HiddenField ID="hiddidcobranza" runat="server" />
    </form>

</body>
</html>
