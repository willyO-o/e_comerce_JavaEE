$(function () {
    'use strict';

    listarCategoria();
    listarMarca();
    listarProductos();




    $("#add-prod").on("submit", function (e) {
        e.preventDefault();
        let form = $(this);
        //console.log("clic"); 
        if (form.attr("action") === "ControladorProducto?accion=add") {
            let datos = new FormData(form);
            //console.log(datos);
            formProd(datos, form);
        } else {
            let datos = form.serializeArray();
            formularios(datos, form);
        }
        listarProductos();
        $("#add-prod")[0].reset();
        $("#modal-prod").modal("hide");

        //
    });

    $('#tab-productos').on("click", ".btn-verp", function () {
        let idp = $(this).attr("idp");
        let datos = {idp: idp, accion: "getPr"};
        //console.log(idp); 
        $.ajax({
            type: "post",
            url: "ControladorProducto",
            data: datos,
            dataType: "json",
            success: function (data) {
                //console.log(data); 
                let img1 = $("#img1-prod");
                let img2 = $("#img2-prod");
                let img3 = $("#img3-prod");
                let img4 = $("#img4-prod");
                let tit = $("#tit-prod");
                let mar = $("#mar-prod");
                let cat = $("#cat-prod");
                let prec = $("#prec-prod");
                let desc = $("#product-desc");
                let cara = $("#product-comments");
                let stock = $("#stock-prod");
                let stoMin = $("#stoMin-prod");
                let gara = $("#gara-prod");

                img1.attr("src", data.img);
                img2.attr("src", data.img2);
                img3.attr("src", data.img3);
                img4.attr("src", data.img4);
                tit.text(data.pro);
                mar.text(data.marc);
                cat.text(data.cate);
                prec.text(data.preVenta);
                desc.text(data.desPro);
                cara.text(data.carPro);
                stock.text(data.stock);
                stoMin.text(data.stockMin);
                gara.text(data.garan);


            }
        });

    });


    $('#tab-productos').on("click", ".btn-editpr", function () {
        let idp = $(this).attr("idp");
        let datos = {idp: idp, accion: "getPr"};
        //console.log(idp);
        $.ajax({
            type: "post",
            url: "ControladorProducto",
            data: datos,
            dataType: "json",
            success: function (data) {
                //console.log(data);
                let img1 = $("#fm-img");
                let img2 = $("#fm-img2");
                let img3 = $("#fm-img3");
                let img4 = $("#fm-img4");
                let tit = $("#fm-pro");
                let prec = $("#fm-pre");
                let desc = $("#fm-des");
                let cara = $("#fm-car");
                let stock = $("#fm-sto");
                let stoMin = $("#fm-stM");
                let gara = $("#fm-gar");
                let form = $("#add-prod");

                form.attr("action", "ControladorProducto?accion=update&idp=" + data.inPro);
                form.removeAttr("enctype");
                img1.attr("disabled", "disabled");
                img2.attr("disabled", "disabled");
                img3.attr("disabled", "disabled");
                img4.attr("disabled", "disabled");
                tit.val(data.pro);
                $("#marcas option").removeAttr("selected");
                $("#categorias option").removeAttr("selected");
                $("#categorias option[value=" + data.idCat + "]").attr("selected", true);
                $("#marcas option[value=" + data.idMarc + "]").attr("selected", true);
                prec.val(data.preVenta);
                stock.val(data.stock);
                stoMin.val(data.stockMin);
                gara.val(data.garan);
                cara.text(data.carPro);
                desc.text(data.desPro);


            }
        });

    });

    $("#tab-productos").on("click", ".btn-delet", function () {
        let id = $(this).attr("id");
        let datos = {id: id, accion: "delete"};
        let url = "ControladorProducto";
        eliminar(datos, url, listarProductos);
    });

    $("#btn-agrePr").on("click", function () {
        $("#add-prod").attr("action", "ControladorProducto?accion=add");
        $("#add-prod")[0].reset();
        $("#add-prod").attr("enctype", "multipart/form-data");
        $("#fm-img").removeAttr("disabled");
        $("#fm-img2").removeAttr("disabled");
        $("#fm-img3").removeAttr("disabled");
        $("#fm-img4").removeAttr("disabled");
        $("#fm-pro").val("");
        $("#fm-pre").val("");
        $("#fm-des").text("");
        $("#fm-car").text("");
        $("#fm-sto").val("");
        $("#fm-stM").val("");
        $("#fm-gar").val("");
        $("#marcas option").removeAttr("selected");
        $("#categorias option").removeAttr("selected");
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

                    $('#categorias').append(
                            $('<option />', {
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
                        return "<button class='btn btn-warning btn-editpr ' data-toggle='modal' data-target='#modal-prod' idp='" + data + "' ><i class='fas fa-pencil-alt'></i></button>" + "<button class='btn btn-danger btn-delet mx-2' id='" + data + "'><i class='fas fa-trash'></i></button>" + "<button class='btn btn-success btn-verp' data-toggle='modal' data-target='#modal-lg' type='button' idp='" + data + "'><i class='fas fa-eye'></i></button>";
                    }
                }

            ],
            language: espaniol
        });
    }

    function formularios(datos, form) {

        Swal.fire({
            title: 'Espere Por favor !',
            html: ' Registrando datos', // add html attribute if you want or remove
            allowOutsideClick: false,
            onBeforeOpen: () => {
                Swal.showLoading();
            }
        });

        $.ajax({
            url: form.attr("action"),
            type: form.attr("method"),
            data: datos,
            dataType: "json",
            success: function (data) {
                //console.log(data);
                if (data.res === "exito") {
                    swal.close();
                    Swal.fire(
                            'Listo !!',
                            'Datos Registrados',
                            'success'
                            );

                } else {
                    Swal.fire(
                            'Error !!',
                            'Ocurrio un error al registrar, intente de nuevo',
                            'error'
                            );
                }
            }
        });
    }

    function eliminar(datos, url, funcion) {


        Swal.fire({
            title: 'Esta usted Seguro?',
            text: "Esta accion no se puede deshacer!",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Elimnar objeto!'
        }).then((result) => {
            if (result.value) {

                $.ajax({

                    type: "POST",
                    data: datos,
                    url: url,
                    dataType: "json",
                    success: function (data) {
                        let resultado = data;

                        //console.log(resultado);

                        if (resultado.res === 'exito') {
                            Swal.fire(
                                    'Listo !!',
                                    'Eliminado ',
                                    'success'
                                    );
                            funcion();

                        } else {
                            Swal.fire(
                                    'Error !!',
                                    'correo o passowrd incorrectos, intente de nuevo ',
                                    'error'
                                    );
                        }
                    }
                });

            }
        });

    }

});
