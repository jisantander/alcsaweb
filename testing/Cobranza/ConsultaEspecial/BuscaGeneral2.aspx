<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscaGeneral2.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.BuscaGeneral2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">

        function Ir(pagina, estado) {
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
</head>
<body>

    <form runat="server" id="Formulario">
        <table border="0" style="width: 800px">
            <tr>
                <td class="barra-titulo" colspan="4">SISTEMA DE COBRANZA</td>
            </tr>

            <tr>
                <td class="barra-sub-titulo" colspan="4">BUSCAR JUICIO</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Rut Deudor</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRut" runat="server" Width="90%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%"><font color="red" size="-2"><b>Ej. 12324654-6</b></font></td>
                <td align="left" style="width: 30%"></td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Número Operación</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNroOperacion" runat="server" onKeyPress="return acceptNum(event)" Width="90%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%"></td>
                <td align="left" style="width: 30%"></td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Cliente</td>
                <td align="left" style="width: 30%">
                                                                <asp:DropDownList ID="ddlCliente" runat="server" Width="90%" DataTextField="rsocial" DataValueField="rut_cli">
                                                                </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="barra-sub-titulo" colspan="4">

                    <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click" />

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
                            <asp:TemplateField HeaderText="Acción">
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:Ir('/cobranza/procesos/MostrarDomicilios.aspx?Codigo=&deudor=<%# Eval("rut_deudor") %>&id_juicios=&estado=');">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Agregar Juicio" /></a>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="rut_cli" HeaderText="Rut Cliente" >
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="rut_deudor" HeaderText="Rut Deudor" >
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nomdeudor" HeaderText="Nombre Deudor" >
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SinDomicilio" HeaderText="Nuevos Domicilios Encontrados" >
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>

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

                </td>
            </tr>
            <tr>
                <td align="right" class="barra-sub-titulo" colspan="4">

                    &nbsp;</td>
            </tr>
        </table>
    </form>

</body>
</html>
