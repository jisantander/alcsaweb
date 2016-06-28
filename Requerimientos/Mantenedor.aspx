<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mantenedor.aspx.cs" Inherits="CobranzaALC.Requerimientos.Mantenedor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.mensaje-popup').html('');
            $('.mensaje-popup').hide();

            $('.btn-popup').click(function () {
                $('.mensaje-popup').hide();
                $('.texto-observacion').html('');
            });

            $('#btnCambiarEstado').click(function (event) {
                if ($('#ddlEstados').val() == '') {
                    $('#divMensajeCambioEstado').html('Seleccione un estado.');
                    $('#divMensajeCambioEstado').show();
                    event.preventDefault();
                    return false;
                }

                if ($('#txtObservacionEstado').val() == '') {
                    $('#divMensajeCambioEstado').html('Ingrese una observacion.');
                    $('#divMensajeCambioEstado').show();
                    event.preventDefault();
                    return false;
                }

                return true;
            });

            $('#btnGuardarObservacion').click(function (event) {
                if ($('#txtObservacion').val() == '') {
                    $('#divMensajeObservacion').html('Ingrese una observacion.');
                    $('#divMensajeObservacion').show();
                    event.preventDefault();
                    return false;
                }

                return true;
            });

            $('#btnGuardarArchivo').click(function (event) {
                if (!$('input[type="file"]').val()) {
                    $('#divMensajeArchivo').html('Seleccione un archivo.');
                    $('#divMensajeArchivo').show();
                    event.preventDefault();
                    return false;
                }

                return true;
            });

            $('.btn-cerrar').click(function () {
                if (parseInt($('#hdfEsPopup').val()) == 1)
                    window.close();
                else window.location = 'Listado.aspx';
            });

            $('.boton-descargar-archivo').click(function (event) {
                DescargarArchivo($(this).attr('alt'));
                event.preventDefault();
                return false;
            });

            $('.descargar-archivo-inicial').click(function () {
                DescargarArchivo($('#hdfIdDocumentoInicial').val());
            });

            if ($('#lblDescargarArchivoInicial').length == 0)
                $('#divDescargaArchivoPrincipal').hide();

            if (parseInt($('#hdfIdRequerimiento').val()) < 1)
                $('.visible-requerimiento-creado').hide();

            $('#ddlEstados').change(function () {
                EvaluarVisibilidadListaDesarrolladores();
            });
            EvaluarVisibilidadListaDesarrolladores();

            var _estado = $('#hdfCodigoEstadoActual').val();

            $('.btn-acciones-requerimiento').hide();
            $('.btn-cambio-estado').hide();

            if (_estado != 'RECHAZADO' && _estado != 'TERMINADO' && _estado != 'ELIMINADO') {
                $('.btn-acciones-requerimiento').show();

                var intNumeroItems = $('#ddlEstados option').length;
                if (intNumeroItems > 1 || (intNumeroItems == 1 && $('#ddlEstados').val() != ''))
                    $('.btn-cambio-estado').show();
            }

            if ($('#lblMensaje').html() == '') return;
            $('#divMensajeInformativo').modal('show');
        });

        function EvaluarVisibilidadListaDesarrolladores() {
            if ($('#ddlEstados').val() == 'EN_DESARROLLO')
                $('.fila-desarrolladores').show();
            else $('.fila-desarrolladores').hide();
        }

        function DescargarArchivo(id, event) {
            var ruta = '../Cobranza/Documentos/DescargarArchivo.aspx?id=' + id;
            var ventana = window.open(ruta, 'descarga_archivo', '');
            ventana.focus();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="alert alert-success" role="alert"><span class="glyphicon glyphicon-edit"></span>&nbsp;<strong>Requerimiento</strong></div>

            <div class="panel panel-primary">
                <div class="panel-heading"><strong>Nuevo Requerimiento</strong></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="lblFechaIngreso">Fecha Ingreso</label>
                            <asp:Label ID="lblFechaIngreso" runat="server" CssClass="form-control" ClientIDMode="Static" Enabled="False"></asp:Label>
                        </div>
                        <div class="col-md-6">
                            <label for="lblNombreUsuario">Usuario Solicitante</label>
                            <asp:Label ID="lblNombreUsuario" runat="server" CssClass="form-control" ClientIDMode="Static" Enabled="False"></asp:Label>
                        </div>
                    </div>
                    <div class="row visible-requerimiento-creado">
                        <div class="col-md-6">
                            <label for="lblEstado">Estado</label>
                            <asp:Label ID="lblEstado" runat="server" CssClass="form-control" ClientIDMode="Static" Enabled="False"></asp:Label>
                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="txtDescripcion">Descripción de la Incidencia</label>
                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="MultiLine" Height="100px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Documento (opcional)</label>
                            <asp:FileUpload ID="fupArchivoInicial" runat="server" CssClass="form-control form-control" ClientIDMode="Static" />
                            <div id="divDescargaArchivoPrincipal" class="btn btn-default form-control descargar-archivo-inicial">
                                <span class="glyphicon glyphicon-download-alt descargar-archivo-inicial">&nbsp;</span><asp:Label ID="lblDescargarArchivoInicial" runat="server" ClientIDMode="Static" Visible="false" CssClass="descargar-archivo-inicial"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="alert alert-success" role="alert">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-default" OnClick="btnGuardar_Click" />
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-default" OnClick="btnEliminar_Click" Visible="False" />
                <input id="btnCancelar" type="button" value="Cancelar" class="btn btn-default btn-cerrar" />
            </div>

            <div class="panel panel-primary visible-requerimiento-creado">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="btn-group btn-group-justified btn-acciones-requerimiento" role="group" aria-label="...">
                                <div class="btn btn-default btn-popup" role="alert" data-toggle="modal" data-target="#divIngresoObservacion"><span class="glyphicon glyphicon-pencil"></span>&nbsp;<strong>Agregar Observación</strong></div>
                                <div class="btn btn-default btn-popup" role="alert" data-toggle="modal" data-target="#divIngresoArchivo"><span class="glyphicon glyphicon-file"></span>&nbsp;<strong>Subir Archivo</strong></div>
                                <div class="btn btn-default btn-popup btn-cambio-estado" role="alert" data-toggle="modal" data-target="#divCambioEstado"><span class="glyphicon glyphicon-check"></span>&nbsp;<strong>Cambiar Estado</strong></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <asp:GridView ID="gvObservaciones" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" EmptyDataText="NO SE ENCONTRARON OBSERVACIONES Y/O DOCUMENTOS">
                                <Columns>
                                    <asp:BoundField DataField="FechaIngreso" DataFormatString="{0:dd-MM-yyyy HH:mm}" HeaderText="Fecha Ingreso" HtmlEncode="False">
                                        <ItemStyle HorizontalAlign="Right" Width="15%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Usuario" HeaderText="Usuario">
                                        <ItemStyle HorizontalAlign="Right" Width="15%" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Observación">
                                        <ItemTemplate>
                                            <asp:Label ID="lblObservacionHistorica" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                                            <asp:Label ID="lblDescargarArchivo" runat="server" onclick='<%# Eval("IdDocumento", "DescargarArchivo({0})") %>' Text='<%# Bind("Descripcion") %>' CssClass="btn btn-link"></asp:Label>
                                            <asp:HiddenField ID="hdfIdDocumento" runat="server" Value='<%# Bind("IdDocumento") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="50%" HorizontalAlign="Justify" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEliminar" runat="server" CssClass="glyphicon glyphicon-remove" Visible="false" CommandArgument='<%# Bind("ID") %>' OnClick="btnEliminar_Click1"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <asp:HiddenField ID="hdfUsuario" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdfIdRequerimiento" runat="server" ClientIDMode="Static" Value="0" />
        <asp:HiddenField ID="hdfCodigoEstadoActual" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdfEsPopup" runat="server" ClientIDMode="Static" Value="0" />
        <asp:HiddenField ID="hdfIdDocumentoInicial" runat="server" ClientIDMode="Static" Value="0" />

        <!-- Modal de Ingreso de Observación -->
        <div id="divIngresoObservacion" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Ingresar Observación</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="txtObservacion">Observación</label>
                                <asp:TextBox ID="txtObservacion" runat="server" CssClass="form-control texto-observacion" ClientIDMode="Static" TextMode="MultiLine" Height="100px"></asp:TextBox>
                            </div>
                        </div>
                        <div id="divMensajeObservacion" class="alert alert-danger mensaje-popup" role="alert"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnGuardarObservacion" runat="server" Text="Guardar" CssClass="btn btn-default" OnClick="btnGuardarObservacion_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal de Ingreso de Archivo -->
        <div id="divIngresoArchivo" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Ingresar Archivo</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="fupArchivo">Archivo</label>
                                <asp:FileUpload ID="fupArchivo" runat="server" CssClass="form-control" ClientIDMode="Static" Width="100%" />
                            </div>
                        </div>
                        <div id="divMensajeArchivo" class="alert alert-danger mensaje-popup" role="alert"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnGuardarArchivo" runat="server" Text="Guardar" CssClass="btn btn-default" OnClick="btnGuardarArchivo_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal de Ingreso de Cambio de Estado -->
        <div id="divCambioEstado" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Cambio de Estado</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="ddlEstados">Estado</label>
                                <asp:DropDownList ID="ddlEstados" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="MultiLine" DataTextField="Nombre" DataValueField="Codigo"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row fila-desarrolladores">
                            <div class="col-md-12">
                                <label for="ddlDesarrolladores">Desarrollador a Cargo</label>
                                <asp:DropDownList ID="ddlDesarrolladores" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="MultiLine" DataTextField="Descripcion" DataValueField="Nombre"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label for="txtObservacionEstado">Observación</label>
                                <asp:TextBox ID="txtObservacionEstado" runat="server" CssClass="form-control texto-observacion" ClientIDMode="Static" TextMode="MultiLine" Height="100px"></asp:TextBox>
                            </div>
                        </div>
                        <div id="divMensajeCambioEstado" class="alert alert-danger mensaje-popup" role="alert"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnCambiarEstado" runat="server" Text="Guardar" CssClass="btn btn-default" OnClick="btnCambiarEstado_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Mensaje Informativo -->
        <div id="divMensajeInformativo" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label ID="lblMensaje" runat="server" ClientIDMode="Static" EnableViewState="false"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
