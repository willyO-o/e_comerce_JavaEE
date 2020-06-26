$(function () {
    'use strict';

    listarCategoria();
    listarMarca();
    listarProductos();




    $("#add-prod").on("submit", function (e) {
        e.preventDefault();
        //console.log("clic"); 

        let datos = new FormData(this);
        let form = $(this);
        //console.log(datos);
        formProd(datos, form);
        $("#add-prod")[0].reset();
        $("#modal-prod").modal("hide");

        //
    });

    function formProd(datos, form) {
        $.ajax({
            type: form.attr("method"),
            data: datos,
            url: form.attr("action"),
            dataType: "json",
            contentType: false,
            processData: false,
            async: true,
            cache: false,
            success: function (data) {
                //console.log(data);
                if (data.res === 'exito') {
                    Swal.fire(
                            'Listo !!',
                            'Registrado',
                            'success'
                            );
                    listarProductos();
                } else if (data.res === undefined || data.res !== "exito") {
                    Swal.fire(
                            'Error !!',
                            'Ocurrio un error durante el proceso',
                            'error'
                            );

                }

            }
        });
    }
    function listarCategoria() {

        $.ajax({

            type: "POST",
            data: "accion=listar",
            url: "ControladorCategoria",
            dataType: 'json',
            success: function (data) {
                $.each(data, function (i, item) {

                    $('#categorias').append($('<option />', {
                        text: item.cate,
                        value: item.idCat
                    }));
                });

            }
        });
    }

    function listarMarca() {

        $.ajax({

            type: "POST",
            data: "accion=listar",
            url: "ControladorMarca",
            dataType: 'json',
            success: function (data) {
                $.each(data, function (i, item) {

                    $('#marcas').append($('<option />', {
                        text: item.mar,
                        value: item.idMar
                    }));
                });

            }
        });
    }


    function listarProductos() {
        let tabla = $('#tab-productos').DataTable({
            destroy: true,
            responsive: true,
            autoWidth: false,
            dom: 'Bfrtip',

            ajax: {
                url: "ControladorProducto?accion=listar",
                method: "GET"
            },
            buttons: [
                {
                    extend: 'excelHtml5',
                    title: 'Data export',
                    className: 'btn btn-success',
                    text: "Excel",
                    exportOptions: {
                        columns: [0, 2, 3, 4, 5, 6, 7]
                    }
                },
                {
                    extend: 'csvHtml5',
                    title: 'Data export',
                    className: 'btn btn-secondary',
                    text: "Csv",
                    exportOptions: {
                        columns: [0, 2, 3, 4, 5, 6, 7]
                    }
                },
                {
                    extend: 'pdfHtml5',
                    title: 'Data export',
                    className: 'btn btn-danger',
                    text: "Pdf",
                    exportOptions: {
                        columns: [0, 2, 3, 4, 5, 6, 7]
                    }
                },
                {
                    extend: 'print',
                    title: 'Data export',
                    className: 'btn btn-primary',
                    text: "Imprimir",
                    exportOptions: {
                        columns: [0, 2, 3, 4, 5, 6, 7]
                    }
                }
            ],
            columns: [
                {data: "pro"},
                {data: "img",
                    render: function (data) {
                        return "<img width='150px' height='100px' src='" + data + "'>";
                    }},
                {data: "preVenta"},
                {data: "stock"},
                {data: "stockMin"},
                {data: "garan"},
                {data: "cate"},
                {data: "marc"},
                {data: "inPro",
                    render: function (data) {
                        return "<button class='btn btn-warning btn-editpr mx-2' idp='" + data + "'><i class='fas fa-pencil-alt'></i></button>" + "<button class='btn btn-danger btn-delet' idp='" + data + "'><i class='fas fa-trash'></i></button>" + "<a class='btn btn-success ' href='?menu=detalle&idp=" + data + "'><i class='fas fa-eye'></i></a>";
                    }
                }

            ],
            language: espaniol
        });
    }
});

let espaniol = {
    "sProcessing": "Procesando...",
    "sLengthMenu": "Mostrar _MENU_ registros",
    "sZeroRecords": "No se encontraron resultados",
    "sEmptyTable": "Ningún dato disponible en esta tabla",
    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
    "sInfoPostFix": "",
    "sSearch": "Buscar:",
    "sUrl": "",
    "sInfoThousands": ",",
    "sLoadingRecords": "Cargando...",
    "oPaginate": {
        "sFirst": "Primero",
        "sLast": "Último",
        "sNext": "Siguiente",
        "sPrevious": "Anterior"
    },
    "oAria": {
        "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    },
    "decimal": ",",
    "thousands": "."
};
$(document).ready(function () {
    bsCustomFileInput.init();
});