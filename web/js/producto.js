$(function () {
    'use strict';

    listarCategoria();
    listarMarca();


    $("#add-prod").on("submit", function (e) {
        e.preventDefault();
        //console.log("clic"); 

        let datos = new FormData(this);
        let form = $(this);
        //console.log(datos);
        formProd(datos, form);
        //$("#modal-edprod").modal("hide");
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
                console.log(data);
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
});

$(document).ready(function () {
    bsCustomFileInput.init();
});