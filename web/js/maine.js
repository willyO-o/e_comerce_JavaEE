$(function () {
    'use strict';

    $(".btn-add-al-carrito").on("click", function () {
        let id = $(this).attr("idpr");
        let input = $("#cantidad-producto-add");

        let cant;
        if (input.length) {
            cant = input.val();
        } else {
            cant = 1;
        }
        let datos = {id: id, can: cant, accion: "add"};
        $.ajax({
            type: "POST",
            url: "ControladorCarrito",
            data: datos,
            dataType: "json",
            success: function (data) {
                //console.log(data);
                if (data.res === "exito") {
                    swal(data.pro, "Agregado al Carrito!", "success");
                    cargarMiniCarrito();
                    cantidadCarrito();
                } else {
                    swal(data.pro, "ocurrio un error!", "error");
                }

            }
        });

    });

    //eliminar prodcuto del carrito
    $("#mini-carrito").on("click", ".header-cart-item-img", function () {
        let id = $(this).attr("idpr");
        let datos = {id: id, accion: "delete"};
        $.ajax({
            type: "post",
            url: "ControladorCarrito",
            data: datos,
            dataType: "json",
            success: function (data) {
                //console.log(data);
                if (data.res === "exito") {
                    cargarMiniCarrito();
                    cantidadCarrito();
                }
            }
        });

    });
    $("#tab-carrito").on("click", ".cart-img-product", function () {
        let tr = $(this).parents().parents("tr");
        let id = $(this).find("img").attr("idpr");
        let datos = {id: id, accion: "delete"};
        $.ajax({
            type: "post",
            url: "ControladorCarrito",
            data: datos,
            dataType: "json",
            success: function (data) {
                //console.log(data);
                if (data.res === "exito") {
                    cargarMiniCarrito();
                    cantidadCarrito();
                    getTotal()
                    tr.remove();
                }
            }
        });


    });

    //modificar cantidad de producto del carrtio
    $("#tab-carrito").on("change", ".num-producto", function () {
        let cant = $(this).val();
        //console.log(cant);
        let tot = $(this).parents().parents("tr").find(".td-total");
        let id = $(this).attr("idpr");

        let datos = {id: id, can: cant, accion: "update"};
        $.ajax({
            type: "POST",
            url: "ControladorCarrito",
            data: datos,
            dataType: "json",
            success: function (data) {
                //console.log(data);
                if (data.res === "exito") {
                    //swal(data.pro, "Agregado al Carrito!", "success");
                    cargarMiniCarrito();
                    cantidadCarrito();
                    tot.text(data.tot);
                    getTotal();
                } else {
                    swal(data.pro, "ocurrio un error!", "error");
                }

            }
        });
    });
    getTotal();
    function getTotal() {
        
        $.ajax({
            type: "POST",
            url: "ControladorCarrito",
            data: "accion=getTotal&id=0",
            dataType: "json",
            success: function (data) {
                //console.log(data);
                if (data.res === "exito") {
                    //swal(data.pro, "Agregado al Carrito!", "success");
                    cargarMiniCarrito();
                    cantidadCarrito();
                    $(".total-del-carrito").text(data.tot);
                } else {
                    swal(data.pro, "ocurrio un error!", "error");
                }

            }
        });
    }

    cantidadCarrito();
    function cantidadCarrito() {
        $.ajax({
            type: "post",
            url: "ControladorCarrito",
            data: "accion=tam&id=0",
            dataType: "json",
            success: function (data) {
                //console.log(data);
                if (data.res === "exito") {
                    $(".header-icons-noti").text(data.idPr)
                }
            }
        });
    }

    function cargarMiniCarrito() {
        $('#mini-carrito').load('Vista/vistaCliente/car.jsp');
    }
    //
});