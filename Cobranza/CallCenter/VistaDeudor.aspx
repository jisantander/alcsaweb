<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VistaDeudor.aspx.cs" Inherits="CobranzaALC.Cobranza.CallCenter.VistaDeudor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="alert alert-success" role="alert"><span class="glyphicon glyphicon-edit"></span>&nbsp;<strong>Información del Deudor</strong></div>

            <div class="panel panel-primary">
                <div class="panel-heading"><strong>Deudor</strong></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                            <label for="lblRutDeudor">RUT</label>
                            <asp:Label ID="lblRutDeudor" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:Label>
                        </div>
                        <div class="col-md-9">
                            <label for="lblNombreDeudor">Nombre</label>
                            <asp:Label ID="lblNombreDeudor" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="lblTelefono">Teléfono</label>
                            <asp:Label ID="lblTelefono" runat="server" CssClass="form-control" ClientIDMode="Static" ></asp:Label>
                        </div>
                        <div class="col-md-6">
                            <label for="lblCelular">Celular</label>
                            <asp:Label ID="lblCelular" runat="server" CssClass="form-control" ClientIDMode="Static" ></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="lblDomicilio">Domicilio</label>
                            <asp:GridView ID="gvDomicilios" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" EmptyDataText="NO SE ENCONTRARON DOMICILIOS">
                                <Columns>
                                    <asp:BoundField DataField="calle" HeaderText="Calle">
                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="numero" HeaderText="Número">
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="villapob" HeaderText="Villa o Población">
                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Block" HeaderText="block">
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nrodpto" HeaderText="N° Dpto">
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="comnom" HeaderText="Comuna">
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="regnom" HeaderText="Región">
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="vigencia" HeaderText="Vigencia">
                                        <ItemStyle HorizontalAlign="Left" Width="5%" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-primary visible-requerimiento-creado">
                <div class="panel-heading"><strong>Cobranzas</strong></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <asp:GridView ID="gvCobranzas" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" EmptyDataText="NO SE ENCONTRARON REGISTROS" ShowHeader="False">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="panel panel-primary">
                                                <div class="panel-heading">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <asp:Label ID="lblNumeroOperacion" runat="server" Font-Bold="true" Text='<%# Eval("NumeroOperacion", "N° Operación: {0}") %>' ></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <label for="lblTipoProceso">Tipo Cobranza</label>
                                                            <asp:Label ID="lblTipoProceso" runat="server" CssClass="form-control" Text='<%# Bind("TipoCobranza") %>' ></asp:Label>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label for="lblNombreCliente">Fecha Proceso</label>
                                                            <asp:Label ID="lblFechaProceso" runat="server" CssClass="form-control" Text='<%# Eval("FechaProceso", "{0:dd-MM-yyyy}") %>' ></asp:Label>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label for="lblEstado">Estado</label>
                                                            <asp:Label ID="lblEstado" runat="server" CssClass="form-control" Text='<%# Bind("EstadoCobranza") %>' ></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <label for="lblRutCliente">Rut Cliente</label>
                                                            <asp:Label ID="lblRutCliente" runat="server" CssClass="form-control" Text='<%# Bind("RutCliente") %>' ></asp:Label>
                                                        </div>
                                                        <div class="col-md-9">
                                                            <label for="lblNombreCliente">Nombre Cliente</label>
                                                            <asp:Label ID="lblNombreCliente" runat="server" CssClass="form-control" Text='<%# Bind("NombreCliente") %>' ></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="lblProcedimiento">Procedimiento</label>
                                                            <asp:Label ID="lblProcedimiento" runat="server" CssClass="form-control" Text='<%# Bind("NombreProcedimiento") %>' ></asp:Label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="lblMateria">Materia</label>
                                                            <asp:Label ID="lblMateria" runat="server" CssClass="form-control" Text='<%# Bind("NombreMateria") %>' ></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="lblProducto">Producto</label>
                                                            <asp:Label ID="lblProducto" runat="server" CssClass="form-control" Text='<%# Bind("NombreProducto") %>' ></asp:Label>
                                                        </div>
                                                        <div class="col-md-6">

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <asp:HiddenField ID="hdfRutDeudor" runat="server" ClientIDMode="Static" />

    </form>
</body>
</html>
