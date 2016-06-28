<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscaCobranzaConsulta.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.BuscaCobranzaConsulta" %>

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

            if (document.all("txtRut").value == "" && document.all("txtNroOperacion").value == "" && document.all("txtNroOperacion").value == "txtRol") {
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
                    <asp:TextBox ID="txtRut" runat="server" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%"></td>
                <td align="left" style="width: 30%"></td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">N° Operación</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNroOperacion" runat="server" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%"></td>
                <td align="left" style="width: 30%"></td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Rol</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRol" runat="server" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%"></td>
                <td align="left" style="width: 30%"></td>
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
                        PageSize="8"
                        AutoGenerateColumns="False"
                        Width="100%"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Acción">
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:Ir('../procesos/Consultas_Juicios.aspx?Codigo=<%# Eval("id_cobranza") %>&rutdeudor=<%# Eval("rut_deudor") %>&id_juicios=<%# Eval("id_juicios") %>&estado=<%# Eval("estado") %>','<%# Eval("estado") %>');">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Agregar Juicio" /></a>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="Nrooperacion" HeaderText="N° de Operación" />
                            <asp:BoundField DataField="rut_cli" HeaderText="Rut Cliente" />
                            <asp:BoundField DataField="rut_deudor" HeaderText="Rut Deudor" />
                            <asp:BoundField DataField="nomdeudor" HeaderText="Nombre Deudor" />
                            <asp:BoundField DataField="estado" HeaderText="Estado" />
                            <asp:BoundField DataField="TipoCobranza" HeaderText="Tipo" />
                            <asp:BoundField DataField="NumeroCampana" HeaderText="N° Campaña" />

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
                <td align="left" class="barra-sub-titulo" colspan="4"></td>
            </tr>
        </table>
    </form>

</body>
</html>
