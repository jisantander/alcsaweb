<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="CobranzaALC.Requerimientos.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.nuevo-requerimiento').click(function () {
                window.location = 'Mantenedor.aspx?id_req=0';
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="alert alert-success" role="alert"><span class="glyphicon glyphicon-edit"></span>&nbsp;<strong>Requerimientos</strong></div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="btn btn-default nuevo-requerimiento" role="alert"><span class="glyphicon glyphicon-plus"></span>&nbsp;<strong>Ingresar Nuevo Requerimiento</strong></div>
                </div>
                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-12">
                            <asp:GridView ID="gvRequerimientos" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" EmptyDataText="NO SE ENCONTRARON REQUERIMIENTOS">
                                <Columns>
                                    <asp:BoundField DataField="ID" DataFormatString="{0:00000}" HeaderText="ID" HtmlEncode="False">
                                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="UsuarioSolicitante" HeaderText="Usuario Solicitante">
                                        <ItemStyle HorizontalAlign="Right" Width="15%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="UsuarioAprobador" HeaderText="Usuario Aprobador">
                                        <ItemStyle HorizontalAlign="Right" Width="15%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="UsuarioResponsable" HeaderText="Usuario Responsable">
                                        <ItemStyle HorizontalAlign="Right" Width="15%" />
                                    </asp:BoundField>


                                    <asp:BoundField DataField="NombreEstado" HeaderText="Estado">
                                        <ItemStyle HorizontalAlign="Justify" Width="15%" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Observación">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Descripcion") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtObservacion" runat="server" Height="50px" Text='<%# Bind("Descripcion") %>' TextMode="MultiLine" Width="97%"></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Justify" Width="25%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:HyperLink ID="btnDocumento" runat="server" CssClass="glyphicon glyphicon-search" NavigateUrl='<%# Eval("ID","Mantenedor.aspx?id_req={0}") %>'></asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="5%" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <asp:HiddenField ID="hdfUsuario" runat="server" ClientIDMode="Static" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
