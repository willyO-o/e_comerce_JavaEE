$(function () {
    'use strict';

    // colocando la clase activa a la navegacion
    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
    navegacion();
    function navegacion() {
        var menu = getParameterByName('menu');
        switch (menu) {
            case "home":
                $(".menu  ul li:nth-child(1)").addClass("sale-noti");
                break;
            case "tienda":
                $(".menu  ul li:nth-child(2)").addClass("sale-noti");
                break;
            case "carrito":
                $(".menu  ul li:nth-child(3)").addClass("sale-noti");
                break;
            case "about":
                $(".menu  ul li:nth-child(4)").addClass("sale-noti");
                break;
            case "contacto":
                $(".menu  ul li:nth-child(5)").addClass("sale-noti");
                break;
            case "":
                $(".menu  ul li:nth-child(1)").addClass("sale-noti");
                break;
        }
    }//fin navegacion activa

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

    $("#form-pedido").on("submit", function (e) {
        e.preventDefault();
        let datos = $(this).serializeArray();
        let t = $(".total-del-carrito").text();

        if (t > 0) {

            $.ajax({
                type: "post",
                url: "ControladorPedido",
                data: datos,
                dataType: "json",
                success: function (data) {
                    //console.log(data);
                    if(data.res==="exito"){
                        swal("Listo", "Pedido Registrado, Les enviamos un email de confirmacion", "success");
                        setTimeout(function () {
                            location.reload();
                        }, 2500);
                    }else{
                        swal("Error", "ocurrio un error!", "error");
                    }
                }
            });
        }
    });

    $(".btn-sletter").on("click",function(e){
        e.preventDefault();
        swal("Suscrito...","gracias por Suscribirte","success");
    });
    
    //formulario de contacto
    $("#form-contacto").on("submit",function (e){
        e.preventDefault();
        let form=$(this);
        registrar(form);
    });
    
    //loguearse
    $("#form-login").on("submit", function (e) {
        e.preventDefault();
        let datos = $(this).serializeArray();
        $.ajax({
            type: "post",
            url: "Validar",
            dataType: "json",
            data: datos,
            success: function (data) {
                console.log(data)
                switch (data.res) {
                    case "user":
                        swal("Listo", "Bienvenido: " + data.nom, "success");
                        swal("Listo", "Bienvenido: " + data.nom, "success");
                        setTimeout(function () {
                            location.href = "admin.jsp";
                        }
                        , 2000);
                        break;
                    case "cliente":
                        swal("Listo", "Bienvenido: " + data.nom, "success");
                        setTimeout(function () {
                            location.reload();
                        }
                        , 2000);

                        break;
                    default :
                        swal("Datos Erroneos", "Error: Correo o Password Incorrectos!", "error");
                        break;
                }
            }

        });
    });


    //clientes registrarse
    $("#form-cliente").on("submit", function (e) {
        e.preventDefault();
        let form = $(this);
        registrar(form);

    });
    function registrar(form) {
        let datos = form.serializeArray();
        $.ajax({
            type: form.attr("method"),
            url: form.attr("action"),
            data: datos,
            dataType: "json",
            success: function (data) {
                console.log(data);
                if (data.res === "exito") {
                    form[0].reset();
                    swal("Listo", "Registro Exitoso!", "success");
                } else {
                    swal("Error", "ocurrio un error!", "error");
                }
            }
        });
    }

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