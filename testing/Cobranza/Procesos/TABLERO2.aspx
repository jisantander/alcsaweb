<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TABLERO2.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.TABLERO2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltdae</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.Rut.js"></script>

    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('.control-rut').Rut();

            $('#imgDescargar').click(function () {
                var _url = 'TableroExcel.aspx?' + $('#hdfFiltro').val();
                var _ventana = window.open(_url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
                _ventana.focus()
            });
        });

    </script>

</head>
<body>
    <form id="form1" runat="server">

        <table cellspacing="0" cellpadding="0" border="0" style="width: 700px;">
            <tbody>
                <tr>
                    <td class="barra-titulo" colspan="4">SISTEMA DE COBRANZA</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 15%" class="letra">N° Operación</td>
                    <td style="width: 35%" class="letra">
                        <asp:TextBox ID="txtNroOperacion" runat="server"
                            Width="60%"></asp:TextBox>
                    </td>
                    <td style="width: 15%" class="letra">Rut Deudor</td>
                    <td style="width: 35%" class="letra">
                        <asp:TextBox ID="txtRutDeudor" runat="server"
                            Width="60%" CssClass="control-rut"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%" class="letra">Rut Cliente</td>
                    <td style="width: 35%" class="letra">
                        <asp:TextBox ID="txtRutCliente" runat="server"
                            Width="60%" AutoPostBack="True" OnTextChanged="txtRutCliente_TextChanged" CssClass="control-rut"></asp:TextBox>
                    </td>
                    <td style="width: 15%" class="letra">Nombre Cliente</td>
                    <td style="width: 35%" class="letra">
                        <asp:DropDownList ID="cbxCliente" runat="server"
                            Width="97%" AutoPostBack="True" OnSelectedIndexChanged="cbxCliente_SelectedIndexChanged" DataTextField="rsocial" DataValueField="rut_cli">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%" class="letra"></td>
                    <td style="width: 35%" class="letra"></td>
                    <td style="width: 15%" class="letra">REMESA</td>
                    <td style="width: 35%" class="letra">
                        <asp:DropDownList ID="cbxRemesas" runat="server" DataValueField="ID" DataTextField="Nombre"
                            Width="97%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%" class="letra">Abogado</td>
                    <td style="width: 35%" class="letra">
                        <asp:DropDownList ID="cbxbogado" runat="server"
                            Width="97%" DataTextField="nombres" DataValueField="rut">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 15%" class="letra">Procurador</td>
                    <td style="width: 35%" class="letra">
                        <asp:DropDownList ID="cbxProcurador" runat="server"
                            Width="97%" DataTextField="nombres" DataValueField="rut">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%" class="letra">Tribunal</td>
                    <td style="width: 35%" class="letra">
                        <asp:DropDownList ID="cbxTribunal" runat="server"
                            Width="97%" DataTextField="descripcion" DataValueField="id_tribunal">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 15%" class="letra">Producto</td>
                    <td style="width: 35%" class="letra">
                        <asp:DropDownList ID="cbxProducto" runat="server"
                            Width="97%" DataTextField="descripcion" DataValueField="id_producto">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%" class="letra">Estado Juicio</td>
                    <td style="width: 35%" class="letra">
                        <asp:DropDownList ID="cbxEstadoJuicio" runat="server"
                            Width="97%">
                            <asp:ListItem Value="Seleccione">Seleccione</asp:ListItem>
                            <asp:ListItem Value="A">Activo</asp:ListItem>
                            <asp:ListItem Value="S">Suspendido</asp:ListItem>
                            <asp:ListItem Value="P">En Proceso de Termino</asp:ListItem>
                            <asp:ListItem Value="N">Terminado</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 15%" class="letra">Trámite</td>
                    <td style="width: 35%" class="letra">
                        <asp:DropDownList ID="cbxTramite" runat="server"
                            Width="97%" DataTextField="descripcion" DataValueField="id_tramite">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td style="width: 15%" class="letra">Juicio</td>
                    <td style="width: 35%" class="letra">
                        <asp:DropDownList ID="cbxCobranzaConJuicio" runat="server"
                            Width="97%">
                            <asp:ListItem Value="1" Selected="True">Con Juicio</asp:ListItem>
                            <asp:ListItem Value="0">Sin Juicio</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 15%" class="letra">Actividad</td>
                    <td style="width: 35%" class="letra">
                        <asp:DropDownList ID="cbxActividadGestion" runat="server"
                            Width="97%">
                            <asp:ListItem Value="2" Selected="True">Con y Sin Gestión</asp:ListItem>
                            <asp:ListItem Value="1">Con Gestión</asp:ListItem>
                            <asp:ListItem Value="0">Sin Gestión</asp:ListItem>
                        </asp:DropDownList>
                        <asp:HiddenField ID="hdfFiltro" runat="server" ClientIDMode="Static" />
                    </td>
                </tr>

                <tr>
                    <td class="barra-sub-titulo" colspan="4">
                        <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClick="Button1_Click" />
                        &nbsp;<asp:Button ID="btnLimpiar" runat="server" CssClass="boton" Text="Limpiar" OnClick="btnLimpiar_Click" />
                        &nbsp;<img id="imgDescargar" src="../../images/ico_excel.gif" style="width: 20px; height: 20px; cursor: pointer;" alt="Descargar Excel" />
                    </td>
                </tr>
            </tbody>
        </table>

        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="barra-sub-titulo">Total Registros:
                        <asp:Label ID="lab_Total_Registros" runat="server" Font-Size="Small" Font-Bold="True" ForeColor="Blue"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="Grilla" runat="server"
                        AllowPaging="True"
                        PageSize="50"
                        AutoGenerateColumns="False"
                        Width="100%"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None" OnPageIndexChanging="Grilla_PageIndexChanging1">
                        <%-- <PagerSettings Mode="Numeric" FirstPageText="<<" LastPageText=">>" PageButtonCount="20"/> --%>
                        <HeaderStyle CssClass="cabezabrilla" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="cliente" HeaderText="Acreedor" />
                            <asp:BoundField DataField="abogado" HeaderText="Abogado" />
                            <asp:BoundField DataField="NombreRemesa" HeaderText="Remesa" />
                            <asp:BoundField DataField="procurador" HeaderText="Procurador" />
                            <asp:BoundField DataField="nrooperacion" HeaderText="N° Operación" />
                            <asp:BoundField DataField="producto" HeaderText="Producto" />
                            <asp:BoundField DataField="rut_deudor" HeaderText="Rut Deudor" />
                            <asp:BoundField DataField="nomdeudor" HeaderText="Nombre Deudor" />
                            <asp:BoundField DataField="tipocobranza" HeaderText="Tipo Cobranza" />
                            <asp:BoundField DataField="tribunal" HeaderText="Tribunal" />
                            <asp:BoundField DataField="rol" HeaderText="Rol" />
                            <asp:BoundField DataField="tramite" HeaderText="Tramite" />
                            <asp:BoundField DataField="ftramite" HeaderText="F. Tramite" />
                            <asp:BoundField DataField="proxgestion" HeaderText="Prox. Gestión" />
                            <asp:BoundField DataField="fechaproxgestion" HeaderText="F. Prox. Gestión" />
                            <asp:BoundField DataField="DiasSinGestion" HeaderText="Días sin Gestión" />
                            <asp:BoundField DataField="subtramite" HeaderText="SubTrámite" />
                            <asp:BoundField DataField="fechasubtramite" HeaderText="F. SubTrámite" />
                            <asp:BoundField DataField="EstadoJuicio" HeaderText="Estado Juicio" />
                            <asp:BoundField DataField="IdCampanaCallCenter" HeaderText="ID Campaña Call Center" />
                            <asp:BoundField DataField="observacion" HeaderText="Observación" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="13px" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="13px" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" Font-Size="13px" />
                        <RowStyle BackColor="#EFF3FB" Font-Size="13px" Wrap="false" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" Font-Size="13px" />
                    </asp:GridView>
                </td>
            </tr>
        </table>

        <div>
        </div>
    </form>
</body>
</html>
