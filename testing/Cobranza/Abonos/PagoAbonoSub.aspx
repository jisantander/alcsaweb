<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PagoAbonoSub.aspx.cs" Inherits="CobranzaALC.Cobranza.Abonos.PagoAbonoSub" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>

    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/alc2.css" rel="stylesheet" />
    <script src="../../js/funciones.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>

    <script language="javascript" type="text/javascript">

        function validafpago() {

            document.all("txtMonto").value = "0";
            document.all("txtIntereses").value = "0";
            document.all("txtGastos").value = "0";
            document.all("txtIntAdicional").value = "0";
            document.all("txthonorarios").value = "0";
            document.all("txtdeschonorarios").value = "0";
            document.all("txtotrosdescuentos").value = "0";
            document.all("txtdescintereses").value = "0";
            document.all("txttotal").value = "0";
            document.all("txtMontoAbono").value = "0";

            document.all("txtFechaPago").value = "";

            if (trim(document.all("hiddTipoMoneda").value) == "5") {

                if (trim(document.all("txtFechaPago").value) == "") {
                    alert('Debe ingresar fecha de pago');
                    document.all("txtFechaPago").focus();
                    return false;
                }


                if (!(EsFecha(document.all("txtFechaPago").value, 'dma'))) {
                    alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                    document.all("txtFechaPago").focus();
                    return false;
                }

            }
            else document.all("txtFechaPago").value = "";

            return true;
        }

        function MostrarDocumento(id_abono) {
            var url = 'ComprobanteAbono.aspx?id_abono=' + id_abono;
            var pWin = window.open(url, 'newWin', 'width=680,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100');
            pWin.focus();
            return false;
        }

        function validarut() {

            if (trim(document.all("txtGirador").value) == "") {
                alert('Debe ingresar girador');
                document.all("txtGirador").focus();
                return false;
            }

            if (!(ChequeaRut(document.all("txtGirador")))) {
                alert('Rut no es válido');
                document.all("txtGirador").focus();
                document.all("txtGirador").select();

                return false;
            }

            return true;
        }

        function Ir() {

            if (trim(document.all("txtFecha").value) == "") {
                alert('Debe ingresar fecha abono');
                document.all("txtFecha").focus();
                return false;
            }

            if (trim(document.all("txtMontoAbono").value) == "") {
                alert('Debe ingresar monto abono');
                document.all("txtMontoAbono").focus();
                return false;
            }

            if (trim(document.all("ConceptoAbono").value) == "Seleccione") {
                alert('Debe seleccionar un concepto de abono');
                document.all("ConceptoAbono").focus();
                return false;
            }

            if (trim(document.all("tipomoneda").value) == "Seleccione") {
                alert('Debe seleccionar tipo de moneda');
                document.all("tipomoneda").focus();
                return false;
            }

            //Vàlidar CHEQUE 

            if (trim(document.all("hiddTipoMoneda").value) == "5") {

                if (trim(document.all("banco").value) == "Seleccione") {
                    alert('Debe seleccionar el banco');
                    document.all("banco").focus();
                    return false;
                }

                if (trim(document.all("txtFechaPago").value) == "") {
                    alert('Debe ingresar fecha de pago');
                    document.all("txtFechaPago").focus();
                    return false;
                }

                if (!(EsFecha(document.all("txtFechaPago").value, 'dma'))) {
                    alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                    document.all("txtFechaPago").focus();
                    return false;
                }

                if (trim(document.all("txtNroCheque").value) == "") {
                    alert('Debe ingresar Nº de cheque');
                    document.all("txtNroCheque").focus();
                    return false;
                }

                if (trim(document.all("txtGirador").value) == "") {
                    alert('Debe ingresar girador');
                    document.all("txtGirador").focus();
                    return false;
                }

                if (!(ChequeaRut(document.all("txtGirador")))) {
                    alert('Rut no es válido');
                    document.all("txtGirador").focus();
                    document.all("txtGirador").select();

                    return false;
                }

                if (trim(document.all("txtnomgirador").value) == "") {
                    alert('Girador no se encuentra registrado');
                    document.all("txtnomgirador").focus();
                    return false;
                }

                if (trim(document.all("txtSerie").value) == "") {
                    alert('Debe ingresar Serie');
                    document.all("txtSerie").focus();
                    return false;
                }
            }

            var pagina = 'ComprobanteAbono.aspx?';

            var cliente = document.all("txtCliente").value;
            var deudor = document.all("txtNomDeudor").value;
            var rutdeudor = document.all("txtRutDeudor").value;
            var operacion = document.all("txtNroOperacion").value;
            var fecha = document.all("txtFecha").value;
            var montoabono = document.all("txtMontoAbono").value;
            var concepto = document.all("hiddConcepto").value;
            //REQ 
            var nrocheque = document.all("txtNroCheque").value;
            var banquito = document.all("hiddBanco").value;
            var fdeposito = document.all("txtFechaPago").value;
            var rutgirador = document.all("txtGirador").value;
            var nomgirador = document.all("txtnomgirador").value;

            pagina = pagina + 'cliente=' + cliente + '&deudor=' + deudor + '&operacion=' + operacion + '&fecha=' + fecha + '&montoabono=' + montoabono + '&concepto=' + concepto + '&rutdeudor=' + rutdeudor + '&nrocheque=' + nrocheque + '&banquito=' + banquito + '&fdeposito=' + fdeposito + '&rutgirador=' + rutgirador + '&nomgirador=' + nomgirador;

            //alert(pagina);

            popup(pagina, '710', '500');

        }

        function popup(url, ancho, alto) {
            var pWin = window.open(url, 'newWin', 'width=' + ancho + ',height=' + alto + ',scrollbars=1,satus=0,menubar=no,top=10,left=100');
            pWin.focus();
            return false;
        }

        function ValidarEliminar() {
            if (confirm('Esta seguro de eliminar el deudor ?'))
                return true;
            return false;
        }

        function ValidarActualizar() {

            if (confirm('Esta seguro de actualizar el deudor ?')) {

                if (document.all("txtNombre").value == "") {
                    alert('Debe ingresar la Razón Social');
                    document.all("txtNombre").focus();
                    return false;
                }

                if (document.all("txtProfesion").value == "") {
                    alert('Debe ingresar la la profesión');
                    document.all("txtProfesion").focus();
                    return false;
                }

                return true;
            }
            return false;
        }

        function ValidarGuardar() {
            if (trim(document.all("txtNroComprobante").value) == "") {
                alert('Debe ingresar N° comprobante');
                document.all("txtNroComprobante").focus();
                return false;
            }

            if (trim(document.all("txtFechaPago").value) == "") {
                alert('Debe ingresar fecha de pago');
                document.all("txtFechaPago").focus();
                return false;
            }

            if (!(EsFecha(document.all("txtFechaPago").value, 'dma'))) {
                alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                document.all("txtFechaPago").focus();
                return false;
            }

            if (trim(document.all("txtNroCheque").value) == "") {
                alert('Debe ingresar N° cheque');
                document.all("txtNroCheque").focus();
                return false;
            }

            if (trim(document.all("txtSerie").value) == "") {
                alert('Debe ingresar serie');
                document.all("txtSerie").focus();
                return false;
            }

            if (trim(document.all("txtMontoAbono").value) == "") {
                alert('Debe ingresar monto abono');
                document.all("txtMontoAbono").focus();
                return false;
            }
        }

        function validagastospagados() {
            if (trim(document.all("tipomoneda").value) == "5") {
                if (trim(document.all("txtFechaPago").value) == "") {
                    alert('Debe ingresar la fecha de pago');
                    document.all("txtFechaPago").focus();
                    return false;
                }

                if (!(EsFecha(document.all("txtFechaPago").value, 'dma'))) {
                    alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                    document.all("txtFechaPago").focus();
                    return false;
                }

            }

            return true;
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
        .style1 {
            width: 750px;
        }

        .styletd {
            background-color: red;
            color: White;
            font-weight: bold;
        }

        .style2 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 116px;
        }

        .style4 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 133px;
        }

        .style5 {
            width: 157px;
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
                <td class="barra-sub-titulo" colspan="4">MULTI CHEQUE (MCH)</td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">N° de Operación</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNroOperacion" runat="server"
                        Style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Cliente</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtCliente" runat="server"
                        Style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Rut Deudor</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRutDeudor" runat="server"
                        Style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Deudor</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNomDeudor" runat="server"
                        Style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Fecha</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFecha" runat="server" ReadOnly="true"
                        Style="WIDTH: 120px; margin-left: 0px;" Width="232px"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>

            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">Liberación de Letras</td>
            </tr>

            <tr>
                <td align="left" colspan="4">
                    <asp:GridView ID="grillapagletras" runat="server"
                        PageSize="100"
                        AutoGenerateColumns="False"
                        Width="100%"
                        OnRowCommand="Deshabilitar"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None">
                        <Columns>



                            <asp:TemplateField HeaderText="Id Cuota" Visible="false">
                                <HeaderStyle Wrap="true" Width="70" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblidcuota" Visible="false" runat="server" Text='<%# Bind("id_cuota_colegio") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Tipo Doc.">
                                <HeaderStyle Wrap="true" Width="70" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblnrodoc1" runat="server" Text='<%# Bind("tipodocumento") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="N° Doc.">
                                <HeaderStyle Wrap="true" Width="70" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblnrodoc2" runat="server" Text='<%# Bind("nrodocumento") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <%--    <asp:TemplateField    HeaderText="Nro. Cuota">
                             <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("nrocuota") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>


                            <asp:TemplateField HeaderText="F. Vcto. ">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblNombre2" runat="server" Text='<%# Bind("fvcto") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Monto">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblInteres" runat="server" Text='<%# Bind("montocapital") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Pagado">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblIntAdicional" runat="server" Text='<%# Bind("pagado") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="MCH">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblHonorarios" runat="server" Text='<%# Bind("MCH") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Liberar">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/icon_Exito.gif" OnClientClick="return confirm('¿Está seguro que desea liberar la letra ?')" CommandName="Deshabilitar" />
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

                </td>
            </tr>

            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">Pago (MCH)</td>
            </tr>

            <tr>
                <td align="left" colspan="4">
                    <asp:GridView ID="grillaabono" runat="server"
                        PageSize="100"
                        AutoGenerateColumns="False"
                        Width="100%"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None">
                        <Columns>

                            <asp:TemplateField HeaderText="N° Comprobante">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblnrodoc44" runat="server" Text='<%# Bind("NroComprobante") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Ultima Fecha Pago">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblnrodoc555" runat="server" Text='<%# Bind("fpago") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Banco ">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblNombre2" runat="server" Text='<%# Bind("banco") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--           <asp:TemplateField    HeaderText="N° Cheque">
                             <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblInteres" runat="server" Text='<%# Bind("nrocheque") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField    HeaderText="Serie">
                             <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblIntAdicional" runat="server" Text='<%# Bind("serie") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>

                            <asp:TemplateField HeaderText="Monto de Pago">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblHonorarios" runat="server" Text='<%# Bind("montoabono") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Rut Girador">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblHonorarios" runat="server" Text='<%# Bind("rutgirador") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Girador">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblHonorarios" runat="server" Text='<%# Bind("girador") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--     <asp:TemplateField HeaderText="Liberar"   >
                            <HeaderStyle  HorizontalAlign="Center"></HeaderStyle>
                             <ItemStyle  HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate>
                               <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/b_borrar.gif"  OnClientClick="return confirm('¿Está seguro que desea liberar la letra ?')" CommandName="Deshabilitar" />
                              </ItemTemplate>
                             </asp:TemplateField>--%>
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
                <td align="left" class="barra-sub-titulo" colspan="4">Ingreso Documento de Pago</td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">N° Comprobante</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNroComprobante" runat="server" CssClass="cssLabelsData" onKeyPress="return acceptNum(event)"
                        Style="WIDTH: 80px; margin-left: 0px; text-align: right"></asp:TextBox></td>
                <td align="left" style="width: 20%">F.Pago</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFechaPago" runat="server" CssClass="cssLabelsData"
                        Style="WIDTH: 80px; margin-left: 0px; text-align: right"></asp:TextBox></td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">N° Cheque</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNroCheque" runat="server" CssClass="cssLabelsData"
                        Style="WIDTH: 120px; margin-left: 0px; text-align: right"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Serie</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtSerie" runat="server" CssClass="cssLabelsData"
                        Style="WIDTH: 120px; margin-left: 0px; text-align: right"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Monto Abono</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtMontoAbono" runat="server" CssClass="cssLabelsData" onKeyPress="return acceptNum(event)"
                        Style="WIDTH: 120px; margin-left: 0px; text-align: right"></asp:TextBox></td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">
                    <asp:HiddenField ID="hiddidcobranza" runat="server" />
                </td>
            </tr>

            <tr>
                <td align="left" colspan="4">
                    <asp:GridView ID="grillacheques" runat="server"
                        OnRowCommand="Borrar"
                        PageSize="100"
                        AutoGenerateColumns="False"
                        Width="100%"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None">
                        <Columns>

                            <asp:TemplateField HeaderText="" Visible="false">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblnrodoc444" runat="server" Text='<%# Bind("id_abonoMCH") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="N° Comprobante">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblnrodoc44" runat="server" Text='<%# Bind("id_abono_comprobante") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="f. Pago">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblnrodoc555" runat="server" Text='<%# Bind("fpago") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--         
                             <asp:TemplateField    HeaderText="Banco ">
                             <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre2" runat="server" Text='<%# Bind("banco") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>

                            <asp:TemplateField HeaderText="N° Cheque">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblInteres" runat="server" Text='<%# Bind("nrocheque") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Serie">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblIntAdicional" runat="server" Text='<%# Bind("serie") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Monto Abono">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblHonorarios1" runat="server" Text='<%# Bind("montoabono") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--     <asp:TemplateField    HeaderText="Girador">
                             <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblHonorarios2" runat="server" Text='<%# Bind("deudor") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>

                            <asp:TemplateField HeaderText="Liberado">
                                <HeaderStyle Wrap="true" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblHonorarios3" runat="server" Text='<%# Bind("estado") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--    
                            <asp:TemplateField HeaderText="Cambia Estado">
                            <HeaderStyle  HorizontalAlign="Center"></HeaderStyle>
                             <ItemStyle  HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate>
                               <asp:ImageButton ID="ImageEstado" runat="server" ImageUrl="~/images/icon_Exito.gif"  OnClientClick="return confirm('¿Está seguro que desea cambiar el estado del cheque ?')" CommandName="Estado" />
                              </ItemTemplate>
                             </asp:TemplateField>--%>


                            <asp:TemplateField HeaderText="Eliminar">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/b_borrar.gif" OnClientClick="return confirm('¿Está seguro que desea eliminar el cheque ?')" CommandName="Borrar" />
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

                </td>
            </tr>

            <tr>
                <td align="right" class="barra-sub-titulo" colspan="4">
                    <asp:Button ID="btnImprimir" runat="server" Visible="false" CssClass="boton" Text="Imprime Abono"
                        OnClientClick="return Ir();" Width="130px" />

                    <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                        OnClientClick="return ValidarGuardar();" OnClick="btnGuardar_Click" Width="130px" />

                    <asp:Button ID="Button3" runat="server" CssClass="boton" Text="Pagos" OnClick="Button3_Click" Width="130px" />

                </td>
            </tr>
        </table>
    </form>
</body>
</html>
