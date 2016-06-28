<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="juicioestado.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.juicioestado" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>

    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <script src="../../js/funciones.js" type="text/javascript"></script>
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.control-calendario').datepicker();

            $("#divObservaciones").dialog({
                resizable: false,
                autoOpen: false,
                modal: true,
                height: 400,
                width: 550,
                buttons: {
                    Cerrar: function () {
                        $(this).dialog('close');
                    }
                }
            });

            $('#aVerObservaciones').click(function () {
                $("#divObservaciones").dialog('open');
            });
        });
    </script>

    <script language="javascript" type="text/javascript">

        function ValidarGuardaEstado() {
            if (trim(document.all("txtObservacion").value) == "") {
                alert('Debe ingresar la Observación');
                document.all("txtObservacion").focus();
                return false;
            }

            if (confirm('Esta seguro de cambiar el estado del juicio ?'))
                return true;
            else return false;
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
                <td class="barra-sub-titulo" colspan="4">CAMBIAR ESTADO JUICIO</td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">N° Operación</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNroOperacion" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Cliente </td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="cbxClientes" runat="server" DataTextField="RAZON_SOCIAL" DataValueField="RUT" Width="95%">
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Rut Deudor</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRutDeudor" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Deudor</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNomDeudor" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Tipo Procedimiento</td>
                <td align="left" colspan="3">
                    <asp:TextBox ID="txtProcedimiento" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Matería</td>
                <td align="left" colspan="3">
                    <asp:TextBox ID="txtMateria" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Producto</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtProducto" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%"></td>
                <td align="left" style="width: 30%"></td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Estado</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="cbxEstado" runat="server" Width="95%">
                        <asp:ListItem Value="A">Activo</asp:ListItem>
                        <asp:ListItem Value="S">Suspendido</asp:ListItem>
                        <asp:ListItem Value="P">En Proceso De Termino</asp:ListItem>
                        <asp:ListItem Value="N">Terminado</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">Jurisdicción </td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="cbxListaJurisdiccion" AutoPostBack="true" runat="server" OnSelectedIndexChanged="cbxListaJurisdiccion_SelectedIndexChanged1" Width="95%">
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Rol o Rit</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRol" runat="server" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Juzgado</td>
                <td align="left" style="width: 30%">

                    <asp:DropDownList ID="cbxJuzgados" runat="server" Width="95%">
                    </asp:DropDownList>

                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%" rowspan="2">Observación</td>
                <td align="left" colspan="3">

                    <asp:TextBox ID="txtObservacion" runat="server"
                        TextMode="MultiLine" Height="70px" Width="99%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="3">
                    <a id="aVerObservaciones" href="javascript:void(0);">Ver Observaciones Anteriores</a>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Riesgo</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="ddlRiesgo" runat="server" DataTextField="Nombre" DataValueField="ID" Width="95%">
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">Fecha Riesgo</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFechaRiesgo" runat="server"
                        CssClass="control-calendario" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="barra-sub-titulo" colspan="4" align="right">
                    <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" OnClick="btnGuardar_Click1" OnClientClick="return ValidarGuardaEstado();" />

                    <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Volver"
                        OnClick="btnCancelar_Click" /></td>
            </tr>

        </table>

        <asp:HiddenField ID="hiddidcobranza" runat="server" />
        <asp:HiddenField ID="hdfEstadoActual" runat="server" />
        <asp:HiddenField ID="hdfIdJuicio" runat="server" />

        <div id="divObservaciones" style="overflow-y: scroll;" title="Observaciones">
            <asp:GridView ID="gvObservaciones" runat="server"
                AutoGenerateColumns="False"
                Width="100%"
                ForeColor="#333333" EmptyDataText="NO SE ENCONTRARON OBSERVACIONES">
                <Columns>
                    <asp:BoundField DataField="fproceso" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Fecha Ingreso" HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Usuario" DataField="usuario">
                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                    </asp:BoundField>

                    <asp:BoundField DataField="descripcion" HeaderText="Observación">
                    <ItemStyle HorizontalAlign="Left" Width="70%" />
                    </asp:BoundField>

                </Columns>
                <RowStyle BackColor="#EFF3FB" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>

        </div>
    </form>
</body>
</html>
