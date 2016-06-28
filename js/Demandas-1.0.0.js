var _rutServicio = '/Servicios/';
function AsignarAutocompletar(nombreControlRut, nombreControlNombre, nombreControlDireccion, nombreControlId) {
    /*$('#' + nombreControlRut).on('change paste input', function () {
        $('#' + nombreControlNombre).val('');
        if (nombreControlDireccion != '')
            $('#' + nombreControlDireccion).val('');
        if (nombreControlId != '')
            $('#' + nombreControlId).val('');
    });*/

    $('#' + nombreControlRut).autocomplete({
        source: function (request, response) {
            $.ajax({
                url: _rutServicio + 'ListadosAutocompletar.svc/ListarClientes',
                data: {
                    term: request.term,
                    count: 15
                },
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            Rut: item.Rut,
                            Nombre: item.Nombre,
                            IdDomicilio: item.IdDomicilio,
                            Direccion: item.Direccion
                        }
                    }))
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) { }
            });
        },
        minLength: 0,
        focus: function (event, ui) {
            $('#' + nombreControlRut).val(ui.item.Rut);
            $('#' + nombreControlNombre).val(ui.item.Nombre);
            if (nombreControlDireccion != '')
                $('#' + nombreControlDireccion).val(ui.item.Direccion);
            if (nombreControlId != '')
                $('#' + nombreControlId).val(ui.item.IdDomicilio);
            return false;
        },
        select: function (event, ui) {
            $('#' + nombreControlRut).val(ui.item.Rut);
            $('#' + nombreControlNombre).val(ui.item.Nombre);
            if (nombreControlDireccion != '')
                $('#' + nombreControlDireccion).val(ui.item.Direccion);
            if (nombreControlId != '')
                $('#' + nombreControlId).val(ui.item.IdDomicilio);
            return false;
        }
    }).on('paste input', function () {
        $(this).autocomplete("search");
    }).data('ui-autocomplete')._renderItem = function (ul, item) {
        return $('<li>')
        .append('<a>' + item.Rut + "<br>" + item.Nombre + '</a>')
        .appendTo(ul);
    };

    if (nombreControlDireccion != '')
        BuscarDirecciones(nombreControlRut, nombreControlDireccion, nombreControlId);
}

function BuscarDirecciones(nombreControlRut, nombreControlDireccion, nombreControlId) {
    $('#' + nombreControlDireccion).autocomplete({
        source: function (request, response) {
            $.ajax({
                url: _rutServicio + 'ListadosAutocompletar.svc/ListarDomicilios',
                data: {
                    term: $('#' + nombreControlRut).val(),
                    count: 15
                },
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            ID: item.ID,
                            Direccion: item.Direccion
                        }
                    }))
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) { }
            });
        },
        minLength: 0,
        focus: function (event, ui) {
            $('#' + nombreControlDireccion).val(ui.item.Direccion);
            $('#' + nombreControlId).val(ui.item.ID);
            return false;
        },
        select: function (event, ui) {
            $('#' + nombreControlDireccion).val(ui.item.Direccion);
            $('#' + nombreControlId).val(ui.item.ID);
            return false;
        }
    }).focus(function () {
        $(this).autocomplete("search");
    }).data('ui-autocomplete')._renderItem = function (ul, item) {
        return $('<li>')
        .append('<a>' + item.Direccion + '</a>')
        .appendTo(ul);
    };
}

function BuscarConceptos(nombreControlTexto, nombreControlOculto, valor) {
    $('#' + nombreControlTexto).autocomplete({
        source: function (request, response) {
            $.ajax({
                url: _rutServicio + 'ListadosAutocompletar.svc/ListarPorConcepto',
                data: {
                    concepto: valor,
                    count: 100
                },
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            ID: item.ID,
                            Nombre: item.Nombre
                        }
                    }))
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) { alert(textStatus); }
            });
        },
        minLength: 0,
        focus: function (event, ui) {
            $('#' + nombreControlTexto).val(ui.item.Nombre);
            if (nombreControlOculto != '')
                $('#' + nombreControlOculto).val(ui.item.ID);
            return false;
        },
        select: function (event, ui) {
            $('#' + nombreControlTexto).val(ui.item.Nombre);
            if (nombreControlOculto != '')
                $('#' + nombreControlOculto).val(ui.item.ID);
            return false;
        }
    }).focus(function () {
        $(this).autocomplete("search");
    }).data('ui-autocomplete')._renderItem = function (ul, item) {
        return $('<li>')
        .append('<a>' + item.Nombre + '</a>')
        .appendTo(ul);
    };
}